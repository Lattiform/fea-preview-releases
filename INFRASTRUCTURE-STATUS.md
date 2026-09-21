# Update infrastructure status

Verified on 21 September 2026.

## Ready

- Public repository: `https://github.com/Lattiform/fea-preview-releases`
- GitHub Pages source: `main` branch, `/docs`
- HTTPS enforcement: enabled
- Feed: `https://lattiform.github.io/fea-preview-releases/appcast.xml`
- Feed response: HTTP 200, `application/xml`
- Feed XML: valid and intentionally contains no update items
- Production Sparkle key account: `lattiform-fea-preview-production`
- Private key custody: macOS Keychain only
- Public key: checked in as `SPARKLE-PUBLIC-KEY.txt`
- Public key decoded length: 32 bytes
- Lattiform Release configuration validation: passed for version `0.1.0`,
  build `100`, previous published build `0`, the live HTTPS feed, and the
  recorded public key

## Deliberately not published

- No unsigned candidate is attached to a GitHub Release.
- No appcast item references an unsigned or unnotarized archive.
- No dSYM, private key, Apple credential, internal log, or proprietary source
  is present in this repository.

## Remaining before the first update is offered

- Install a valid Developer ID Application identity on the release Mac.
- Configure a `notarytool` Keychain profile.
- Freeze and validate the exact application source commit.
- Build, sign, notarize, staple, and Gatekeeper-check build `100`.
- Build a strictly newer signed update, such as build `101`.
- Generate and upload the signed archives and appcast, publishing the appcast
  only after every referenced asset is reachable.
- Complete an installed build-100-to-build-101 update and recovery test.
- Optionally point `updates.lattiform.com` at GitHub Pages after adding the
  matching CNAME in GoDaddy DNS.
