# ------------------
# FUNCTIONS ZSH FILE
# ------------------

# Function to change directory and display contents
unalias cs 2>/dev/null  # Unalias `cs` to avoid conflicts
cs() {
  cd "$@" && clear && pwd && colorls --dark
}

# Function to change directory (including hidden files) and display contents
unalias csa 2>/dev/null  # Unalias `csa` to avoid conflicts
csa() {
  cd "$@" && clear && pwd && colorls -a --dark
}

# Find and Open README.md
find_and_open_readme() {
  if [[ -f README.md ]]; then
    nvim README.md
  else
    echo "README.md not found in the current directory."
  fi
}

# Open Neovim with File or Directory
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

# Git Commit Dot Files
git_commit_dot_files() {
  cd ~/
  local datetime=$(TZ="Pacific/Auckland" date +"%Y-%m-%d %H:%M:%S")
  git add ~/.fzf.zsh ~/.p10k.zsh ~/.tmux.conf ~/.zshrc ~/README.md ~/.tmux/ ~/.config/zsh/ ~/.config/lazygit/ ~/.config/neofetch/
  git submodule add https://github.com/ianTevesAcc/IT-nvim ~/.config/nvim/
  git commit -m "$datetime"
  git push -u origin main && echo "\n---\nDot files git push: success\n---\n" || echo "\n---\nDot files git push: failed\n---\n"
}

# Git Commit Nvim Config
git_commit_nvim() {
  cd ~/.config/nvim/
  local datetime=$(TZ="Pacific/Auckland" date +"%Y-%m-%d %H:%M:%S")
  git add .
  git commit -m "$datetime"
  git push -u origin main && echo "\n---\nNvim files git push: success\n---\n" || echo "\n---\nNvim files git push: failed\n---\n"
}

# C++ Project Setup Function
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

# Ollama on port 11434
ollama_11434() {
  OLLAMA_HOST=127.0.0.1:11434 ollama "$@"
}

# Ollama on port 11435
ollama_11435() {
  OLLAMA_HOST=127.0.0.1:11435 ollama "$@"
}

# Ollama Model Selection
ollama_run() {
  declare -A ai_models=(
  [deepseek]="deepseek-r1:1.5b"
  [qwen]="qwen:1.8b"
  [llama]="llama3.2:1b"
  [nsfw]="NSFW-3B"
)

model=${ai_models[$1]}

if [[ -n "$model" ]]; then
  echo "Running Ollama model: $model"
  ollama run "$model"
else
  echo "Error: AI model '$1' not found. Available models: ${(@k)ai_models}" >&2
fi
}

# Pandoc Convert Function
pandoc_convert() {
  if [[ $# -lt 2 ]]; then
    echo "Usage: pandoc_convert <input_file> <output_format> [extra_options]"
    return 1
  fi

  INPUT_FILE="$1"
  OUTPUT_FORMAT="$2"
  EXTRA_OPTIONS="$3"

  BASENAME="${INPUT_FILE%.*}"
  OUTPUT_FILE="${BASENAME}.${OUTPUT_FORMAT}"

  echo "Converting \"$INPUT_FILE\" to \"$OUTPUT_FILE\" ..."
  pandoc "$INPUT_FILE" -o "$OUTPUT_FILE" $EXTRA_OPTIONS

  if [[ $? -eq 0 ]]; then
    echo "✅ Conversion successful: \"$OUTPUT_FILE\""
  else
    echo "❌ Conversion failed."
  fi
}

# Special Pandoc Conversion (DOCX to Markdown with Grid Tables)
pandoc_special() {
  if [[ $# -lt 2 ]]; then
    echo "Usage: pandoc_special <input_file> <output_format>"
    return 1
  fi

  INPUT_FILE="$1"
  OUTPUT_FORMAT="$2"
  BASENAME="${INPUT_FILE%.*}"
  OUTPUT_FILE="${BASENAME}.${OUTPUT_FORMAT}"

  echo "Converting \"$INPUT_FILE\" to \"$OUTPUT_FILE\" with special settings..."
  pandoc "$INPUT_FILE" -o "$OUTPUT_FILE" --from=docx --to=markdown-grid_tables

  if [[ $? -eq 0 ]]; then
    echo "✅ Conversion successful: \"$OUTPUT_FILE\""
  else
    echo "❌ Conversion failed."
  fi
}
