if (which cargo | is-empty) {
  echo "Install cargo manually"
  exit 1
}
if (which rustc | is-empty) {
  echo "Install rustc manually"
  exit 1
}
if (which rustup | is-empty) {
  echo "Install rustup manually"
  exit 1
}

# tools
# cargo install nu # Sould be installed
cargo install starship --no-default-features --features "battery notify gix-faster" # So it does not need cmake to install
cargo install rioterm

if (which hx | is-empty) {
  echo "Install Helix manually"
}

# cli
cargo install bat
cargo install fd-find
cargo install ripgrep
cargo install tealdeer
cargo install du-dust

## git
if (which git | is-empty) {
  echo "Install git manually"
}
cargo install git-delta
cargo install difftastic

# lsp
cargo install taplo-cli # toml
rustup component add rust-analyzer # rust
cargo install --git https://github.com/wgsl-analyzer/wgsl-analyzer wgsl_analyzer # wgsl

if $nu.os-info.name != "windows" {
  if (which fish | is-empty) {
    echo "You may install fish manually (used for autocompletion)"
  }
}
