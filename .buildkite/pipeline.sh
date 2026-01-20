#!/usr/bin/env bash

cat <<EOF | buildkite-agent pipeline upload
steps:
    - name: "🚀"
      command: "./timeout.sh"
      agents:
        - "queue=default"
EOF