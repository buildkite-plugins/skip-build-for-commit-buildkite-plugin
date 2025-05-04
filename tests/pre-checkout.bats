#!/usr/bin/env bats

setup() {
    load "${BATS_PLUGIN_PATH}/load.bash"



    # you can set variables common to all tests here
    export BUILDKITE_ORGANIZATION_SLUG="test"
    export BUILDKITE_PIPELINE_SLUG="rocket"
    export BUILDKITE_COMMIT="commit123"
    export BUILDKITE_BUILD_NUMBER="42"
    export BUILDKITE_PLUGIN_SAMPLEPLUGIN_BUILDKITE_API_TOKEN="dummy_token"

    SCRIPT_DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")/.." && pwd)"
    SCRIPT="$SCRIPT_DIR/hooks/pre-checkout"

    # Stub plugin_read_config
    mkdir -p "$BATS_TEST_TMPDIR/lib"
    echo 'plugin_read_config() { echo "$BUILDKITE_PLUGIN_SAMPLEPLUGIN_BUILDKITE_API_TOKEN"; }' > "$BATS_TEST_TMPDIR/lib/plugin.bash"
}

@test "cancels if previous build with same commit but different build number exists" {
  export PATH="$BATS_TEST_TMPDIR:$PATH"

  # Mock curl: first call returns build #41 with same commit
  curl() {
    echo -e "HTTP/1.1 200 OK\r\n\r\n[{\"number\":41}]"
  }

  buildkite-agent() {
    echo "annotated"
  }

  run bash "$SCRIPT"
  assert_output --partial "already been built in build #41"
  assert_success
}