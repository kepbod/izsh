# Check if zplugin is installed
ZPLUGIN="$HOME/.zplugin"
ZPLUGIN_GIT="https://github.com/zdharma/zplugin.git"
ZPLUGIN_MODULE="$HOME/.zplugin/bin/zmodules/Src/zdharma/zplugin.so"

if [ ! -d "$ZPLUGIN" ]; then
    echo "Installing zplugin ..."
    if [ -x "$(which git)" ]; then
        mkdir -p "$ZPLUGIN" 2> /dev/null
        git clone "$ZPLUGIN_GIT" "$ZPLUGIN/bin"
        source $ZPLUGIN/bin/zplugin.zsh
        zplugin module build
    else
        echo "ERROR: please install git before installation !!"
    fi
    if [ ! $? -eq 0 ]; then
        echo ""
        echo "ERROR: downloading zplugin ($ZPLUGIN_GIT) failed !!"
        rm -rf $ZPLUGIN
    fi;
fi

# Load zplugin
source $ZPLUGIN/bin/zplugin.zsh

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
zplugin ice lucid atclone"dircolors -b LS_COLORS > clrs.zsh" \
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
## fzf
if [ ! -x "$(which fzf)" ]; then
    zplugin ice from"gh-r" as"program"
    zplugin light junegunn/fzf-bin
fi
## lsd
if [ ! -x "$(which lsd)" ]; then
    zplugin ice lucid as"command" from"gh-r" bpick"$PICK" mv"lsd* -> lsd" pick"lsd/lsd"
    zplugin light Peltoche/lsd
fi
## bat
if [ ! -x "$(which bat)" ]; then
    zplugin ice lucid as"command" from"gh-r" bpick"$PICK" mv"bat* -> bat" pick"bat/bat"
    zplugin light sharkdp/bat
fi
## fd
if [ ! -x "$(which fd)" ]; then
    zplugin ice lucid as"command" from"gh-r" bpick"$PICK" mv"fd* -> fd" pick"fd/fd"
    zplugin light sharkdp/fd
fi
## rg
if [ ! -x "$(which rg)" ]; then
    zplugin ice lucid as"command" from"gh-r" bpick"$PICK" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
    zplugin light BurntSushi/ripgrep
fi
## delta
if [ ! -x "$(which delta)" ]; then
    zplugin ice lucid as"command" from"gh-r" bpick"$PICK" mv"delta* -> delta" pick"delta/delta"
    zplugin light dandavison/delta
fi
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
