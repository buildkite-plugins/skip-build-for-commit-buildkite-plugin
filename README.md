# skip build for commits [![Build status](https://badge.buildkite.com/c5e8fc8efd91713b2f64222a79fb65d5ac3aa5c6717956b29b.svg?branch=master)](https://buildkite.com/buildkite/plugins-shellcheck)

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) that checks if a commit is already built across different branch.

## Example

This will check all builds for the same commit and exits current job if the build is already found

```yml
steps:
  - plugins:
      - skip-build-for-commit#v1.0.0:
          buildkite_api_token: $API_TOKEN_ENV_VAR
```

## Configuration

### Required

### `API_TOKEN_ENV_VAR` (string or array of strings)

Env var for buildkite API token for API access

