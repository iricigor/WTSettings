function Get-WTPath {

    # 'C:\Users\Jelena\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\RoamingState'
    $Package = Get-AppxPackage -Name Microsoft.WindowsTerminal
    $Env:LOCALAPPDATA + '\Packages\' + $Package.PackageFamilyName + '\LocalState\profiles.json'

}
function Get-WTSettings {

    Get-Content (Get-WTPath) | ConvertFrom-Json

}

function Get-WTProfile ([string]$Name) {

    if ($Name) {
        (Get-WTSettings).profiles | ? name -eq $Name
    } else {
        (Get-WTSettings).profiles
    }
}

function Get-WTGlobals {

    (Get-WTSettings).globals

}

function Get-WTKeyBindings {

    (Get-WTSettings).globals.keybindings

}


function Get-WTScheme ([string]$Name) {

    if ($Name) {
        (Get-WTSettings).schemes | ? name -eq $Name
    } else {
        (Get-WTSettings).schemes
    }
}
