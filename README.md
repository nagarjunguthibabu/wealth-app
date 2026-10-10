# Wealth Compass V2

## 1. Create the database
Open your Supabase project, go to **SQL Editor**, paste the complete contents of `supabase-setup.sql`, and run it once.

## 2. Deploy
Upload these files to the root of your GitHub repository. In **Settings > Pages**, deploy from the `main` branch and root folder.

## 3. Authentication
Create an account from the app. If Supabase email confirmation is enabled, confirm the email before signing in.

## 4. Exchange rates
The app requests SEK to INR reference rates from Frankfurter. It stores the exact rate with each snapshot, so older numbers do not change later. You can override a fetched rate.

## 5. CSV import
Export Excel as CSV. The importer recognises `Date` or `Month`, `INR/SEK Rate`, and the default category names. A Month such as `2026-10` is stored as `2026-10-01`.

## Security
The browser contains a Supabase anonymous/public key, which is expected for a client app. The SQL file enables Row Level Security, ensuring signed-in users can access only rows where `user_id` matches their account. Never place a Supabase service-role key in this app.
