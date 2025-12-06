# External completer example (https://www.nushell.sh/cookbook/external_completers.html)
let carapace_completer = {|spans|
    carapace $spans.0 nushell ...$spans | from json
}

$env.config.buffer_editor = "hx"

$env.config.history = {
    file_format: "sqlite" # "sqlite" or "plaintext"
    isolation: true # only available with sqlite file_format. true enables history isolation, false disables it. true will allow the history to be isolated to the current session using up/down arrows. false will allow the history to be shared across all sessions.
}

$env.config.completions = {
    case_sensitive: true
    algorithm: "fuzzy" # prefix or fuzzy
    external: {
        enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions
        max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
        completer: $carapace_completer # check 'carapace_completer'
    }
}

$env.config.footer_mode = "auto" # always, never, number_of_rows, auto

$env.config.edit_mode = "emacs" # emacs, vi
$env.config.edit_mode = "emacs" # emacs, vi

# Disable kitty protocol for now because there is a bug with is
# $env.config.use_kitty_protocol = true # enables keyboard enhancement protocol implemented by kitty console, only if your terminal support this.

$env.config.highlight_resolved_externals = true # true enables highlighting of external commands in the repl resolved by which

$env.config.show_banner = false # remove welcome message

# run before the prompt is shown
$env.config.hooks.pre_prompt = [{ || 
    if (which direnv | is-empty) { 
        return 
    } 
    
    direnv export json | from json | default {} | load-env
}]

# CTRL+h = CTRL+Backspace
$env.config.keybindings ++= [
    {
        name: delete_one_word_backward
        modifier: control
        keycode: char_h
        mode: [emacs, vi_insert]
        event: {edit: backspaceword}
    }
]

# Aliases
alias ll = ls -l
alias la = ls -a
alias cdgr = cd (git rev-parse --show-toplevel)

# Theme
source ./catppuccin_macchiato.nu

# Starship prompt
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
