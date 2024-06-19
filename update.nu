# ! Will overwrites config !

mkdir ~/.config

# Alacritty
if $nu.os-info.name == "windows" {
  cp -r config/alacritty $env.APPDATA
} else {
  cp -r config/alacritty ~/.config
}

# Zellij
# if $nu.os-info.name != "windows" {
#   cp -r config/zellij ~/.config
# }

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

# Nushell
if $nu.os-info.name == "windows" {
  cp -r config/nushell $env.APPDATA
} else {
  cp -r config/nushell ~/.config
}

print "Manually update Firefox extensions"
