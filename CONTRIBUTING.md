# Contribuindo

> [!WARNING]
> Este repositório está arquivado e não está mais ativo.
> Ele permanece público somente para fins de estudo.
> Não há garantia de resposta, revisão de PRs ou correção de issues.

## Setup de desenvolvimento

1. Instale JDK 17+.
2. Clone o repositório.
3. Execute:

```bash
pwsh -File scripts/build.ps1
pwsh -File scripts/lint.ps1
pwsh -File scripts/test.ps1
```

## Convenções de código

- Indentação: 2 espaços (`.editorconfig`).
- Encoding: UTF-8 com final de linha LF.
- Nomes de classes Java em PascalCase.
- Pacotes em lowercase com separação por `.`.

## Fluxo de branch e PR

- Branch naming sugerido: `type/descricao-curta`.
- Exemplo: `fix/corrige-build-atividade3`.
- Abra PR com template e checklist completo.

## Conventional Commits

Formato:

```text
<type>(<scope>): <description>
```

Tipos permitidos:

- `feat` — nova funcionalidade
- `fix` — correção de bug
- `refactor` — refatoração sem mudança de comportamento
- `docs` — documentação
- `style` — formatação sem mudança de lógica
- `test` — adição ou correção de testes
- `chore` — manutenção, dependências, configs
- `ci` — mudanças em CI/CD
- `perf` — melhoria de performance
- `security` — correções de segurança

## Como rodar testes

```bash
pwsh -File scripts/test.ps1
```

## Áreas prioritárias para contribuição

- Aumento de cobertura de testes dos exercícios.
- Padronização de naming em classes legadas.
- Melhorias de DX e observabilidade de CI.

## Autor

Enoque Sousa  
Portfólio: https://enoquesousa.vercel.app  
GitHub: https://github.com/enoquesousa
