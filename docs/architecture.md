# Arquitetura

## Visão geral

O repositório adota organização por exercícios independentes, com cada diretório contendo classes relacionadas ao mesmo cenário.
A automação de qualidade opera por diretório para preservar isolamento e evitar colisões de classes em pacote padrão.

## Estrutura principal

- `Aula01/`: código-fonte dos exercícios e desafios.
- `scripts/`: automações de build, lint, testes e validação final.
- `tests/`: testes unitários em Java puro e espaço para integração/e2e.
- `.github/`: workflows, templates e ownership.

## Decisões arquiteturais

1. **Build por diretório**: evita conflitos de classes com mesmo nome em exercícios distintos.
2. **Testes sem framework externo**: reduz complexidade para um projeto educacional sem gerenciador de dependências.
3. **CI com matrix Java 17/21**: garante compatibilidade com versões LTS.
