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

# Platform
if [[ "$(uname)" == "Darwin" ]]; then
PICK="*darwin*"
alias dircolors="gdircolors"
elif [[ "$(uname)" == "Linux" ]]; then
PICK="*musl*"
elif [[ "$(uname)" == "MINGW32_NT" ]]; then
PICK="*windows*"
fi
