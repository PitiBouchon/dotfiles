if (which cargo | is-empty) {
  echo "Install cargo manually"
  exit 1
}
if (which rustup | is-empty) {
  echo "Install rustup manually"
  exit 1
}

# tools
# cargo install nu # Sould be installed
# cargo install starship --locked (need cmake and other things)
cargo install rioterm --locked

if (which hx | is-empty) {
  echo "Install Helix manually"
}

# cli
cargo install bat --locked
cargo install fd-find --locked
cargo install ripgrep --locked
cargo install tealdeer --locked
cargo install du-dust --locked

## git
if (which git | is-empty) {
  echo "Install git manually"
}
cargo install git-delta --locked
cargo install difftastic --locked

# lsp
cargo install taplo-cli --locked # toml
rustup component add rust-analyzer # rust
cargo install --git https://github.com/wgsl-analyzer/wgsl-analyzer wgsl_analyzer # wgsl


if $nu.os-info.name != "windows" {
  if (which fish | is-empty) {
    echo "Install fish manually (used for autocompletion)"
  }
}
