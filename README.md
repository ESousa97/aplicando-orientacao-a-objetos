# Aplicando Orientação a Objetos

> Repositório prático com exercícios progressivos de orientação a objetos em Java.

![CI](https://github.com/enoquesousa/aplicando-orientacao-a-objetos/actions/workflows/ci.yml/badge.svg)
![License](https://img.shields.io/github/license/enoquesousa/aplicando-orientacao-a-objetos)
![Java](https://img.shields.io/badge/java-%3E%3D17-blue)
![Last Commit](https://img.shields.io/github/last-commit/enoquesousa/aplicando-orientacao-a-objetos)
![Issues](https://img.shields.io/github/issues/enoquesousa/aplicando-orientacao-a-objetos)

---

Este projeto organiza atividades de estudo em Java para praticar classes, objetos, encapsulamento e composição.
O conteúdo foi estruturado para execução local com scripts padronizados de build, lint e testes.
A proposta é fornecer um laboratório objetivo para evolução técnica com base em práticas de engenharia de software.

## Demonstração

Execução de exemplo:

```bash
javac Aula01/Principal.java Aula01/Filme.java
java Aula01.Principal
```

Saída esperada inclui ficha técnica do filme e média de avaliações.

## Stack Tecnológico

| Tecnologia | Papel |
|---|---|
| Java 21 LTS | Runtime e compilação local |
| PowerShell | Automação local de build/lint/test |
| GitHub Actions | Pipeline de qualidade em push e PR |
| Dependabot | Atualização automática de workflows |

## Pré-requisitos

- Java JDK 17 ou superior
- PowerShell 7+ (ou Windows PowerShell 5.1)
- Git

## Instalação e Uso

```bash
git clone https://github.com/enoquesousa/aplicando-orientacao-a-objetos.git
cd aplicando-orientacao-a-objetos
pwsh -File scripts/build.ps1
pwsh -File scripts/lint.ps1
pwsh -File scripts/test.ps1
```

Variáveis opcionais em `.env.example`.

## Scripts Disponíveis

| Script | Descrição |
|---|---|
| `pwsh -File scripts/build.ps1` | Compila todos os diretórios Java por unidade de exercício |
| `pwsh -File scripts/lint.ps1` | Compila com `-Xlint:all -Werror` |
| `pwsh -File scripts/test.ps1` | Executa testes unitários em Java puro |
| `pwsh -File scripts/validate.ps1` | Pipeline local: lint + test + build |

## Arquitetura

- `Aula01/`: exercícios e desafios de orientação a objetos.
- `tests/`: testes unitários e espaços para integração/e2e.
- `scripts/`: automação de qualidade local.
- `.github/`: governança, templates e CI.

Detalhes adicionais em `docs/architecture.md` e `docs/setup.md`.

## API Reference

Não se aplica. O repositório é composto por exercícios Java executáveis localmente.

## Roadmap

- [x] Padronizar estrutura de automação local
- [x] Adicionar pipeline de CI para lint/test/build
- [x] Estabelecer documentação de contribuição e segurança
- [ ] Expandir testes para todos os exercícios
- [ ] Adicionar análise estática avançada (Checkstyle/SpotBugs)

## Contribuindo

Consulte `CONTRIBUTING.md` para setup e fluxo de PR.

## Licença

Distribuído sob a licença MIT. Veja `LICENSE`.

## Autor

Enoque Sousa  
Portfólio: https://enoquesousa.vercel.app  
GitHub: https://github.com/enoquesousa
