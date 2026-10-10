# Wealth Compass V4

## Upgrade
1. Open Supabase SQL Editor.
2. Run `supabase-v4.sql` once. It is safe for existing V2/V3 data.
3. Replace the old GitHub Pages files with all files in this folder.
4. Hard refresh the browser. If an installed Home Screen version remains cached, remove it and add it again.

## V4 features
- Current allocation by asset class, risk, country, currency or asset
- Portfolio insights replacing the duplicate breakdown card
- 100% stacked asset-class evolution
- Equity share trend
- Risk evolution
- Country exposure evolution
- NW / without-pension controls
- Annual review with start/end NW, contributions, residual market + FX effect, best/worst month, equity shift and yearly notes
- FIRE progress, milestones and contribution summaries
- Comments, editable history, custom assets/classifications, CSV import/export and online FX rates

## Important interpretation
`Market + FX effect = net-worth change - recorded net contribution`. With monthly balance snapshots alone, market movement and currency movement cannot be separated reliably, so V4 labels the combined residual honestly.
