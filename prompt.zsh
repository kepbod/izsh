# order
SPACESHIP_PROMPT_ORDER=(
    user          # Username section
    host          # Hostname section
    dir           # Current directory section
    git           # Git section (git_branch + git_status)
    hg            # Mercurial section (hg_branch  + hg_status)
    conda         # conda virtualenv section
    exec_time     # Execution time
    line_sep      # Line break
    vi_mode       # Vi-mode indicator
    char          # Prompt character
)

SPACESHIP_PROMPT_SYMBOL="❯"

# vi-mode
SPACESHIP_VI_MODE_INSERT="❯"
SPACESHIP_VI_MODE_NORMAL="☿"
SPACESHIP_VI_MODE_SUFFIX=""
