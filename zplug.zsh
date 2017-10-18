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
zplug "rupa/z", use:z.sh
zplug "changyuheng/fz", defer:1, if:"which fzf"
zplug "github/hub", use:"etc/*zsh", if:"which hub"

# Fish like feature
zplug "modules/completion", from:prezto, defer:1
zplug "modules/syntax-highlighting", from:prezto, defer:2
zplug "modules/history-substring-search", from:prezto, defer:3
zplug "modules/autosuggestions", from:prezto

# Prompt
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, as:theme

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
