#!/usr/bin/env bash

set -e

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

exec "$here/docker-run.sh" alpine:edge "$@"
