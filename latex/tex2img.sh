#!/bin/bash

if [ "$#" -lt 4 ]; then
    echo "Usage: $0 -i input.tex -o output.png [--dpi 300]"
    echo "Example: $0 -i emc2.tex -o emc2.png"
    echo "Formats: PNG, JPG, SVG"
    exit 1
fi

INPUT_FILE=""
OUTPUT_FILE=""
DPI="300"

while [[ $# -gt 0 ]]; do
    case $1 in
        -i|--input)
            INPUT_FILE="$2"
            shift 2
            ;;
        -o|--output)
            OUTPUT_FILE="$2"
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

if [ -z "$INPUT_FILE" ] || [ -z "$OUTPUT_FILE" ]; then
    echo "Error: Both input and output files are required"
    exit 1
fi

if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file $INPUT_FILE not found"
    exit 1
fi

INPUT_DIR="$(dirname "$(realpath "$INPUT_FILE")")"
INPUT_NAME="$(basename "$INPUT_FILE")"
OUTPUT_DIR="$(dirname "$(realpath "$OUTPUT_FILE")")"
OUTPUT_NAME="$(basename "$OUTPUT_FILE")"

mkdir -p "$OUTPUT_DIR"

sudo docker build -t latex2img .
sudo docker run --rm \
    -v "$INPUT_DIR:/input:ro" \
    -v "$OUTPUT_DIR:/output:rw" \
    latex2img \
    -i "/input/$INPUT_NAME" \
    -o "/output/$OUTPUT_NAME" \
    --dpi "$DPI"