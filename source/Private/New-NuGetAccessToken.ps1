function New-NuGetAccessToken {
    param (
        [string]$accessTokenPath = "$env:USERPROFILE\.creds\NuGet\nuGetAccessToken.xml"
    )

    $apiKey = Read-Host "Enter NuGet API key" -AsSecureString

    #Create parent folders of the access token file
    $accessTokenDir = $accessTokenPath.Substring(0, $accessTokenPath.lastIndexOf('\'))
    if (!(Test-Path $accessTokenDir)) {
        $null = New-Item -ItemType Directory $accessTokenDir
    }

    #Create access token file
    $apiKey | Export-Clixml $accessTokenPath
}