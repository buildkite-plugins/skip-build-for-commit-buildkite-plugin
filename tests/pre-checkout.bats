#!/usr/bin/env bats

load "$BATS_PLUGIN_PATH/load.bash"
export read_build_token_env="value"
export BUILDKITE_COMMIT="1234567890abcdef1234567890abcdef12345678"
export BUILDKITE_ORGANIZATION_SLUG="my-org"
export BUILDKITE_PIPELINE_SLUG="my-pipeline"

@test "Runs successfully" {
  set $read_build_token_env="value"
  

  run "$PWD/hooks/pre-checkout"

  assert_success

}