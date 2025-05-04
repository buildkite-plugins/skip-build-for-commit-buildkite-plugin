#!/bin/bash
set -euo pipefail

PLUGIN_PREFIX="SKIP_BUILD_FOR_COMMIT"


# Reads a single value
function plugin_read_config() {
  local var="BUILDKITE_PLUGIN_${PLUGIN_PREFIX}_${1}"
  local default="${2:-}"
  echo "${!var:-$default}"
}

