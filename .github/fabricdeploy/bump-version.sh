#!/usr/bin/env bash
# fabricdeploy: bump the artifact PATCH version after a successful deploy.
# Dependency-free (no jq/python). Edits VERSION, appends DEPLOY-LOG.md.
set -euo pipefail

version_file="${1:-VERSION}"
[ -f "$version_file" ] || { echo "no $version_file; skipping bump"; exit 0; }

current="$(tr -d '[:space:]' < "$version_file")"
major="${current%%.*}"; rest="${current#*.}"; minor="${rest%%.*}"; patch="${rest#*.}"
next="${major}.${minor}.$((patch + 1))"
printf '%s\n' "$next" > "$version_file"
printf 'v%s · %s · run %s\n' "$next" "$(date -u +%Y-%m-%dT%H:%M:%SZ)" "${CI_RUN_ID:-local}" >> DEPLOY-LOG.md

# Best-effort record back to the repo (orgs that block CI pushes can drop these lines).
git config user.email "fabricdeploy-bot@users.noreply.github.com" 2>/dev/null || true
git config user.name "fabricdeploy-bot" 2>/dev/null || true
git add "$version_file" DEPLOY-LOG.md 2>/dev/null || true
git commit -m "chore: deploy v${next} [skip ci]" 2>/dev/null || true
git tag "v${next}" 2>/dev/null || true
git push --follow-tags 2>/dev/null || echo "note: could not push version bump (non-fatal)"
echo "fabricdeploy: artifact version -> v${next}"
