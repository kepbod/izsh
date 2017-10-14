# order
SPACESHIP_PROMPT_ORDER=(
    user          # Username section
    host          # Hostname section
    dir           # Current directory section
    git           # Git section (git_branch + git_status)
    conda         # conda virtualenv section
    exec_time     # Execution time
    line_sep      # Line break
    vi_mode       # Vi-mode indicator
    char          # Prompt character
)

# general
SPACESHIP_PROMPT_SYMBOL="❯"

# user
SPACESHIP_USER_PREFIX=""

# git
SPACESHIP_GIT_SYMBOL=""
SPACESHIP_GIT_BRANCH_PREFIX="$SPACESHIP_GIT_SYMBOL"

# exec_time
SPACESHIP_EXEC_TIME_PREFIX=""


# vi-mode
SPACESHIP_VI_MODE_INSERT="❯"
SPACESHIP_VI_MODE_NORMAL="☿"
SPACESHIP_VI_MODE_SUFFIX=""
