# Aventuras na Veia — Sistema de Gestão

Aplicativo web para gestão de eventos, vendas, cadastros e financeiro da **Aventuras na Veia** (turismo de aventura e ecoturismo).

## O que tem no app

- **Painel** — resumo de vendas, recebimentos, valores a receber, custos e lucro, com páginas de detalhe para cada indicador.
- **Financeiro** — saldo, movimentações manuais e custos dos eventos.
- **Cadastro** — aventureiros com ficha de saúde, histórico de compras e geração de **PDF do cadastro** (com logo, termos de responsabilidade, LGPD e assinaturas).
- **Eventos** — viagens com clientes em ordem alfabética, carros & caronas.
- **Nova venda** — lançamento de vendas com parcelas.
- **Formulário público de inscrição** (`?inscricao=cadastro`) — o cliente preenche os dados, **assina digitalmente na tela** (dedo ou mouse) e pode baixar o PDF do próprio cadastro na hora.

## Como funciona

É um app de **arquivo único** (`index.html`): HTML, CSS e JavaScript juntos, sem build e sem dependências para instalar. Os dados ficam no **Supabase** (tabelas `anv_store` e `anv_inscricoes`) com fallback em `localStorage`.

## Como publicar (GitHub Pages)

1. Suba o `index.html` (e este README) para o repositório.
2. No repositório: **Settings → Pages → Source: Deploy from a branch → Branch: main / (root) → Save**.
3. O app fica disponível em `https://SEU-USUARIO.github.io/NOME-DO-REPO/`.
4. Link de cadastro para enviar aos clientes: `https://SEU-USUARIO.github.io/NOME-DO-REPO/?inscricao=cadastro`

## Assinatura digital (opcional, recomendado)

Para que a assinatura desenhada pelo cliente fique salva no banco (e apareça no PDF gerado pelo painel), adicione na tabela `anv_inscricoes` do Supabase:

```sql
alter table anv_inscricoes add column if not exists assinatura text;
alter table anv_inscricoes add column if not exists assinado_em timestamptz;
```

Sem essas colunas o app continua funcionando normalmente — o cliente ainda baixa o PDF assinado na hora do cadastro.
