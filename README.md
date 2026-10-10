# Wealth Compass

A private, mobile-friendly wealth tracker for assets in SEK and INR.

## Run locally
Open `index.html` in a browser. For offline install support, serve the folder through a simple web server or GitHub Pages.

## Publish with GitHub Pages
1. Create a new public or private repository.
2. Upload all files from this folder to the repository root.
3. In repository Settings > Pages, choose **Deploy from a branch**, select `main` and `/ (root)`, then save.
4. Open the published site on your phone and choose **Add to Home Screen**.

## Data and privacy
Data is stored only in the browser on the current device using local storage. Use **Export CSV** regularly for backup. Clearing browser storage or switching devices will not carry the data across automatically.

## Exchange rate
The app expects **INR per 1 SEK**. Example: if 1 SEK equals 8 INR, enter 8. The app converts INR assets to SEK by dividing by the rate, and SEK assets to INR by multiplying by it.
