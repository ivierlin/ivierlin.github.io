#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

cd public

git init
git config user.name "Travis"
git config user.email "travis@travis-ci.org"

git remote add upstream "https://$PUSH_TOKEN@github.com/ivierlin/ivierlin.github.io.git"
git fetch upstream
git reset upstream/master

touch .

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:master
