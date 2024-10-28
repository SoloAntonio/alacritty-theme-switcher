# Alacritty Theme Switcher Zsh Plugin

This Zsh plugin is designed to work with **Oh My Zsh** and allows easy switching between themes in Alacritty, complete with autocompletion for theme files in a specified directory.

## Features
- **Theme Switching**: Quickly apply themes from a specified directory to Alacritty.
- **Autocomplete**: Auto-completion for theme names with `<TAB>` for easier theme selection.

## Installation

1. **Clone the Repository**  
   Start by cloning the plugin into your custom Zsh plugins directory (e.g., `~/.oh-my-zsh/custom/plugins`):
   ```zsh
   ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom/" git clone --depth=1 "https://github.com/SoloAntonio/alacritty-theme-switcher.git" "${ZSH_CUSTOM}/plugins/alacritty-theme-switcher"
   ```
2. **Enable the Plugin**
   Open your .zshrc file in a text editor and add alacritty-theme-switcher to the list of plugins:
   ```zsh
   plugins=(... alacritty-theme-switcher)
   ```
3. **Reload Zsh**
   ```zsh
   source ~/.zshrc
   ```
## Configuration

Alacritty Config File: The plugin expects the Alacritty configuration file to be located at: `ALACRITTY_CONFIG="${HOME}/.config/alacritty/alacritty.toml`
Theme Directory: Themes are expected to be in `THEME_DIR=${HOME}/.config/alacritty/themes/themes/` by default. 
Customize these paths as needed by editing the plugin script.

## Usage

  - alacritty_themes_list: List available Alacritty themes
  - alacritty_theme_apply `<theme>`: Apply the specified theme (autocomplete available with `<TAB>`)

## Get Themes:
You can find a collection of Alacritty themes in the [Alacritty Themes](https://github.com/alacritty/alacritty-theme) repository. Simply download your preferred themes and place them in the theme directory.

## License

This project is licensed under the terms described in the [LICENSE](https://github.com/SoloAntonio/alacritty-theme-switcher/blob/main/LICENSE) file.

## Contributing
Feel free to open issues or submit pull requests to improve the plugin. Contributions are welcome!