for keymap in 'emacs' 'viins'; do
    bindkey -M "$keymap" "$key_info[Control]N" history-substring-search-down
    bindkey -M "$keymap" "$key_info[Control]P" history-substring-search-up
    bindkey -M "$keymap" "$key_info[Control]A" beginning-of-line
    bindkey -M "$keymap" "$key_info[Control]E" end-of-line
    bindkey -M "$keymap" "$key_info[Control]F" vi-forward-word
    bindkey -M "$keymap" "$key_info[Control]B" vi-backward-word
done
