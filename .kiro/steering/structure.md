# Project Structure

## Root Directory Layout

```
├── config/                    # Hugo configuration files
│   └── _default/             # Default config (config.toml, params.toml, menus.toml, languages.toml)
├── content/                   # Site content (Markdown files)
│   ├── authors/admin/        # Author profile and bio
│   ├── home/                 # Homepage widget sections
│   └── posts/                # Blog posts
├── static/                    # Static assets (copied as-is to public/)
│   ├── css/                  # Custom stylesheets
│   ├── img/                  # Images
│   ├── js/pdf-js/           # PDF.js library for CV viewer
│   └── Curriculum_Vitae.pdf  # CV file
├── themes/                    # Hugo themes
│   └── academia-hugo/        # Main theme (git submodule)
├── public/                    # Generated site (separate git repo for GitHub Pages)
├── resources/                 # Hugo-generated resources (cached assets)
├── layouts/                   # Custom layout overrides (if needed)
├── config.yaml               # Main Hugo config (alternative to config.toml)
└── deploy.sh                 # Deployment script
```

## Content Organization

### Home Page Widgets (`content/home/`)
Each file represents a section on the homepage:
- `about.md` - Profile/bio section
- `posts.md` - Recent posts widget
- `cv.md` - CV section
- `contact.md` - Contact information
- `index.md` - Homepage settings

Widget properties:
- `widget` - Type of widget
- `headless = true` - Indicates it's a page section, not standalone
- `active` - Enable/disable the widget
- `weight` - Display order (lower numbers appear first)

### Blog Posts (`content/posts/`)
Individual Markdown files with TOML front matter:
- Use `+++` delimiters for front matter
- Common fields: `title`, `date`, `tags`, `description`
- Can include custom CSS via `custom_css` field

### Author Profiles (`content/authors/admin/`)
- `_index.md` - Main author profile
- Images stored in same directory or `static/img/`

## Static Assets

- **Images**: `static/img/` for profile photos and general images
- **CSS**: `static/css/custom.css` for site-wide custom styles
- **PDFs**: Root of `static/` for documents like CV
- **Icons**: Favicon files in root and `static/`

## Theme Structure

The Academia Hugo theme in `themes/academia-hugo/` contains:
- Default layouts, partials, and shortcodes
- Theme assets (SCSS, JS)
- Example site and documentation
- i18n translations

**Note**: Customize by creating files in root directories (e.g., `layouts/`) that override theme defaults.

## Build Output

- `public/` - Generated static site, separate git repository
- `resources/_gen/` - Hugo's cached processed assets (SCSS, images)

## Archive

- `z_archive/` - Old theme files and deprecated content (not used in builds)
