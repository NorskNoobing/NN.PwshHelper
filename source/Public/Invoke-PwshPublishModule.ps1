function Invoke-PwshPublishModule {
    param (
        [Parameter(Mandatory)][string]$moduleName,
        [Parameter(Mandatory)][string]$modulePath
    )

    $allPsModulePath = ($env:PSModulePath -split ";")[0]
    $newFolderPath = "$allPsModulePath\$moduleName"
    
    if (Test-Path $newFolderPath) {
        Write-Error "Please remove the folder `"$newFolderPath`"." -ErrorAction Stop
    }

    $null = New-Item -ItemType Directory -Name $moduleName -Path $allPsModulePath -Force

    (Get-ChildItem $modulePath).FullName | ForEach-Object {
        Copy-Item -Destination $newFolderPath -Path $_
    }

    Publish-Module -Path $newFolderPath -NuGetApiKey $(Get-NuGetAccessToken)
    Remove-Item -Path $newFolderPath -Recurse
}