# Wealth Compass Final

## Changes
- Net-worth chart now uses about 75% of the desktop dashboard width.
- Allocation card is smaller, with a more compact donut.
- Currency and pension controls are grouped and aligned.
- Dropdowns and toggles use one consistent control style.
- Asset allocation view shows the top five assets plus Other, with no cluttered legend.
- Evolution has its own explicit NW / Without pension toggle.
- Equity-share chart no longer shows a redundant legend.
- Annual Review has its own NW / Without pension toggle.
- FIRE remains based on net worth excluding pension and now states this clearly.

## Deploy
1. Replace the files in the GitHub Pages repository with all files from this package.
2. Keep the existing Supabase project and data.
3. No database migration is required if V4.1 already works.
4. Open the deployed app once with `?v=final` to bypass an older cached document.
