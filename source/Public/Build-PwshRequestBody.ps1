function Build-PwshRequestBody {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)][hashtable]$Params,
        [array]$ExcludedParams
    )

    process {
        $Body = $null
        $Params.Keys.ForEach({
            [string]$Key = $_
            $Value = $Params.$key
        
            if ($ExcludedParams -contains $Key) {
                return
            }
        
            $Body += @{
                $Key = $Value
            }
        })

        Write-Output ($Body | ConvertTo-Json -Depth 99)
    }
}