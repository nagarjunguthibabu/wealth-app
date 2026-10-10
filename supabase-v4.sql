create extension if not exists pgcrypto;
create table if not exists public.wealth_snapshots(id uuid primary key default gen_random_uuid(),user_id uuid not null references auth.users(id) on delete cascade,snapshot_date date not null,inr_per_sek numeric not null check(inr_per_sek>0),values_json jsonb not null default '{}'::jsonb,comment text not null default '',contribution_sek numeric not null default 0,created_at timestamptz default now(),unique(user_id,snapshot_date));
create table if not exists public.wealth_settings(user_id uuid primary key references auth.users(id) on delete cascade,categories_json jsonb not null default '[]'::jsonb,display_currency text not null default 'SEK',fire_target_sek numeric not null default 6000000);
alter table public.wealth_snapshots add column if not exists comment text not null default '';
alter table public.wealth_snapshots add column if not exists contribution_sek numeric not null default 0;
alter table public.wealth_settings add column if not exists fire_target_sek numeric not null default 6000000;
alter table public.wealth_snapshots enable row level security;alter table public.wealth_settings enable row level security;
do $$ begin
if not exists(select 1 from pg_policies where policyname='v41_snap_all') then create policy v41_snap_all on public.wealth_snapshots for all using(auth.uid()=user_id) with check(auth.uid()=user_id); end if;
if not exists(select 1 from pg_policies where policyname='v41_settings_all') then create policy v41_settings_all on public.wealth_settings for all using(auth.uid()=user_id) with check(auth.uid()=user_id); end if;
end $$;
