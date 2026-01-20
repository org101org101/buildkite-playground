#!/usr/bin/env bash
set -ex

IMAGE="$1"
if [[ -z "$IMAGE" ]]; then
  echo Error: image not defined
  exit 1
fi
shift

CIDFILE="$(mktemp "${TMPDIR:-/tmp}/docker-run-cid.XXXXXX")"
ARGS=(
  --workdir /workspace
  --volume "$PWD:/workspace"
  --rm
  --user "$(id -u):$(id -g)"
  --cidfile
)

cleanup() {
  if [[ -f "$CIDFILE" ]]; then
    cid="$(cat "$CIDFILE")"
    if [[ -n "$cid" ]]; then
      docker stop --time 15 "$cid" >/dev/null 2>&1 || true
    fi
    rm -f "$CIDFILE"
  fi
}

on_term() {
  cleanup
  exit 143
}

trap cleanup EXIT
trap on_term INT TERM

exec docker run "${ARGS[@]}" -t "$IMAGE" "$@"
