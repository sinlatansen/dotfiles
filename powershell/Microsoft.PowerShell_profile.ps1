oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\quick-term.omp.json" | Invoke-Expression

Import-Module Terminal-Icons
Import-Module PSReadLine

# Set-PSReadLineOption -PredictionSource History
# Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -MaximumHistoryCount 5000
Set-PSReadLineKeyHandler -Key Ctrl+n -Function NextHistory
Set-PSReadLineKeyHandler -Key Ctrl+p -Function PreviousHistory

# Custom username for oh-my-posh
$env:POSH_SESSION_USER = "lzy"

# Proxy
$env:HTTP_PROXY  = "http://127.0.0.1:7890"
$env:HTTPS_PROXY = "http://127.0.0.1:7890"
$env:NO_PROXY    = "localhost,127.0.0.1"

# Yazi - file tool for preview
$env:YAZI_FILE_ONE = "C:\Program Files\Git\usr\bin\file.exe"

# OpenCode alias
Set-Alias oc opencode
function ocweb {
    & opencode web
}

# Yazi alias - change directory on exit
function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi --cwd-file="$tmp"
    if (Test-Path $tmp) {
        $cwd = Get-Content $tmp
        if ($cwd -ne $PWD.Path) {
            Set-Location $cwd
        }
        Remove-Item $tmp
    }
}


# fastfetch
function ff {
    fastfetch.exe
}


# Editor
$env:EDITOR = "code --wait"
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
