if (which rustc | is-empty) {
  print "Install rustc manually"
  exit 1
}
if (which rustup | is-empty) {
  print "Install rustup manually"
  exit 1
}
if (which cargo | is-empty) {
  print "Install cargo manually"
  exit 1
}

# tools
# cargo install nu
cargo install alacritty
# if $nu.os-info.name != "windows" { cargo install zellij }
cargo install starship --no-default-features --features "battery notify gix-faster" # So it does not need cmake to install

## helix
cargo install --git https://github.com/helix-editor/helix helix-term

let helix_config_path = if $nu.os-info.name == "windows" {
  ($env.APPDATA | path join helix/)
} else {
  ([$env.HOME, ".config/helix/"] | path join)
}

if not ($helix_config_path | path join runtime/grammars | path exists) {
  print "Fetching and building grammar"
  hx --grammar fetch
  hx --grammar build
}

if not ($helix_config_path | path join runtime/queries | path exists) {
  print "Getting helix queries and themes"
  git clone https://github.com/helix-editor/helix
  cp -r ([$env.PWD, "helix/runtime/"] | path join) $helix_config_path
  rm -rf ([$env.PWD, "helix"] | path join)
}

# cli
cargo install bat
cargo install fd-find
cargo install ripgrep
cargo install tealdeer

## git
if (which git | is-empty) {
  print "Install git manually"
}
cargo install git-delta
if $nu.os-info.name != "windows" {
  cargo install difftastic # does not work on windows
}

# lsp
cargo install taplo-cli # toml
rustup component add rust-analyzer # rust
cargo install --git https://github.com/wgsl-analyzer/wgsl-analyzer wgsl_analyzer # wgsl
# cargo install --git https://github.com/Feel-ix-343/markdown-oxide.git # markdown
# cargo install typst-lsp # typst

if $nu.os-info.name != "windows" {
  if (which fish | is-empty) {
    print "You may install fish manually (used for autocompletion)"
  }
}
