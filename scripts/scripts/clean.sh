#!/bin/sh

sed -e "s|$HOME|/home/abraz|g" \
    -e "s|$(git config user.name)||g" \
    -e "s|$(git config user.email)||g"
