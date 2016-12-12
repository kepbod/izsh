# alias
alias rm="${aliases[rm]:-rm} -i"
alias mv="${aliases[mv]:-mv} -i"
alias cp="${aliases[cp]:-cp} -i"
alias ln="${aliases[ln]:-ln} -i"
alias mkdir="${aliases[mkdir]:-mkdir} -p"
alias vi="vim -X"
if (( $+commands[htop] )); then
    alias top=htop
fi
