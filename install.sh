#!/usr/bin/env bash

for key in user.name user.email github.user; do
    if [ -z "$(git config --global $key | cat)"  ]; then
        echo "Please enter your git $key:"
        read var
        git config --global $key "$var"
    fi
done
