# ----------------------------------------------
# ALIASES CONFIGURATION FILE (~/.config/zsh/aliases.zsh)
# ----------------------------------------------

# 🔹 General Aliases
alias ls='ls --color'
alias R='reset'
alias C='clear'
alias E='exit'
alias Ex='explorer.exe'
alias Sz='source ~/.zshrc'
alias Nz='nvim ~/.zshrc'
alias Tz='nvim ~/.tmux.conf'
alias F='fzf'
alias Fc='fzf --preview="bat --color=always {}"'
alias Nfc='nvim $(fzf -m --preview="bat --color=always {}")'

# 🔹 Directory Navigation Aliases
alias cs="cd"
alias OB="cs /mnt/c/Users/iante/OneDrive/"
alias Ddir="cs /mnt/d/"
alias Cdir="cs /mnt/c/Users/iante/OneDrive/"

# 🔹 Custom Functions as Aliases
alias RM='find_and_open_readme'
alias N='nvim_open_file'
alias Ga="git_commit_dot_files; git_commit_nvim"
alias Gz="git_commit_dot_files"
alias Gn="git_commit_nvim"
alias AI1="ollama_11434"
alias AI2="ollama_11435"
alias AI='ollama_run'

# 🔹 C++ Project Setup Alias
alias CPP="cpp_setup"
