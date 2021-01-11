#!/usr/bin/env bash

ELLIPSIS_SRC=$1

source $ELLIPSIS_SRC/init.bash

#load git

# Install git configuration
#git.add_include '~/.gitinclude'

for key in user.name user.email github.user; do
    if [ -z "$(git config --global $key | cat)"  ]; then
        echo "Please enter your git $key:"
        read var
        git config --global $key "$var"
    fi
done
