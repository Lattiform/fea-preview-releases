#!/bin/bash

set -euo pipefail

feed_url="${1:-https://lattiform.github.io/fea-preview-releases/appcast.xml}"
temporary_feed="$(mktemp -t lattiform-appcast.XXXXXX)"
trap 'rm -f "${temporary_feed}"' EXIT

curl \
    --fail \
    --location \
    --proto '=https' \
    --silent \
    --show-error \
    --output "${temporary_feed}" \
    "${feed_url}"

xmllint --noout "${temporary_feed}"

if ! grep -q '<title>Lattiform FEA Preview Updates</title>' "${temporary_feed}"; then
    echo "The published feed has an unexpected title." >&2
    exit 1
fi

echo "PASS: ${feed_url} is available over HTTPS and contains valid XML."
