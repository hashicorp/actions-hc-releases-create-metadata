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
