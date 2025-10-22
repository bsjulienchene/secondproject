#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo "Usage: $0 -i input.tex -o output.png [--dpi 300]"
    echo "Example: $0 -i emc2.tex -o emc2.png"
    echo "Formats: PNG, JPG, SVG"
    exit 1
fi

INPUT=""
OUTPUT=""
DPI=300

while [[ $# -gt 0 ]]; do
    case $1 in
        -i|--input)
            INPUT="$2"
            shift 2
            ;;
        -o|--output)
            OUTPUT="$2"
            shift 2
            ;;
        --dpi)
            DPI="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

if [ -z "$INPUT" ] || [ -z "$OUTPUT" ]; then
    echo "Error: Both input and output files are required"
    exit 1
fi

if [ ! -f "$INPUT" ]; then
    echo "Error: Input file $INPUT not found"
    exit 1
fi

TEMP_DIR="/tmp/latex2img-$$"
mkdir -p "$TEMP_DIR"

BASENAME=$(basename "$INPUT" .tex)
EXT="${OUTPUT##*.}"

cp "$INPUT" "$TEMP_DIR/"
cd "$TEMP_DIR"

pdflatex -interaction=nonstopmode "$BASENAME.tex"

if [ ! -f "$BASENAME.pdf" ]; then
    echo "Error: LaTeX compilation failed"
    rm -rf "$TEMP_DIR"
    exit 1
fi

case "$EXT" in
    svg)
        pdf2svg "$BASENAME.pdf" "$(realpath "$OUTPUT")"
        ;;
    png|jpg|jpeg)
        convert -density "$DPI" "$BASENAME.pdf" "$(realpath "$OUTPUT")"
        ;;
    *)
        echo "Error: Unsupported format $EXT"
        rm -rf "$TEMP_DIR"
        exit 1
        ;;
esac

rm -rf "$TEMP_DIR"
echo "Generated $OUTPUT from $INPUT"