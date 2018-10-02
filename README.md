# Hola Theme

![](hola.jpg)

**Hola** modern and stylish vCard website template for [Grav CMS](http://github.com/getgrav/grav).  Designed to be a resume, vCard, portfolio template, it’s the perfect template for creative designers, developers, freelancers, photographer or any creative profession. It is fully responsive and retina/hi-dpi ready. It will look great on any devices from desktop to mobile phones. It has blog page templates, working contact form, stylish portfolio section and other features you will only find on premium templates. Built with clean and organized code, this template is also very easy to customize.

## Features

* HTML5 and CSS3
* Fully responsive layout
* Modern, stylish design
* Easy to customize
* Hundreds of icons avaliable
* Multiple page template types
* Retina ready
* Smooth scrolling home page nav 
* Stylish portfolio section
* Animated stats section
* @font-face custom web fonts
* Parallax type sections included
* Compatible with all major browsers

![](hola-mobile.jpg)

### Supported Page Templates

* Default view template `default.md`
* Error view template `error.md`
* Blog view template `blog.md`
* Blog item view template `item.md`
* Modular view templates: `modular.md`
  * Home Banner Modular view template - `home.md`
  * About Modular view template - `about.md`
  * Experience Modular view template - `experience.md`
  * Portfolio Modular view template - `works.md`
  * Services Modular view template - `services.md`
  * Testimonials Modular view template - `testimonials.md`
  * Resume Modular view template - `resume.md`
  * Blog Modular view template - `blog.md`
  * Call To Action Modular view template - `cta.md`
  * Stats Modular view template - `stats.md`
  * Basic One or Two Column Text Modular view template - `basic.md`


# Installation

Installing the Hola theme can be done in one of two ways. Our GPM (Grav Package Manager) installation method enables you to quickly and easily install the theme with a simple terminal command, while the manual method enables you to do so via a zip file. 

The theme by itself is useful, but you may have an easier time getting up and running by installing a skeleton. The skeleton can be found in [Hola Skeleton](https://github.com/devlom/grav-hola-skeleton) package which are self-contained repositories for a complete sites which include: sample content, configuration, theme, and plugins.

## GPM Installation (Preferred)

The simplest way to install this theme is via the [Grav Package Manager (GPM)](http://learn.getgrav.org/advanced/grav-gpm) through your system's Terminal (also called the command line).  From the root of your Grav install type:

    bin/gpm install hola

This will install the Hola theme into your `/user/themes` directory within Grav. Its files can be found under `/your/site/grav/user/themes/hola`.

## Manual Installation

To install this theme, just download the zip version of this repository and unzip it under `/your/site/grav/user/themes`. Then, rename the folder to `hola`. You can find these files either on [GitHub](https://github.com/devlom/grav-theme-hola) or via [GetGrav.org](http://getgrav.org/downloads/themes).

You should now have all the theme files under

    /your/site/grav/user/themes/hola

## Default Options

Hola comes with a few default options that can be set site-wide.  These options are:

```yaml
enabled: true                 # Enable the theme
production-mode: true         # In production mode, only minified CSS is used. When disabled, nested CSS with sourcemaps are enabled
header-fixed: true            # Cause the header to be fixed at the top of the browser
header-animated: true         # Allows the fixed header to resize to a smaller header when scrolled
header-dark: false            # Inverts the text/logo to work better on dark backgrounds
header-transparent: false     # Allows the fixed header to be transparent over the page
sticky-footer: true           # Causes the footer to be sticky at the bottom of the page
blog-page: '/blog'            # The route to the blog listing page, useful for a blog style layout with sidebar
custom_logo:                  # A custom logo rather than the default (see below)  
custom_logo_mobile:           # A custom logo to use for mobile navigation
```

To make modifications, you can copy the `user/themes/hola/hola.yaml` file to `user/config/themes/` folder and modify, or you can use the admin plugin.

> NOTE: Do not modify the `user/themes/hola/hola.yaml` file directly or your changes will be lost with any updates

## Custom Logos

To add a custom logo, you should put the log into the `user/themes/hola/images/logo` folder.  Standard image formats are support (`.png`,`.jpg`, `.gif`, `.svg`, etc.).  Then reference the logo via the YAML like so:

```yaml
custom_logo:
    - name: 'my-logo.png'
custom_logo_mobile:
    - name: 'my-mobile-logo.png'    
```

Alternatively, you can you use the drag-n-drop "Custom Logo" field in the Hola theme options.

## Page Overrides

Hola has the ability to allow pages to override some of the default options by letting the user set `body_classes` for any page.  The theme will merge the combination of the defaults with any `body_classes` set. For example:

```yaml
body_classes: "header-dark header-transparent"
```

On a particular page will ensure that page has those options enabled (assuming they are false by default).

## Features Modular Options

The features modular template provides the ability to set a class on the features, as well as an array of feature items.  For example:

```yaml
class: offset-box
features:
    - header: Crazy Fast
      text: "Performance is not just an afterthought, we baked it in from the start!"
      icon: fighter-jet
    - header: Easy to build
      text: "Simple text files means Grav is trivial to install, and easy to maintain"
      icon: database
    - header: Awesome Technology
      text: "Grav employs best-in-class technologies such as Twig, Markdown &amp; Yaml"
      icon: cubes
    - header: Super Flexible
      text: "From the ground up, with many plugin hooks, Grav is extremely extensible"
      icon: object-ungroup
    - header: Abundant Plugins
      text: "A vibrant developer community means over 200 themes available to download"
      icon: puzzle-piece
    - header: Free / Open Source
      text: "Grav is an open source project, so you can spend your money on other stuff"
      icon: money 
```

## Modular Hola Settings

Additional options found in every modular section. It can be used to unlock additional functions such as:

```yaml
Banner Background:       # Allows user to pick custom banner background
Overlay Opacity:         # Gives user control over banner overlay opacity
Button Link:             # Allows user to enter cutom buton link
Icon Picker:             # User can pick desired icon from available set
Skill Procentage:        # Couses the skill chart to be lenghten to entered value
Custom Background Color: # Allows user to enter custom background class
```

And much more...
Please enjoy! 

~ _Devlom Team_ ~ 