#!/bin/bash
set -o pipefail

profile_dir="$1"

pr_message="[Falco](https://falco.org) has detected a deviation from normal behavior of the workflow.
Review the changes in this PR and accept it in order to establish a new baseline."
PR_DATE=$(date +"%Y%m%d_%H%M%S")
BRANCH_NAME="sysdig-profile-update-$PR_DATE"

git config --global user.email "oss@falco.com"
git config --global user.name "Falco action"
git fetch --all

random_branch_name=falco-profile-update-$(tr -dc A-Za-z0-9 < /dev/urandom | head -c 32 | xargs)
git checkout -B "$random_branch_name" "origin/$random_branch_name" || git checkout -B "$random_branch_name" "origin/$(git remote show origin | grep 'HEAD branch' | cut -d' ' -f5)"

git add $GITHUB_WORKSPACE/$profile_dir/ 
git commit -m 'update falco profile'
git push -f --set-upstream origin $random_branch_name
gh pr create --title "Updates to falco profile" --body "$(echo -e "$pr_message\n\nchanges:\n\`\`\`\nUpdates to falco profile\n\`\`\`")"