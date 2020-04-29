#!/usr/bin/env bash

pkg.link() {
    fs.link_files files
}

pkg.install() {
    # Configure git
    configureGit
}

pkg.pull() {
    # Unlink old files
    hooks.unlink

    # Pull down package changes
    git.pull

    # Link files
    pkg.link

    # Configure git
    configureGit
}

configureGit() {
    # Install git configuration
    git.add_include '~/.gitinclude'

    git.configured || cat <<\EOF
You should set your email, name and github user for git with `git config`:
    git config --global user.name "John Smith"
    git config --global user.email "johnsmith@example.com"
    git config --global github.user "johnsmith"
EOF
}

git.configured() {
    for key in user.name user.email github.user; do
        if [ -z "$(git config --global $key | cat)"  ]; then
            return 1
        fi
    done
    return 0
}