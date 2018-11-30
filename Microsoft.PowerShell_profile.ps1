Set-Location D:

# code
function J-Code { set-location "D:\Java\Code" }
Set-Alias jcode J-Code

function Js-Code { set-location "D:\JavaScript\Code" }
Set-Alias jscode Js-Code


function Js-Node-Code { set-location "D:\JavaScript\Code\node" }
Set-Alias ncode Js-Node-Code

function PHP-Code { set-location "D:\PHP\Code" }
Set-Alias phpcode PHP-Code

function L-Code { set-location "D:\PHP\Code\laravel" }
Set-Alias lcode L-Code

function S-Code { set-location "D:\PHP\Code\symfony" }
Set-Alias scode S-Code

function Ts-Code { set-location "D:\JavaScript\Code\ts" }
Set-Alias tscode Ts-Code

function Unity-Code { set-location "D:\Unity\Code" }
Set-Alias ucode Unity-Code

function Kotlin-Code { set-location "D:\Kotlin\Code" }
Set-Alias kcode Kotlin-Code

function Go-Code { set-location "D:\Go\Code\src\github.com\ravendcode" }
Set-Alias gocode Go-Code

function Rust-Code { set-location "D:\Rust\Code" }
Set-Alias rscode Rust-Code

function CS-Code { set-location "D:\CS\Code" }
Set-Alias cscode CS-Code

function Py-Code { set-location "D:\Py\Code" }
Set-Alias pycode Py-Code

function Py-Base-Code { set-location "D:\Py\Code\base" }
Set-Alias pybcode Py-Base-Code

function Py-Sanic-Code { set-location "D:\Py\Code\sanic" }
Set-Alias pyscode Py-Sanic-Code

function Py-Django-Code { set-location "D:\Py\Code\django" }
Set-Alias pydcode Py-Django-Code

function Py-Flask-Code { set-location "D:\Py\Code\flask" }
Set-Alias pyfcode Py-Flask-Code

# node
function Node-Yarn() { yarn $args }
Set-Alias y Node-Yarn

# gradle
function Gradle() { gradle $args }
Set-Alias g Gradle

# php
function PHP-Unit() { php vendor\bin\phpunit $args }
Set-Alias pp PHP-Unit

function PHP-Unit-Filter() { php vendor\bin\phpunit --filter $args }
Set-Alias ppf PHP-Unit-Filter

# laravel
function Laravel-Artisan() { php artisan $args }
Set-Alias a Laravel-Artisan

function Laravel-Artisan-Serve() { php artisan serve $args }
Set-Alias as Laravel-Artisan-Serve

# symfony
function Symfony-Console() { php bin/console $args }
Set-Alias c Symfony-Console

function PHP-Unit() { php bin\phpunit $args }
Set-Alias p PHP-Unit

function PHP-Unit-Filter() { php bin\phpunit --filter $args }
Set-Alias pf PHP-Unit-Filter

function Symfony-Console-Serve() { php bin/console server:run $args }
Set-Alias cs Symfony-Console-Serve

# django
function Django-Admin() { django-admin.py $args }
Set-Alias da Django-Admin

function Django-Runserver() { python manage.py runserver $args }
Set-Alias dr Django-Runserver

function Django-Manage() { python manage.py runserver $args }
Set-Alias dm Django-Manage

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

function Pip-Freeze-Requirements { pip freeze > requirements.txt }
Set-Alias pipf Pip-Freeze-Requirements

function Pip-Install-Requirements { pip install -r requirements.txt }
Set-Alias pipir Pip-Install-Requirements

# git
function Git-Init { git init }
Set-Alias ggi Git-Init

function Git-Status { git status }
Set-Alias ggs Git-Status

function Git-Add { git add . }
Set-Alias gga Git-Add

function Git-Commit() { git commit -m $args }
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

function Git-Push-Heroku { git push heroku master }
Set-Alias ggph Git-Push-Heroku

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

function mkcd($dirname) {
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
