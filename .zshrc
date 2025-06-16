
minimize()  {   osascript -e 'tell application "System Events" to keystroke "h" using command down'   }

rice()  {              cd ~/workspace/rice/                  ;   pipenv run python main.py "$1"                     ; cd -   }
ytg()   {  minimize ;  cd ~/OneDrive/boxtur/youtube_grid_01  ;   pipenv run python main.py         ;  pipenv update ; cd -   }

# Created by `pipx` on 2023-03-09 14:50:54
export PATH="$PATH:/Users/khzs/.local/bin"


# common aliases and functions
source /dev/stdin <<< "$(curl https://gist.githubusercontent.com/khzs/ea5f71b7ad0ec6ada102a3addb10ce49/raw 2> /dev/null)"

# common ricing
source ~/.config/dotfiles-common/zshrc-common-rice.sh

