# Neovim Configuration

A personal Neovim setup built on [LazyVim](https://github.com/LazyVim/LazyVim).

## ⚡️ Requirements

- **Neovim** >= 0.9.0
- **Git**
- A **C compiler** for tree-sitter
- [ripgrep](https://github.com/BurntSushi/ripgrep) (optional, but highly recommended)
- [fd](https://github.com/sharkdp/fd) (optional, but highly recommended)

## 🚀 Installation

1. **Backup your current configuration (optional):**

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   mv ~/.local/share/nvim ~/.local/share/nvim.bak
   ```

2. **Clone this repository:**

   ```bash
   git clone https://github.com/shivaraj110/neovim.git ~/.config/nvim
   ```

3. **Open Neovim:**

   ```bash
   nvim
   ```

Lazy.nvim will automatically start downloading and installing the plugins.

## 🛠️ After Installation

- Run `:Lazy` to check plugin status.
- Run `:checkhealth` to verify your environment.
