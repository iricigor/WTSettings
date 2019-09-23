function Set-WTSettings ($Settings) {

    Set-Content -Path (Get-WTPath) -Value ($Settings | ConvertTo-Json)

}

function Set-WTProfile ([string]$Name, $Value) {
    $Settings = Get-WTSettings
    
    $Profiles = $Settings.profiles
    $Profiles = $Profiles | ? Name -ne $Name
    $Profiles += $Value

    $Settings.profiles = $Profiles
    Set-WTSettings $Settings
}

function Set-WTGlobals ($Value) {
    $Settings = Get-WTSettings
    $Settings.globals = $Value
    Set-WTSettings $Settings
}

