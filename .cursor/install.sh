#!/usr/bin/env bash
set -euo pipefail

# This repository is documentation only (Chinese-language prompt templates).
# The development experience is authoring and validating Markdown, so the one
# tool the environment provides is the markdownlint-cli2 linter.
#
# Install it globally into the active Node toolchain's bin directory, which is
# already on PATH. On a fresh image npm's global prefix can default to "/",
# which makes `npm install -g` fail with EACCES, so pass --prefix pointing at
# the current Node install for this invocation only. Using --prefix (instead of
# `npm config set prefix`) avoids writing a persistent prefix into ~/.npmrc,
# which nvm reports as incompatible. This keeps the step idempotent and clean.

MARKDOWNLINT_VERSION="0.23.3"

NODE_PREFIX="$(dirname "$(dirname "$(command -v npm)")")"
npm install -g "markdownlint-cli2@${MARKDOWNLINT_VERSION}" --prefix "$NODE_PREFIX"

version_banner="$(markdownlint-cli2 --version 2>&1)"
echo "markdownlint-cli2 installed: $(printf '%s\n' "$version_banner" | head -n 1)"
