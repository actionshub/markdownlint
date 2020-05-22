#!/bin/bash

mkdir ._actionshub_problem-matchers
cp /markdownlint.json ._actionshub_problem-matchers/markdownlint.json
echo "##[add-matcher]._actionshub_problem-matchers/markdownlint.json"

if [ $INPUT_FILESTOIGNOREREGEX ]; then
  # mdl does not currently support an exclude list so we use this to have that feature
  output=$(find * -not -regex "$INPUT_FILESTOIGNOREREGEX" | grep -i ".md" | sed "s/^/'/;s/$/'/" | tr '\n' ' '  | xargs mdl)
else
  output=$(mdl $INPUT_PATH)
fi
exit_code=$?

echo "$output"

# See https://github.community/t5/GitHub-Actions/set-output-Truncates-Multiline-Strings/td-p/37870
output="${output//'%'/'%25'}"
output="${output//$'\n'/'%0A'}"
output="${output//$'\r'/'%0D'}"
echo "::set-output name=output::$output"

exit $exit_code
