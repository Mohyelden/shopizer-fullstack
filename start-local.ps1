$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$taskJava = Get-ChildItem "$PSScriptRoot\.local\java11" -Directory | Select-Object -First 1
if (!$taskJava) { throw 'Local Java 11 was not found.' }
$env:JAVA_HOME = $taskJava.FullName
$env:Path = "$env:JAVA_HOME\bin;$env:Path"
Set-Location "$PSScriptRoot\sm-shop"
$taskServer = Start-Process -FilePath "$env:JAVA_HOME\bin\java.exe" -ArgumentList '-jar', "`"$PSScriptRoot\sm-shop\target\shopizer.jar`"" -NoNewWindow -PassThru
$taskServer.Id | Set-Content "$PSScriptRoot\.local\server.pid"
$taskServer.WaitForExit()

