#!/bin/bash

mkdir ._actionshub_problem-matchers
cp /markdownlint.json ._actionshub_problem-matchers/markdownlint.json
echo "##[add-matcher]._actionshub_problem-matchers/markdownlint.json"
output=$(mdl $INPUT_PATH)
exit_code=$?

echo "$output"

# See https://github.community/t5/GitHub-Actions/set-output-Truncates-Multiline-Strings/td-p/37870
output="${output//'%'/'%25'}"
output="${output//$'\n'/'%0A'}"
output="${output//$'\r'/'%0D'}"
echo "::set-output name=output::$output"

exit $exit_code
