#Requires -Module ModuleBuilder
[string]$moduleName = "NN.PwshHelper"
[version]$version = "0.0.5"
[string]$author = "NorskNoobing"
[string]$ProjectUri = "https://github.com/$author/$moduleName"
[string]$releaseNotes = "Update Invoke-PwshPublishModule.ps1"
[string]$description = "Helper functions for PowerShell"
[array]$tags = @("Help","Helper","Helper-functions")
[version]$PSversion = "7.2"

$manifestSplat = @{
    "Description" = $description
    "PowerShellVersion" = $PSversion
    "Tags" = $tags
    "ReleaseNotes" = $releaseNotes
    "Path" = ".\source\$moduleName.psd1"
    "RootModule" = "$moduleName.psm1"
    "Author" = $author
    "ProjectUri" = $ProjectUri
}
New-ModuleManifest @manifestSplat

$buildSplat = @{
    "SourcePath" = ".\source\$moduleName.psd1"
    "Version" = $version
}
Build-Module @buildSplat