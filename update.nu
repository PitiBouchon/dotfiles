# ! WILL OVERWRITES CONFIG !

mkdir ~/.config

# Alacritty
if $nu.os-info.name == "windows" {
  cp -r config/alacritty $env.APPDATA
} else if $nu.os-info.name != "android" {
  cp -r config/alacritty ~/.config
}

# Rio
if $nu.os-info.name == "windows" {
  cp -r config/rio $env.LOCALAPPDATA
} else if $nu.os-info.name != "android" {
  cp -r config/rio ~/.config
}

# Nushell
if $nu.os-info.name == "windows" {
  cp -r config/nushell $env.APPDATA
} else {
  cp -r config/nushell ~/.config
}


# Zellij
if $nu.os-info.name != "windows" and $nu.os-info.name != "android" {
  cp -r config/zellij ~/.config
}

# Starship
cp config/starship/starship.toml ~/.config/starship.toml

# Helix
if $nu.os-info.name == "windows" {
  cp -r config/helix $env.APPDATA
} else {
  cp -r config/helix ~/.config
}

# Git
nu config/git/update.nu

# Tealdeer
tldr --update

# Helix
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
