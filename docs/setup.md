# Setup avançado

## Executar validação local completa

```bash
pwsh -File scripts/validate.ps1
```

## Executar apenas build

```bash
pwsh -File scripts/build.ps1
```

## Executar lint estrito

```bash
pwsh -File scripts/lint.ps1
```

## Executar testes unitários

```bash
pwsh -File scripts/test.ps1
```

## Troubleshooting

- Se `javac` não for encontrado, valide `JAVA_HOME` e `PATH`.
- Se o terminal bloquear políticas de script no Windows, execute:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```
