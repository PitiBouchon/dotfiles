# External completer example (https://www.nushell.sh/cookbook/external_completers.html)
let carapace_completer = {|spans|
    carapace $spans.0 nushell ...$spans | from json
}

# The default config record. This is where much of your global configuration is setup.
$env.config = {
    history: {
        file_format: "sqlite" # "sqlite" or "plaintext"
        isolation: true # only available with sqlite file_format. true enables history isolation, false disables it. true will allow the history to be isolated to the current session using up/down arrows. false will allow the history to be shared across all sessions.
    }

    completions: {
        case_sensitive: true
        algorithm: "prefix" # prefix or fuzzy
        external: {
            enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up may be very slow
            max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
            completer: $carapace_completer # check 'carapace_completer' above as an example
        }
    }

    footer_mode: "auto" # always, never, number_of_rows, auto
    buffer_editor: "hx" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
    edit_mode: emacs # emacs, vi
    # Disable kitty protocol for now because there is a bug with is
    # use_kitty_protocol: true # enables keyboard enhancement protocol implemented by kitty console, only if your terminal support this.
    highlight_resolved_externals: true # true enables highlighting of external commands in the repl resolved by which.

    hooks: {
        pre_prompt: [{ || 
            if (which direnv | is-empty) { 
                return 
            } 
            
            direnv export json | from json | default {} | load-env
        }] # run before the prompt is shown
        pre_execution: [{ null }] # run before the repl input is run
    }
}


# Aliases
alias ll = ls -l
alias la = ls -a
alias cdgr = cd (git rev-parse --show-toplevel)

# Theme
source ./catppuccin_macchiato.nu

# Prompt
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Zellij
if $nu.os-info.name != "windows" and $nu.os-info.name != "android" {
    if 'ZELLIJ' not-in ($env | columns) {
        zellij attach -c
    }
    if 'ZELLIJ_AUTO_EXIT' in ($env | columns) and $env.ZELLIJ_AUTO_EXIT == 'true' {
        exit
    }
}
