# --- ESSENTIALS ---

if (which rustc | is-empty) or (which rustup | is-empty) or (which cargo | is-empty) {
  print "Install rustc / rustup / cargo manually"
  exit 1
}


# --- TOOLS ---

# cargo install --locked nu
cargo install --locked alacritty
if $nu.os-info.name != "windows" { cargo install --locked zellij }
cargo install --locked starship

## - Helix -
cargo install --locked --git https://github.com/helix-editor/helix helix-term


# --- CLI ---

cargo install --locked bat
cargo install --locked fd-find
cargo install --locked ripgrep
cargo install --locked tealdeer

## - Git -
if (which git | is-empty) {
  print "Install git manually"
}
cargo install --locked git-delta
if $nu.os-info.name != "windows" {
  cargo install --locked difftastic # does not work on windows for some reason
}

## - Lsp -
rustup component add rust-analyzer # rust
cargo install --locked taplo-cli # toml
cargo install --locked just # toml
cargo install --locked --git https://github.com/Feel-ix-343/markdown-oxide.git # markdown
# cargo install --locked --git https://github.com/wgsl-analyzer/wgsl-analyzer wgsl_analyzer # wgsl
# cargo install --locked typst-lsp # typst

## - Autocomplete -
if (which carapace | is-empty) {
  print "You may install carapace manually (used for autocompletion)"
}

let helix_config_path = if $nu.os-info.name == "windows" {
  ($env.APPDATA | path join helix/)
} else {
  ([$env.HOME, ".config/helix/"] | path join)
}
if not ($helix_config_path | path join runtime/queries | path exists) {
  print (["Copy the runtime/ directory of https://github.com/helix-editor/helix into ", $helix_config_path] | str join)
}
