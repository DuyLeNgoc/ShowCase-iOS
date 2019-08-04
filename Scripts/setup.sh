#!/bin/bash
set -e

test -r ./.git/hooks/pre-commit && readonly is_existed=true
if [[ -z "${is_existed}" ]]; then 
 cp ./Scripts/swiftlint.sh ./.git/hooks/pre-commit
 chmod +x ./.git/hooks/pre-commit
fi

pod install --verbose

echo "Open the project ShowCase.xcworkspace to run"
