# Check if zi is installed
ZI="$HOME/.zi"
ZI_GIT="https://github.com/z-shell/zi.git"

if [ ! -d "$ZI" ]; then
    echo "Installing zi ..."
    if [ -x "$(which git)" ]; then
        mkdir -p "$ZI" 2> /dev/null
        git clone "$ZI_GIT" "$ZI/bin"
    else
        echo "ERROR: please install git before installation!!"
        exit 1
    fi
    if [ ! $? -eq 0 ]; then
        echo ""
        echo "ERROR: downloading zi ($ZI_GIT) failed!!"
        exit 1
    fi;
fi

# Load zi
source $ZI/bin/zi.zsh

# zi related
zi light z-shell/z-a-submods

# Environment
## environment
zi ice svn silent
zi snippet PZT::modules/environment
## editor
zi ice svn silent
zi snippet PZT::modules/editor
## terminal
zi ice svn silent
zi snippet PZT::modules/terminal
## directory
zi ice svn silent
zi snippet PZT::modules/directory
## history
zi ice svn silent
zi snippet PZT::modules/history
## LS_COLORS
zi pack for ls_colors

# Prompt
zi ice lucid pick"async.zsh" src"pure.zsh"
zi light sindresorhus/pure

# Utility
## alias
zi ice lucid
zi load zimfw/utility
## alias-tips
zi ice wait lucid
zi load djui/alias-tips
## zsh-autopair
zi ice wait lucid
zi load hlissner/zsh-autopair
## archive
zi ice svn silent pick""
zi snippet PZT::modules/archive
## fzf
zi ice from"gh-r" as"program"
zi light junegunn/fzf-bin
## lsd
zi ice lucid as"command" from"gh-r" bpick"$PICK" mv"lsd* -> lsd" pick"lsd/lsd"
zi light lsd-rs/lsd
## bat
zi ice lucid as"command" from"gh-r" bpick"$PICK" mv"bat* -> bat" pick"bat/bat"
zi light sharkdp/bat
## fd
zi ice lucid as"command" from"gh-r" bpick"$PICK" mv"fd* -> fd" pick"fd/fd"
zi light sharkdp/fd
## rg
zi ice lucid as"command" from"gh-r" bpick"$PICK" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zi light BurntSushi/ripgrep
## delta
zi ice lucid as"command" from"gh-r" bpick"$PICK" mv"delta* -> delta" pick"delta/delta"
zi light dandavison/delta
## forgit
zi ice wait lucid
zi load wfxr/forgit
## formarks
zi ice wait lucid
zi load wfxr/formarks

# Fish like feature
## completion
zi ice svn silent submods"zsh-users/zsh-completions -> external"
zi snippet PZT::modules/completion
## autosuggestions
zi ice svn silent submods"zsh-users/zsh-autosuggestions -> external"
zi snippet PZT::modules/autosuggestions
## history-substring-search
zi ice svn silent submods"zsh-users/zsh-history-substring-search -> external"
zi snippet PZT::modules/history-substring-search
## history-search-multi-word
zi load z-shell/H-S-MW
## fast-syntax-highlighting
zi light z-shell/F-Sy-H
