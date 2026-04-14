#!/usr/bin/env bash
# -*- coding: utf-8 -*-
#
# File: dev/sphinx/create_docs.sh
#
# Part of ‘UNICORN Binance DepthCache Cluster’
# Project website: https://github.com/oliver-zehentleitner/unicorn-binance-depth-cache-cluster
# Github: https://github.com/oliver-zehentleitner/unicorn-binance-depth-cache-cluster
# Documentation: https://oliver-zehentleitner.github.io/unicorn-binance-depth-cache-cluster
# PyPI: https://pypi.org/project/unicorn-binance-depth-cache-cluster
#
# License: MIT
# https://github.com/oliver-zehentleitner/unicorn-binance-depth-cache-cluster/blob/master/LICENSE
#
# Author: Oliver Zehentleitner
#
# Copyright (c) 2022-2023, Oliver Zehentleitner (https://about.me/oliver-zehentleitner)
# All rights reserved.

rm dev/sphinx/source/changelog.md
rm dev/sphinx/source/code_of_conduct.md
rm dev/sphinx/source/contributing.md
rm dev/sphinx/source/license.rst
rm dev/sphinx/source/readme.md
rm dev/sphinx/source/security.md

cp CHANGELOG.md dev/sphinx/source/changelog.md
cp CODE_OF_CONDUCT.md dev/sphinx/source/code_of_conduct.md
cp CONTRIBUTING.md dev/sphinx/source/contributing.md
cp README.md dev/sphinx/source/readme.md
cp SECURITY.md dev/sphinx/source/security.md

# license.rst needs a reST title
{
    echo "License"
    echo "======="
    echo ""
    echo "::"
    echo ""
    sed 's/^/    /' LICENSE
} > dev/sphinx/source/license.rst

mkdir -vp dev/sphinx/build

cd dev/sphinx
rm build/html
ln -s ../../../docs build/html
make html -d
echo "Creating CNAME file for GitHub."
echo "oliver-zehentleitner.github.io/unicorn-binance-depth-cache-cluster" > build/html/CNAME
