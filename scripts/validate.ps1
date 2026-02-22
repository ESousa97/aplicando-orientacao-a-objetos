$ErrorActionPreference = 'Stop'
$root = Resolve-Path (Join-Path $PSScriptRoot '..')

Write-Host 'Executando lint...' -ForegroundColor Cyan
& (Join-Path $PSScriptRoot 'lint.ps1')
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}

Write-Host 'Executando testes...' -ForegroundColor Cyan
& (Join-Path $PSScriptRoot 'test.ps1')
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}

Write-Host 'Executando build...' -ForegroundColor Cyan
& (Join-Path $PSScriptRoot 'build.ps1')
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}

Write-Host "Validação final concluída em $root" -ForegroundColor Green
