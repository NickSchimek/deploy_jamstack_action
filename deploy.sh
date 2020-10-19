#!/bin/bash

set -e

cd $DIR

git config --global init.defaultBranch main
git init
git config user.email "${ACTOR}@users.noreply.github.com"
git config user.name "${ACTOR}"
git add .
git commit -m"Deploy ${GITHUB_SHA}"
git push -f "https://${ACTOR}:${TOKEN}@github.com/${REPO}.git" main:${BRANCH}
