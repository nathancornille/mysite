#!/bin/sh

# Deploy script that commits both source and public repositories
# Usage: ./deploy-all.sh "commit message"

# If a command fails then the deploy stops
set -e

# Get commit message from argument or use default
msg="Site update $(date)"
if [ -n "$*" ]; then
    msg="$*"
fi

printf "\033[0;32mCommitting source changes...\033[0m\n"

# Commit source repository
git add .
git commit -m "$msg" || echo "No source changes to commit"
git push || echo "No source changes to push"

printf "\033[0;32mBuilding and deploying site...\033[0m\n"

# Run the existing deploy script (builds hugo and commits public/)
./deploy.sh "$msg"

printf "\033[0;32mDone! Source and public repositories updated.\033[0m\n"
