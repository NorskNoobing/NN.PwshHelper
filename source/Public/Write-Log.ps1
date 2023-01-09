function Write-Log {
    param (
        [Parameter(Mandatory,ValueFromPipeline,Position=0)]$Message,
        [Parameter(Mandatory)][string]$Path
    )
    $logDir = $Path.Substring(0, $Path.lastIndexOf('\'))
    if (!(Test-Path $logDir)) {
        $null = New-Item -ItemType Directory $logDir
    }

    $timeStamp = Get-Date -Format "yy-MM-dd HH:mm:ss"


    if ($Message.gettype().Name -eq "String") {
        Out-File -Path $Path -Append -InputObject "$timeStamp $message"
    } else {
        Out-File -Path $Path -Append -InputObject @"
$timeStamp
-----------------
"@
        Out-File -Path $Path -Append -InputObject $Message
    }
}