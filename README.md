# Society Complaint Box

**A paper trail for building complaints**

A paper trail for building complaints.

A full-stack demo built with **Next.js 14 (App Router)**, **Tailwind CSS** and a
**Supabase (Postgres)** backend. Records are written from the browser straight to
Postgres through row-level security policies — no custom API layer to maintain.

---

## Stack

| Layer | Choice |
| --- | --- |
| Framework | Next.js 14, App Router, TypeScript |
| Styling | Tailwind CSS |
| Database | Supabase Postgres, RLS-secured |
| Hosting | GitHub Pages (static export via Actions) |

## Live

https://password123-blip.github.io/society-complaint-box/

## Run it locally

```bash
npm install
cp .env.example .env.local   # add your Supabase URL + anon key
npm run dev
```

Open http://localhost:3000.

## Set up the database

Run `supabase/migrations/0001_init.sql` in the Supabase SQL editor. It is
idempotent — safe to run more than once. It creates the `society_complaint_box_complaints` table,
enables row-level security and adds read/insert policies for anonymous users.

## Data model

Table: `society_complaint_box_complaints`

| Column | Type |
| --- | --- |
| `flat` | text |
| `category` | text |
| `summary` | text |
| `severity` | text |
| `raised_on` | date |
| `created_at` | timestamptz |

Every row also has `id uuid` and `created_at timestamptz`.

## Deploy

Pushing to `main` triggers `.github/workflows/deploy-pages.yml`, which builds a
static export and publishes it to GitHub Pages. The build needs the repository
secrets `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` — no key is
committed to this repo.

## What it does

- **Nothing gets lost in WhatsApp** — Every complaint gets a row with a date.
- **Categorised** — Plumbing, lift, security, parking — sortable.
- **Age of open issues** — See which complaints have been sitting too long.

## License

MIT
