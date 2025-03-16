#!/bin/sh

sed -e "s|/home/abraz|$HOME|g" \
    -e "s||$(git config user.name)|g" \
    -e "s||$(git config user.email)|g"
