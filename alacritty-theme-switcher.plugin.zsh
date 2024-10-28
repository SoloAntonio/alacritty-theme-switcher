# Zsh Plugin for Alacritty Theme Switcher

# Constants
ALACRITTY_CONFIG="${HOME}/.config/alacritty/alacritty.toml"
THEME_DIR="${HOME}/.config/alacritty/themes/themes/"

# Function to list available themes
alacritty_theme_list() {
  if [[ -d "$THEME_DIR" ]]; then
    local themes=("${(@f)$(print -rl -- "$THEME_DIR"*.toml(N:t:r))}")
    if [[ ${#themes[@]} -eq 0 ]]; then
      echo "No themes found in $THEME_DIR."
    else
      echo "Available themes:"
      print -rl -- $themes
    fi
  else
    echo "Error: Theme directory $THEME_DIR does not exist."
  fi
}

# Function to apply a theme
alacritty_theme_apply() {
  local theme="$1"
  local theme_file="${THEME_DIR}${theme}.toml"

  # Check if the theme file exists
  if [[ ! -f "$theme_file" ]]; then
    echo "Error: Theme '$theme' not found in $THEME_DIR."
    return 1
  fi

  # Check if Alacritty config exists
  if [[ ! -f "$ALACRITTY_CONFIG" ]]; then
    echo "Error: Alacritty config file '$ALACRITTY_CONFIG' not found."
    return 1
  fi

  # Combined check if both [general] and the import line are missing
  if ! grep -q "^\[general\]" "$ALACRITTY_CONFIG" && ! grep -q "^import = \[\"${THEME_DIR}" "$ALACRITTY_CONFIG"; then
    # Add [general] and the theme import
    sed -i '' "1s|^|[general]\nimport = [\"${theme_file}\"]\n|" "$ALACRITTY_CONFIG"
  elif grep -q "^\[general\]" "$ALACRITTY_CONFIG" && ! grep -q "^import = \[\"${THEME_DIR}" "$ALACRITTY_CONFIG"; then
    # [general] exists, but import doesn't—replace the existing line with the new import
    sed -i '' "/^\[general\]/ { s|^\[general\].*|[general]\nimport = [\"$theme_file\"]|; }" "$ALACRITTY_CONFIG"
  else
    # Replace the existing import line with the new theme file
    sed -i '' "/^import = \[/ { s|import = \[\"${THEME_DIR}[^\"]*\".*\]|import = [\"${theme_file}\"]|; }" "$ALACRITTY_CONFIG" 
  fi 

  echo "Theme '$theme' applied successfully."
}

# Zsh Autocompletion for theme names
_alacritty_theme_apply_completion() {
  local themes=("${(@f)$(print -rl -- "$THEME_DIR"*.toml(N:t:r))}")
  _values 'themes' $themes
}

# Register autocompletion for the alacritty_theme_apply function
compdef _alacritty_theme_apply_completion alacritty_theme_apply