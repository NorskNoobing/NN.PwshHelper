function Build-RequestBody {
    [CmdletBinding()]
    param (
        [hashtable]$Params
    )

    process {
        $Params.Keys.ForEach({
            [string]$Key = $_
            $Value = $Params.$key
        
            if ($ParameterExclusion -contains $Key) {
                return
            }
        
            $Body = $Body + @{
                $Key = $Value
            }
        })

        Write-Output ($Body | ConvertTo-Json -Depth 99)
    }
}