# pkg install git
# pkg install rust
# pkg install nu
pkg install starship

pkg install helix
let helix_config_path = ([$env.HOME, ".config/helix/"] | path join)

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

pkg install bat
pkg install fd
pkg install ripgrep
pkg install tealdeer
pkg install git-delta
pkg install difftastic
pkg install rust-analyzer
pkg install taplo
pkg install fish
