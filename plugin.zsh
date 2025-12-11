# Check if zi is installed
ZI="$HOME/.zi/bin"
ZI_GIT="https://github.com/z-shell/zi.git"

if [ ! -f "$ZI/zi.zsh" ]; then
    echo "Installing zi ..."
    if [ -x "$(which git)" ]; then
        mkdir -p "$ZI" 2> /dev/null
        git clone "$ZI_GIT" "$ZI"
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
source $ZI/zi.zsh

# Enable zsh completion system
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

# Environment
## environment
zi snippet PZTM::environment
## editor
zi snippet PZTM::editor
## terminal
zi snippet PZTM::terminal
## directory
zi snippet PZTM::directory
## history
zi snippet PZTM::history
## LS_COLORS
zi ice wait lucid from'gh-r' as'program' bpick"$PICK" mv'vivid* -> vivid' pick"vivid/vivid" \
  atload'export LS_COLORS="$(vivid generate jellybeans)"'
zi light sharkdp/vivid

# Prompt
zi ice pick"async.zsh" src"pure.zsh"
zi light sindresorhus/pure

# Utility
## alias
zi ice lucid
zi load zimfw/utility
## zsh-you-should-use
zi light MichaelAquilina/zsh-you-should-use
## zsh-autopair
zi ice wait lucid pick'autopair.zsh'
zi load hlissner/zsh-autopair
## extract 
zi snippet OMZP::extract
## fzf
zi ice from"gh-r" as"program"
zi light junegunn/fzf
## lsd
zi ice lucid as"command" from"gh-r" bpick"$PICK" mv"lsd* -> lsd" pick"lsd/lsd" \
  atclone"zi creinstall -q lsd-rs/lsd"
zi light lsd-rs/lsd
## bat
zi ice lucid as"command" from"gh-r" bpick"$PICK" mv"bat* -> bat" pick"bat/bat" \
  atclone"bat/bat --completion zsh > _bat; zi creinstall -q sharkdp/bat"
zi light sharkdp/bat
## fd
zi ice lucid as"command" from"gh-r" bpick"$PICK" mv"fd* -> fd" pick"fd/fd" \
  atclone"zi creinstall -q sharkdp/fd"
zi light sharkdp/fd
## rg
zi ice lucid as"command" from"gh-r" bpick"$PICK" mv"ripgrep* -> ripgrep" pick"ripgrep/rg" \
  atclone"zi creinstall -q BurntSushi/ripgrep"
zi light BurntSushi/ripgrep
## forgit
zi ice wait lucid
zi load wfxr/forgit
## delta
zi ice lucid as"command" from"gh-r" bpick"$PICK" mv"delta* -> delta" pick"delta/delta"
zi light dandavison/delta
## formarks
zi ice wait lucid
zi load wfxr/formarks

# Fish like feature
## zsh-history-substring-search, F-Sy-H, H-S-MW, and zsh-autosuggestions
zi wait lucid for \
  zsh-users/zsh-history-substring-search \
  atinit"ZI[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    z-shell/F-Sy-H \
    z-shell/H-S-MW \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions
## completion system using fzf
zi ice lucid wait has'fzf'
zi light Aloxaf/fzf-tab
zi ice lucid wait has'fzf'
zi light Freed-Wu/fzf-tab-source 
## completions for conda
zi ice lucid wait as'completion' blockf has'conda'
zi snippet https://github.com/conda-incubator/conda-zsh-completion/blob/main/_conda
