# Color output
zstyle ':prezto:*:*' color 'yes'

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':prezto:*:*' case-sensitive 'yes'

# Set the Zsh modules to load (man zshmodules).
zstyle ':prezto:load' zmodule 'attr' 'stat'

# Set the Zsh functions to load (man zshcontrib).
zstyle ':prezto:load' zfunction 'zargs' 'zmv'

# Load other setting
IZSH_DIR=${ZDOTDIR:-$HOME}/.izsh
source $IZSH_DIR/config.zsh
source $IZSH_DIR/zplug.zsh
source $IZSH_DIR/prompt.zsh
source $IZSH_DIR/keybinding.zsh
source $IZSH_DIR/completion.zsh
source $IZSH_DIR/alias.zsh
