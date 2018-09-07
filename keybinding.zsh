# Add some keybindings
for keymap in 'emacs' 'viins'; do
    bindkey -M "$keymap" "$key_info[Control]N" history-substring-search-down
    bindkey -M "$keymap" "$key_info[Control]P" history-substring-search-up
    bindkey -M "$keymap" "$key_info[Control]A" beginning-of-line
    bindkey -M "$keymap" "$key_info[Control]E" end-of-line
    bindkey -M "$keymap" "$key_info[Control]F" vi-forward-word
    bindkey -M "$keymap" "$key_info[Control]B" vi-backward-word
done

# Enable autopair
autopair-init

# Enable surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround

# Enable select-quoted
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
        bindkey -M $m $c select-quoted
    done
done

# Enable select-bracketed
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
	for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $m $c select-bracketed
	done
done

# Enable cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs