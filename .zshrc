# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# ~/.zshrc
 
# Load Homebrew shell completion
# if type brew &>/dev/null; then
#   FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

#   autoload -Uz compinit
#   compinit
#   # rm -f ~/.zcompdump; compinit
# fi
 
 
# OH-MY-ZSH
# 
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
ZSH_THEME="spaceship-prompt/spaceship"
# ZSH_THEME="powerlevel10k/powerlevel10k"

COMPLETION_WAITING_DOTS="true"
 
## Spaceship Prompt Options
SPACESHIP_PACKAGE_SHOW=true
SPACESHIP_TIME_SHOW=true

## Powerlevel10k Options
# typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=true
 
plugins=(
  copyfile
  docker
  docker-compose
  extract
  fd
  fzf
  gitfast
  gitignore
  history
  kubectl
  pip
  pipenv
  npm
  nvm
  macos
  sudo
  thefuck
  yarn
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)
 
# FZF
#
export FZF_BASE="/usr/local/opt/fzf" # macos
export FZF_DEFAULT_COMMAND="fd --type f" # macos
# export FZF_DEFAULT_COMMAND="fdfind --type f" # linux
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
# alias fd="fdfind" # linux
 
alias dotfile="cd ~/share/dotfiles"
alias gtc="cd ~/.config"
alias gtl="cd ~/.local"
alias gtp="cd ~/project"
alias gts="cd ~/sandbox"
 
export EDITOR="nvim"
export GIT_EDITOR="nvim"
export VISUAL="code"
 
## lf
# 
[ -f "$HOME/.config/lf/diricons" ] && source "$HOME/.config/lf/diricons"
export PATH="$HOME/.local/bin:$PATH" # linux
 
## Bat
# 
export BAT_THEME="Coldark-Dark"
 
## Load .env file
#
loadenv() {
  local envfile="${1:=.env}"
  if [ -f $envfile ]; then
    # Load Environment Variables
    echo "Loading env vars from $envfile"
    export $(grep -v '^#' $envfile | xargs)
  else
    echo "Failed to load env vars: \"$envfile\" not found."
  fi
}
 
## Git Aliases
# 
alias ga="git add ."
alias gac="git add . && git commit -m"
alias gb="git branch"
alias gba="git branch --all"
alias gc="git commit -m"
alias gcl="git clone"
alias gdiff="git diff"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gign="[ ! -f '.gitignore' ] && gitignore"
alias glog="git log --oneline --graph"
alias gloga="git log"
alias gpu="git push --set-upstream origin"
alias gpull="git pull"
alias gpush="git push"
alias grh="git reset --hard"
alias grm="git remote"
alias gs="git status"
alias gsc="git switch --create"
alias gsm="git switch main"
alias gsms="git switch master"
alias gst="git stash"
alias gsw="git switch"
gitignore() { echo ".DS_Store\nnode_modules/\n\n.env\n.env.local\n\n.firebase/\n.netlify/\n\nbuild/\ndist/\n" >> ".gitignore" }
  
## postgres alias
# 
alias startpsql="brew services start postgresql"
alias restartpsql="brew services restart postgresql"
alias stoppsql="brew services stop postgresql"
 
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

## redis alias
# 
alias startredis="brew services start redis"
alias restartredis="brew services restart redis"
alias stopredis="brew services stop redis"
 
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
export JAVA_8_HOME=$("/usr/libexec/java_home" -v 1.8)
export JAVA_11_HOME=$("/usr/libexec/java_home" -v 11)
 
alias java_home="/usr/libexec/java_home"
alias java8="export JAVA_HOME=$JAVA_8_HOME"
alias java11="export JAVA_HOME=$JAVA_11_HOME"
 
## SSH
#
alias connxampp="ssh -i '$HOME/.bitnami/stackman/machines/xampp/ssh/id_rsa' -o StrictHostKeyChecking=no 'bitnami@192.168.64.2'"
alias connvbox="ssh 'zzacong@192.168.56.3'"
 
## Ibmcloud
#
[ -f "/usr/local/ibmcloud/autocomplete/zsh_autocomplete" ] && source "/usr/local/ibmcloud/autocomplete/zsh_autocomplete"
alias ibm="ibmcloud"
alias cf="ibmcloud cf" 
alias ce="ibmcloud ce" 
alias cr="ibmcloud cr" 
alias cftarget="ibmcloud target --cf"
 
## Docker
#
function dockerprune {
  docker rmi `docker images --filter "dangling=true" -q`
}
 
## Conda
# 
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('$HOME/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
      if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
      else
        export PATH="$HOME/opt/anaconda3/bin:$PATH"
      fi
  fi
# unset __conda_setup
# <<< conda initialize <<<
 
## Flutter
# 
export PATH="$PATH:$HOME/flutter/bin"
 
## Haskell ghcup
# 
[ -f "/Users/zzmacpro/.ghcup/env" ] && source "/Users/zzmacpro/.ghcup/env" # ghcup-env
 
## Go
# 
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
 
## Xampp
# 
alias xampp="cd $HOME/bitnami/stackman/machines/xampp/volumes/root"
alias htdocs="cd $HOME/.bitnami/stackman/machines/xampp/volumes/root/htdocs"
 
# prompt_context(){}

## Fauna autocomplete setup
# 
FAUNA_AC_ZSH_SETUP_PATH="$HOME/Library/Caches/fauna-shell/autocomplete/zsh_setup" && test -f $FAUNA_AC_ZSH_SETUP_PATH && source $FAUNA_AC_ZSH_SETUP_PATH
 
## Created by `pipx` on 2021-09-09 05:14:45
# 
export PATH="$PATH:$HOME/.local/bin"
# enable pipx shell completion
eval "$(register-python-argcomplete pipx)"
 
## Homebrew
# 
export PATH="/usr/local/sbin:$PATH"

## Man page
#
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
 
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
 
# export GPG_TTY=$(tty)
 
# SSH Key (Linux)
#
# if [ -z "$SSH_AUTH_SOCK" ] ; then
#   eval `ssh-agent -s`
#   ssh-add
# fi
 
