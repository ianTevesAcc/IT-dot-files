# IT dot files
This is a repo full of my dot files. Copy all files into a folder then move them individually.

```terminal
mkdir ian-dot-files
git clone git@github.com:ianTevesAcc/dot-files.git
```

Then move individually either with a file explorer application or by terminal commands.

```terminal
# move them
mv selected-dot-file selected-directory

# or copy them to their destination
cp selected-dot-file selected-directory
```
Shortcuts:
- You can view tmux shortcuts by running `Thelp`

Required Plugins (install via `brew`):
- neovim
- tmux
- bat
- colorls
- neofetch
- lazygit

---

# To Do
- [x] Test if git commit dot files and nvim files is working on .zshrc
- [ ] Add a way to close current tmux window and close term window at the same time when `Q` is pressed in tmux command mode `<C-s>Q`
