#!/usr/bin/env bash

cd "$(pwd)/$(dirname ${BASH_SOURCE})"
./update-vscode-plugins.py
./codelldb/update.sh
git add .
git commit -m "vscode-extensions: Auto update" || echo "No changes to commit"
