# Neovim Configuration

A modern, feature-rich Neovim configuration built on [NvChad](https://nvchad.com/) v2.5 with carefully selected plugins for an enhanced development experience.

## ✨ Features

- **🎨 Beautiful UI**: Catppuccin theme with customized statusline and dashboard
- **🤖 AI Integration**: Avante.nvim for AI-powered coding assistance
- **🔍 Smart Navigation**: Flash.nvim for quick movement, enhanced Telescope fuzzy finding
- **🔧 Development Tools**: Complete LSP setup, linting, formatting, and auto-completion
- **📝 Enhanced Editing**: Surround operations, sort motions, and advanced text manipulation
- **🌳 Git Integration**: Conflict resolution and status indicators
- **📚 Markdown Support**: Live rendering and enhanced editing capabilities

> [!NOTE]
> Some Mason packages aren't available on certain ARM processors. Watch for errors and install manually if needed.

> [!IMPORTANT]
> This configuration requires NvChad v2.5. For older versions, check the v2.0 branch (no longer maintained).

## 🚀 Installation

### Prerequisites
- [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- GCC or equivalent C compiler
- Make
- [Ripgrep](https://github.com/BurntSushi/ripgrep) (for Telescope live grep)

### Setup Steps

1. **Backup existing configuration** (if any):
   ```bash
   # Backup approach (recommended)
   mv ~/.config/nvim{,.bak}
   mv ~/.local/share/nvim{,.bak}
   mv ~/.local/state/nvim{,.bak}

   # Or delete completely
   rm -rf ~/.config/nvim ~/.local/state/nvim ~/.local/share/nvim
   ```

2. **Clone this configuration**:
   ```bash
   git clone https://github.com/v3ceban/nvchad-config.git ~/.config/nvim
   ```

3. **Launch Neovim**:
   ```bash
   nvim
   ```
   
   Lazy.nvim will automatically install all plugins on first launch.

4. **Enjoy your enhanced Neovim experience!** 🎉

## 🛠️ Configuration Structure

```
lua/
├── configs/           # Plugin configurations
│   ├── avante.lua    # AI assistant settings
│   ├── cmp.lua       # Completion configuration
│   ├── conform.lua   # Formatting settings
│   ├── lspconfig.lua # LSP server configurations
│   └── ...
├── chadrc.lua        # NvChad configuration
├── mappings.lua      # Custom keybindings
├── options.lua       # Neovim options
└── plugins.lua       # Plugin specifications
```

## 🎯 Key Bindings

The configuration uses `<Space>` as the leader key. All bindings are discoverable through Which-key.

### Quick Access
- `<Space>e` - Toggle file explorer (NvimTree)
- `<Space>ff` - Find files
- `<Space>fw` - Find word (live grep)
- `<Space>fo` - Recent files
- `<Space>th` - Theme selector

### AI Features (Avante)
- `<M-a>` - Toggle AI chat window
- `<leader>am` - Change AI provider/model
- `<leader>ae` - Edit selection with AI
- `<leader>ah` - View chat history

### Navigation & Movement
- `s` + motion - Flash jump to location
- `<leader>st` - Treesitter node selection
- `%` - Enhanced bracket/quote matching

### Text Manipulation
- `cs` - Change surrounding
- `ds` - Delete surrounding  
- `ys` - Add surrounding
- `gs` - Sort motion/selection

## 🌐 Language Support

### HTML

- Uses [css-lsp](https://github.com/microsoft/vscode-css-languageservice) for LSP and linting
- Uses [prettierd](https://github.com/fsouza/prettierd) for formatting
- Uses [emmet](https://github.com/olrtg/emmet-language-server) for LSP snippets

### CSS

- Uses [html-lsp](https://github.com/microsoft/vscode-html-languageservice) for LSP and linting
- Uses [prettierd](https://github.com/fsouza/prettierd) for formatting
- Uses [tailwindcss-language-server](https://github.com/tailwindlabs/tailwindcss-intellisense) for Tailwind LSP
- Uses [rustywind](https://github.com/avencera/rustywind) for Tailwind classes organization

### JavaScript/TypeScript

- Uses [typescript-language-server](https://github.com/typescript-language-server/typescript-language-server) for LSP
- Uses [eslintd](https://github.com/mantoni/eslint_d.js/) for linting
- Uses [prettierd](https://github.com/fsouza/prettierd) for formatting
- Requires eslint config to run linting server
  - Run `npm init` if not already done
  - Run `npm init @eslint/config@latest` in the root of the project
- Uses [prisma-language-server](https://github.com/prisma/language-tools) for LSP in Prisma files

### JSON

- Uses [json-lsp](https://github.com/microsoft/vscode-json-languageservice) for LSP in JSON files
- Uses [fixjson](https://github.com/rhysd/fixjson) for formatting JSON files

### PHP

- Uses [intelephense](https://intelephense.com/) for LSP and linting
- Uses [php-cs-fixer](https://github.com/PHP-CS-Fixer/PHP-CS-Fixer) for formatting
- Requires a git repo to run linting server
  - To create .git run `git init` in the root of the project

### Lua

- Uses [lua-language-server](https://github.com/LuaLS/lua-language-server) for LSP and linting
- Uses [stylua](https://github.com/JohnnyMorganz/StyLua) for formatting

### Bash

- Uses [bash-language-server](https://github.com/bash-lsp/bash-language-server) for LSP
- Uses [beautysh](https://github.com/lovesegfault/beautysh) for formatting

### C/C++

- Uses [clangd](https://clangd.llvm.org) for LSP and linting
- Uses [clang-format](https://pypi.org/project/clang-format/) for formatting

### Python

- Uses [python-lsp-server](https://github.com/python-lsp/python-lsp-server) for LSP and linting
- Uses [black](https://pypi.org/project/black/) and [isort](https://pycqa.github.io/isort/) for formatting

### Go

- Uses [gopls](https://pkg.go.dev/golang.org/x/tools/gopls) for LSP and linting
- Uses [gofumpt](https://pkg.go.dev/mvdan.cc/gofumpt), [goimports-reviser](https://github.com/incu6us/goimports-reviser), and [golines](https://github.com/segmentio/golines) for formatting

### Markdown

- Uses [Render Markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim) for inline markdown rendering
- Uses [markdowny.nvim](https://github.com/antonk52/markdowny.nvim) for some markdown features in **Visual** mode
  - `<C-k>` to add a link
  - `<C-b>` to make text bold
  - `<C-i>` to make text italic
  - `<C-e>` to make text inline code or code block in **V-Line** mode

### Docker

- Uses [Dockerfile Language Server](https://github.com/rcjsuen/dockerfile-language-server-nodejs) for LSP in Dockerfiles
- Uses [Docker Compose Language Service](https://github.com/microsoft/compose-language-service) for LSP in Docker Compose files

## 🔌 Key Plugins & Features

### Core Framework
- **[NvChad](https://nvchad.com/)** - Base configuration framework
- **[Lazy.nvim](https://github.com/folke/lazy.nvim)** - Modern plugin manager
- **[Which-key](https://github.com/folke/which-key.nvim)** - Keybinding discovery

### AI & Productivity

### **[Abolish.vim](https://github.com/tpope/vim-abolish)**
Advanced search and replace with smart substitutions.
- `<leader>sr` - Search and replace with pattern matching
- `:Subvert/child{,ren}/adult{,s}/g` - Smart pluralization handling
- Works with abbreviations and case coercion

### **[Avante.nvim](https://github.com/yetone/avante.nvim)**
AI-powered code editing with multiple provider support.

**Supported Providers:**
- Copilot (Claude 3.5 Sonnet - default)
- OpenAI, Deepseek, Groq, Ollama
- Web search via Tavily

**Key Features:**
- Code generation and editing
- File operations and web search
- Clean chat interface
- Context-aware suggestions

### Development Tools
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - Language Server Protocol support
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Auto-completion engine
- **[conform.nvim](https://github.com/stevearc/conform.nvim)** - Code formatting
- **[nvim-lint](https://github.com/mfussenegger/nvim-lint)** - Linting integration
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting

### Navigation & UI
- **[Flash.nvim](https://github.com/folke/flash.nvim)** - Enhanced navigation with search labels
- **[Telescope](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder
- **[nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)** - File explorer
- **[dressing.nvim](https://github.com/stevearc/dressing.nvim)** - Improved UI elements

### Text Editing & Manipulation
- **[nvim-surround](https://github.com/kylechui/nvim-surround)** - Surround text objects (visual mode: `s`)
- **[vim-sort-motion](https://github.com/christoomey/vim-sort-motion)** - Sort with motions (`gs`)
- **[nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)** - Auto-close HTML/XML tags
- **[vim-matchquote](https://github.com/airblade/vim-matchquote)** - Enhanced `%` matching

### Git & Version Control
- **[git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim)** - Resolve merge conflicts (`<leader>cX`)

### Markdown & Documentation
- **[render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)** - Live markdown rendering
- **[markdowny.nvim](https://github.com/antonk52/markdowny.nvim)** - Enhanced markdown editing in visual mode

## 🎨 Customization

### Theme
Modify the theme in `lua/chadrc.lua`:
```lua
M.base46 = {
  theme = "catppuccin", -- Change to your preferred theme
}
```

### Adding Plugins
Add new plugins to `lua/plugins.lua`:
```lua
{
  "author/plugin-name",
  event = "VeryLazy",
  config = function()
    -- Plugin configuration
  end,
}
```

### Custom Keybindings
Add mappings in `lua/mappings.lua`:
```lua
map("n", "<leader>xx", "<cmd>YourCommand<CR>", { desc = "Description" })
```

## 🔧 Troubleshooting

### Common Issues
- **Plugins not loading**: Run `:Lazy sync` to update plugins
- **LSP not working**: Check `:LspInfo` for server status  
- **Icons missing**: Install a Nerd Font and configure your terminal
- **Mason packages failing**: Some packages aren't available on ARM - install manually

### Getting Help
- `:help <plugin-name>` - Plugin documentation
- `:checkhealth` - System health check
- `:Lazy` - Plugin manager interface
- `:Mason` - LSP server manager

## 📚 Useful Resources

- [NvChad Documentation](https://nvchad.com/)
- [Conform.nvim Formatters](https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters)
- [LSPconfig Servers](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)
- [Nvim-lint Linters](https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters)
- [Lazy.nvim Plugin Spec](https://lazy.folke.io/spec)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues and pull requests to improve this configuration.

---

**Enjoy your enhanced Neovim experience!** ✨
