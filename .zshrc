## ~/.zshrc
#
 
# Load Homebrew shell completion
# if type brew &> /dev/null; then
#   FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
#   autoload -Uz compinit
#   compinit
#   # rm -f ~/.zcompdump; compinit
# fi

# Load Homebrew on Apple Silicon
if [[ $(uname -m) == "arm64" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

SYSTEM_TYPE=$(uname -s)

# OH-MY-ZSH
# 
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
ZSH_THEME="spaceship-prompt/spaceship"
 
COMPLETION_WAITING_DOTS="true"
 
## Spaceship Prompt Options
SPACESHIP_PACKAGE_SHOW=true
SPACESHIP_TIME_SHOW=true

plugins=(
  deno
  # docker
  # docker-compose
  # dotenv
  dotnet
  extract
  # fd
  # flutter
  fnm
  # fzf
  # gitfast
  gitignore
  history
  # kubectl
  pip
  pipenv
  # nvm
  sudo
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# FZF
#
if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  export FZF_BASE="/usr/local/opt/fzf"
  export FZF_DEFAULT_COMMAND="fd --type f"
else
  export FZF_DEFAULT_COMMAND="fdfind --type f"
fi
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border --multi'
 
source "$ZSH/oh-my-zsh.sh"


# USER CONFIGURATION
# 
## Custom Aliases
alias cl="clear"
alias dirs="dirs -v"
alias fzfd="fd --type d | fzf"
alias lfrc="nvim ~/.config/lf/lfrc"
alias mf="touch"
alias runp="lsof -i"
alias trpt="trash-put"
alias trls="trash-list"
alias reload="source ~/.zshrc"
alias vi="nvim"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias zshrc="nvim ~/.zshrc"
alias zshrcc="code ~/.zshrc"
alias yt="youtube-dl --add-metadata"

alias gtc="cd ~/.config"
alias gtl="cd ~/.local"
alias gtp="cd ~/Developer/project"
alias gts="cd ~/Developer/sandbox"

export EDITOR="nvim"
export GIT_EDITOR="nvim"
export VISUAL="code"

## LF
# 
[ -f "$HOME/.config/lf/diricons" ] && source "$HOME/.config/lf/diricons"

## BAT
# 
export BAT_THEME="Coldark-Dark"

## git alias
# 
alias ga="git add"
alias gac="git add . && git commit -m"
alias gan="git add -N ."
alias gap="git add -N . && git add -p"
alias gb="git branch"
alias gba="git branch --all"
alias gc="git commit -m"
alias gcl="git clone"
alias gdiff="git diff"
alias gedit="git commit --amend --no-edit"
alias gedita="git add . && git commit --amend --no-edit"
alias geditm="git commit --amend"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gign="[ ! -f '.gitignore' ] && gitignore"
alias glog="git log --oneline --graph"
alias gloga="git log"
alias gpu="git push --set-upstream origin"
alias gpuh="git push --set-upstream origin HEAD"
alias gpull="git pull"
alias gpush="git push"
alias grh="git reset --hard"
alias grm="git remote"
alias grst="git restore"
alias gs="git status"
alias gsm="git switch main"
alias gsms="git switch master"
alias gst="git stash"
alias gsw="git switch"

## yadm alias
# 
alias ya="yadm add"
alias yc="yadm commit -m"
alias ydiff="yadm diff"
alias yf="yadm fetch"
alias ylog="yadm log --oneline"
alias ypull="yadm pull"
alias ypush="yadm push"
alias ys="yadm status"

## postgres alias
# 
alias startpsql="brew services start postgresql@14"
alias restartpsql="brew services restart postgresql@14"
alias stoppsql="brew services stop postgresql@14"

## mysql alias
# 
alias startmysql="brew services start mysql"
alias restartmysql="brew services restart mysql"
alias stopmysql="brew services stop mysql"

## mongodb alias
# 
alias startmongo="brew services start mongodb-community"
alias restartmongo="brew services restart mongodb-community"
alias stopmongo="brew services stop mongodb-community"

## pnpm
# 
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
alias pn="pnpm"
alias pnpx="pnpm dlx"
# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

## npm - corepack
# 
corepackup() {
  corepack enable
  corepack prepare pnpm@latest --activate;
  corepack prepare yarn@stable --activate;
}

## ANDROID_SDK
# 
export ANDROID_SDK="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT=$ANDROID_SDK
export PATH="$PATH:$ANDROID_SDK/emulator"
export PATH="$PATH:$ANDROID_SDK/tools"
export PATH="$PATH:$ANDROID_SDK/tools/bin"
export PATH="$PATH:$ANDROID_SDK/platform-tools"

## JAVA
# 
if command -v "/usr/libexec/java_home" &> /dev/null; then
  alias java_home="/usr/libexec/java_home"
  java8() { export JAVA_HOME=$("/usr/libexec/java_home" -v 1.8) }
  jdk() {
    version=$1
    export JAVA_HOME=$("/usr/libexec/java_home" -v "$version")
    java -version
  }
fi

## Ibmcloud
#
[ -f "/usr/local/ibmcloud/autocomplete/zsh_autocomplete" ] && source "/usr/local/ibmcloud/autocomplete/zsh_autocomplete"
alias ibm="ibmcloud"
alias cf="ibmcloud cf" 
alias ce="ibmcloud ce" 
alias cr="ibmcloud cr" 
alias cftarget="ibmcloud target --cf"

## Flutter
# 
export PATH="$PATH:$HOME/flutter/bin"

## Haskell ghcup
# 
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

## Go
# 
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

## Xampp
# 
alias xampp="cd $HOME/bitnami/stackman/machines/xampp/volumes/root"
alias htdocs="cd $HOME/.bitnami/stackman/machines/xampp/volumes/root/htdocs"

## Fauna
# 
FAUNA_AC_ZSH_SETUP_PATH="$HOME/Library/Caches/fauna-shell/autocomplete/zsh_setup"
[ -f $FAUNA_AC_ZSH_SETUP_PATH ] && source $FAUNA_AC_ZSH_SETUP_PATH # fauna shell autocomplete

## Created by `pipx` on 2021-09-09 05:14:45
# 
# enable pipx shell completion
if command -v "register-python-argcomplete" &> /dev/null; then
  eval "$(register-python-argcomplete pipx)"
fi

## Fnm (node version manager)
#
if command -v "fnm" &> /dev/null; then
  eval "$(fnm env)"
  # eval "$(fnm env --use-on-cd)"
  alias f16="fnm use 16"
fi


## Add PATHs
# 
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

## Man page
#
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  # MacOS
  # 
  ## Conda
  # 
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  #  __conda_setup="$('$HOME/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  #  if [ $? -eq 0 ]; then
  #    eval "$__conda_setup"
  #  else
  #      if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
  #        . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
  #      else
  #        export PATH="$HOME/opt/anaconda3/bin:$PATH"
  #      fi
  #  fi
  # unset __conda_setup
  # <<< conda initialize <<<
  alias bupd="brew update && brew outdated"
  alias bupg="brew upgrade && brew cleanup"
  
else
  # Linux
  # 
  alias fd="fdfind"
  alias open="xdg-open"
  alias bat="batcat"

  # SSH Key
  #
  # if [ -z "$SSH_AUTH_SOCK" ] ; then
    # eval `ssh-agent -s`
    # ssh-add
  # fi
fi
 
# CUSTOM FUNCTIONS
# 
## Load .env file
#
loadenv() {
  local envfile="${1:=.env}"
  if [ -f $envfile ]; then
    echo "Loading env vars from $envfile"
    set -a
    source <(cat $envfile | sed -e '/^[[:space:]]*#/d;/^[[:space:]]*$/d')
    set +a
  else
    echo "Failed to load env vars: \"$envfile\" not found."
  fi
}

## Docker
#
dockerprune() {
  docker rmi `docker images --filter "dangling=true" -q`
}

## Git
#
gitignore() { 
  echo ".DS_Store\nnode_modules/\n\n.env\n.env.local\n\n.firebase/\n.netlify/\n\nbuild/\ndist/\n" >> ".gitignore" 
}

gitzzacong() {
  git config user.name "Zac Ong"
  git config user.email "61817066+zzacong@users.noreply.github.com"
}

gitibm() {
  git config user.name "Zac Ong"
  git config user.email "zac.ong@ibm.com"
}

