# Tmux Shortcuts Categorized

###### General

> | **Action**                    | **Shortcut**                                      |
> | ----------------------------- | ------------------------------------------------- |
> | Reload tmux configuration     | `Prefix + r`                                      |
> | Change prefix key to Ctrl+s   | `set -g prefix C-s`                               |
> | Enable mouse support          | `set -g mouse on`                                 |
> | Fix terminal color issue      | `set -ga terminal-overrides ",xterm-256color:Tc"` |
> | Enable copy text in copy mode | `y` (in copy mode)                                |

---

###### Pane Navigation (Vim Style)

> | **Action** | \*_Shortcut_ |
> | ---------- | ------------ |
> | Move Left  | `Prefix + h` |
> | Move Down  | `Prefix + j` |
> | Move Up    | `Prefix + k` |
> | Move Right | `Prefix + l` |

---

###### Splitting Panes

> | **Action**         | **Shortcut** |
> | ------------------ | ------------ |
> | Split Horizontally | `Prefix + s` |
> | Split Vertically   | `Prefix + v` |

---

###### Session Management

> | **Action**                              | **Shortcut**                          |
> | --------------------------------------- | ------------------------------------- |
> | Switch Between Sessions                 | `Ctrl+Shift+s`                        |
> | Create a New Session (Prompt for Name)  | `Alt + n`                             |
> | Rename Current Session                  | `Alt + Shift + r`                     |
> | Move Windows to Other Sessions          | `Alt + M`                             |
> | Go to Previous Session                  | `Alt + <`                             |
> | Go to Next Session                      | `Alt + >`                             |
> | Kill Current Session                    | `Alt + K`                             |
> | Kill All Sessions (With Confirmation)   | `X`                                   |
> | Automatically Kill All Sessions on Exit | `set-option -g detach-on-destroy off` |

---

###### Window Management

> | **Action**               | **Shortcut**        |
> | ------------------------ | ------------------- |
> | Create a New Window      | `Alt + t`           |
> | Rename Current Window    | `Alt + r`           |
> | Move to Previous Window  | `Alt + Left Arrow`  |
> | Move to Next Window      | `Alt + Right Arrow` |
> | Reorder Windows (Up)     | `Alt + PageUp`      |
> | Reorder Windows (Down)   | `Alt + PageDown`    |
> | Convert Pane into Window | `Alt + !`           |
> | Kill a Pane              | `x`                 |
> | Kill All Active Sessions | `X`                 |
> | Send 'cs ..' Command     | `Alt + Left`        |
> | Send 'cs -' Command      | `Alt + Right`       |

---

###### Pane Resizing

> | **Action**   | **Shortcut**          |
> | ------------ | --------------------- |
> | Resize Up    | `Alt + Shift + Up`    |
> | Resize Down  | `Alt + Shift + Down`  |
> | Resize Left  | `Alt + Shift + Left`  |
> | Resize Right | `Alt + Shift + Right` |

---

###### Active Window Navigation

> | **Action** | **Shortcut**      |
> | ---------- | ----------------- |
> | Move Left  | `Alt + Shift + H` |
> | Move Down  | `Alt + Shift + J` |
> | Move Up    | `Alt + Shift + K` |
> | Move Right | `Alt + Shift + L` |

---

###### Plugins

> | **Plugin**                | **Command**                                               |
> | ------------------------- | --------------------------------------------------------- |
> | Tmux Plugin Manager (TPM) | `set -g @plugin 'tmux-plugins/tpm'`                       |
> | Sensible Defaults         | `set -g @plugin 'tmux-plugins/tmux-sensible'`             |
> | Mode Indicator            | `set -g @plugin 'MunifTanjim/tmux-mode-indicator'`        |
> | Nerd Font Window Name     | `set -g @plugin 'joshmedeski/tmux-nerd-font-window-name'` |
> | Dracula Theme             | `set -g @plugin 'dracula/tmux'`                           |
> | Initialize TPM            | `run '/home/linuxbrew/.linuxbrew/opt/tpm/share/tpm/tpm'`  |

---

###### Dracula Theme Settings

> | **Setting**     | **Value**             |
> | --------------- | --------------------- |
> | Status Position | Top                   |
> | Show Powerline  | true                  |
> | Show Flags      | true                  |
> | Border Contrast | true                  |
> | Plugins Enabled | time, battery         |
> | Show Left Icon  | session               |
> | Time Format     | `%a-%d/%m %l:%M%p %Z` |
