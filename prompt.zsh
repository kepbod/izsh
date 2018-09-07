# Match the terminal-cursor to the current vi-mode
autoload -Uz add-zsh-hook add-zle-hook-widget
add-zle-hook-widget  line-init      set-vi-mode-terminal-cursor
add-zle-hook-widget  keymap-select  set-vi-mode-terminal-cursor
set-vi-mode-terminal-cursor () {
   case $KEYMAP in
      vicmd) echo -ne '\e[1 q';; # block cursor
      viins|main|*) echo -ne '\e[5 q';; # bar cursor
   esac
}
add-zsh-hook         preexec        reset-vi-mode-terminal-cursor
reset-vi-mode-terminal-cursor () {
   echo -ne '\e[1 q'
}