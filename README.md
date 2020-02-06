# Markdown Lint

[![CI State](https://github.com/actionshub/markdownlint/workflows/release/badge.svg)](https://github.com/actionshub/markdownlint)

A Github Action to run mdl on your files

## Inputs

### `path`

Path to scan for markdown files within the directory (and nested directories) `mdl`

## Outputs

### `output`

The output from `mdl`

## Usage
```yaml
name: markdownlint

on: [push, pull_request]

jobs:
  delivery:

    runs-on: ubuntu-latest

    steps:
    - name: Check out code
      uses: actions/checkout@master
    - name: Run mdl
      uses: actionshub/markdownlint@master
```
