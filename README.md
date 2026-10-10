# Wealth Compass V3

## Upgrade from V2
1. In Supabase, open SQL Editor.
2. Run the complete `supabase-v3.sql` file once. It adds comments, contributions and FIRE settings while keeping existing snapshot data.
3. Replace the old GitHub repository files with all V3 files.
4. If the installed phone app still shows V2, remove it from the Home Screen, refresh the website, then add it again.

## New in V3
- Snapshot comments
- NW / NW without pension chart toggle
- Create and edit assets
- Classify every asset by asset class, risk and country
- Allocation selector for asset class, risk, country, currency or individual asset
- Optional net contribution field and residual market + FX effect
- FIRE target and progress
- Full-date storage with Mon YYYY display
- CSV import/export
- Online current or historical SEK/INR reference rate
- Supabase login and private cloud data
- Installable PWA

## Contribution logic
Enter net new money added during the period in SEK. The app calculates:
`Market + FX effect = change in net worth - net contribution`
This residual combines market movement and currency movement. It does not falsely claim to separate those two without transaction-level data.
