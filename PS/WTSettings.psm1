
$ModName = 'WTSettings'
Get-Module $ModName | Remove-Module -Force

Write-Host "`n`n$ModName module import starting`n" -ForegroundColor Cyan

#
# Module definitions
#



#
# Import main functions
#

#$Public = @(Get-ChildItem (Join-Path $PSScriptRoot 'Public') -Filter *.ps1)
#$Private = @(Get-ChildItem (Join-Path $PSScriptRoot 'Private') -Filter *.ps1 -ErrorAction SilentlyContinue)
$Files = @(Get-ChildItem $PSScriptRoot  -Filter *.ps1)

#foreach ($F in ($Private+$Public) ) {
foreach ($F in $Files ) {

    Write-Host ("Importing $($F.Name)... ") -NoNewline

    try {
        . ($F.FullName)
        Write-Host '  OK  ' -ForegroundColor Green
    } catch {
        Write-Host 'FAILED' -ForegroundColor Red
    }
}

#Export-ModuleMember -Function $Public.BaseName
#Write-Host "Exported $($Public.Count) member(s)"
Export-ModuleMember -Function *
Export-ModuleMember -Alias *


Write-Host "`nType 'Get-Command -Module $ModName' for list of commands, 'Get-Help <CommandName>' for help, or"
Write-Host "'Get-Command -Module $ModName | Get-Help | Select Name, Synopsis' for explanation on all commands`n"
