#!/bin/bash

echo " * fetching from upstream"
git fetch upstream
git merge upstream/master

echo " * updating all submodules"
git submodule update
git submodule foreach git submodule update
echo " * DONE"
