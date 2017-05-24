# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Load zplug
source ~/.zplug/init.zsh

# Environment
zplug "modules/environment", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/history", from:prezto

# Utility
zplug "modules/archive", from:prezto

# Prompt
zplug "mafredri/zsh-async", on:kepbod/pure
zplug "kepbod/pure", use:pure.zsh, as:theme

# Fish like feature
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"

# Language
zplug "modules/python", from:prezto

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
