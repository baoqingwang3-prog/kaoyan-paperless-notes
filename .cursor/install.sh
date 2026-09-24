#!/usr/bin/env bash
set -euo pipefail

# This repository is documentation only (Chinese-language prompt templates).
# The development experience is authoring and validating Markdown, so the one
# tool the environment provides is the markdownlint-cli2 linter.
#
# Install it globally into the active Node toolchain's bin directory, which is
# already on PATH. On a fresh image npm's global prefix can default to "/",
# which makes `npm install -g` fail with EACCES, so pin the prefix to the
# current Node install first. This keeps the step idempotent and self-contained.

MARKDOWNLINT_VERSION="0.23.3"

NODE_PREFIX="$(dirname "$(dirname "$(command -v npm)")")"
npm config set prefix "$NODE_PREFIX"
npm install -g "markdownlint-cli2@${MARKDOWNLINT_VERSION}"

version_banner="$(markdownlint-cli2 --version 2>&1)"
echo "markdownlint-cli2 installed: $(printf '%s\n' "$version_banner" | head -n 1)"
