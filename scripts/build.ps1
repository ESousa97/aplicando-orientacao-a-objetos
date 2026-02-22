param(
  [switch]$Lint,
  [switch]$KeepClassFiles
)

$ErrorActionPreference = 'Stop'
$repoRoot = Resolve-Path (Join-Path $PSScriptRoot '..')

$sourceFiles = Get-ChildItem -Path $repoRoot -Recurse -Filter *.java |
  Where-Object { $_.FullName -notmatch '[\\/]tests[\\/]' }

$directories = $sourceFiles | Group-Object DirectoryName
$errors = @()

foreach ($directory in $directories) {
  Push-Location $directory.Name
  try {
    $javacArgs = @()
    if ($Lint) {
      $javacArgs += '-Xlint:all'
      $javacArgs += '-Werror'
    }

    $output = & javac @javacArgs *.java 2>&1
    if ($LASTEXITCODE -ne 0) {
      $errors += [pscustomobject]@{
        Directory = $directory.Name
        Output = ($output -join "`n")
      }
    }
  }
  finally {
    if (-not $KeepClassFiles) {
      Remove-Item -ErrorAction SilentlyContinue *.class
    }
    Pop-Location
  }
}

if ($errors.Count -gt 0) {
  Write-Host "Build failed in $($errors.Count) diretorio(s):" -ForegroundColor Red
  foreach ($buildIssue in $errors) {
    Write-Host "`n[$($buildIssue.Directory)]" -ForegroundColor Yellow
    Write-Host $buildIssue.Output
  }
  exit 1
}

Write-Host 'Build concluido com sucesso.' -ForegroundColor Green
