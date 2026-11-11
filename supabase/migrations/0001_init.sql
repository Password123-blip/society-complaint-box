-- Society Complaint Box — schema
-- Safe to run more than once.

create extension if not exists "pgcrypto";

create table if not exists public.society_complaint_box_complaints (
  id uuid primary key default gen_random_uuid(),
  flat text,
  category text,
  summary text,
  severity text,
  raised_on date,
  created_at timestamptz not null default now()
);

create index if not exists society_complaint_box_complaints_created_idx on public.society_complaint_box_complaints (created_at desc);

alter table public.society_complaint_box_complaints enable row level security;

drop policy if exists "society_complaint_box_complaints_read" on public.society_complaint_box_complaints;
create policy "society_complaint_box_complaints_read" on public.society_complaint_box_complaints for select using (true);

drop policy if exists "society_complaint_box_complaints_insert" on public.society_complaint_box_complaints;
create policy "society_complaint_box_complaints_insert" on public.society_complaint_box_complaints for insert with check (true);
