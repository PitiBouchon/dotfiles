# --- ESSENTIALS ---

if (which rustc | is-empty) or (which rustup | is-empty) or (which cargo | is-empty) {
  print "Install rustc / rustup / cargo manually"
  exit 1
}

if (which brew | is-empty) {
  print "Install homebrew manually"
  exit 1
}

# --- TOOLS ---

brew install starship
brew install zellij

## - Helix -
brew install helix


# --- CLI ---

brew install bat
brew install fd
brew install ripgrep
brew install tealdeer
brew install typst
brew install tokei
brew install presenterm
brew install dust
brew install yazi

## - Git -
if (which git | is-empty) {
  print "Install git manually"
}
brew install git-delta
brew install difftastic

## - Lsp -
rustup component add rust-analyzer # rust
brew install taplo # toml
brew install just
brew install markdown-oxide # markdown
brew install harper # git commit
# cargo install --locked typst-lsp # typst
# cargo install --locked --git https://github.com/wgsl-analyzer/wgsl-analyzer wgsl_analyzer # wgsl
# cargo install --locked --git https://github.com/astral-sh/uv uv # python

## - Autocomplete -
brew install carapace
