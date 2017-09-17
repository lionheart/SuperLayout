#!/usr/bin/env bash

# Copyright 2016-2017 Lionheart Software LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Usage: ./bump_version.sh 3.6.4

if [ "$1" != "" ]; then
    pod spec lint --quick

    sed -i "" "s/\(s.version[ ]*=[ ]\).*/\1 \"$1\"/g" SuperLayout.podspec
    sed -i "" "s/tree\/[\.0-9]*/tree\/$1/g" .jazzy.yaml

    sh generate_docs.sh

    git add .
    git commit -m "bump version to $1"

    # Delete tag if already exists
    git tag -d $1
    git push origin master :$1

    git tag $1
    git push origin master
    git push --tags
    pod trunk push
fi

