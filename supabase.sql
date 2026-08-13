-- ============================================================
--  Aventuras na Veia — banco de dados (Supabase)
--  Cole TUDO isto no Supabase: menu "SQL Editor" > "New query" > Run
-- ============================================================

-- Uma tabela simples que espelha o app: para cada usuário, guarda
-- 4 "coleções" (trips, sales, financeiro, aventureiros) em JSON.
create table if not exists public.anv_store (
  user_id    uuid        not null references auth.users(id) on delete cascade,
  k          text        not null,           -- 'trips' | 'sales' | 'financeiro' | 'aventureiros'
  v          jsonb       not null default '[]'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, k)
);

-- Liga a segurança por linha: cada pessoa só vê/mexe nos próprios dados.
alter table public.anv_store enable row level security;

-- (Recria as políticas de forma segura)
drop policy if exists "anv_select" on public.anv_store;
drop policy if exists "anv_insert" on public.anv_store;
drop policy if exists "anv_update" on public.anv_store;
drop policy if exists "anv_delete" on public.anv_store;

create policy "anv_select" on public.anv_store
  for select using (auth.uid() = user_id);

create policy "anv_insert" on public.anv_store
  for insert with check (auth.uid() = user_id);

create policy "anv_update" on public.anv_store
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "anv_delete" on public.anv_store
  for delete using (auth.uid() = user_id);

-- Pronto! Agora é só criar sua conta pelo app (tela de login > "Criar conta").
