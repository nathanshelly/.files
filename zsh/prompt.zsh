# use spaceship prompt
export ZSH_THEME="spaceship"

# customize layout
# note options below may override
# whether or not the below items show up
SPACESHIP_PROMPT_ORDER=(
  user          # username
  host          # hostname
  dir           # current directory
  git           # git section (git_branch + git_status)
  package       # package version
  node          # node.js section
  venv          # virtualenv section
  exec_time     # execution time
  line_sep      # line break
  vi_mode       # vi mode indicator
  jobs          # background jobs indicator
  exit_code     # exit code
  char          # prompt character
)

# SPACESHIP_RPROMPT_ORDER=(
# 	battery
# )

# prompt options
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_RPROMPT_ADD_NEWLINE=false

# char
SPACESHIP_CHAR_SYMBOL="λ "
SPACESHIP_CHAR_COLOR_SUCCESS=093
SPACESHIP_CHAR_COLOR_FAILURE=125
SPACESHIP_CHAR_COLOR_SECONDARY=209

# user
SPACESHIP_USER_SHOW=true
SPACESHIP_USER_COLOR=124
SPACESHIP_USER_COLOR_ROOT=red

# host
SPACESHIP_HOST_SHOW=true
SPACESHIP_HOST_COLOR=172
SPACESHIP_HOST_COLOR_SSH=071
SPACESHIP_HOST_PREFIX="$FG[241]at %F{red}"

# dir
SPACESHIP_DIR_SHOW=true
SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_COLOR=039
SPACESHIP_DIR_PREFIX="$FG[241]in %F{red}"

# git
SPACESHIP_GIT_PREFIX="$FG[241]on %F{red}"

# branch
SPACESHIP_GIT_BRANCH_COLOR=071
SPACESHIP_GIT_BRANCH_PREFIX=

# status
SPACESHIP_GIT_STATUS_COLOR=045
SPACESHIP_GIT_STATUS_PREFIX=" "
SPACESHIP_GIT_STATUS_SUFFIX=""

# disable a few defaults
SPACESHIP_GIT_STATUS_RENAMED=""
SPACESHIP_GIT_STATUS_STASHED=""
SPACESHIP_GIT_STATUS_UNMERGED=""
SPACESHIP_GIT_STATUS_DIVERGED=""

# colored status indicators
# maybe come back to with dots? - •
SPACESHIP_GIT_STATUS_MODIFIED="$FG[212]!%F{red}"
SPACESHIP_GIT_STATUS_ADDED="$FG[045]+%F{red}"
SPACESHIP_GIT_STATUS_UNTRACKED="$FG[004]?%F{red}"
SPACESHIP_GIT_STATUS_DELETED="$FG[214]x%F{red}"

SPACESHIP_GIT_STATUS_AHEAD="$FG[247]⬆%F{red}"
SPACESHIP_GIT_STATUS_BEHIND="$FG[247]⬇%F{red}"

# package
# come back to this

# node
# come back to this

# venv
# come back to this 

# exec time
SPACESHIP_EXEC_TIME_ELAPSED=10

# battery
# SPACESHIP_BATTERY_SHOW=charged
# SPACESHIP_BATTERY_THRESHOLD=15

# vi mode 
SPACESHIP_VI_MODE_INSERT="$FG[159]•%F{red}"
SPACESHIP_VI_MODE_NORMAL="$FG[166]•%F{red}"
SPACESHIP_VI_MODE_COLOR=249
