# ----------------------------------------------
# ZSH CONFIGURATION FILE (~/.zshrc)
# ----------------------------------------------

# ---------------------------
# 🔹 Powerlevel10k Instant Prompt (Must Stay at the Top)
# ---------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---------------------------
# 🔹 Load Separate ZSH Configuration Files
# ---------------------------
for file in ~/.config/zsh/*.zsh; do
  source "$file"
done

# ---------------------------
# 🔹 Load Powerlevel10k Configuration
# ---------------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---------------------------
# 🔹 Load FZF and Shell Integrations
# ---------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)
