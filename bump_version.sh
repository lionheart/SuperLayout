#!/bin/bash

if [ "$1" != "" ]; then
  git tag -d $1
  sed -i "" "s/\(s.version[ ]*=[ ]\).*/\1 \"$1\"/g" SuperLayout.podspec
  git add .
  git commit -m "bump version to $1"
  git tag $1
  git push origin master
  git push --tags --force
  pod trunk push
fi
