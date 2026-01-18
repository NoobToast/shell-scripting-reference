#!/bin/bash
# Check if a command exists before using it

if command -v "$1" &> /dev/null; then
    echo ">>uninstall.sh: $1 is currently installed and available"
else
    echo ">>uninstall.sh: $1 is not found (already uninstalled or never installed)"
fi
