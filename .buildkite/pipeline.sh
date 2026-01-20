#!/usr/bin/env bash

cat <<EOF | buildkite-agent pipeline upload
steps:
    - name: "🚀"
      command: "./timeout.sh"
      timeout_in_minutes: 1
      agents:
        - "queue=default"
EOF