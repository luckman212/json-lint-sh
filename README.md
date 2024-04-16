# json-lint-sh

A simple Bash wrapper around [jsonlint](https://github.com/zaach/jsonlint) to make it more convenient to find and pop open an editor to the exact location of the invalid JSON in a file. Just download the script, make executable and place in your `$PATH`.

On macOS you can satisfy the dependency with Homebrew

```
brew install jsonlint
```

This version of the script is written with Sublime Text in mind, adjust as needed (vim, emacs, VSCode etc) using the `$LN` and `$COL` variables.

# usage

```
json-lint.sh <filename>
```

Posted because of this HN thread: https://news.ycombinator.com/item?id=40030411
