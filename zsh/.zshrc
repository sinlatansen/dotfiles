# 环境变量
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# 代理
export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"

if [[ $(hostname) == "lzy-MacBookPro" ]]; then
  
  export TERM="xterm-256color"
  export RANGER_LOAD_DEFAULT_RC=false
  
  # homebrew镜像源
  # export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
  
elif [[ $(hostname) == "Cloud" ]]; then
  
  # 给root传递
  export EDITOR="/usr/bin/nvim"
  
  # X11
  export DISPLAY=localhost:10.0

  # nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

elif [[ $(hostname) == "Y9000P" ]]; then
  # 代理
  host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
  export http_proxy="http://$host_ip:7890"
  export https_proxy="http://$host_ip:7890"

  # X11
  export DISPLAY=$host_ip:0
  
  # neovim
  export PATH="/opt/nvim/bin:$PATH"

fi

# Oh My Zsh
if [[ $(hostname) == "lzy-MacBookPro" ]]; then
  
  ZSH_THEME="bira"
  # eval "$(lua $HOME/.oh-my-zsh/custom/plugins/zlua/z.lua --init zsh)"

elif [[ $(hostname) == "Cloud" ]]; then

  ZSH_THEME="ys"
  
elif [[ $(hostname) == "Y9000P" ]]; then

  ZSH_THEME="eastwood"
  
fi

plugins=(git zsh-autosuggestions zsh-syntax-highlighting copyfile copypath sudo)

source $ZSH/oh-my-zsh.sh

# Aliases
alias c="code ."
alias ..="cd ../"
alias ..l="cd ../ && ls -a"
alias ..ll="cd ../ && ls -al"

alias ...='cd ../../..'
alias ....='cd ../../../..'
alias .....='cd ../../../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'


alias zshrc='nvim ~/.zshrc'
alias update="source ~/.zshrc"
alias cls="clear"
alias vim="nvim"
alias n="nvim"
alias n.="nvim ."
alias h='history'

alias df='df -h'
alias md="mkdir "


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
alias ls="lsd"
alias lsa="lsd -a"
alias lt="lsd --tree"
alias lta="lsd -a --tree"

# lazygit
alias lg="lazygit"
# dotfiles
alias dt="cd ~/dotfiles && lsa"

# lsd
alias ll='lsd -l'
alias lla='lsd -al'

if [[ $(hostname) == "lzy-MacBookPro" ]]; then

  # 快捷开启XQuartz
  alias xserver="defaults write org.xquartz.X11 app_to_run /usr/bin/true && open -a XQuartz"

  alias ut="ssh -X ubuntu@82.156.196.198"

  # lsd 长日期
  alias ll='lsd -l --date +%Y年%m月%d"日"%H:%M:%S'
  alias lla='lsd -al --date +%Y年%m月%d"日"%H:%M:%S'

elif [[ $(hostname) == "Cloud" ]]; then

  # typecho
  alias tgp="cd /www/typecho/usr/themes/butterfly/ && git pull"
  alias pgp="cd /www/typecho/usr/plugins/ && git pull"

fi


# 避免粘贴格式损坏
DISABLE_MAGIC_FUNCTIONS="true"

eval $(thefuck --alias f)

# Welcome message
if [[ $(hostname) == "MBP2017" ]]; then

  # figlet -c -f larry3d Welcome!
  # fortune

elif [[ $(hostname) == "Cloud" ]]; then

  echo
  echo
  figlet -c Hello Ubuntu!
  fortune

elif [[ $(hostname) == "Y9000P" ]]; then
  fortune | pokemonsay
fi

