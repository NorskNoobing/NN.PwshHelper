function Write-Log {
    param (
        [Parameter(Mandatory)][string]$Message,
        [Parameter(Mandatory)][string]$Path
    )
    $logDir = $logPath.Substring(0, $logPath.lastIndexOf('\'))
    if (!(Test-Path $logDir)) {
        New-Item -ItemType Directory $logDir | Out-Null
    }

    $timeStamp = Get-Date -Format "dd/MM/yy hh:mm:ss"
    Add-Content -Path $logPath -Value "$timeStamp $message"
}