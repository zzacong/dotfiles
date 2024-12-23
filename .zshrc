# zmodload zsh/zprof

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
SPACESHIP_IBMCLOUD_SYMBOL="☁️  "

plugins=(
  deno
  # docker
  # docker-compose
  # dotenv
  # dotnet
  # extract
  # fd
  # flutter
  fnm
  # fzf
  # gitfast
  gitignore
  # history
  # kubectl
  pip
  # pipenv
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
export EDITOR="nvim"
export GIT_EDITOR="nvim"
export VISUAL="code"
export MY_PROXY="johnfire:johnfire@170.64.192.59:3128"
export DIGITALOCEAN="zacong@170.64.192.59"

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
alias dl="yt-dlp --proxy $MY_PROXY"

alias gtc="cd ~/.config"
alias gtl="cd ~/.local"
alias gtp="cd ~/Developer/project"
alias gts="cd ~/Developer/sandbox"

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
alias gstls="git stash list"
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

read_bitrate() {
    ffprobe -v error -print_format json -show_entries stream=bit_rate "$1" | jq '.streams[0].bit_rate'
}

to_low_bitrate() {
  if command -v "ffmpeg" >/dev/null 2>&1; then
    while getopts ":i:o:b:" opt; do
      case $opt in
      i)
        local arg_i="$OPTARG"
        ;;
      o)
        local arg_o="$OPTARG"
        ;;
      b)
        local arg_b="$OPTARG"
        ;;
      \?)
        echo "Invalid option: -$OPTARG" >&2
        return 1
        ;;
      :)
        echo "Option -$OPTARG requires an argument." >&2
        return 1
        ;;
      esac
    done
    if [[ -n "$arg_i" && -f "$arg_i" ]]; then
      local filename_no_ext="${arg_i%.*}"
      local video_output="${filename_no_ext}_output.mp4"
    else
      echo "'${arg_i:-<no name>}' does not exist." >&2
      return 1
    fi
    echo "Input: $arg_i"
    echo "Output: ${arg_o:-$video_output}"
    echo "Bitrate: ${arg_b:-2M}"
    ffmpeg -i "$arg_i" -b:v "${arg_b:-2M}" "${arg_o:-$video_output}"
  else
    echo "ffmpeg not found." >&2
    return 1
  fi
}

list_videos() {
  for file in *; do 
      if [ "$file" != "input.txt" ]; then
        echo "file '$file'"
      fi
  done > input.txt
  cat input.txt
  # for file in *; do echo "file '$file'"; done > input.txt
  # sed '$d' input.txt > temp.txt && mv temp.txt input.txt
}

