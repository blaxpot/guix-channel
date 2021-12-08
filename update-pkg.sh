#!/usr/bin/env sh

CODE_DIR="${HOME}/code/"

for REPO in blax-st; do
  GIT_HASH=$(git -C "${CODE_DIR}${REPO}" log -n 1 --format=format:"%H")
  GUIX_HASH=$(guix hash --hash=sha256 --format=nix-base32 -rx "${CODE_DIR}${REPO}")
  echo "${CODE_DIR} ${GIT_HASH} ${GUIX_HASH}"
  sed -i "s/(commit \"[0-9a-f]\{40\}\")/(commit \"${GIT_HASH}\")/g" "blaxpot/packages/${REPO}.scm"
  sed -i "s/(base32 \".\+\")/(base32 \"${GUIX_HASH}\")/g" "blaxpot/packages/${REPO}.scm"
done

