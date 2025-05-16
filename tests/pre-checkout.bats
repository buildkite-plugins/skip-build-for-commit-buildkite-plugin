#!/usr/bin/env bats

load "$BATS_PLUGIN_PATH/load.bash"

setup() {
    export BUILDKITE_PLUGIN_SKIP_BUILD_FOR_COMMIT_BUILD_TOKEN_ENV="value"
    export BUILDKITE_COMMIT="1234567890abcdef1234567890abcdef12345678"
    export BUILDKITE_ORGANIZATION_SLUG="my-org"
    export BUILDKITE_PIPELINE_SLUG="my-pipeline"
}



@test "Runs successfully" {
    export BUILDKITE_PLUGIN_SKIP_BUILD_FOR_COMMIT_BUILD_TOKEN_ENV="READ_TOKEN"

    unset BUILDKITE_PLUGIN_SKIP_BUILD_FOR_COMMIT_BUILD_TOKEN_ENV

    run "$PWD/hooks/pre-checkout"

    assert_failure
    assert_output --partial 'Missing mandatory option'
    refute_output --partial 'Running plugin'

}