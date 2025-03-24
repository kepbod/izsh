# alias
alias vi="nvim"
alias tmux="tmux -2"
alias r="radian"
alias wc="wc -l"
alias top="htop"
alias ls="lsd"
alias cat="bat -pp"
alias less="bat --wrap never"
alias grep="rg -N"
alias find="fd"
alias mkdir="mkdir -p"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ln="ln -i"
alias ssh="tssh"

# other functions
set_proxy() { export https_proxy=http://127.0.0.1:$1 && export http_proxy=http://127.0.0.1:$1 && export all_proxy=127.0.0.1:$1; }
unset_proxy() { unset https_proxy && unset http_proxy && unset all_proxy; }