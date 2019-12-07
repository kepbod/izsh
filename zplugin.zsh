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

# Prompt
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

# Utility
## alias-tips
zplugin ice wait lucid
zplugin load djui/alias-tips
## zsh-autopair
zplugin ice wait lucid
zplugin load hlissner/zsh-autopair
## forgit
zplugin ice wait lucid
zplugin load wfxr/forgit
## zsh-diff-so-fancy
zplugin ice wait lucid as"program" pick"bin/git-dsf"
zplugin light zdharma/zsh-diff-so-fancy
## archive
zplugin ice svn silent pick''
zplugin snippet PZT::modules/archive

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
