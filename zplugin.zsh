# Check if zplugin is installed
if [[ ! -d ~/.zplugin ]]; then
    mkdir ~/.zplugin
    git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin
fi

# Load zplugin
source ~/.zplugin/bin/zplugin.zsh

# Zplugin related
zplugin light zdharma/z-p-submods

# Environment
## environment
zplugin ice svn silent
zplugin snippet PZT::modules/environment
## utility
zplugin ice svn silent
zplugin snippet PZT::modules/utility
## editor
zplugin ice svn silent
zplugin snippet PZT::modules/editor
## terminal
zplugin ice svn silent
zplugin snippet PZT::modules/terminal
## directory
zplugin ice svn silent
zplugin snippet PZT::modules/directory
## history
zplugin ice svn silent
zplugin snippet PZT::modules/history
## LS_COLORS
zplugin ice lucid atclone"gdircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zplugin light trapd00r/LS_COLORS

# Prompt
zplugin ice lucid pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

# Utility
## alias-tips
zplugin ice wait lucid
zplugin load djui/alias-tips
## zsh-autopair
zplugin ice wait lucid
zplugin load hlissner/zsh-autopair
## archive
zplugin ice svn silent pick""
zplugin snippet PZT::modules/archive
## lsd
zplugin ice lucid as"command" from"gh-r" mv"lsd* -> lsd" pick"lsd/lsd"
zplugin light Peltoche/lsd
## bat
zplugin ice lucid as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zplugin light sharkdp/bat
## delta
zplugin ice lucid as"command" from"gh-r" mv"delta* -> delta" pick"delta/delta"
zplugin light dandavison/delta
## forgit
zplugin ice wait lucid
zplugin load wfxr/forgit
## formarks
zplugin ice wait lucid
zplugin load wfxr/formarks

# Fish like feature
## completion
zplugin ice svn silent submods"zsh-users/zsh-completions -> external"
zplugin snippet PZT::modules/completion
## autosuggestions
zplugin ice svn silent submods"zsh-users/zsh-autosuggestions -> external"
zplugin snippet PZT::modules/autosuggestions
## history-substring-search
zplugin ice svn silent submods"zsh-users/zsh-history-substring-search -> external"
zplugin snippet PZT::modules/history-substring-search
## history-search-multi-word
zplugin ice wait"1" lucid
zplugin load zdharma/history-search-multi-word
## fast-syntax-highlighting
zplugin ice wait"1" lucid atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting
