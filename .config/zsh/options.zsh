# --------------------
# OPTIONAL ZSH CONFIGS
# --------------------

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward
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

# Shell Instegrations
eval "$(fzf --zsh)"
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"

# Ibus Fix
export GTK_IM_MODULE=xim #Fix for Chrome
export QT_IM_MODULE=xim #Not sure if this works or not, but whatever
export XMODIFIERS=@im=ibus

# Completion styling
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --color $realpath"
zstyle ":fzf-tab:complete:__zoxide_z:*" fzf-preview "ls --color $realpath"

# FZF Styling
export FZF_DEFAULT_OPTS="--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"

# Apply Dracula colors to fzf-tab
zstyle ":fzf-tab:complete:*" fzf-pad 1
zstyle ":fzf-tab:complete:*" fzf-preview "bat --color=always --style=plain {}"
zstyle ":fzf-tab:complete:*" fzf "--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9,fg+:#f8f8f2,bg+:#44475a,hl+:#ff79c6,info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6,marker:#ff79c6,spinner:#ffb86c,header:#6272a4"

# Customize colors for matches and completion preview
zstyle ":fzf-tab:*" switch-color "fg:#bd93f9"
zstyle ":fzf-tab:*" header-color "fg:#6272a4"
zstyle ":fzf-tab:*" info-color "fg:#ffb86c"
zstyle ":fzf-tab:*" preview-color "fg:#50fa7b"

# Set Prompt indent to 0
ZLE_RPROMPT_INDENT=0  # take off zsh line right prompt padding

# Turn off error sounds
unsetopt BEEP
