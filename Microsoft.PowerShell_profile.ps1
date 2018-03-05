Set-Location D:
# code
function Js-Code { set-location "D:\JavaScript\Code" }
Set-Alias jscode Js-Code
function Jsn-Code { set-location "D:\JavaScript\Code\node" }
Set-Alias jsncode Jsn-Code
function Go-Code { set-location "D:\Go\Code\src\github.com\ravendcode" }
Set-Alias gocode Go-Code
function Py-Code { set-location "D:\Py\Code" }
Set-Alias pycode Py-Code
function Pyb-Code { set-location "D:\Py\Code\base" }
Set-Alias pybcode Pyb-Code
function Pys-Code { set-location "D:\Py\Code\salic" }
Set-Alias pyscode Pys-Code
function Pyd-Code { set-location "D:\Py\Code\django" }
Set-Alias pydcode Pyd-Code
function Pyf-Code { set-location "D:\Py\Code\flask" }
Set-Alias pyfcode Pyf-Code
# py venv
function Py-Venv($venvname) {
    if ($venvname -eq $null) {
        py -m venv venv
    } else {
        py -m venv $venvname
    }
}
Set-Alias pyv Py-Venv
function Py-Venv-Activate { venv\Scripts\activate }
Set-Alias pyva Py-Venv-Activate
function Py-Venv-Deactivate { deactivate }
Set-Alias pyvd Py-Venv-Deactivate
# git
function Git-Init { git init }
Set-Alias ggi Git-Init
function Git-Status { git status }
Set-Alias ggs Git-Status
function Git-Add { git add . }
Set-Alias gga Git-Add
function Git-Commit($message) { git commit -m "$message" }
Set-Alias ggc Git-Commit
function Git-Log { git log }
Set-Alias gglog Git-Log
function Git-Log-Oneline { git log --oneline }
Set-Alias ggl Git-Log-Oneline
function Git-Log-Oneline-Graph { git log --oneline --graph }
Set-Alias gglg Git-Log-Oneline-Graph
function Git-B() { git branch }
Set-Alias ggb Git-B
function Git-Co($branchname) { git co $branchname}
Set-Alias ggco Git-Co
function Git-Co-Master { git co master }
Set-Alias ggcom Git-Co-Master
function Git-Co-Branch($branch) { git co -b $branch }
Set-Alias ggcob Git-Co-Branch
function Git-Push { git push }
Set-Alias ggp Git-Push
function Git-Pull { git pull }
Set-Alias ggpl Git-Pull
# file
function touch() {
    $t = $host.ui.RawUI.ForegroundColor
    if ($args.count -eq 0) {
        $host.ui.RawUI.ForegroundColor = "Magenta"
        echo "set filename please"
    } else {
        $host.ui.RawUI.ForegroundColor = "Green"
        foreach ($filename in $args) {
            if (! (Test-Path $filename)) {
                echo $null >> $filename
                echo "$filename success created"
            }
        }
    }
    $host.ui.RawUI.ForegroundColor = $t
}
function mkdirs() {
    foreach ($dirname in $args) {
        if (! (Test-Path $dirname)) {
            New-Item -ItemType directory -Path $dirname
        }
   }
}
function mcd($dirname) {
    if ($dirname) {
        if (! (Test-Path $dirname)) {
            New-Item -ItemType directory -Path $dirname
        }
        Set-Location $dirname
    }
}
function la() {
    gci -force | ?{$_.mode -match "h"}
    gci
}
function rmrf() {
    foreach ($dirname in $args) {
        if (Test-Path $dirname) {
            Remove-Item $dirname -Force
        }
    }
}

Import-Module 'D:\JavaScript\Helpers\powershell\posh-git-develop\src\posh-git.psd1'

$GitPromptSettings.DefaultPromptSuffix = '`n$(''$'' * ($nestedPromptLevel + 1)) '
$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
$GitPromptSettings.DefaultPromptPrefix = 'Ravend@$(hostname) '
$GitPromptSettings.BeforeText = ' ('
$GitPromptSettings.BeforeText.ForegroundColor = 'Cyan'
$GitPromptSettings.AfterText = ')'
$GitPromptSettings.AfterText.ForegroundColor = 'Cyan'
$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = [ConsoleColor]::Magenta
$GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Yellow'
