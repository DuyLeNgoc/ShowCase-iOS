#!/bin/bash
set -e

if [ "$CI" == true ]; then
    echo "CI == true, skipping this script"
    exit 0
fi

SWIFT_LINT=./Pods/SwiftLint/swiftlint

if ! [[ -e "${SWIFT_LINT}" ]]; then
    echo "${SWIFT_LINT} is not installed."
    exit 0
fi

echo "SwiftLint $(${SWIFT_LINT} version)"

if [[ $* == *--all* ]]; then
    ${SWIFT_LINT} autocorrect
    ${SWIFT_LINT} lint
    exit 0
fi

# Always lint AppDelegate to prevent "No lintable files found at paths: ''"
# caused by a combination --use-script-input-files and --force-exclude
# See https://github.com/realm/SwiftLint/issues/2619
export SCRIPT_INPUT_FILE_0="ShowCase/AppDelegate.swift"
count=1

# make for .. in work with the shitty spaces in our filenames
OIFS="$IFS"
IFS=$'\n'

# Changed files not added to stage area yet
for file_path in $(git diff --diff-filter=d --name-only | grep ".swift$"); do
    export SCRIPT_INPUT_FILE_$count=$file_path
    count=$((count + 1))
done

# Changed files added to stage area
for file_path in $(git diff --diff-filter=d --name-only --cached | grep ".swift$"); do
    export SCRIPT_INPUT_FILE_$count=$file_path
    count=$((count + 1))
done

# Newly added untracked files
for file_path in $(git ls-files --others --exclude-standard | grep ".swift$"); do
    export SCRIPT_INPUT_FILE_$count=$file_path
    count=$((count + 1))
done


if [ "$count" -ne 0 ]; then
    export SCRIPT_INPUT_FILE_COUNT=$count
    $SWIFT_LINT autocorrect --use-script-input-files --force-exclude
    $SWIFT_LINT lint --use-script-input-files --force-exclude
else
    echo "No files to lint!"
    exit 0
fi