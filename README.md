# Markdown Lint

[![CI State](https://github.com/actionshub/markdownlint/workflows/release/badge.svg)](https://github.com/actionshub/markdownlint)

A Github Action to run mdl on your files

## Inputs

### `path`

Path to scan for markdown files within the directory (and nested directories) `mdl`

### `filesToIgnoreRegex`

A regex of files you do not want scanned, note: cannot be used with `path` input

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

## Configuration

`markdownlint` can use a config file called `.mdlrc` this can be found in the [documentation](https://github.com/markdownlint/markdownlint/blob/master/docs/configuration.md)

For more complex configuration, you may wish to use a Ruby style file.
In this case, your `.mdlrc` file should contain a link to the style file:

```sh
style '.mdl.rb'
```

which can contain arbitrary Ruby code:

```rb
# Enable all rules by default
all

# Extend line length, since each sentence should be on a separate line.
rule 'MD013', :line_length => 99999

# Allow in-line HTML
exclude_rule 'MD033'

# Nested lists should be indented with four spaces.
rule 'MD007', :indent => 4
```

More information can be found in the [mdl documentation](https://github.com/markdownlint/markdownlint/blob/master/docs/creating_styles.md).

## Markdown link checker

It may also be worth looking into a [markdown link checker](https://github.com/gaurav-nelson/github-action-markdown-link-check)
