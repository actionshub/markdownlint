#!/bin/bash

mkdir ._actionshub_problem-matchers
cp /markdownlint.json ._actionshub_problem-matchers/markdownlint.json
echo "##[add-matcher]._actionshub_problem-matchers/markdownlint.json"

# in this context a blank string is an acceptable not set
if [ -n "$INPUT_FILESTOIGNOREREGEX" ]; then
  # mdl does not currently support an exclude list so we use this to have that feature
  output=$(find * -type f | grep -v -E "$INPUT_FILESTOIGNOREREGEX" | grep -i "\.md" | sed "s/^/'/;s/$/'/" | tr '\n' ' '  | xargs mdl)
else
  # use input path
  output=$(mdl "$INPUT_PATH")
fi
exit_code=$?

echo "$output"

# See https://github.com/community/community/discussions/26288
output="${output//'%'/'%25'}"
output="${output//$'\n'/'%0A'}"
output="${output//$'\r'/'%0D'}"
echo "output=$output" >> $GITHUB_OUTPUT

exit $exit_code
