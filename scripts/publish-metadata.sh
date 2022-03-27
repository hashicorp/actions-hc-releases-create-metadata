#!/usr/bin/env bash

hc-releases metadata create -product "$PRODUCT_NAME" \
-input "$METADATA_FILE"
