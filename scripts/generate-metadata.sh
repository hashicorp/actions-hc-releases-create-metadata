#!/usr/bin/env bash
VERSION="${VERSION//v}"

curl -SsL https://github.com/kvz/json2hcl/releases/download/v0.0.6/json2hcl_v0.0.6_linux_amd64 \
| sudo tee /usr/local/bin/json2hcl > /dev/null && sudo chmod 755 /usr/local/bin/json2hcl && json2hcl -version

json2hcl -reverse < "$METADATA_FILE" > meta.json

mkdir build-artifacts

for EXTENSION in $BUILD_ARTIFACTS
do
	cp *."$EXTENSION" build-artifacts/
done

if [ "$CHANGELOG" == 'true' ]; then
	changelogurl="https://github.com/$REPO/blob/v$VERSION/CHANGELOG.md"
else
	changelogurl=""
fi

bob generate-release-metadata -metadata-file "meta.json" \
-in-dir "build-artifacts" -out-file "release-metadata-final.json" \
-changelog-url "$changelogurl" -version "$VERSION"