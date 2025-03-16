# ------------------
# .ZSHRC FILE CONFIG
# ------------------

# -----------------------------------
# Enable Powerlevel10k instant prompt
# -----------------------------------
# Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ----------
# Load Zinit
# ----------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

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

# ---------------------
# Load ZSH Config Files
# ---------------------
for file in ~/.config/zsh/*.zsh; do
  source "$file"
done


# DEFAULT CONFIG & OPTIONS ---
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/user/local/bin:$PATH

# Set ZSH Theme
ZSH_THEME="powerlevel10k/powerlevel10k"
# To source oh-my-zsh ~ I haven't done this in this case for faster terminal loading
#plugins=(git)  # to load plugins through the oh-my-zsh ~ I use OMZP instead
#source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
