# --- ESSENTIALS ---

if (which rustc | is-empty) or (which rustup | is-empty) or (which cargo | is-empty) {
  print "Install rustc / rustup / cargo manually"
  exit 1
}

# --- TOOLS ---

# cargo install nu
cargo install alacritty
if $nu.os-info.name != "windows" { cargo install zellij }
cargo install starship --no-default-features --features "battery notify gix-faster" # So it does not need cmake to install

## - Helix -
cargo install --git https://github.com/helix-editor/helix helix-term

hx --grammar fetch
hx --grammar build

let helix_config_path = if $nu.os-info.name == "windows" {
  ($env.APPDATA | path join helix/)
} else {
  ([$env.HOME, ".config/helix/"] | path join)
}
if not ($helix_config_path | path join runtime/queries | path exists) {
  print (["Copy the runtime/ directory of https://github.com/helix-editor/helix into ", $helix_config_path] | str join)
}


# --- CLI ---

cargo install bat
cargo install fd-find
cargo install ripgrep
cargo install tealdeer

## - Git -
if (which git | is-empty) {
  print "Install git manually"
}
cargo install git-delta
if $nu.os-info.name != "windows" {
  cargo install difftastic # does not work on windows for some reason
}

## - Lsp -
rustup component add rust-analyzer # rust
cargo install taplo-cli # toml
# cargo install --git https://github.com/wgsl-analyzer/wgsl-analyzer wgsl_analyzer # wgsl
# cargo install --git https://github.com/Feel-ix-343/markdown-oxide.git # markdown
# cargo install typst-lsp # typst

## - Autocomplete -
if $nu.os-info.name != "windows" {
  if (which fish | is-empty) {
    print "You may install fish manually (used for autocompletion)"
  }
}
