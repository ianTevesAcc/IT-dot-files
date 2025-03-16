# ----------------
# ALIASES ZSH FILE
# ----------------

# Basic system aliases
alias C='clear'
alias E='exit'
alias R='reset'

# Directory navigation aliases
alias Ddir="cs /mnt/d/"
alias Cdir="cs /mnt/c/Users/iante/OneDrive/"
alias OB="cs /mnt/c/Users/iante/OneDrive/"

# Listing and file navigation
alias ls='ls --color'
alias lc="clear && pwd && colorls --dark"
alias lca="clear && pwd && colorls --dark -a"
alias cover="clear && neofetch && pwd && colorls --dark"

# Git aliases
alias Ga="git_commit_dot_files; git_commit_nvim"
alias Gz="git_commit_dot_files"
alias Gn="git_commit_nvim"

# Neovim and config-related aliases
alias N='nvim_open_file'
alias Nz='nvim ~/.zshrc'
alias Sz='source ~/.zshrc'
alias Tz='nvim ~/.tmux.conf'
alias Nn='N ~/.config/nvim/'

# File search and preview aliases
alias F='fzf'
alias Fc='fzf --preview="bat --color=always {}"'
alias Nfc='nvim $(fzf -m --preview="bat --color=always {}")'

# Terminal utilities
alias neofetch="neofetch --ascii /home/ian/.config/neofetch/anime-logo.txt"

# Tmux aliases
alias Tls="tmux list-sessions"
alias Tks="tmux kill-session -t"
alias Thelp="bat /home/ian/.tmux/tmux-shortcuts.md"

# Ollama AI aliases
alias AI1="ollama_11434"
alias AI2="ollama_11435"
alias AI='ollama_run'

# Windows-related alias
alias Ex='explorer.exe'
