# Aventuras na Veia — Controle de Vendas

Sistema de controle de vendas para empresas de aventura (trilhas, rapéis, viagens, escaladas).

## Funcionalidades

- **Painel** com vendido, recebido, a receber, custos e lucro (filtro por ano/mês)
- **Financeiro** com fluxo de caixa (entradas e saídas manuais) e saldo automático
- **Cadastro** de aventureiros com histórico de compras e cobrança via WhatsApp
- **Eventos** com categorias, custo por viagem e lucro
- **Vendas** parceladas com datas de vencimento editáveis
- **Parcelas a vencer** no painel com destaque para atrasadas
- **Gráficos** de faturamento e vendas por categoria
- **Login** com autenticação via Supabase
- **Sincronização na nuvem** (dados salvos no Supabase)
- **Modo local** como fallback (dados no localStorage)

## Como usar

1. Abra o `index.html` no navegador ou hospede no GitHub Pages
2. Faça login com as credenciais cadastradas no Supabase
3. Pronto!

## Configuração do Supabase

1. Crie um projeto em [supabase.com](https://supabase.com)
2. Execute o arquivo `supabase.sql` no SQL Editor do Supabase
3. As chaves já estão configuradas no `index.html`

## Tecnologias

- HTML/CSS/JavaScript puro (arquivo único)
- Supabase (autenticação + banco de dados)
- Google Fonts (Archivo + Inter)

## Licença

© 2026 Aventuras na Veia. Todos os direitos reservados.
