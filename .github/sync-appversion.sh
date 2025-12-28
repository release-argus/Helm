#!/usr/bin/env bash
set -euo pipefail

CHART_FILE="Chart.yaml"
VALUES_FILE="values.yaml"

# Extract argus.image.tag from values.yaml
IMAGE_TAG=$(grep -E '^\s*tag:' "$VALUES_FILE" | head -n1 | awk '{print $2}')

if [[ -z "$IMAGE_TAG" ]]; then
    echo "Error: argus.image.tag not found in $VALUES_FILE"
    exit 1
fi

echo "Updating appVersion in $CHART_FILE to $IMAGE_TAG"

# Update appVersion in Chart.yaml
if grep -q '^appVersion:' "$CHART_FILE"; then
    if sed --version >/dev/null 2>&1; then
        sed -i "s/^appVersion:.*/appVersion: $IMAGE_TAG/" "$CHART_FILE"
    else
        sed -i '' "s/^appVersion:.*/appVersion: $IMAGE_TAG/" "$CHART_FILE"
    fi
else
    echo "Error: appVersion not found in $CHART_FILE"
fi

