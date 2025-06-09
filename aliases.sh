# command re-mapping
# inspired by: https://github.com/bewuethr/dotfiles/
alias ..='cd ..'
alias ...='cd ../..'

# Some ls aliases
alias ls='ls --group-directories-first --color=auto'  # Directories first
alias ls1='ls -1'                        # One file per line

alias la='ls -a  --group-directories-first'  # Show dotfiles, directories first
alias la1='la -1'                        # Show dotfiles, one per line

alias ll='ls -l'                                      # Long listing format
alias lla='ll --almost-all --group-directories-first' # Long with dofiles, dirs first

# grep
alias grep='grep --color=auto --exclude-dir=.git --exclude=tags --exclude=*.swp --exclude-dir=vendor'
alias cgrep='grep --color=always'

# Always show directories first
alias tree='tree --dirsfirst'

# TMUX
alias ta="tmux attach -t"
alias taa="tmux attach"
alias tkpa="tmux kill-pane -t"
alias tkss="tmux kill-session -t"
alias tksv="tmux kill-server"
alias tl="tmux list-sessions"

# my aliases
alias zsh="zsh -l"                          # Use zsh
alias c="source ~/.load_class.sh"           # Open pds-ana class session
alias nvim="~/opt/nvim/nvim"                # Launch neovim
alias nivm="nvim"                           # In case of mispelling
alias aliases="cat ~/mydots/aliases.sh"     # Show my aliases
alias functions="cat ~/mydots/functions.sh" # Show my functions
