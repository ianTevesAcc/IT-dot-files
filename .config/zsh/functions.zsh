# ----------------------------------------------
# FUNCTIONS FILE (~/.config/zsh/functions.zsh)
# ----------------------------------------------

# Unalias `cs` to avoid conflicts
unalias cs 2>/dev/null

# Function to change directory and display contents
cs() {
  cd "$@" && clear && pwd && colorls --dark
}

# Unalias `csa` to avoid conflicts
unalias csa 2>/dev/null

# Function to change directory (including hidden files) and display contents
csa() {
  cd "$@" && clear && pwd && colorls -a --dark
}

# 🔹 Find and Open README.md
find_and_open_readme() {
  if [[ -f README.md ]]; then
    nvim README.md
  else
    echo "README.md not found in the current directory."
  fi
}

# 🔹 Open Neovim with File or Directory
nvim_open_file() {
  if [ -z "$1" ]; then
    nvim
    return 1
  fi

  local target="$1"

  if [ -f "$target" ]; then
    nvim "$target"
  elif [ -d "$target" ]; then
    local prev_dir="$PWD"
    cd "$target" || return 1
    nvim
    cd "$prev_dir" || return 1
  else
    echo "Error: '$target' is not a valid file or directory."
    return 1
  fi
}

# 🔹 Git Commit Dot Files
git_commit_dot_files() {
  cd ~/
  local datetime=$(TZ="Pacific/Auckland" date +"%Y-%m-%d %H:%M:%S")
  git add ~/.fzf.zsh ~/.p10k.zsh ~/.tmux.conf ~/.zshrc ~/README.md ~/.tmux/ ~/.config/zsh/ ~/.config/lazygit/ ~/.config/neofetch/
  git submodule add https://github.com/ianTevesAcc/IT-nvim ~/.config/nvim/
  git commit -m "$datetime"
  git push -u origin main && echo "\n---\nDot files git push: success\n---\n" || echo "\n---\nDot files git push: failed\n---\n"
}

# 🔹 Git Commit Nvim Config
git_commit_nvim() {
  cd ~/.config/nvim/
  local datetime=$(TZ="Pacific/Auckland" date +"%Y-%m-%d %H:%M:%S")
  git add .
  git commit -m "$datetime"
  git push -u origin main && echo "\n---\nNvim files git push: success\n---\n" || echo "\n---\nNvim files git push: failed\n---\n"
}

# 🔹 C++ Project Setup Function
cpp_setup() {
  project_name=$(echo "$1" | tr ' ' '-')

  mkdir -p "$project_name"/{src,include,build}
  touch "$project_name"/CMakeLists.txt "$project_name"/src/main.cpp "$project_name"/include/app.h

  echo '#include <iostream>
  int main() {
  std::cout << "Hello, World!" << std::endl;
  return 0;
}' > "$project_name/src/main.cpp"

echo 'cmake_minimum_required(VERSION 3.10)
project(MyProject)
set(CMAKE_CXX_STANDARD 17)
add_executable(my_project src/main.cpp)' > "$project_name/CMakeLists.txt"

cd "$project_name/build" || return
cmake ..
make
cd ../..
}
