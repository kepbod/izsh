# Color output
zstyle ':prezto:*:*' color 'yes'

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':prezto:*:*' case-sensitive 'yes'

# Set the Zsh modules to load (man zshmodules).
zstyle ':prezto:load' zmodule 'attr' 'stat'

# Set the Zsh functions to load (man zshcontrib).
zstyle ':prezto:load' zfunction 'zargs' 'zmv'

# Vi mode
zstyle ':prezto:module:editor' key-bindings 'vi'

# Auto convert .... to ../..
zstyle ':prezto:module:editor' dot-expansion 'yes'

# Auto set the tab and window titles.
zstyle ':prezto:module:terminal' auto-title 'yes'

# Set the window title format.
zstyle ':prezto:module:terminal:window-title' format '%n@%m: %s'

# Set the tab title format.
zstyle ':prezto:module:terminal:tab-title' format '%m: %s'

# Set the terminal multiplexer title format.
zstyle ':prezto:module:terminal:multiplexer-title' format '%s'

# Enable fast vi-mode
KEYTIMEOUT=1

# Enable LESSPIPE
LESSOPEN="|lesspipe.sh %s"; export LESSOPEN

# Platform
if [[ "$(uname)" == "Darwin" ]]; then
PICK="*darwin*"
elif [[ "$(uname)" == "Linux" ]]; then
PICK="*musl*"
elif [[ "$(uname)" == "MINGW32_NT" ]]; then
PICK="*windows*"
fi

# Load other setting
IZSH_DIR=${ZDOTDIR:-$HOME}/.izsh
source $IZSH_DIR/plugin.zsh
source $IZSH_DIR/config.zsh
source $IZSH_DIR/alias.zsh
