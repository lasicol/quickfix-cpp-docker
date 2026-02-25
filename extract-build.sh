#!/usr/bin/env bash
# Build the quickfix image (if needed) and copy /quickfix from container to output

set -e
OUTPUT_DIR="${1:-.}"

echo "Building image (if needed)..."
docker build -t builder .

echo "Extracting build output to ${OUTPUT_DIR}..."
mkdir -p "$OUTPUT_DIR"
docker run --rm \
  -v "$(cd "$OUTPUT_DIR" && pwd):/out" \
  builder bash -c '
    cp -a /quickfix /out/
    echo "Done. Contents:"
    ls -la /out/quickfix
  '

echo ""
echo "Build output is in: $(cd "$OUTPUT_DIR" && pwd)"
ls -la "$OUTPUT_DIR"
