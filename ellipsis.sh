#!/usr/bin/env bash

if [ ! -d "$PKG_PATH/../common" ]; then
    echo "Dependency on katharinegillis/common, package is missing."
    exit 1
fi

source "$PKG_PATH/../common/common.sh"

softDependencies=(
    vim
);

common_soft_dependencies_check "${softDependencies[*]}"

pkg.link() {
    common_link
}

pkg.install() {
    common_install
}

pkg.pull() {
    common_pull
}

pkg.uninstall() {
    common_uninstall
}
