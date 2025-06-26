#!/bin/bash

# Hola Theme Release Builder
# This script downloads Grav, the Hola theme, and skeleton, then packages them for release

set -e  # Exit on any error

VERSION="1.1.3"
BUILD_DIR="build"
RELEASE_NAME="hola-${VERSION}"
GRAV_VERSION="1.7.44"  # Latest stable Grav version

echo "Building Hola Theme Release v${VERSION}"
echo "========================================"

# Clean up previous builds
if [ -d "$BUILD_DIR" ]; then
    echo "Cleaning up previous build directory..."
    rm -rf "$BUILD_DIR"
fi

# Create build directory
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

echo "1. Downloading Grav CMS v${GRAV_VERSION}..."
wget -q "https://github.com/getgrav/grav/releases/download/${GRAV_VERSION}/grav-admin-v${GRAV_VERSION}.zip" -O grav.zip
unzip -q grav.zip
mv grav-admin hola-site

echo "2. Downloading Hola Theme..."
# Copy the current theme files (assuming we're running from theme directory)
cp -r ../* hola-site/user/themes/hola/ 2>/dev/null || true
# Remove build directory from theme copy
rm -rf hola-site/user/themes/hola/build

echo "3. Downloading Hola Skeleton..."
# Download skeleton if available, otherwise use theme defaults
if wget -q --spider "https://github.com/devlom/grav-skeleton-hola/archive/master.zip" 2>/dev/null; then
    wget -q "https://github.com/devlom/grav-skeleton-hola/archive/master.zip" -O skeleton.zip
    unzip -q skeleton.zip
    
    # Copy skeleton content to the site
    if [ -d "grav-skeleton-hola-master" ]; then
        cp -r grav-skeleton-hola-master/* hola-site/ 2>/dev/null || true
        echo "   ✓ Skeleton files copied"
    fi
    
    # Clean up
    rm -rf grav-skeleton-hola-master skeleton.zip
else
    echo "   ⚠ Skeleton not available, using theme defaults"
    
    # Create basic site structure with theme
    mkdir -p hola-site/user/pages/01.home
    cat > hola-site/user/pages/01.home/modular.md << 'EOF'
---
title: 'Hola - Stylish vCard Theme'
menu: Home
onpage_menu: false
body_classes: 'header-dark header-transparent'

content:
    items: '@self.modular'
    order:
        by: default
        dir: asc
        custom:
            - _home
            - _about
            - _services
            - _experience
            - _works
            - _testimonials
            - _blog
            - _contact
---

# Hola - Stylish vCard Theme

A modern and stylish vCard website template for Grav CMS.
EOF

    # Create a basic home module
    mkdir -p hola-site/user/pages/01.home/_home
    cat > hola-site/user/pages/01.home/_home/home.md << 'EOF'
---
title: 'Hello, I am John Doe.'
subtitle: 'Freelance Web Designer'
button_text: 'MORE ABOUT ME'
button_url: '#about'
background_image: wheel-1000.jpg
body_classes: ''
---
EOF
fi

echo "4. Setting up configuration..."
# Ensure theme is properly configured
cat > hola-site/user/config/system.yaml << 'EOF'
home:
  alias: /home

pages:
  theme: hola

theme:
  name: hola
EOF

# Set proper permissions
find hola-site -type f -name "*.md" -exec chmod 644 {} \;
find hola-site -type f -name "*.yaml" -exec chmod 644 {} \;
find hola-site -type f -name "*.php" -exec chmod 644 {} \;
find hola-site -type d -exec chmod 755 {} \;

echo "5. Creating release package..."
# Create the final zip package
zip -r "${RELEASE_NAME}.zip" hola-site/ -q
mv "${RELEASE_NAME}.zip" ..

# Also create a theme-only package
echo "6. Creating theme-only package..."
cd hola-site/user/themes/
zip -r "../../../hola-theme-${VERSION}.zip" hola/ -q

cd ../../..

echo "7. Cleaning up..."
rm -rf "$BUILD_DIR"

echo ""
echo "✓ Release packages created:"
echo "  - ${RELEASE_NAME}.zip (Complete Grav site with Hola theme)"
echo "  - hola-theme-${VERSION}.zip (Theme only)"
echo ""
echo "Release notes for v${VERSION}:"
echo "- Fixed Twig compatibility with newest Grav"
echo "- Fixed contact form validation"
echo "- Fixed menu navigation and Unicode support"
echo "- Added Eastern European font character support"
echo ""
echo "Ready for GitHub release!"