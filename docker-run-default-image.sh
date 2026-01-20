#!/usr/bin/env bash

set -e

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

exec "$here/docker-run.sh" anzaxyz/ci:ubuntu-22.04_rust-1.91.1_nightly-2025-09-14_819eca14 "$@"
