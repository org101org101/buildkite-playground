#!/usr/bin/env bash
set -ex

IMAGE="$1"
if [[ -z "$IMAGE" ]]; then
  echo Error: image not defined
  exit 1
fi
shift

ARGS=(
  --workdir /workspace
  --volume "$PWD:/workspace"
  --rm
  --user "$(id -u):$(id -g)"
)

exec docker run "${ARGS[@]}" -t "$IMAGE" "$@"
