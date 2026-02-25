#!/usr/bin/env bash
# Run container with local quickfix folder mounted at /quickfix

set -e
QUICKFIX_DIR="${1:-./quickfix}"
IMAGE="${2:-builder}"

if [ ! -d "$QUICKFIX_DIR" ]; then
  echo "Error: $QUICKFIX_DIR not found. Run ./extract-build.sh first to get the quickfix folder."
  exit 1
fi

docker run --rm -it \
  -p 5001:5001 \
  -v "$(cd "$QUICKFIX_DIR" && pwd):/quickfix" \
  "$IMAGE"
