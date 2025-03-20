#!/bin/bash

# Intended to be executed on GitHub Actions
# Execute from root

# Sets the flag INCLUDE_DISCLAIMER in preambles.tex to true
echo "\\setbool{INCLUDE_DISCLAIMER}{true}" >> ./notes/preambles.tex