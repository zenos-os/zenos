#!/bin/bash
git fetch corert
git subtree pull --prefix vendor/corert corert master --squash
