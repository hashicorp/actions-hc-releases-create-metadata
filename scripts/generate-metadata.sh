#!/usr/bin/env bash
# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0


set -euo pipefail

VERSION="${VERSION//v}"
DESTDIR="${HOME}/bin"

mkdir -p "$DESTDIR"
curl --silent --show-error --fail --location -o "${DESTDIR}/json2hcl" \
    https://github.com/kvz/json2hcl/releases/download/v0.0.6/json2hcl_v0.0.6_linux_amd64
chmod 755 "${DESTDIR}/json2hcl"
export PATH="${PATH}:$DESTDIR"
json2hcl -version

json2hcl -reverse < "$METADATA_FILE" > meta.json

if [ "$CHANGELOG" == 'true' ]; then
	changelogurl="https://github.com/${PRODUCT_REPO:-REPO}/blob/v$VERSION/CHANGELOG.md"
else
	changelogurl=""
fi

# Remove the .json and .yaml files created by goreleaser in the artifact
# directory; we don't publish those
/bin/rm -f \
    "$ARTIFACT_DIR"/artifacts.json \
    "$ARTIFACT_DIR"/metadata.json \
    "$ARTIFACT_DIR"/config.yaml
find "$ARTIFACT_DIR" -type d -mindepth 1 -maxdepth 1 -print0 \
    | xargs -0 /bin/rm -rf

bob generate-release-metadata -metadata-file "meta.json" \
-in-dir "$ARTIFACT_DIR" -out-file "release-metadata-final.json" \
-changelog-url "$changelogurl" -version "$VERSION"
