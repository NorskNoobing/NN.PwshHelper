function Get-NuGetAccessToken {
    param (
        [string]$accessTokenPath = "$env:USERPROFILE\.creds\NuGet\nuGetAccessToken.xml"
    )

    if (!(Test-Path $accessTokenPath)) {
        New-NuGetAccessToken
    }

    Import-Clixml $accessTokenPath | ConvertFrom-SecureString -AsPlainText
}