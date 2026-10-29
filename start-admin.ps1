$ErrorActionPreference = 'Stop'
$taskRoot = $PSScriptRoot
$taskNode = Join-Path $taskRoot '.local\node14\node-v14.21.3-win-x64\node.exe'
$env:Path = (Split-Path $taskNode) + ';' + $env:Path
$env:NG_CLI_ANALYTICS = 'false'
$taskAdmin = Start-Process -FilePath $taskNode -ArgumentList '--max-old-space-size=4096','node_modules/@angular/cli/bin/ng','serve','--host','127.0.0.1','--port','4200','--proxy-config','proxy.conf.json' -WorkingDirectory "$taskRoot\shopizer-admin" -NoNewWindow -PassThru
$taskAdmin.Id | Set-Content "$taskRoot\.local\admin.pid"
$taskAdmin.WaitForExit()
