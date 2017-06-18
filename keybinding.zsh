# Vi mode
zstyle ':prezto:module:editor' key-bindings 'vi'

# Key-bindings
for keymap in 'emacs' 'viins'; do
    bindkey -M "$keymap" "$key_info[Control]N" history-substring-search-down
    bindkey -M "$keymap" "$key_info[Control]P" history-substring-search-up
    bindkey -M "$keymap" "$key_info[Control]A" beginning-of-line
    bindkey -M "$keymap" "$key_info[Control]E" end-of-line
    bindkey -M "$keymap" "$key_info[Control]F" vi-forward-word
    bindkey -M "$keymap" "$key_info[Control]B" vi-backward-word
done

# Auto convert .... to ../..
zstyle ':prezto:module:editor' dot-expansion 'yes'

# Let prompt show vi mode
VIM_PROMPT="❯"
PROMPT='%(?.%F{magenta}.%F{red})${VIM_PROMPT}%f '

prompt_pure_update_vim_prompt() {
    zle || {
        print "error: pure_update_vim_prompt must be called when zle is active"
        return 1
    }
    VIM_PROMPT=${${KEYMAP/vicmd/❮}/(main|viins)/❯}
    zle .reset-prompt
}

function zle-line-init zle-keymap-select {
    prompt_pure_update_vim_prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
