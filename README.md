# DocumenterShiki.jl

[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://hsugawa8651.github.io/DocumenterShiki.jl/)
![Shiki](https://img.shields.io/badge/powered%20by-Shiki-10b981)
![Documenter.jl](https://img.shields.io/badge/built%20with-Documenter.jl-9558b2)

Modern syntax highlighting for Documenter.jl using [Shiki](https://shiki.style/).

## Overview

This project integrates Shiki syntax highlighting with Documenter.jl, providing beautiful, modern syntax highlighting for Julia documentation with support for light/dark themes and 200+ languages.

## Features

- 🎨 Modern syntax highlighting powered by Shiki
- 🌓 Light/dark theme support with automatic detection
- 📋 Copy-to-clipboard functionality for code blocks
- 🚀 CDN-based loading (no bundling required)
- 🌍 Support for 200+ programming languages
- ⚡ Fast and lightweight

## Requirements

- Julia 1.6+
- Node.js 18+
- pnpm 8.0+
- Documenter.jl

## Installation

1. Clone this repository:
```bash
git clone https://github.com/hsugawa8651/DocumenterShiki.jl.git
cd DocumenterShiki.jl
```

2. Install Node.js dependencies:
```bash
pnpm install
```

3. Install Julia dependencies:
```bash
julia --project=docs -e 'using Pkg; Pkg.instantiate()'
```

## Usage

### Basic Usage

In your `docs/make.jl`:

```julia
include("ShikiHighlighter.jl")
using .ShikiHighlighter

makedocs(
    format = shiki_html(
        theme = "github-light"
    ),
    # ... other options
)

add_shiki_assets()
```

### Build Documentation

```bash
# Build with Shiki highlighting
pnpm run build-docs

# Development mode
pnpm run dev

# Clean build artifacts
pnpm run clean
```

### Configuration Options

The `shiki_html()` function accepts the following options:

- `theme`: Shiki theme name (default: `"github-light"`)
- `langs`: Array of language IDs to support (default: common languages)
- `cdn_url`: CDN URL for Shiki (default: jsDelivr)

## How It Works

1. `makedocs()` is called with `shiki_html()` format
2. Documentation is built by Documenter.jl
3. `add_shiki_assets()` injects Shiki CSS and JavaScript
4. Code blocks are highlighted dynamically on page load
5. Theme switching is handled automatically based on user preference

## License

MIT License - see [LICENSE.md](LICENSE.md) for details

## Author

Hiroharu Sugawara <hsugawa@gmail.com>