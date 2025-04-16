# skip build for commits [![Build status](https://badge.buildkite.com/c5e8fc8efd91713b2f64222a79fb65d5ac3aa5c6717956b29b.svg?branch=master)](https://buildkite.com/buildkite/plugins-shellcheck)

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) that checks if a commit is already built across different branch and cancels a build if the commit is already built.

## Example

This will fetch all builds for the same commit for a pipeline and cancel current build if the build is already found with same commit.

```yml
steps:
  - plugins:
      - skip-build-for-commit#v1.0.0:
          read_build_token_env: API_TOKEN_ENV_VAR_NAME
```

## Configuration

### Required

### `API_TOKEN_ENV_VAR_NAME` (string)

Env var for buildkite API token for API access to read builds. Choose only read_builds as token scope.To avoid leaking your API token to buildkite.com or anyone with access to build logs, you need to avoid including it in pipeline.yml. This means it needs to be set specifically with an environment variable in an Agent hook, or made available from a previous plugin defined on the same step.



