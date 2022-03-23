#!/usr/bin/env bash
VERSION="${VERSION//v}"

if [ "$CHANGELOG" == 'true' ]; then
	changelogurl="https://github.com/$REPO/blob/v$VERSION/CHANGELOG.md"
else
	changelogurl=""
fi

hc-releases metadata create -product "$PRODUCT_NAME" \
-add /version='"'"$VERSION"'"' \
-add /url_changelog='"'"$changelogurl"'"' \
-input "$METADATA_FILE"
