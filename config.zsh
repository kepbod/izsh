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

# Disable autopair first
AUTOPAIR_INHIBIT_INIT=1

# Enable fast vi-mode
KEYTIMEOUT=1