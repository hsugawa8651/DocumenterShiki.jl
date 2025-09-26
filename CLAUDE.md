# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Julia-based documentation project that integrates Shiki syntax highlighting with Documenter.jl. The project provides a custom Shiki highlighter module that adds modern syntax highlighting to Documenter-generated documentation.

## Common Commands

### Build Documentation
```bash
# Build docs with Shiki highlighting
pnpm run build-docs

# Development mode (watch for changes)
pnpm run dev

# Clean build artifacts
pnpm run clean
```

### Build Shiki Assets Only
```bash
pnpm run build-shiki
```

### Julia Documentation Building
```bash
# Direct Julia command
julia --project=docs docs/make.jl
```

## Architecture

### Key Components

1. **ShikiHighlighter.jl Module** (`docs/ShikiHighlighter.jl`)
   - Provides `shiki_html()` function that wraps Documenter.HTML() with Shiki highlighting configuration
   - Generates CSS and JavaScript assets for syntax highlighting
   - Supports theme switching (light/dark modes)
   - Configurable language support and CDN URL

2. **Documentation Build Process** (`docs/make.jl`)
   - Uses the ShikiHighlighter module to configure Documenter
   - Calls `add_shiki_assets()` after building to inject Shiki resources
   - Configured for GitHub Light theme by default

3. **Node.js Integration** 
   - Uses pnpm as package manager (v9.0.0+)
   - Requires Node.js 18+ 
   - Shiki library (v1.22.2) for syntax highlighting
   - Build scripts coordinate Julia and Node.js processes

### How It Works

1. `makedocs()` is called with `shiki_html()` format which stores configuration globally
2. Documentation is built normally by Documenter.jl
3. `add_shiki_assets()` injects generated CSS and JavaScript into the build directory
4. JavaScript dynamically loads Shiki from CDN and highlights code blocks on page load
5. Supports theme switching and includes copy-to-clipboard functionality

## Key Features

- Dynamic syntax highlighting using Shiki
- Light/dark theme support with automatic detection
- Copy button for code blocks
- Loading states for code blocks during highlight processing
- Configurable language and theme support
- CDN-based loading (no bundling required)