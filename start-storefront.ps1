$ErrorActionPreference = 'Stop'
$taskRoot = $PSScriptRoot
$taskNode = Join-Path $taskRoot '.local\node14\node-v14.21.3-win-x64\node.exe'
$env:Path = (Split-Path $taskNode) + ';' + $env:Path
$env:BROWSER = 'none'
$env:HOST = '127.0.0.1'
$env:PORT = '3000'
New-Item -ItemType Directory -Force "$taskRoot\.local\storefront-temp" | Out-Null
$env:TEMP = "$taskRoot\.local\storefront-temp"
$env:TMP = $env:TEMP
$taskStore = Start-Process -FilePath $taskNode -ArgumentList '--max-old-space-size=4096','node_modules/react-scripts/scripts/start.js' -WorkingDirectory "$taskRoot\shopizer-storefront" -NoNewWindow -PassThru
$taskStore.Id | Set-Content "$taskRoot\.local\storefront.pid"
$taskStore.WaitForExit()
