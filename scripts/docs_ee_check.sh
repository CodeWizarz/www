#!/usr/bin/env bash

## Check which OS the script runs from since sed behaves differently
## on macOS and Linux
if [ "$(uname)" == "Darwin" ]; then
  SED="sed -i ''"
else
  SED="sed -i"
fi

cd "$(dirname "$0")/.."

## Check if the EE docs URL is used
echo 'Checking for CE documentation URLs...'
grep --extended-regexp --recursive --binary-file=without-match '//docs.gitlab.com/ce/' data/ source/ >/dev/null 2>&1
if [ $? == 0 ]
then
  echo '✖ ERROR: Always use the EE documentation links!' >&2
  echo
  grep --extended-regexp --recursive --color=auto --line-number --binary-file=without-match '//docs.gitlab.com/ce/' data/ source/
  echo
  echo "You can run the following command to fix it:"
  echo "find source data \( -name \"*.md\" -o -name \"*.haml\" -o -name \"*.yml\" -o -name \"*.erb\" \) -print0 | xargs -0 $SED 's|//docs.gitlab.com/ce|//docs.gitlab.com/ee|g'"
  exit 1
fi

echo "✔ Linting passed"
exit 0
