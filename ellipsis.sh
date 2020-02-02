#!/usr/bin/env bash

pkg.link() {
    fs.link_files files
}

git-configured() {
    for key in user.name user.email github.user; do
        if [ -z "$(git config --global $key | cat)"  ]; then
            return 1
        fi
    done
    return 0
}

pkg.install() {
    pkg.pull
}

pkg.pull() {
    echo -e "\e[32mUpdating git...\e[0m"

    # Install git configuration
    git.add_include '~/.gitinclude'

    git.configured || cat <<\EOF
You should set your email, name and github user for git with `git config`:
    git config --global user.name "John Smith"
    git config --global user.email "johnsmith@example.com"
    git config --global github.user "johnsmith"
EOF

    echo -e "\e[32mDone git.\e[0m"
}