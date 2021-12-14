#!/usr/bin/env sh

# For each package file, check CODE_DIR for a repo with the same name and update it's git-fetch
# parameters to the currently checked out version of the codebase if found.

CODE_DIR="${HOME}/code/"

for FILE in $(ls -1 blaxpot/packages); do
  REPO=${FILE%.scm}
  [ ! -d "${CODE_DIR}${REPO}" ] && continue
  GIT_HASH=$(git -C "${CODE_DIR}${REPO}" log -n 1 --format=format:"%H")
  GUIX_HASH=$(guix hash --hash=sha256 --format=nix-base32 -rx "${CODE_DIR}${REPO}")
  echo "${CODE_DIR}${REPO} : commit ${GIT_HASH} base32 ${GUIX_HASH}"
  sed -i "s/(commit \"[0-9a-f]\{40\}\")/(commit \"${GIT_HASH}\")/g" "blaxpot/packages/${FILE}"
  sed -i "s/(base32 \".\+\")/(base32 \"${GUIX_HASH}\")/g" "blaxpot/packages/${FILE}"
done

