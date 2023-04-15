#!/usr/bin/env bash

# Set parent directory path
parent_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

# Initialize variables from .env file
github_token="$(grep 'github_token=' "$parent_path"/.env | sed 's/^.*=//')"
github_username="$(grep 'github_username=' "$parent_path"/.env | sed 's/^.*=//')"
github_repository="$(grep 'github_repository=' "$parent_path"/.env | sed 's/^.*=//')"
backup_folder="$(grep 'backup_folder=' "$parent_path"/.env | sed 's/^.*=//')"

# Change directory to parent path
cd "$parent_path" || exit 1

# Check if backup folder exists, create one if it does not
if [ ! -d "$backup_folder" ]; then
  mkdir "$backup_folder"
fi

# Copy important files into backup folder
cp "$(grep 'path_' "$parent_path"/.env | sed 's/^.*=//')" "$backup_folder"

# Git commands
git init
git rm -rf --cached "$parent_path"/.env
git add "$parent_path"
git commit -m "New backup from $(date +"%d-%m-%y")"
git push https://"$github_token"@github.com/"$github_username"/"$github_repository".git
