# ! Will overwrites config !

mkdir ~/.config

# Rio
if $nu.os-info.name == "windows" {
  cp -r config/rio $env.LOCALAPPDATA
} else {
  cp -r config/rio ~/.config
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

# Nushell
if $nu.os-info.name == "windows" {
  cp -r config/nushell $env.APPDATA
} else {
  cp -r config/nushell ~/.config
}

echo "Manually update Firefox extensions"
