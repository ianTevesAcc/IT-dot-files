# IMPORTANT LOADS ---
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load ZINIT
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Paths
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"                        # path to brew bin
export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"                       # path to brew sbin
export PATH="/usr/bin:$PATH"                                              # path to usr bin
export PATH="/usr/bin:$PATH"                                              # path to usr sbin
export PATH="/usr/local/bin:$PATH"                                        # path to usr local bin
export PATH="/usr/local/sbin:$PATH"                                       # path to usr local sbin
export RBENV_ROOT="$HOME/.rbenv"                                          # path to rbenv
export PATH="$RBENV_ROOT/shims:/versions:$PATH"                           # path to rbenv versions
export PATH="/home/linuxbrew/.linuxbrew/share/emacs/site-lisp/ruby:$PATH" # path to ruby
export PATH="/home/linuxbrew/.linuxbrew/lib/ruby/gems/3.3.0/bin:$PATH"    # path to ruby bin
export PATH="/home/ian/node_modules/.bin:$PATH"                           # path to node modules bin
export PATH="/home/ian/node_modules/.bin/neovim-node-host:$PATH"          # path to npm nvim host
export PATH="/snap/bin:$PATH"                                             # path to snap bin
export PATH="/home/linuxbrew/.linuxbrew/lib/luarocks/:$PATH"              # path to luarocks
export PATH="$HOME/.local/share/nvim/mason/bin/:$PATH"                    # path to mason bin
export PATH="/home/ian/.local/bin:$PATH"                                  # path to .local/bin

# Colour correct TERM - Check TERM color with `echo $TERM`
# export TERM='xterm-256color'
# export EDITOR='nvim'
# export VISUAL='nvim'

# Ibus Fix
export GTK_IM_MODULE=xim #Fix for Chrome
export QT_IM_MODULE=xim #Not sure if this works or not, but whatever
export XMODIFIERS=@im=ibus

# ZINIT CONFIG ---
# Download Zinit if not found
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# ZSH Plugins
zinit ice depth=1; zinit light romkatv/Powerlevel10k  # add PowerLevel10k
zinit light zsh-users/zsh-syntax-highlighting         # add ZSH Syntax Highlighting
zinit light zsh-users/zsh-completions                 # add ZSH Completions
zinit light zsh-users/zsh-autosuggestions             # add ZSH Syntax Highlighting
zinit light Aloxaf/fzf-tab                            # add FZF

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey "^r" fzf-history-widget
#bindkey "^I" fzf-completion
#bindkey "^T" fzf-file-widget
#bindkey "^[c" fzf-cd-widget

# History
HISTSIZE=9999
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias R='reset'
alias C='clear'
alias E='exit'
alias Ex='explorer.exe'
alias Nn='N ~/.config/nvim/'
alias Tz='nvim ~/.tmux.conf'
alias Sz='source ~/.zshrc'
alias Nz='nvim ~/.zshrc'
alias F='fzf'
alias Fc='fzf --preview="bat --color=always {}"'
alias Nfc='nvim $(fzf -m --preview="bat --color=always {}")'

# Shell Instegrations
eval "$(fzf --zsh)"
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"

# MY CONFIG ---
# Aliases
alias lc="clear && pwd && colorls --dark"
alias lca="clear && pwd && colorls --dark -a"
alias lg="lazygit"
alias Ddir="cs /mnt/d/"
alias Cdir="cs /mnt/c/Users/iante/OneDrive/"
alias neofetch="neofetch --ascii /home/ian/.config/neofetch/anime-logo.txt"
alias cover="clear && neofetch && pwd && colorls --dark"
alias Tls="tmux list-sessions"
alias Tks="tmux kill-session -t"
alias Thelp="bat /home/ian/.tmux/tmux-shortcuts.md"

# Open README.md in current dir
alias RM='find_and_open_readme'

find_and_open_readme() {
  if [[ -f README.md ]]; then
    nvim README.md
  else
    echo "README.md not found in the current directory."
  fi
}

# Open nvim file
alias N='nvim_open_file'

nvim_open_file() {
  # Check if an argument is passed
  if [ -z "$1" ]; then
    echo "Usage: nvim_open_file <file_or_directory>"
    return 1
  fi

  local target="$1"

  # Check if the target is a file
  if [ -f "$target" ]; then
    nvim "$target"
  elif [ -d "$target" ]; then
    # Store the current directory
    local prev_dir="$PWD"

    # Change to the target directory
    cd "$target" || return 1

    # Open the directory in nvim
    nvim

    # Return to the previous directory after nvim exits
    cd "$prev_dir" || return 1
  else
    echo "Error: '$target' is not a valid file or directory."
    return 1
  fi
}

# Git add dot and conf files to repo
alias Ga="git_commit_dot_files; git_commit_nvim"
alias Gz="git_commit_dot_files"
alias Gn="git_commit_nvim"

git_commit_dot_files() {
  cd ~/
  local datetime=$(TZ="Pacific/Auckland" date +"%Y-%m-%d %H:%M:%S")

  # Commit and push dot files
  git add ~/.fzf.zsh ~/.p10k.zsh ~/.tmux.conf ~/.zshrc ~/README.md ~/.tmux/ ~/.config/lazygit/ ~/.config/neofetch/
  git commit -m "$datetime"
  git push -u origin main && dot_push_status="success" || dot_push_status="failed"

  # Print status
  echo "\n---\nDot files git push: $dot_push_status\n---\n"
}

