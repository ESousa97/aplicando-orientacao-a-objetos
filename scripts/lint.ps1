$ErrorActionPreference = 'Stop'
$buildScript = Join-Path $PSScriptRoot 'build.ps1'
& $buildScript -Lint
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}
Write-Host 'Lint concluido com sucesso.' -ForegroundColor Green
