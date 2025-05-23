#!/bin/sh


RBASH_PATH="(mktemp -d)"
\mkdir "$RBASH_PATH"

# Add required commands
ln -s "$(command -v clear)" "$RBASH_PATH"

# Add all commands passed as arguments to this script
err=": failed to link"
for cmd in "$@"; do
    if [ "$cmd" == "$0" ]; then
        continue
    fi
    ln -s "$(command -v $cmd)" "$RBASH_PATH" &> /dev/null || echo "$cmd$err"
done

# Remove --norc to get a nice prompt
(PATH="$RBASH_PATH" "$(command -v bash)" --norc -r)

\rm -r "$RBASH_PATH"

