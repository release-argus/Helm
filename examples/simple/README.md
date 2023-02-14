# Simple deployment
This example installs Argus in a Kubernetes cluster, with minimal values via [helmfile](https://github.com/helmfile/helmfile).

## Usage
1. Modify the `host` entry in the `helmfile.yaml` to match your Ingress configuration.
2. To apply the chart run `helmfile apply`
