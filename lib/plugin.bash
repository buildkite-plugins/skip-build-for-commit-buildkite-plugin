#!/bin/bash
set -euo pipefail

PLUGIN_PREFIX="SKIP_BUILD_FOR_COMMIT"


# Reads either a value or a list from plugin config
function plugin_read_list() {
  prefix_read_list "BUILDKITE_PLUGIN_${PLUGIN_PREFIX}_${1}"
}


