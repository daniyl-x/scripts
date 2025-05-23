#!/bin/sh


RBASH_PATH="(mktemp -d)"
\mkdir "$RBASH_PATH"

# Add clear command
ln -s "$(command -v clear)" "$RBASH_PATH"

# Remove --norc to get a nice prompt
(PATH="$RBASH_PATH" "$(command -v bash)" --norc -r)

\rm -r "$RBASH_PATH"

