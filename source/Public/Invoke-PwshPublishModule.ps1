function Invoke-PwshPublishModule {
    param (
        [Parameter(Mandatory)][string]$moduleName,
        [Parameter(Mandatory)][string]$modulePath
    )

    $allPsModulePath = ($env:PSModulePath -split ";")[0]
    $null = New-Item -ItemType Directory -Name $moduleName -Path $allPsModulePath -Force
    $newFolderPath = "$allPsModulePath\$moduleName"

    (Get-ChildItem $modulePath).FullName | ForEach-Object {
        Copy-Item -Destination $newFolderPath -Path $_
    }

    Publish-Module -Path $newFolderPath -NuGetApiKey $(Get-NuGetAccessToken)
    Remove-Item -Path $newFolderPath -Recurse
}