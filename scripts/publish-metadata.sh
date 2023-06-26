#!/usr/bin/env bash
# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0


hc-releases metadata create -product "$PRODUCT_NAME" \
-input "$METADATA_FILE"
