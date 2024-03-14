# 环境变量
if [[ $(hostname) == "MBP2017" ]]; then
  export PATH="$HOME/bin:/usr/local/bin:$PATH"
  export ZSH="$HOME/.oh-my-zsh"
  export TERM="xterm-256color"
  export RANGER_LOAD_DEFAULT_RC=false
  export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
elif [[ $(hostname) == "Cloud" ]]; then
  # something
fi


# Oh My Zsh
source $ZSH/oh-my-zsh.sh
if [[ $(hostname) == "MBP2017" ]]; then
  ZSH_THEME="bira"
  plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
elif [[ $(hostname) == "Cloud" ]]; then
fi

# Aliases
alias c="code ."
alias ..="cd ../"
alias ..l="cd ../ && ls -a"
alias ..ll="cd ../ && ls -al"

alias zshrc='nvim ~/.zshrc'
alias update="source ~/.zshrc"
alias cls="clear"
alias vim="nvim"

alias ta="tmux a"
alias tn="tmux"

alias offclash='unset http_proxy && unset https_proxy all_proxy'
alias onclash='export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'

if [[ $(hostname) == "MBP2017" ]]; then
  alias xserver="defaults write org.xquartz.X11 app_to_run /usr/bin/true && open -a XQuartz"
  alias ut="ssh -X ubuntu@82.156.196.198"
elif [[ $(hostname) == "Cloud" ]]; then
fi


# 避免粘贴格式损坏
DISABLE_MAGIC_FUNCTIONS="true"
# Additional configuration

eval $(thefuck --alias f)

# Welcome message
if [[ $(hostname) == "MBP2017" ]]; then
  figlet -c -f larry3d Welcome!
elif [[ $(hostname) == "Cloud" ]]; then
fi
