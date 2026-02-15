alias oc = opencode

def ll [] {
    ls -la
}

def ocweb [] {
    opencode web
}

def y [] {
    let tmp = (mktemp)
    yazi --cwd-file $tmp
    if ($tmp | path exists) {
        let cwd = (open $tmp | str trim)
        if $cwd != $env.PWD {
            cd $cwd
        }
        rm $tmp
    }
}

def ff [] {
    fastfetch
}

$env.config.show_banner = "short"

$env.config.edit_mode = "vi"

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

zoxide init nushell | save -f ~/.config/nushell/.zoxide.nu
source ~/.config/nushell/.zoxide.nu