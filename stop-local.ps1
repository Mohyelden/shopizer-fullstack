$ErrorActionPreference = 'Stop'
$taskPidFile = Join-Path $PSScriptRoot '.local\server.pid'
if (Test-Path $taskPidFile) {
    $taskServerId = [int](Get-Content $taskPidFile)
    $taskServer = Get-Process -Id $taskServerId -ErrorAction SilentlyContinue
    if ($taskServer -and $taskServer.Path -like "$PSScriptRoot\.local\java11\*\bin\java.exe") {
        Stop-Process -Id $taskServerId
        Write-Host 'Shopizer stopped.'
    } else { Write-Host 'The background Shopizer server is already stopped.' }
}
