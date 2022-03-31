#!/usr/bin/env bash
VERSION="${VERSION//v}"

curl -SsL https://github.com/kvz/json2hcl/releases/download/v0.0.6/json2hcl_v0.0.6_linux_amd64 \
| sudo tee /usr/local/bin/json2hcl > /dev/null && sudo chmod 755 /usr/local/bin/json2hcl && json2hcl -version

json2hcl -reverse < "$METADATA_FILE" > meta.json

if [ "$CHANGELOG" == 'true' ]; then
	changelogurl="https://github.com/$REPO/blob/v$VERSION/CHANGELOG.md"
else
	changelogurl=""
fi

# XXX we don't support JSON artifacts yet; RDX-400
/bin/rm -f "$ARTIFACT_DIR"/*.json

bob generate-release-metadata -metadata-file "meta.json" \
-in-dir "$ARTIFACT_DIR" -out-file "release-metadata-final.json" \
-changelog-url "$changelogurl" -version "$VERSION"
