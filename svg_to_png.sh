#!/usr/bin/env bash
# Converts SVG files to PNG on macOS.
# PNG is lossless — no quality setting applies.
# Renderer priority: rsvg-convert → Inkscape → ImageMagick (cairosvg via Python as last resort)

set -euo pipefail

SCRIPT_NAME="$(basename "$0")"
OUTPUT_DIR=""
DPI=144   # 2× default (96 dpi) for retina-quality output
VERBOSE=false

usage() {
  cat <<EOF
Usage: $SCRIPT_NAME [OPTIONS] <file.svg|directory> [...]

Converts SVG files to PNG. Supports SVGs from Illustrator, Figma, Inkscape,
web tools, and hand-crafted files.

OPTIONS
  -o DIR     Write PNG files to DIR (default: same directory as each SVG)
  -d DPI     Resolution in DPI (default: 144 — 2× screen resolution)
  -v         Verbose output
  -h         Show this help

EXAMPLES
  $SCRIPT_NAME icon.svg
  $SCRIPT_NAME -o ./output -d 288 ./assets/*.svg
  $SCRIPT_NAME ./icons/          # converts all SVGs in a directory
EOF
  exit 0
}

log() { [[ "$VERBOSE" == true ]] && echo "$@"; }
err() { echo "ERROR: $@" >&2; }

# ── renderer detection ───────────────────────────────────────────────────────

find_renderer() {
  if command -v rsvg-convert &>/dev/null; then
    echo "rsvg"
  elif command -v inkscape &>/dev/null; then
    echo "inkscape"
  elif command -v convert &>/dev/null && convert --version 2>&1 | grep -qi "imagemagick"; then
    echo "imagemagick"
  elif command -v python3 &>/dev/null && python3 -c "import cairosvg" 2>/dev/null; then
    echo "cairosvg"
  else
    echo "none"
  fi
}

print_install_hint() {
  cat <<EOF

No SVG renderer found. Install one of the following via Homebrew:

  brew install librsvg          # rsvg-convert (recommended — fastest, best compatibility)
  brew install inkscape         # Inkscape (best for complex SVGs)
  brew install imagemagick      # ImageMagick (widely available)
  pip3 install cairosvg         # CairoSVG (Python, good fallback)

EOF
}

# ── conversion functions ─────────────────────────────────────────────────────

convert_rsvg() {
  local src="$1" dst="$2"
  rsvg-convert --dpi-x "$DPI" --dpi-y "$DPI" --format png --output "$dst" "$src"
}

convert_inkscape() {
  local src="$1" dst="$2"
  # Inkscape 1.x uses --export-filename; 0.9x uses --export-png
  if inkscape --version 2>&1 | grep -q "^Inkscape 0\."; then
    inkscape --export-dpi="$DPI" --export-png="$dst" "$src" &>/dev/null
  else
    inkscape --export-dpi="$DPI" --export-filename="$dst" "$src" &>/dev/null
  fi
}

convert_imagemagick() {
  local src="$1" dst="$2"
  # -density must come before the input file for ImageMagick
  convert -density "$DPI" -background none "$src" "$dst"
}

convert_cairosvg() {
  local src="$1" dst="$2"
  python3 -c "
import cairosvg, sys
cairosvg.svg2png(url=sys.argv[1], write_to=sys.argv[2], dpi=${DPI})
" "$src" "$dst"
}

do_convert() {
  local renderer="$1" src="$2" dst="$3"
  case "$renderer" in
    rsvg)       convert_rsvg       "$src" "$dst" ;;
    inkscape)   convert_inkscape   "$src" "$dst" ;;
    imagemagick) convert_imagemagick "$src" "$dst" ;;
    cairosvg)   convert_cairosvg   "$src" "$dst" ;;
  esac
}

# ── main logic ───────────────────────────────────────────────────────────────

convert_file() {
  local renderer="$1" svg_file="$2"

  if [[ ! -f "$svg_file" ]]; then
    err "'$svg_file' is not a file — skipping"
    return 1
  fi

  local base_name
  base_name="$(basename "${svg_file%.svg}")"

  local out_dir
  if [[ -n "$OUTPUT_DIR" ]]; then
    out_dir="$OUTPUT_DIR"
  else
    out_dir="$(dirname "$svg_file")"
  fi

  local png_file="${out_dir}/${base_name}.png"

  log "  $svg_file → $png_file"

  if do_convert "$renderer" "$svg_file" "$png_file"; then
    echo "✓  $(basename "$svg_file") → $(basename "$png_file")"
  else
    err "Failed to convert '$svg_file'"
    return 1
  fi
}

main() {
  local targets=()

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -o) OUTPUT_DIR="$2"; shift 2 ;;
      -d) DPI="$2";        shift 2 ;;
      -v) VERBOSE=true;    shift   ;;
      -h|--help) usage ;;
      *) targets+=("$1"); shift ;;
    esac
  done

  if [[ ${#targets[@]} -eq 0 ]]; then
    err "No input files or directories specified."
    echo "Run '$SCRIPT_NAME -h' for usage."
    exit 1
  fi

  local renderer
  renderer="$(find_renderer)"

  if [[ "$renderer" == "none" ]]; then
    print_install_hint
    exit 1
  fi

  log "Renderer: $renderer | DPI: $DPI"

  if [[ -n "$OUTPUT_DIR" ]]; then
    mkdir -p "$OUTPUT_DIR"
  fi

  local success=0 fail=0

  for target in "${targets[@]}"; do
    if [[ -d "$target" ]]; then
      # Process all SVGs in the directory (non-recursive)
      local found=false
      while IFS= read -r -d '' svg; do
        found=true
        convert_file "$renderer" "$svg" && ((success++)) || ((fail++))
      done < <(find "$target" -maxdepth 1 -iname "*.svg" -print0 | sort -z)
      if [[ "$found" == false ]]; then
        err "No SVG files found in '$target'"
      fi
    elif [[ "$target" == *.svg || "$target" == *.SVG ]]; then
      convert_file "$renderer" "$target" && ((success++)) || ((fail++))
    else
      err "'$target' is not an SVG file or directory — skipping"
      ((fail++))
    fi
  done

  echo ""
  echo "Done: $success converted, $fail failed."
  [[ $fail -eq 0 ]]
}

main "$@"
