function Build-PwshRequestBody {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)][hashtable]$Parameters,
        [array]$ExcludedParameters
    )

    process {
        $Params.Keys.ForEach({
            [string]$Key = $_
            $Value = $Params.$key
        
            if ($ExcludedParameters -contains $Key) {
                return
            }
        
            $Body = $Body + @{
                $Key = $Value
            }
        })

        Write-Output ($Body | ConvertTo-Json -Depth 99)
    }
}