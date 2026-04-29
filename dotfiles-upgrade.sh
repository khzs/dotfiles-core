#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

extract_name() {
  echo "$1" | tr '/' '\n' | grep -v "config" | awk 'NR==4'
}

makepatch() {
  local name=$(extract_name "$1")
  diff -u "copy/${name}.base" "$1" > "${name}.patch"
  if ! command -v bat > /dev/null; then
    cat "${name}.patch"
  else
    bat --paging=never "${name}.patch"
  fi
}

applypatch() {
  local name=$(extract_name "$1")
  cp "copy/${name}.base" "$1"
  patch "$1" < "${name}.patch"
  rm "${name}.patch"
}

paths=(
)

git status
git diff
for p in "${paths[@]}"; do makepatch "$p"; done
git pull
source one-time-setup-$(uname).sh
for p in "${paths[@]}"; do applypatch "$p"; done
git status
git diff
