alias oc = opencode

def md [] {
    mkdir
}

def ll [] {
    ls -la
}

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

def ff [] {
    fastfetch
}

$env.config.show_banner = "short"

$env.config.edit_mode = "vi"

source ~/.config/nushell/scripts/git-completions.nu
source ~/.config/nushell/scripts/npm-completions.nu
source ~/.config/nushell/scripts/cargo-completions.nu

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

zoxide init nushell | save -f ~/.config/nushell/.zoxide.nu
source ~/.config/nushell/.zoxide.nu