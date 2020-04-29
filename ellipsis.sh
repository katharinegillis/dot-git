#!/usr/bin/env bash

pkg.link() {
    fs.link_files files
}

pkg.install() {
    # Configure git
    bash $PKG_PATH/run.sh
}

pkg.pull() {
    # Check for updates on git
    git remote update 2>&1 > /dev/null
    if git.is_behind; then
        # Unlink old files
        hooks.unlink

        # Pull down package changes
        git.pull

        # Link files
        pkg.link
    fi

    # Configure git
    bash $PKG_PATH/run.sh "$ELLIPSIS_SRC"
}