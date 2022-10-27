function Write-Log {
    param (
        [Parameter(Mandatory)][string]$Message,
        [Parameter(Mandatory)][string]$Path
    )
    $logDir = $Path.Substring(0, $Path.lastIndexOf('\'))
    if (!(Test-Path $logDir)) {
        New-Item -ItemType Directory $logDir | Out-Null
    }

    $timeStamp = Get-Date -Format "dd/MM/yy hh:mm:ss"
    Add-Content -Path $Path -Value "$timeStamp $message"
}