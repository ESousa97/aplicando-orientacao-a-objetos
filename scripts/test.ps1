$ErrorActionPreference = 'Stop'
$repoRoot = Resolve-Path (Join-Path $PSScriptRoot '..')
$buildScript = Join-Path $PSScriptRoot 'build.ps1'
$classpathSeparator = [IO.Path]::PathSeparator

& $buildScript -KeepClassFiles
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}

$tempTestClasses = Join-Path $repoRoot '.tmp-test-classes'
if (Test-Path $tempTestClasses) {
  Remove-Item -Recurse -Force $tempTestClasses
}
New-Item -ItemType Directory -Path $tempTestClasses | Out-Null

$testFiles = Get-ChildItem -Path (Join-Path $repoRoot 'tests') -Recurse -Filter *.java
$compileErrors = @()
$runErrors = @()

foreach ($testFile in $testFiles) {
  $compileOutput = & javac -cp $repoRoot -d $tempTestClasses $testFile.FullName 2>&1
  if ($LASTEXITCODE -ne 0) {
    $compileErrors += [pscustomobject]@{
      Test = $testFile.FullName
      Output = ($compileOutput -join "`n")
    }
  }
}

if ($compileErrors.Count -gt 0) {
  Write-Host "Falha ao compilar $($compileErrors.Count) teste(s):" -ForegroundColor Red
  foreach ($compileIssue in $compileErrors) {
    Write-Host "`n[$($compileIssue.Test)]" -ForegroundColor Yellow
    Write-Host $compileIssue.Output
  }
  Remove-Item -Recurse -Force $tempTestClasses
  Get-ChildItem -Path $repoRoot -Recurse -Filter *.class | Remove-Item -Force
  exit 1
}

foreach ($testFile in $testFiles) {
  $content = Get-Content -Raw $testFile.FullName
  $packageMatch = [regex]::Match($content, 'package\s+([\w\.]+)\s*;')
  $classMatch = [regex]::Match($content, 'public\s+class\s+(\w+)')

  if (-not $classMatch.Success) {
    continue
  }

  $className = $classMatch.Groups[1].Value
  $fqcn = if ($packageMatch.Success) { "$($packageMatch.Groups[1].Value).$className" } else { $className }

  $runOutput = & java -cp "$tempTestClasses$classpathSeparator$repoRoot" $fqcn 2>&1
  if ($LASTEXITCODE -ne 0) {
    $runErrors += [pscustomobject]@{
      Test = $fqcn
      Output = ($runOutput -join "`n")
    }
  }
}

Remove-Item -Recurse -Force $tempTestClasses
Get-ChildItem -Path $repoRoot -Recurse -Filter *.class | Remove-Item -Force

if ($runErrors.Count -gt 0) {
  Write-Host "Falha na execucao de $($runErrors.Count) teste(s):" -ForegroundColor Red
  foreach ($runIssue in $runErrors) {
    Write-Host "`n[$($runIssue.Test)]" -ForegroundColor Yellow
    Write-Host $runIssue.Output
  }
  exit 1
}

Write-Host 'Testes concluídos com sucesso.' -ForegroundColor Green
