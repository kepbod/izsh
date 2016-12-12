# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Load zplug
source ~/.zplug/init.zsh

# Environment
zplug "modules/environment", from:zim
zplug "modules/directory", from:zim
zplug "modules/history", from:zim
zplug "modules/utility", from:zim
zplug "modules/editor", from:prezto

# Utility
zplug "b4b4r07/enhancd", use:init.sh
zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:"fzf"
zplug "monochromegane/the_platinum_searcher", \
    as:command, \
    from:gh-r, \
    rename-to:"pt"
zplug "github/hub", \
    as:command, \
    from:gh-r, \
    hook-load:"$(~/.zplug/bin/hub alias -s)"

# Prompt
zplug "mafredri/zsh-async", on:sindresorhus/pure
zplug "sindresorhus/pure"

# Fish like feature
zplug "modules/syntax-highlighting", from:zim
zplug "modules/history-substring-search", from:zim
zplug "modules/completion", from:zim
zplug "zsh-users/zsh-autosuggestions"


# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

# Source packages and add commands to $PATH
zplug load

if zplug check modules/editor; then
    zstyle ':prezto:module:editor' key-bindings 'emacs'
fi

