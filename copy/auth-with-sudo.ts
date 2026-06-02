import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { isToolCallEventType } from "@earendil-works/pi-coding-agent";
import { Key, matchesKey, truncateToWidth } from "@earendil-works/pi-tui";
import { execSync } from "node:child_process";

export default function (pi: ExtensionAPI) {
  let cachedPassword: string | null = null;
  let passwordExpiry = 0;
  const CACHE_DURATION_MS = 5 * 60 * 1000; // 5 minutes

  async function getPassword(ctx: any): Promise<string | null> {
    const now = Date.now();

    // Return cached password if still valid
    if (cachedPassword && now < passwordExpiry) {
      return cachedPassword;
    }

    // Prompt the user with a masked password input (shows ● stars)
    const password = await ctx.ui.custom<string | null>(
      (tui, theme, _kb, done) => {
        let value = "";
        let cachedLines: string[] | undefined;

        function refresh() {
          cachedLines = undefined;
          tui.requestRender();
        }

        function handleInput(data: string) {
          if (matchesKey(data, Key.enter)) {
            done(value);
            return;
          }
          if (matchesKey(data, Key.escape) || matchesKey(data, Key.ctrl("c"))) {
            done(null);
            return;
          }
          if (matchesKey(data, Key.backspace)) {
            if (value.length > 0) {
              value = value.slice(0, -1);
              refresh();
            }
            return;
          }
          // Printable character — append to password, show star
          if (data.length === 1 && data.charCodeAt(0) >= 32) {
            value += data;
            refresh();
          }
        }

        function render(width: number): string[] {
          if (cachedLines) return cachedLines;
          const lines: string[] = [];
          const add = (s: string) => lines.push(truncateToWidth(s, width));

          add(theme.fg("accent", "─".repeat(width)));
          add(theme.fg("accent", " 🔐 sudo authentication required"));
          lines.push("");
          add(theme.fg("text",   " Enter your sudo password:"));
          const stars = value.length > 0
            ? theme.fg("accent", "●".repeat(value.length))
            : theme.fg("dim", "(type your password…)");
          add(" " + stars);
          lines.push("");
          add(theme.fg("dim", " Enter to confirm  •  Esc to cancel"));
          add(theme.fg("accent", "─".repeat(width)));

          cachedLines = lines;
          return lines;
        }

        return {
          render,
          invalidate: () => { cachedLines = undefined; },
          handleInput,
        };
      },

    );

    if (!password) {
      ctx.ui.notify("sudo: no password provided — command blocked", "error");
      return null;
    }

    // Validate the password
    try {
      execSync(`echo ${JSON.stringify(password)} | sudo -S -p '' true`, {
        stdio: "pipe",
        shell: "/bin/bash",
      });
    } catch {
      ctx.ui.notify("sudo: incorrect password — command blocked", "error");
      return null;
    }

    cachedPassword = password;
    passwordExpiry = now + CACHE_DURATION_MS;
    ctx.ui.notify("sudo: authenticated (cached for 5 minutes)", "info");
    return cachedPassword;
  }

  // Intercept LLM bash tool calls that use sudo
  pi.on("tool_call", async (event, ctx) => {
    if (!isToolCallEventType("bash", event)) return;

    const command = event.input.command ?? "";
    if (!command.includes("sudo")) return;

    const password = await getPassword(ctx);
    if (!password) {
      return { block: true, reason: "sudo authentication failed or was cancelled by user" };
    }
    // Prepend inline sudo -S pre-auth so credentials are cached in the SAME shell
    event.input.command = `echo ${JSON.stringify(password)} | sudo -S -p '' true 2>/dev/null\n${event.input.command}`;
  });

  // Also intercept user ! bash commands that use sudo
  pi.on("user_bash", async (event, ctx) => {
    const command = event.command ?? "";
    if (!command.includes("sudo")) return;

    const password = await getPassword(ctx);
    if (!password) {
      return {
        result: {
          output: "sudo: authentication failed or was cancelled",
          exitCode: 1,
          cancelled: true,
          truncated: false,
        },
      };
    }
    // Prepend inline sudo -S pre-auth in the same shell
    return {
      operations: {
        exec(cmd: string, cwd: string, options: any) {
          const { createLocalBashOperations } = require("@earendil-works/pi-coding-agent");
          const local = createLocalBashOperations();
          return local.exec(
            `echo ${JSON.stringify(password)} | sudo -S -p '' true 2>/dev/null\n${cmd}`,
            cwd,
            options
          );
        },
      },
    };
  });

  // Register a command to manually clear the cached password
  pi.registerCommand("sudo-lock", {
    description: "Clear cached sudo password",
    handler: async (_args, ctx) => {
      cachedPassword = null;
      passwordExpiry = 0;
      execSync("sudo -k", { stdio: "ignore" }); // also invalidate kernel cache
      ctx.ui.notify("sudo: credentials cleared", "info");
    },
  });

  pi.on("session_start", async (_event, ctx) => {
    ctx.ui.notify("sudo-auth extension loaded — sudo commands will prompt for password", "info");
  });
}
