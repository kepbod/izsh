# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Load zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Environment
zplug "modules/environment", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/history", from:prezto

# Utility
zplug "modules/archive", from:prezto
zplug "github/hub", use:"etc/*zsh", if:"which hub"

# Prompt
zplug "mafredri/zsh-async", on:kepbod/pure
zplug "kepbod/pure", use:pure.zsh, as:theme

# Fish like feature
zplug "modules/completion", from:prezto
zplug "modules/history-substring-search", from:prezto, defer:1
zplug "modules/syntax-highlighting", from:prezto
zplug "modules/autosuggestions", from:prezto

# Language
zplug "modules/python", from:prezto
zplug "modules/git", from:prezto

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
