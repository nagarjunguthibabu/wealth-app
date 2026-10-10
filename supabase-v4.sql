-- Wealth Compass V4 setup. Safe for a new project or upgrade from V2/V3.
create extension if not exists pgcrypto;
create table if not exists public.wealth_snapshots(id uuid primary key default gen_random_uuid(),user_id uuid not null references auth.users(id) on delete cascade,snapshot_date date not null,inr_per_sek numeric not null check(inr_per_sek>0),values_json jsonb not null default '{}'::jsonb,comment text not null default '',contribution_sek numeric not null default 0,created_at timestamptz default now(),updated_at timestamptz default now(),unique(user_id,snapshot_date));
create table if not exists public.wealth_settings(user_id uuid primary key references auth.users(id) on delete cascade,categories_json jsonb not null default '[]'::jsonb,display_currency text not null default 'SEK',fire_target_sek numeric not null default 6000000,created_at timestamptz default now(),updated_at timestamptz default now());
alter table public.wealth_snapshots add column if not exists comment text not null default '';
alter table public.wealth_snapshots add column if not exists contribution_sek numeric not null default 0;
alter table public.wealth_settings add column if not exists fire_target_sek numeric not null default 6000000;
alter table public.wealth_snapshots enable row level security; alter table public.wealth_settings enable row level security;
do $$ begin
 if not exists(select 1 from pg_policies where policyname='wc_snap_select') then create policy wc_snap_select on public.wealth_snapshots for select using(auth.uid()=user_id); end if;
 if not exists(select 1 from pg_policies where policyname='wc_snap_insert') then create policy wc_snap_insert on public.wealth_snapshots for insert with check(auth.uid()=user_id); end if;
 if not exists(select 1 from pg_policies where policyname='wc_snap_update') then create policy wc_snap_update on public.wealth_snapshots for update using(auth.uid()=user_id) with check(auth.uid()=user_id); end if;
 if not exists(select 1 from pg_policies where policyname='wc_snap_delete') then create policy wc_snap_delete on public.wealth_snapshots for delete using(auth.uid()=user_id); end if;
 if not exists(select 1 from pg_policies where policyname='wc_set_select') then create policy wc_set_select on public.wealth_settings for select using(auth.uid()=user_id); end if;
 if not exists(select 1 from pg_policies where policyname='wc_set_insert') then create policy wc_set_insert on public.wealth_settings for insert with check(auth.uid()=user_id); end if;
 if not exists(select 1 from pg_policies where policyname='wc_set_update') then create policy wc_set_update on public.wealth_settings for update using(auth.uid()=user_id) with check(auth.uid()=user_id); end if;
end $$;