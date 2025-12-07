# Technology Stack

## Core Framework

- **Hugo**: Static site generator (extended version 0.68.3+)
- **Theme**: Academia Hugo (academic/portfolio theme based on the original Academic theme)
- **Deployment**: GitHub Pages

## Configuration

- Primary config: `config.yaml` (root) and `config/_default/*.toml` files
- Config format: Mixed YAML and TOML
- Theme location: `themes/academia-hugo/`

## Content Structure

- Content written in Markdown with TOML front matter (using `+++` delimiters)
- Posts: `content/posts/*.md`
- Home widgets: `content/home/*.md`
- Author profiles: `content/authors/admin/_index.md`

## Additional Features

- **PDF.js**: Embedded PDF viewer for CV display (`static/js/pdf-js/`)
- **Custom CSS**: `static/css/custom.css`
- **Parcel**: Bundler for development (though primarily Hugo-based)

## Common Commands

### Development
```bash
hugo server          # Start local development server at localhost:1313
hugo                 # Build static site to public/ directory
```

### Deployment
```bash
./deploy.sh          # Build and deploy to GitHub Pages
```

The deploy script:
1. Runs `hugo` to build the site
2. Commits changes in `public/` directory
3. Pushes to GitHub Pages (master branch of public repo)

## Notes

- The `public/` directory is a separate git repository for GitHub Pages deployment
- Hugo extended version required for SCSS/SASS processing
- WSL users may need to mount drives: `sudo mount -t drvfs G: /mnt/g`
