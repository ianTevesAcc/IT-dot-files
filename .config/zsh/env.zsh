# ----------------------------------------------
# ENVIRONMENT VARIABLES FILE (~/.config/zsh/env.zsh)
# ----------------------------------------------

# 🔹 PATH Configurations
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/nvim/:$PATH"

# 🔹 Ruby & Node.js Paths
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/shims:/versions:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/lib/ruby/gems/3.3.0/bin:$PATH"
export PATH="/home/ian/node_modules/.bin:$PATH"

# 🔹 Terminal Settings
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim
export XMODIFIERS=@im=ibus

# 🔹 Editor & Terminal Settings
# export TERM='xterm-256color'
# export EDITOR='nvim'
# export VISUAL='nvim'
