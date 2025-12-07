# Nathan Cornille's Personal Website

Personal academic website built with Hugo and the Academia theme.

## Setup

1. Install Hugo extended (see README_hugo.md)
2. If using WSL, mount the drive if needed: `sudo mount -t drvfs G: /mnt/g`
3. Navigate to the project directory

## Development

```bash
# Start local development server
./hugo_extended_0.68.3_Linux-64bit/hugo server

# Open browser at localhost:1313
```

## Deployment

```bash
# Deploy everything (source + public repos)
./deploy-all.sh "Your commit message"

# Or deploy only the generated site (public/ only)
./deploy.sh "Your commit message"
```

The `deploy-all.sh` script:
1. Commits and pushes source changes to the main repository
2. Builds the site with Hugo
3. Commits and pushes the generated site in `public/` to GitHub Pages

## Project Structure

- `content/` - Markdown content files
- `static/` - Static assets (images, CSS, PDFs)
- `layouts/` - Custom layout overrides
- `themes/academia-hugo/` - Hugo theme
- `public/` - Generated site (separate git repo for GitHub Pages)
