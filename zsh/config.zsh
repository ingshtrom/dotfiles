export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($DOTFILES/functions $fpath)

autoload -U $DOTFILES/functions/*(:t)

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

# zsh history
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE=~/.zsh_history  # ensure history file visibility
export HH_CONFIG=hicolor        # get more colors
bindkey -s "\\C-r" "\\eqhh\\n"     # bind hh to Ctrl-r (for Vi mode check doc)

# FZF FuZzy Finder
# fzf default command
# --files: List files that would be searched but do not search
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# use `bat` for manpages--it's sexy!
# ref: https://github.com/sharkdp/bat#man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# so delta will properly let me use the mouse to scroll
if [[ "$(uname)" == "Linux" ]]
then
  export PAGER="less --RAW-CONTROL-CHARS --quit-if-one-screen --mouse --wheel-lines=10"
else
  export PAGER="less --RAW-CONTROL-CHARS"
fi
export BAT_PAGER="$PAGER"
