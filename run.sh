#!/usr/bin/env bash

ELLIPSIS_SRC=$1

source $ELLIPSIS_SRC/init.bash

load git

git.configured() {
    for key in user.name user.email github.user; do
        if [ -z "$(git config --global $key | cat)"  ]; then
            return 1
        fi
    done
    return 0
}

# Install git configuration
git.add_include '~/.gitinclude'

git.configured || cat <<\EOF
You should set your email, name and github user for git with `git config`:
git config --global user.name "John Smith"
git config --global user.email "johnsmith@example.com"
git config --global github.user "johnsmith"
EOF
