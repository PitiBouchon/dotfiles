# --- ESSENTIALS ---

if (which rustup | is-empty) or (which cargo | is-empty) {
  print "Installing rust"
  pkg install rust
}

# --- TOOLS ---

# pkg install nu
pkg install starship

## - Helix -
pkg install helix

let helix_config_path = ([$env.HOME, ".config/helix/"] | path join)
if not ($helix_config_path | path join runtime/queries | path exists) {
  print (["Copy the runtime/ directory of https://github.com/helix-editor/helix into ", $helix_config_path] | str join)
}

# --- CLI ---

pkg install bat
pkg install fd
pkg install ripgrep
pkg install tealdeer

## - Git -
pkg install git
pkg install git-delta
pkg install difftastic

## - Lsp -
pkg install rust-analyzer
pkg install taplo

## - Autocomplete -
pkg install fish

## - Autocomplete -
if (which carapace | is-empty) {
  print "You may install carapace manually (used for autocompletion)"
}
