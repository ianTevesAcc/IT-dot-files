# ----------------
# ALIASES ZSH FILE
# ----------------

# Basic system aliases
alias C="clear"
alias E="exit"
alias R="reset"

# Directory navigation aliases
alias Ddir="cs /mnt/d/"
alias Cdir="cs /mnt/c/Users/iante/OneDrive/"
alias OB="cs /mnt/c/Users/iante/OneDrive/"

# Listing and file navigation
alias ls="ls --color"
alias lc="clear && pwd && colorls --dark"
alias lca="clear && pwd && colorls --dark -a"
alias cover="clear && neofetch && pwd && colorls --dark"

# Git aliases
alias Ga="git_commit_dot_files; git_commit_nvim"
alias Gz="git_commit_dot_files"
alias Gn="git_commit_nvim"

# Neovim and config-related aliases
alias N="nvim_open_file"
alias Nc="N ~/.config/"
alias Nz="cd ~/.config/zsh/; nvim ~/.zshrc; cd -"
alias Sz="source ~/.zshrc"
alias Tz="N ~/.tmux.conf"
alias Nn="N ~/.config/nvim/"

# File search and preview aliases
alias F="fzf"
alias Fc="fzf --preview="bat --color=always {}""
alias Nfc='N $(fzf -m --preview "bat --color=always {}")'

# Terminal utilities
alias neofetch="neofetch --ascii /home/ian/.config/neofetch/anime-logo.txt"
alias savepkgs="save_installed_packages"

# Tmux aliases
alias Tls="tmux list-sessions"
alias Tks="tmux kill-session -t"

# Help aliases
alias Thelp="bat ~/.tmux/tmux-shortcuts.md"
alias Ahelp="bat ~/.config/zsh/aliases.zsh"

# Ollama AI aliases
alias AI1="ollama_11434"
alias AI2="ollama_11435"
alias AI="AI_model_run"

# Windows-related alias
alias Ex="explorer.exe"

# Set Up Code Projects
alias CPP="cpp_setup"