tag_video_hevc() {
  if [[ $# -lt 2 ]]; then
      echo "Usage: tag_video_hevc <input_file> <output_file>"
      return 1
  fi
  local tag_input_file=$1 
  local tag_output_file=$2 
  ffmpeg -i "$tag_input_file" -c copy -tag:v hvc1 "$tag_output_file"
}

validate_trim_video_params() {
  if [[ $# -lt 3 ]]; then
    echo "Usage: trim_video <input_file> <output_file> <start_time> [end_time]"
    return 1
  fi
  # Set variables globally for reuse in caller functions
  tv_input_file=$1
  tv_output_file=$2
  tv_start_time=$3
  tv_end_time=$4
}

trim_video_copy() {
  validate_trim_video_params "$@"
  if [[ $? -ne 0 ]]; then return 1; fi
  if [[ -z $tv_end_time ]]; then
    ffmpeg -i "$tv_input_file" -ss "$tv_start_time" -c copy "$tv_output_file"
  else
    ffmpeg -i "$tv_input_file" -ss "$tv_start_time" -to "$tv_end_time" -c copy "$tv_output_file"
  fi
}

trim_video_copy_hevc() {
  validate_trim_video_params "$@"
  if [[ $? -ne 0 ]]; then return 1; fi
  if [[ -z $tv_end_time ]]; then
    ffmpeg -i "$tv_input_file" -ss "$tv_start_time" -c copy -tag:v hvc1 "$tv_output_file"
  else
    ffmpeg -i "$tv_input_file" -ss "$tv_start_time" -to "$tv_end_time" -c copy -tag:v hvc1 "$tv_output_file"
  fi
}

trim_video_264() {
  validate_trim_video_params "$@"
  if [[ $? -ne 0 ]]; then return 1; fi
  if [[ -z $tv_end_time ]]; then
    ffmpeg -i "$tv_input_file" -ss "$tv_start_time" -c:v libx264 -crf 24 -preset slow -c:a aac -c:s copy "$tv_output_file"
  else
    ffmpeg -i "$tv_input_file" -ss "$tv_start_time" -to "$tv_end_time" -c:v libx264 -crf 24 -preset slow -c:a aac -c:s copy "$tv_output_file"
  fi
}

trim_video_h264_gpu() {
  validate_trim_video_params "$@"
  if [[ $? -ne 0 ]]; then return 1; fi
  if [[ -z $tv_end_time ]]; then
    ffmpeg -i "$tv_input_file" -ss "$tv_start_time" -c:v h264_videotoolbox -b:v 4000k -c:a aac -c:s copy "$tv_output_file"
  else
    ffmpeg -i "$tv_input_file" -ss "$tv_start_time" -to "$tv_end_time" -c:v h264_videotoolbox -b:v 4000k -c:a aac -c:s copy "$tv_output_file"
  fi
}

trim_video_hevc() {
  validate_trim_video_params "$@"
  if [[ $? -ne 0 ]]; then return 1; fi
  if [[ -z $tv_end_time ]]; then
    ffmpeg -i "$tv_input_file" -ss "$tv_start_time" -c:v libx265 -crf 28 -preset slow -c:a aac -c:s copy -tag:v hvc1 "$tv_output_file"
  else
    ffmpeg -i "$tv_input_file" -ss "$tv_start_time" -to "$tv_end_time" -c:v libx265 -crf 28 -preset slow -c:a aac -c:s copy -tag:v hvc1 "$tv_output_file"
  fi
}

trim_video_hevc_gpu() {
  validate_trim_video_params "$@"
  if [[ $? -ne 0 ]]; then return 1; fi
  if [[ -z $tv_end_time ]]; then
    ffmpeg -i "$tv_input_file" -ss "$tv_start_time" -c:v hevc_videotoolbox -b:v 4000k -c:a aac -c:s copy -tag:v hvc1 "$tv_output_file"
  else
    ffmpeg -i "$tv_input_file" -ss "$tv_start_time" -to "$tv_end_time" -c:v hevc_videotoolbox -b:v 4000k -c:a aac -c:s copy -tag:v hvc1 "$tv_output_file"
  fi
}

encode_video_hevc() {
  if [[ $# -lt 2 ]]; then
      echo "Usage: encode_video_hevc <input_file> <output_file>"
      return 1
  fi
  local tag_input_file=$1 
  local tag_output_file=$2 
  if [[ $? -ne 0 ]]; then return 1; fi
  ffmpeg -i "$tag_input_file" -c:v libx265 -crf 28 -preset slow -c:a copy -c:s copy -tag:v hvc1 "$tag_output_file"
}

join_videos() {
  # Check if at least two files are provided
  if [[ $# -lt 2 ]]; then
    echo "Usage: join_videos <output_file> <input_file1> <input_file2> [<input_file3> ...]"
    return 1
  fi
  echo "$@"
  local output_file=$1
  shift  # Remove the first argument (output file)
  local temp_file="file_list.txt"
  echo "$@"
  # Create a temporary file to list all input videos
  : > "$temp_file"  # Clear the file if it exists
  for video in "$@"; do
    # echo "file '$video'" >> "$temp_file"
    # Escape file paths with spaces and special characters correctly
    printf "file '%s'\n" "$video" >> "$temp_file"
  done
  # Run ffmpeg to join the videos using the concat demuxer
  ffmpeg -f concat -safe 0 -i "$temp_file" -c copy "$output_file"
  # Clean up the temporary file
  rm "$temp_file"
}
