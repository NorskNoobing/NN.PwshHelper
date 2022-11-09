function Install-PwshRequiredModules {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)][array]$ModuleNameArray
    )

    process {
        $ModuleNameArray.ForEach({
            if (Get-InstalledModule $_ -ErrorAction SilentlyContinue) {
                Import-Module $_ -Force
            } else {
                Install-Module $_ -Force
            }
        })
    }
}