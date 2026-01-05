#!/usr/bin/env bash
# Copyright IBM Corp. 2022, 2025
# SPDX-License-Identifier: MPL-2.0


hc-releases metadata create -product "$PRODUCT_NAME" \
-input "$METADATA_FILE"
