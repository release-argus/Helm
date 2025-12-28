#!/bin/bash
set -e

CHART_FILE="Chart.yaml"
VALUES_FILE="values.yaml"

# Extract image tag from values.yaml
IMAGE_TAG=$(yq e '.argus.image.tag' "$VALUES_FILE")

# Update appVersion in Chart.yaml
yq e -i ".appVersion = \"$IMAGE_TAG\"" "$CHART_FILE"

