# Neovim Configuration

<p align="center">
   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/neovim/neovim-original.svg" width="50" height="50"/>
   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/lua/lua-original.svg" width="50" height="50"/>
</p>

Repository dedicated to my Neovim configuration.

### About the Project

A highly modular, performance-oriented Neovim configuration written entirely in Lua. I built this setup primarily to optimize my own daily workflow as a DevOps engineer and Back-end developer, but it is perfectly suited for anyone who shares these same needs. It provides a robust development environment right out of the box, featuring real-time code intelligence, fast file navigation, and a refined, distraction-free visual interface.

**Core Highlights:**
* Intelligent Autocompletion: Powered by `blink.cmp` for instantaneous, visually integrated suggestions.
* Extensive LSP Support: Automated setup via `mason.nvim` for Python, Terraform, Docker, Ansible, Bash, Lua, and more.
* Frictionless Navigation: Fast file and text searching using `Telescope`, paired with a structured sidebar via `Nvim-Tree`.
* Refined UI: Clean aesthetics managed by `Lualine`, `Bufferline`, and `Smear-cursor` for smooth visual feedback.
* Modular Architecture: Responsibilities are strictly isolated into dedicated files, ensuring the codebase remains highly maintainable and easy to extend.

### Installation

Before we start, please note that this repository does not cover how to install Neovim itself. 

Because the installation process varies significantly depending on your operating system (Linux, macOS, or Windows) and package manager, the best approach is to follow the [official Neovim installation guide](https://github.com/neovim/neovim/blob/master/INSTALL.md) for instructions tailored to your specific environment.

Once you have successfully installed Neovim and confirmed it is working correctly, you are ready to apply this project's files. 

To make the configuration setup as seamless as possible, I've created an automated installation script that handles the heavy lifting for you.

**1. Run the installation script:**```bash
curl -sL https://raw.githubusercontent.com/thomaspalma1/nvim/main/install.sh | bash
```

*(Note: The script will automatically handle backing up your existing configuration and cloning this repository.)*

**2. Launch Neovim:**
```bash
nvim
```
*Upon the first launch, the configuration will automatically set itself up, downloading the package manager and installing all defined plugins and language servers. Restart Neovim once the process is complete.*

### Dependencies

To ensure all features—especially fuzzy finding, syntax highlighting, and visual icons—function correctly, the following system dependencies are required:

* Neovim version `0.11.0` or higher.
* A patched font (e.g., *JetBrainsMono Nerd Font*) set as your terminal's default to properly render icons in the statusline and file explorer.
* Node.js and npm required by Mason to install and run certain language servers (e.g., `pyright`, `bashls`).
* Python and pip required by Mason for Python-based tooling (e.g., `ruff`).
* LuaRocks required for Lua package management.

For Ubuntu/Debian-based systems, you will need to install the following search and environment dependencies:

```bash
sudo apt update
sudo apt install ripgrep fd-find python3-venv
```

### Project Structure

![ProjectStructure](docs/config_structure_overview.png)

Below is the conceptual architecture of the configuration:

```text
nvim
├── init.lua                         # Orchestrate the configuration by loading all modules in the correct execution order.
├── lua
│   ├── autocmds
│   │   └── init.lua                 # Define event-driven behaviors and automated tasks across the editor.
│   ├── core
│   │   └── settings.lua             # Establish the foundational behavior by setting native Neovim options.
│   ├── keymaps                      # Centralize all keyboard shortcuts, isolating global bindings from plugin-specific rules.
│   ├── lsp
│   │   └── init.lua                 # Initialize language servers and integrate code intelligence features.
│   ├── plugins                      # Isolate individual plugin configurations for UI, navigation, and functionality.
│   └── themes                       # Set visual colors and handle dynamic theme switching across sessions.
└── nvim-pack-lock.json              # Lock plugin versions to ensure reproducible installations on other machines.
```

### Customization

This configuration was designed to be highly modular and easy to customize. Because each component is isolated in its own directory, you can tweak specific behaviors without breaking the entire editor. 

Common customizations include:

* **Adding new plugins:** Simply drop a new `.lua` file into the `lua/plugins/` directory and require it in the root `init.lua`.
* **Installing additional LSP servers:** Open `lua/lsp/init.lua` and append your desired language server to the `ensure_installed` array within the Mason configuration block.
* **Creating custom keymaps:** Modify the specific context files inside `lua/keymaps/` (e.g., `telescope.lua` or `nvim-tree.lua`) to adjust shortcuts while keeping global and plugin-specific bindings separated.
* **Changing the active colorscheme:** Browse and apply new themes interactively using the Telescope theme picker, or set your permanent default inside `lua/themes/colorscheme.lua`.
* **Adjusting editor options:** Tweak foundational rules like line numbers, indentation size, and clipboard integrations directly in `lua/core/settings.lua`.

### Known Limitations

* **Manual Dependencies:** Some plugins require external system dependencies to be installed manually (such as `ripgrep`, `fd`, Node.js, and Python virtual environments), which are not handled automatically by the Neovim package manager.
* **OS Compatibility:** This configuration was primarily built and tested on Linux (Ubuntu/Debian). While Neovim is cross-platform, macOS or Windows (WSL) users might need to adapt specific paths, clipboard providers, or Mason dependencies to ensure full functionality.
* **Initial Loading Time:** The very first time you launch the editor, the bootstrap process might take a few minutes as Mason downloads and compiles the required language server binaries in the background.

### Future Improvements

* Introduce `conform.nvim` to automatically format Terraform, Python, and Lua files on save.
