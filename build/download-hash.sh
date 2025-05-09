#!/bin/bash
# This script downloads the hash of the LaTeX target.
# ARGS:
#   $1: The compile target root file (e.g. COMP2120-Notes.tex)
#   $2: The local .tex sources hash.
# OUTPUT:
#   changed: 1 if the hash is different. 0 if the hash is the same.
ROOT_FILE="$1"
HASH_FILE=${ROOT_FILE/.tex/.pdf.hash}
HTTP_URL="https://shingzhanho.github.io/COMP2120-Notes/$HASH_FILE"
HTTP_STATUS=$(curl -s -o ./$HASH_FILE -w "%{http_code}" "$HTTP_URL")
if [ "$HTTP_STATUS" -ne 200 ]; then
    echo "Warning: Failed to download hash file. HTTP status code: $HTTP_STATUS"
    echo "Warning: Hash will be treated as 0."
    echo "TARGET_HASH=0" >> "$GITHUB_ENV"
else
    # Read the hash from the file
    TARGET_HASH=$(cat "$HASH_FILE")
    echo "TARGET_HASH=$TARGET_HASH" >> "$GITHUB_ENV"
    echo "Hash downloaded successfully: $TARGET_HASH"
fi
# Check if the hash is different from the local hash
LOCAL_HASH="$2"
if [ "$TARGET_HASH" != "$LOCAL_HASH" ]; then
    echo "changed=1" >> "$GITHUB_OUTPUT"
else
    echo "changed=0" >> "$GITHUB_OUTPUT"
fi