git_commit_nvim() {
  cd ~/.config/nvim/
  local datetime=$(TZ="Pacific/Auckland" date +"%Y-%m-%d %H:%M:%S")

  # Commit and push nvim files
  git add .
  git commit -m "$datetime"
  git push -u origin main && nvim_push_status="success" || nvim_push_status="failed"

  # Print status
  echo "\n---\nNvim files git push: $nvim_push_status\n---\n"
}

# Function for Ollama on port 11434
ollama_11434() {
  OLLAMA_HOST=127.0.0.1:11434 ollama "$@"
}

# Function for Ollama on port 11435
ollama_11435() {
  OLLAMA_HOST=127.0.0.1:11435 ollama "$@"
}

# Aliases for easy access
alias AI1="ollama_11434"
alias AI2="ollama_11435"

# Define a function to map AI names to Ollama models
ollama_run() {
  declare -A ai_models

  # Add AI model mappings here
  ai_models=(
    [deepseek]="deepseek-r1:1.5b"
    [qwen]="qwen:1.8b"
    [llama]="llama3.2:1b"
    [nsfw]="NSFW-3B"
    # Add more AI models as needed
  )

  model=${ai_models[$1]}

  if [[ -n "$model" ]]; then
    echo "Running Ollama model: $model"
    ollama run "$model"
  else
    echo "Error: AI model '$1' not found. Available models: ${(@k)ai_models}" >&2
  fi
}

# Create an alias for easy access
alias AI='ollama_run'

pandoc_convert() {
  if [[ $# -lt 2 ]]; then
    echo "Usage: pandoc_convert <input_file> <output_format> [extra_options]"
    return 1
  fi

  INPUT_FILE="$1"
  OUTPUT_FORMAT="$2"
  EXTRA_OPTIONS="$3"

    # Extract filename without extension (handles spaces properly)
    BASENAME="${INPUT_FILE%.*}"

    # Construct output filename with new extension
    OUTPUT_FILE="${BASENAME}.${OUTPUT_FORMAT}"

    # Run pandoc conversion with proper quoting
    echo "Converting \"$INPUT_FILE\" to \"$OUTPUT_FILE\" ..."
    pandoc "$INPUT_FILE" -o "$OUTPUT_FILE" $EXTRA_OPTIONS

    # Check if conversion was successful
    if [[ $? -eq 0 ]]; then
      echo "✅ Conversion successful: \"$OUTPUT_FILE\""
    else
      echo "❌ Conversion failed."
    fi
  }

  pandoc_special() {
    if [[ $# -lt 2 ]]; then
      echo "Usage: pandoc_convert <input_file> <output_format> [extra_options]"
      return 1
    fi

    INPUT_FILE="$1"
    OUTPUT_FORMAT="$2"

    # Extract filename without extension (handles spaces properly)
    BASENAME="${INPUT_FILE%.*}"

    # Construct output filename with new extension
    OUTPUT_FILE="${BASENAME}.${OUTPUT_FORMAT}"

    # Run pandoc conversion with proper quoting
    echo "Converting \"$INPUT_FILE\" to \"$OUTPUT_FILE\" ..."
    pandoc "$INPUT_FILE" -o "$OUTPUT_FILE" --from=docx --to=markdown-grid_tables

    # Check if conversion was successful
    if [[ $? -eq 0 ]]; then
      echo "✅ Conversion successful: \"$OUTPUT_FILE\""
    else
      echo "❌ Conversion failed."
    fi
  }

# Alias for quick access
alias pandocx="pandoc_convert"
alias pandocs="pandoc_special"

# Alias for 'cs': change directory and run 'colorls --dark'
cs() {
  cd "$@" && clear && pwd && colorls --dark
}

# Alias for 'csa': use 'cd -a' (if valid) and run 'colorls --dark'
csa() {
  cd "$@" && clear && pwd && colorls -a --dark
}

# Alias to Directories
alias OB="cs /mnt/d/PROBV"

# Options
ZLE_RPROMPT_INDENT=0  # take off zsh line right prompt padding
unsetopt BEEP         # turn off error sounds

# DEFAULT CONFIG & OPTIONS ---
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/user/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set ZSH Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# FZF Styling
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# Apply Dracula colors to fzf-tab
zstyle ':fzf-tab:complete:*' fzf-pad 1
zstyle ':fzf-tab:complete:*' fzf-preview 'bat --color=always --style=plain {}'
zstyle ':fzf-tab:complete:*' fzf '--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9,fg+:#f8f8f2,bg+:#44475a,hl+:#ff79c6,info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6,marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# Customize colors for matches and completion preview
zstyle ':fzf-tab:*' switch-color 'fg:#bd93f9'
zstyle ':fzf-tab:*' header-color 'fg:#6272a4'
zstyle ':fzf-tab:*' info-color 'fg:#ffb86c'
zstyle ':fzf-tab:*' preview-color 'fg:#50fa7b'

# To source oh-my-zsh ~ I haven't done this in this case for faster terminal loading
#plugins=(git)  # to load plugins through the oh-my-zsh ~ I use OMZP instead
#source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add shell integration
source <(fzf --zsh)

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
