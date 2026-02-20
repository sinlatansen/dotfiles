alias oc = opencode
alias md = mkdir
alias ff = fastfetch
alias ll = ls -la
alias cat = bat

def ocweb [] {
    opencode web
}

def --env y [...args] {
    let tmp = (mktemp -t "yazi-cwd.XXXXXX")
    ^yazi ...$args --cwd-file $tmp
    let cwd = (open $tmp)
    if $cwd != $env.PWD and ($cwd | path exists) {
        cd $cwd
    }
    rm -fp $tmp
}

$env.config.show_banner = false
$env.config.edit_mode = "vi"

let win_path = ($env.Path | split row (char esep))
$env.PATH = (
    $env.PATH
    | append $win_path
    | append [
        "F:\\OneDrive\\08.Workspace\\rust\\bin"
    ]
    | uniq
)

source ~/.config/nushell/scripts/git-completions.nu
source ~/.config/nushell/scripts/npm-completions.nu
source ~/.config/nushell/scripts/cargo-completions.nu
source ~/.config/nushell/scripts/eza-aliases.nu

source ~/.config/nushell/.zoxide.nu

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

print 求知无坦途。