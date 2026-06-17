#!/usr/bin/env bash
# -*- coding: utf-8 -*-
#
# File: pypi/install_packaging_tools.sh
#
# Part of ‘UNICORN Binance WebSocket API’
# Project website: https://github.com/oliver-zehentleitner/unicorn-binance-depth-cache-cluster
# Github: https://github.com/oliver-zehentleitner/unicorn-binance-depth-cache-cluster
# Documentation: https://oliver-zehentleitner.github.io/unicorn-depthcache-cluster-for-binance
# PyPI: https://pypi.org/project/unicorn-depthcache-cluster-for-binance
#
# License: MIT
# https://github.com/oliver-zehentleitner/unicorn-binance-depth-cache-cluster/blob/master/LICENSE
#
# Author: Oliver Zehentleitner
#
# Copyright (c) 2024-2026, Oliver Zehentleitner (https://about.me/oliver-zehentleitner)
# All rights reserved.

set -xeuo pipefail

# python3 -m pip install --upgrade pip setuptools wheel twine tqdm
python3 -m pip install --upgrade pip setuptools wheel twine tqdm
