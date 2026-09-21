# Lattiform FEA Preview Releases

Public update metadata for Lattiform FEA Preview.

This repository is deliberately separate from the private application source.
It contains only the Sparkle appcast, public release notes, and the small
GitHub Pages landing page. Signed and notarized application ZIPs belong in
GitHub Releases, not in Git history.

## Public endpoints

- Appcast before the custom domain is connected:
  `https://lattiform.github.io/fea-preview-releases/appcast.xml`
- Intended custom-domain appcast:
  `https://updates.lattiform.com/appcast.xml`
- Release archives:
  `https://github.com/Lattiform/fea-preview-releases/releases`

## Publication order

1. Build, Developer ID sign, notarize, and staple the application.
2. Generate the Sparkle archive, release notes, deltas, and appcast using the
   production Ed25519 key held in macOS Keychain.
3. Upload the full ZIP and any deltas as GitHub Release assets.
4. Verify every published HTTPS download directly.
5. Commit and publish the matching release notes.
6. Commit and publish `docs/appcast.xml` last.
7. Install the previous signed build and verify the complete update and
   relaunch path.

Never publish private Sparkle keys, Apple credentials, dSYMs, internal logs,
unsigned candidates, notarization-submission archives, or proprietary source.
