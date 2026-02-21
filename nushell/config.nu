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

let hostname = (sys host).hostname

if $hostname == "Y9000P" {

    $env.HTTP_PROXY = "http://127.0.0.1:7890"
    $env.HTTPS_PROXY = "http://127.0.0.1:7890"
    $env.NO_PROXY = "localhost,127.0.0.1"

    $env.YAZI_FILE_ONE = "C:\\Program Files\\Git\\usr\\bin\\file.exe"

    $env.EDITOR = "code"

    let win_path = ($env.Path | split row (char esep))
    $env.PATH = (
        $env.PATH
        | append $win_path
        | append [
            "F:\\OneDrive\\08.Workspace\\rust\\bin"
        ]
        | uniq
    )

    print "求知无坦途。"
}

source ./scripts/git-completions.nu
source ./scripts/npm-completions.nu
source ./scripts/cargo-completions.nu
source ./scripts/eza-aliases.nu

source ./.zoxide.nu

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
