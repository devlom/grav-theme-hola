# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the **Hola Theme** for Grav CMS - a modern, stylish vCard/portfolio/resume template. The theme is designed for creative professionals including designers, developers, freelancers, and photographers.

## Key Commands

### Development
While this theme includes a `package.json` file referencing Spectre.css and Gulp build tools, no gulpfile.js is present in the repository. The package.json appears to be a remnant from the original template or intended for future development.

### Installation
```bash
# Install via GPM (from Grav root directory)
bin/gpm install hola

# Manual installation - extract to:
/your/site/grav/user/themes/hola
```

### Testing
No automated tests are included in this theme. Manual testing involves:
1. Installing the theme in a Grav instance
2. Creating pages using the various template types
3. Verifying responsive design across devices
4. Testing form submissions and navigation

## Architecture

### Theme Structure
- **PHP Class**: `hola.php` - Extends Grav's Theme class, handles:
  - SVG image path inclusion for Twig templates
  - Form styling class customization
  - Event subscription for theme initialization

### Template System
- Uses Twig templating engine with modular architecture
- Main templates in `/templates/`:
  - `default.html.twig` - Standard pages
  - `blog.html.twig` - Blog listing
  - `item.html.twig` - Blog posts
  - `modular.html.twig` - Modular page container
  - `error.html.twig` - Error pages

### Modular Components (`/templates/modular/`)
- `home.html.twig` - Hero banner section
- `about.html.twig` - About section
- `experience.html.twig` - Work experience timeline
- `works.html.twig` - Portfolio gallery
- `services.html.twig` - Services listing
- `testimonials.html.twig` - Client testimonials
- `resume.html.twig` - Resume/CV section
- `blog.html.twig` - Blog preview section
- `cta.html.twig` - Call-to-action section
- `stats.html.twig` - Statistics counters
- `basic.html.twig` - Basic text content

### Configuration
- `blueprints.yaml` - Theme configuration schema defining customizable options
- `hola.yaml` - Default theme settings (copy to `user/config/themes/` for customization)
- `languages.yaml` - Multi-language support

### Assets
- CSS: `/css/` - Includes base styles, vendor libraries, and custom styles
- JavaScript: `/js/` - jQuery-based scripts for interactions
- Fonts: `/fonts/` - Icon fonts and web fonts
- Images: `/images/` - Theme images and logo directory

## Important Patterns

1. **Logo Customization**: Place logos in `/images/logo/` and reference via YAML configuration
2. **Form Styling**: Custom form classes defined in `hola.php` for consistent styling
3. **Modular Pages**: Build one-page sites by combining modular templates
4. **Multi-lingual Support**: Add language-specific metadata to modular pages
5. **Theme Inheritance**: Extends base Theme class, subscribes to Grav events

## Development Notes

- Never modify files directly in the theme folder - use Grav's configuration override system
- Custom logos should be placed in the theme's `/images/logo/` directory
- The theme includes extensive Blueprint configurations for admin panel customization
- All modular sections have corresponding Blueprint files for content management
- The theme uses jQuery for JavaScript functionality and smooth scrolling navigation

## Workflow Guidelines

- Never commit or push changes, I'll do it myself