# ! WILL OVERWRITES CONFIG !

mkdir ~/.config

# Rio
if $nu.os-info.name != "android" {
  cp -r config/rio ~/.config
}

# Nushell
cp -r config/nushell ~/.config

# Zellij
cp -r config/zellij ~/.config

# Starship
cp -r config/starship/starship.toml ~/.config/starship.toml

# Helix
cp -r config/helix ~/.config

# Git
nu config/git/update.nu

# Presenterm
if $nu.os-info.name == "windows" {
  mkdir ($env.APPDATA | path join presenterm/config/)
  cp -r config/presenterm/config.yaml ($env.APPDATA | path join presenterm/config/)
} else {
  cp -r config/presenterm ~/.config
}

# - Update Tools -

# Tealdeer
# tldr --update

# Helix
# hx --grammar fetch
# hx --grammar build
