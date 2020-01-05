# Markdown Lint

[![CI State](https://github.com/actionshub/markdownlint/workflows/release/badge.svg)](https://github.com/actionshub/markdownlint)

A Github Action to run mdl on your files

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
