# Release checklist

## Candidate identity

- [ ] Clean, pinned application source commit recorded
- [ ] Marketing version recorded
- [ ] Integer build number is greater than the previous published build
- [ ] Release notes reviewed

## Apple distribution

- [ ] Developer ID Application signature verifies inside out
- [ ] Hardened Runtime and sandbox entitlements verify
- [ ] Sparkle Installer and Downloader XPC services verify
- [ ] Apple notarization is accepted
- [ ] Stapled ticket validates
- [ ] Quarantined fresh download passes Gatekeeper

## Sparkle

- [ ] Production private key remains in Keychain
- [ ] Embedded public key matches the production key
- [ ] Feed URL uses HTTPS and the final public endpoint
- [ ] Full update signature validates
- [ ] Delta signature validates when a compatible predecessor exists
- [ ] Published archive and delta URLs return the expected files
- [ ] Appcast is published only after every referenced asset

## Installed update QA

- [ ] Previous signed build discovers the update
- [ ] Stable and beta channel policy behaves as intended
- [ ] Update installs and relaunches at the expected version/build
- [ ] Existing documents and preferences remain intact
- [ ] Interrupted download recovers safely
- [ ] Tampered archive is rejected
- [ ] Temporarily unavailable feed produces a recoverable error
