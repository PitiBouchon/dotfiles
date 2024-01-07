if (which cargo | is-empty) {
  echo "Install cargo manually"
  exit 1
}

# cargo install nu # Sould be installed
cargo install rioterm
cargo install starship
cargo install bat
cargo install fd-find
cargo install ripgrep
cargo install tealdeer
cargo install du-dust
cargo install git-delta
cargo install difftastic

if (which hx | is-empty) {
  echo "Install Helix manually"
}

if (which git | is-empty) {
  echo "Install git manually"
}

if (which fish | is-empty) {
  echo "Install fish manually (used for autocompletion)"
}
