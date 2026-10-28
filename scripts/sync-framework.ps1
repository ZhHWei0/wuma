param([string]$Destination = (Join-Path $PSScriptRoot "..\MaaFramework"))
$ErrorActionPreference = "Stop"
$api = "https://api.github.com/repos/MaaXYZ/MaaFramework/tarball/main"
$archive = Join-Path ([System.IO.Path]::GetTempPath()) "MaaFramework-main.tar.gz"
$extract = Join-Path ([System.IO.Path]::GetTempPath()) "MaaFramework-extract"
if (Test-Path $extract) { Remove-Item -Recurse -Force $extract }
New-Item -ItemType Directory -Path $extract | Out-Null
Invoke-WebRequest -Uri $api -OutFile $archive
tar -xzf $archive -C $extract
$source = Get-ChildItem -Directory $extract | Select-Object -First 1
if (-not $source) { throw "无法从 GitHub API 压缩包中找到 MaaFramework 源码目录。" }
if (Test-Path $Destination) { Remove-Item -Recurse -Force $Destination }
Move-Item -LiteralPath $source.FullName -Destination $Destination
Remove-Item -Force $archive
Remove-Item -Recurse -Force $extract
Write-Host "MaaFramework 已更新到 $Destination"
