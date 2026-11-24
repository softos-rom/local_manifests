#!/bin/bash
# SoftOS: applies the open source patches in patches/<project_path_with_underscores>/NNNN-*.patch
# to a synced LineageOS 24 tree (no commits are created). Run from the root of the source tree:
#   bash .repo/local_manifests/apply-patches.sh      (or the path where this repository is checked out)
# Already applied patches are skipped; a patch that does not apply stops the script.
# Before `repo sync`, revert them with `git -C <project> apply -R <patch>` (last patch first).
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
for d in "$HERE"/patches/*/; do
  [ -d "$d" ] || continue
  proj=$(basename "$d" | tr '_' '/')
  [ -e "$proj/.git" ] || { echo "project not found: $proj (run from the source root)"; exit 1; }
  for p in "$d"*.patch; do
    if git -C "$proj" apply --reverse --check "$p" 2>/dev/null; then
      echo "already applied: $proj $(basename "$p")"
    elif git -C "$proj" apply --check "$p"; then
      git -C "$proj" apply "$p"
      echo "applied: $proj $(basename "$p")"
    else
      echo "PATCH DOES NOT APPLY: $p"; exit 1
    fi
  done
done
