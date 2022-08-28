init
function run
{
    [CmdletBinding()]
    param (
        [ValidateSet("todo", "init", "test", "hilfe")]
        [String]
        $cmd
    )

    . $cmd
}

function init
{
    cd $PSScriptRoot
    del ./GitProjekt -Recurse -Force
    git clone https://github.com/bugfrei/GitProjekt
    cd GitProjekt

    cls
    hilfe
}

function todo
{
    if ($PSVersionTable.PSVersion.Major -eq 7)
    {
        Show-Markdown ./todo.md -UseBrowser
    }
    else
    {
        ii ./todo.md 
    }
}

function test
{
    Write-Host "Pfad: $PSScriptRoot"
}

function hilfe
{
    cls
    Write-Host "Es erfolgt jetzt eine Initialisierung des Tutorials. Diese kann jederzeit mit run init erneut durchgeführt werden."
    Write-Host
    Write-Host "Es gibt folgende run <Kommandos>:"
    Write-Host "run hilfe : zeigt diese Hilfe an."
    Write-Host "run todo: öffnet die todo.md Datei (PowerShell Code im Browser, ansonsten im verknüpften Programm z.B. VS Code)"
    Write-Host "run init: Initialisiert das Tutorial neu"
    Write-Host
    Write-Host "Markdown anzeigen in Visual Studio Code:" -ForegroundColor Yellow
    Write-Host "F1 -> Markdown: Vorschau öffnen"
    Write-Host "Oder einfach Strg+Shift+V"
    Write-Host

}