#!/usr/bin/env bash

pkg.link() {
    fs.link_files files
}

pkg.install() {
    # Configure git
    bash run.sh
}

pkg.pull() {
    # Unlink old files
    hooks.unlink

    # Pull down package changes
    git.pull

    # Link files
    pkg.link

    # Configure git
    bash run.sh "$ELLIPSIS_SRC"
}