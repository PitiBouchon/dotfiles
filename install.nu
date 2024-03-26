if (which cargo | is-empty) {
  echo "Install cargo manually"
  exit 1
}

# cargo install nu # Sould be installed
cargo install rioterm --locked
# cargo install starship --locked (need cmake and other things)
cargo install bat --locked
cargo install fd-find --locked
cargo install ripgrep --locked
cargo install tealdeer --locked
cargo install du-dust --locked
cargo install git-delta --locked
cargo install difftastic --locked

if (which hx | is-empty) {
  echo "Install Helix manually"
}

if (which git | is-empty) {
  echo "Install git manually"
}

if (which fish | is-empty) {
  echo "Install fish manually (used for autocompletion)"
}
