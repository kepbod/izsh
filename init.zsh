# Color output
zstyle ':prezto:*:*' color 'yes'

# Load other setting
IZSH_DIR=${ZDOTDIR:-$HOME}/.izsh
source $IZSH_DIR/zplug.zsh
source $IZSH_DIR/config.zsh
source $IZSH_DIR/completion.zsh
source $IZSH_DIR/alias.zsh
