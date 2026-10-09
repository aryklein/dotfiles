#!/usr/bin/env bash
set -euo pipefail

case "${1:-}" in
    save|edit) ;;
    *) printf 'Usage: %s {save|edit}\n' "$0" >&2; exit 2 ;;
esac

# Cancelling selection is a normal no-op.
geometry=$(slurp) || exit 0
[[ -n $geometry ]] || exit 0

if [[ $1 == save ]]; then
    directory=$HOME/Pictures
    mkdir -p -- "$directory"
    grim -g "$geometry" "$directory/$(date +%F_%H-%M-%S-%N).png"
else
    image=$(mktemp "${XDG_RUNTIME_DIR:-${TMPDIR:-/tmp}}/hypr-screenshot.XXXXXX")
    trap 'rm -f -- "$image"' EXIT
    grim -g "$geometry" "$image"
    swappy -f "$image"
fi
