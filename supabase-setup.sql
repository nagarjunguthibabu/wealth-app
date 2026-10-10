-- Run this entire file in Supabase > SQL Editor once.
create extension if not exists pgcrypto;

create table if not exists public.wealth_snapshots (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  snapshot_date date not null,
  inr_per_sek numeric not null check (inr_per_sek > 0),
  values_json jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique(user_id, snapshot_date)
);

create table if not exists public.wealth_settings (
  user_id uuid primary key references auth.users(id) on delete cascade,
  categories_json jsonb not null default '[]'::jsonb,
  display_currency text not null default 'SEK' check (display_currency in ('SEK','INR')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.wealth_snapshots enable row level security;
alter table public.wealth_settings enable row level security;

create policy "Users read own snapshots" on public.wealth_snapshots for select using (auth.uid() = user_id);
create policy "Users insert own snapshots" on public.wealth_snapshots for insert with check (auth.uid() = user_id);
create policy "Users update own snapshots" on public.wealth_snapshots for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Users delete own snapshots" on public.wealth_snapshots for delete using (auth.uid() = user_id);

create policy "Users read own settings" on public.wealth_settings for select using (auth.uid() = user_id);
create policy "Users insert own settings" on public.wealth_settings for insert with check (auth.uid() = user_id);
create policy "Users update own settings" on public.wealth_settings for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

create or replace function public.set_updated_at() returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end; $$;

drop trigger if exists snapshots_updated_at on public.wealth_snapshots;
create trigger snapshots_updated_at before update on public.wealth_snapshots for each row execute function public.set_updated_at();
drop trigger if exists settings_updated_at on public.wealth_settings;
create trigger settings_updated_at before update on public.wealth_settings for each row execute function public.set_updated_at();
