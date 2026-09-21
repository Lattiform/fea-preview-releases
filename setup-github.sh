#!/bin/bash

set -euo pipefail

owner="${GITHUB_OWNER:-Lattiform}"
repository="fea-preview-releases"
full_name="${owner}/${repository}"

if ! command -v gh >/dev/null 2>&1; then
    echo "GitHub CLI is required. Install and authenticate it before rerunning." >&2
    exit 1
fi

gh auth status >/dev/null

if ! gh repo view "${full_name}" >/dev/null 2>&1; then
    gh repo create "${full_name}" \
        --public \
        --description "Public update metadata and releases for Lattiform FEA Preview" \
        --source . \
        --remote origin \
        --push
else
    expected="https://github.com/${full_name}.git"
    if git remote get-url origin >/dev/null 2>&1; then
        actual="$(git remote get-url origin)"
        if [[ "${actual}" != "${expected}" ]]; then
            echo "Existing origin is ${actual}; expected ${expected}." >&2
            exit 1
        fi
    else
        git remote add origin "${expected}"
    fi
    git push --set-upstream origin main
fi

if ! gh api "repos/${full_name}/pages" >/dev/null 2>&1; then
    gh api \
        --method POST \
        "repos/${full_name}/pages" \
        -f build_type=legacy \
        -f 'source[branch]=main' \
        -f 'source[path]=/docs' \
        >/dev/null
fi

echo "Repository: https://github.com/${full_name}"
echo "Appcast: https://${owner}.github.io/${repository}/appcast.xml"
