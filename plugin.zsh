# Check if zinit is installed
ZINIT="$HOME/.zinit"
ZINIT_GIT="https://github.com/zdharma-continuum/zinit.git"

if [ ! -d "$ZINIT" ]; then
    echo "Installing zinit ..."
    if [ -x "$(which git)" ]; then
        mkdir -p "$ZINIT" 2> /dev/null
        git clone "$ZINIT_GIT" "$ZINIT/bin"
    else
        echo "ERROR: please install git before installation!!"
        exit 1
    fi
    if [ ! $? -eq 0 ]; then
        echo ""
        echo "ERROR: downloading zinit ($ZINIT_GIT) failed!!"
        exit 1
    fi;
fi

# Load zinit
source $ZINIT/bin/zinit.zsh

# zinit related
zinit light zdharma-continuum/zinit-annex-submods

# Environment
## environment
zinit ice svn silent
zinit snippet PZT::modules/environment
## editor
zinit ice svn silent
zinit snippet PZT::modules/editor
## terminal
zinit ice svn silent
zinit snippet PZT::modules/terminal
## directory
zinit ice svn silent
zinit snippet PZT::modules/directory
## history
zinit ice svn silent
zinit snippet PZT::modules/history
## LS_COLORS
zinit ice lucid atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

# Prompt
zinit ice lucid pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# Utility
## alias
zinit ice lucid
zinit load zimfw/utility
## alias-tips
zinit ice wait lucid
zinit load djui/alias-tips
## zsh-autopair
zinit ice wait lucid
zinit load hlissner/zsh-autopair
## archive
zinit ice svn silent pick""
zinit snippet PZT::modules/archive
## fzf
if [ ! -x "$(which fzf)" ]; then
    zinit ice from"gh-r" as"program"
    zinit light junegunn/fzf-bin
fi
## lsd
if [ ! -x "$(which lsd)" ]; then
    zinit ice lucid as"command" from"gh-r" bpick"$PICK" mv"lsd* -> lsd" pick"lsd/lsd"
    zinit light lsd-rs/lsd
fi
## bat
if [ ! -x "$(which bat)" ]; then
    zinit ice lucid as"command" from"gh-r" bpick"$PICK" mv"bat* -> bat" pick"bat/bat"
    zinit light sharkdp/bat
fi
## fd
if [ ! -x "$(which fd)" ]; then
    zinit ice lucid as"command" from"gh-r" bpick"$PICK" mv"fd* -> fd" pick"fd/fd"
    zinit light sharkdp/fd
fi
## rg
if [ ! -x "$(which rg)" ]; then
    zinit ice lucid as"command" from"gh-r" bpick"$PICK" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
    zinit light BurntSushi/ripgrep
fi
## delta
if [ ! -x "$(which delta)" ]; then
    zinit ice lucid as"command" from"gh-r" bpick"$PICK" mv"delta* -> delta" pick"delta/delta"
    zinit light dandavison/delta
fi
## forgit
zinit ice wait lucid
zinit load wfxr/forgit
## formarks
zinit ice wait lucid
zinit load wfxr/formarks

# Fish like feature
## completion
zinit ice svn silent submods"zsh-users/zsh-completions -> external"
zinit snippet PZT::modules/completion
## autosuggestions
zinit ice svn silent submods"zsh-users/zsh-autosuggestions -> external"
zinit snippet PZT::modules/autosuggestions
## history-substring-search
zinit ice svn silent submods"zsh-users/zsh-history-substring-search -> external"
zinit snippet PZT::modules/history-substring-search
## history-search-multi-word
zinit ice wait"1" lucid
zinit load zdharma-continuum/history-search-multi-word
## fast-syntax-highlighting
zinit ice wait"1" lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting
