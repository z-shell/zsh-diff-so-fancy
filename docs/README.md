<h1 align="center"><p>
  <a href="https://github.com/z-shell/zi">
    <img src="https://github.com/z-shell/zi/raw/main/docs/images/logo.png" alt="Logo" width="80px" height="80px" />
  </a>
❮ Zi ❯ Plugin - zsh-diff-so-fancy
</p></h1>
<div align="center">
  <p><img align="center" src="https://raw.githubusercontent.com/z-shell/wiki/main/static/img/gif/zsh-diff-so-fancy.gif" alt="zsh-diff-so-fancy" /></p>
</div><hr />

# zsh-diff-so-fancy

A simple plugin integrating [so-fancy/diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) into Zsh. It provides:

- `git dsf`: A subcommand to run Git diffs through diff-so-fancy
- `fancy-diff`: A helper to run a unified diff and beautify it with diff-so-fancy

## Quick Start

1. **Install** [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy#installation) or load it via your preferred method.
2. **Load the plugin** in your `.zshrc` or plugin manager:
   ```shell
   # Example using Zi
   zi ice as'program' pick'bin/*'
   zi light z-shell/zsh-diff-so-fancy
   ```
3. **Use** the commands:
   - `git dsf <files>` to see a diff rendered by diff-so-fancy
   - `fancy-diff <file1> <file2>` to compare two files with diff-so-fancy

## Manual Configuration

```shell
diff-so-fancy --colors        # Show recommended color config
diff-so-fancy --set-defaults  # Configure Git to use diff-so-fancy with suggested colors
diff-so-fancy --patch         # Patch mode, interoperable with `git add --patch`
```

### Git Integration

```shell
# Use diff-so-fancy for all diffs
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# Use diff-so-fancy for `git add --patch`
git config --global interactive.diffFilter "diff-so-fancy --patch"
```

### diff-so-fancy Options

- **markEmptyLines** (bool, default: true)
  Color the first block of an empty line.
- **changeHunkIndicators** (bool, default: true)
  Simplify Git header chunks to a more readable format.
- **stripLeadingSymbols** (bool, default: true)
  Remove leading `+` or `-` from lines.
- **useUnicodeRuler** (bool, default: true)
  Use Unicode line-drawing characters for file headers (disable if your terminal cannot display them).
- **rulerWidth** (int, default: full width)
  Set a fixed width for the file header separator.

### Installation with [Zi](https://github.com/z-shell/zi)

```shell
zi ice as'null' sbin'bin/*'
zi light z-shell/zsh-diff-so-fancy
```

Or:

```shell
zi ice as'program' pick'bin/*'
zi light z-shell/zsh-diff-so-fancy
```

This places `diff-so-fancy`, `fancy-diff`, and `git-dsf` in `$PATH`, adding the `dsf` subcommand to Git automatically.

## Other Plugin Managers

- **Zplug**
  ```shell
  zplug "z-shell/zsh-diff-so-fancy", as:command, use:"bin/"
  ```
- **Zgen**
  ```shell
  zgen load z-shell/zsh-diff-so-fancy
  ```
