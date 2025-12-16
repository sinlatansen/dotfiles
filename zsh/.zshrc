# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 环境变量
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# 代理
export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"

export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8

ZSH_THEME="ys"

if [[ $(hostname) == "MacBookPro" ]]; then

  ZSH_THEME="re5et"
    
  export TERM="xterm-256color"
  export RANGER_LOAD_DEFAULT_RC=false
  
  # homebrew镜像源
  # export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"

  export https_proxy=http://127.0.0.1:33210 http_proxy=http://127.0.0.1:33210 all_proxy=socks5://127.0.0.1:33211

  # 快捷开启XQuartz
  alias xserver="defaults write org.xquartz.X11 app_to_run /usr/bin/true && open -a XQuartz"

  alias ut="ssh -X ubuntu@82.156.196.198"

  # lsd 长日期
  alias ll='lsd -l --date +%Y年%m月%d"日"%H:%M:%S'
  alias lla='lsd -al --date +%Y年%m月%d"日"%H:%M:%S'

  # taskbar
  alias start="brew services start sketchybar"
  alias stop="brew services stop sketchybar"

  # gcc
  alias gcc="gcc-14"
  alias cc="gcc-14"
  alias g++="g++-14"
  alias c++="c++-14"

elif [[ $(hostname) == "jdCloud" ]]; then

  ZSH_THEME="powerlevel10k/powerlevel10k"

  export http_proxy="http://127.0.0.1:7890"
  export https_proxy="http://127.0.0.1:7890"

  export CF_Key="kdDY-FTgAFNU8KOwburpcTE3n1KzGHc6cXM_q0zY"
  export CF_Email="lllzzzyyy32@gmail.com"

  # acme.sh ssl证书
  . "/home/lzy/.acme.sh/acme.sh.env"

  alias cat="batcat"
  
elif [[ $(hostname) == "MacMini" ]]; then

  ZSH_THEME="powerlevel10k/powerlevel10k"

  export http_proxy=http://127.0.0.1:7890
  export https_proxy=http://127.0.0.1:7890
  export ALL_PROXY=socks5://127.0.0.1:7890

  export PATH="$HOME/.local/bin:$PATH"

  export OLLAMA_HOST=0.0.0.0
  export OLLAMA_ORIGINS=*

  # 用trash代替rm
  alias rm="trash"

  eval "$(zoxide init zsh)"

elif [[ $(hostname) == "zongbao-BUAA" ]]; then

  alias fd="fdfind"

elif [[ $(hostname) == "y9000p" ]]; then

  export PATH=$PATH:$HOME/.dotnet
  export DOTNET_ROOT=$HOME/.dotnet
  export PATH=$PATH:$HOME/dotfiles/scripts

  ZSH_THEME="powerlevel10k/powerlevel10k"

  alias cubemx="flatpak run com.st.STM32CubeMX"
  alias ob="bluetoothctl power on"
  alias cb="bluetoothctl power off; cinnamon-screensaver-command --lock"

  alias mc="mingchao.sh"

  # eval "$(ssh-agent -s)"
  # ssh-add ~/.ssh/id_ed25519

  eval "$(direnv hook zsh)"

  alias rm="trash-put"

  export PATH=$HOME/App/omnetpp/bin:$PATH
  export LD_LIBRARY_PATH=$HOME/App/omnetpp/lib:$LD_LIBRARY_PATH
  GITSTATUS_LOG_LEVEL=DEBUG

  # lua lsp
  export PATH=$PATH:/opt/lua-language-server/bin

  export GTK_IM_MODULE=fcitx
  export QT_IM_MODULE=fcitx
  export XMODIFIERS=@im=fcitx

  # presenterm
  alias md2slide="presenterm"

  eval "$(zoxide init zsh)"

  # Allow Ctrl-z to toggle between suspend and resume
  function Resume {
    fg
    zle push-input
    BUFFER=""
    zle accept-line
  }
  zle -N Resume
  bindkey "^Z" Resume

fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


plugins=(git zsh-autosuggestions zsh-syntax-highlighting copyfile copypath sudo)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ..="cd ../"
alias ..l="cd ../ && ls -a"
alias ..ll="cd ../ && ls -al"
alias n="neofetch"

alias ...='cd ../../..'
alias ....='cd ../../../..'
alias .....='cd ../../../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias zshrc='hx ~/.zshrc'
alias update="source ~/.zshrc"
alias cls="clear"
alias h='history | fzf --no-preview'

alias df='duf'
alias md="mkdir"

# 连接上次会话
alias ta="tmux a"
# 新会话
alias tn="tmux"
# 列出所有会话
alias tls="tmux ls"
# 删除tmux会话
alias td0="tmux kill-session -t 0"
alias td1="tmux kill-session -t 1"
alias td2="tmux kill-session -t 2"
alias td3="tmux kill-session -t 3"
alias td4="tmux kill-session -t 4"
alias td5="tmux kill-session -t 5"

# 临时开关代理
alias offclash='unset http_proxy && unset https_proxy all_proxy'
alias onclash='export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'

# lsd
alias bls="/bin/ls"
alias ls="lsd"
alias lsa="lsd -a"
alias lt="lsd --tree"
alias lta="lsd -a --tree"

# frp
alias reload_frp="sudo launchctl stop com.frp.client; sudo launchctl start com.frp.client"

# lazygit
alias lg="lazygit"
# dotfiles
alias dt="cd ~/dotfiles && lsa"

# lsd
alias bll="/bin/ls -al"
alias ll='lsd -l'
alias lla='lsd -al'

# makefile
alias gm="cp ~/dotfiles/makefile/makefile ."
alias gM="cp ~/dotfiles/makefile/makefile Makefile"

# 避免粘贴格式损坏
DISABLE_MAGIC_FUNCTIONS="true"

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# fzf
source <(fzf --zsh)

export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

export FZF_DEFAULT_OPTS="--height 70% --layout=reverse --border=bold --border=rounded --margin=3% --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
--color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B --walker-skip .git,node_modules,target --preview 'batcat -n --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_CTRL_T_OPTS="--preview 'batcat --color=always {}'"

PATH="$PATH:./node_modules/.bin"

export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# helix
export EDITOR=hx

# Welcome message
if [[ $(hostname) == "jdCloud" ]]; then
  
  clear
  echo
  echo "求知无坦途。"

elif [[ $(hostname) == "zongbao-BUAA" ]]; then

  clear
  echo
  echo "欢迎来到宗宝学长网站服务器。"

elif [[ $(hostname) == "y9000p" ]]; then

  clear
  echo
  echo "求知无坦途。"
  echo

fi

