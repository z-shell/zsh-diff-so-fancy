<h1 align="center"><p>
  <a href="https://github.com/z-shell/zi">
    <img src="https://github.com/z-shell/zi/raw/main/docs/images/logo.png" alt="Logo" width="80px" height="80px" />
  </a>
❮ Zi ❯ Plugin - zsh-diff-so-fancy
</p></h1>
<div align="center">
  <img align="center" src="https://raw.githubusercontent.com/z-shell/wiki/main/static/img/gif/zsh-diff-so-fancy.gif" alt="zsh-diff-so-fancy" width="80%" height="auto" />
</div><hr />

## The `diff-so-fancy`

The [so-fancy/diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) as Github submodule.

The plugin has `bin/git-dsf` script which adds subcommand `dsf` to `git`, and `bin/fancy-diff` to pipe the `diff` output to diff-so-fancy.

## Manual configuration

```shell
diff-so-fancy --colors        # View the commands to set the recommended colors
diff-so-fancy --set-defaults  # Configure git-diff to use diff-so-fancy and suggested colors
diff-so-fancy --patch         # Use diff-so-fancy in patch mode (interoperable with `git add --patch`)
```

```shell
# Configure git to use d-s-f for *all* diff operations
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
```

```shell
# Configure git to use d-s-f for `git add --patch`
git config --global interactive.diffFilter "diff-so-fancy --patch"
```

### Options

#### markEmptyLines

Should the first block of an empty line be colored. (Default: true)

```shell
git config --bool --global diff-so-fancy.markEmptyLines false
```

#### changeHunkIndicators

Simplify git header chunks to a more human readable format. (Default: true)

```shell
git config --bool --global diff-so-fancy.changeHunkIndicators false
```

#### stripLeadingSymbols

Should the pesky `+` or `-` at line-start be removed. (Default: true)

```shell
git config --bool --global diff-so-fancy.stripLeadingSymbols false
```

#### useUnicodeRuler

By default, the separator for the file header uses Unicode line-drawing characters. If this is causing output errors on your terminal, set this to `false` to use ASCII characters instead. (Default: true)

```shell
git config --bool --global diff-so-fancy.useUnicodeRuler false
```

#### rulerWidth

By default, the separator for the file header spans the full width of the terminal. Use this setting to set the width of the file header manually.

```shell
git config --global diff-so-fancy.rulerWidth 47    # git log's commit header width
```

## Install with [Zi](https://github.com/z-shell/zi)

The project [so-fancy/diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) integration with Zi.

Simply add two lines to `.zshrc`:

Using [bin-gem-node](https://wiki.zshell.dev/ecosystem/annexes/bin-gem-node) annex (recommended):

```shell
zi ice as'null' sbin'bin/*'
zi light z-shell/zsh-diff-so-fancy
```

Default:

```shell
zi ice as'program' pick'bin/*'
zi light z-shell/zsh-diff-so-fancy
```

This will add `diff-so-fancy`, `fancy-diff`, `git-dsf` to `$PATH` and automatically equip `git` with subcommand `dsf`.

**No need to use the system package manager or manually configure** `git`, however, if you have the following standard line in your `.gitconfig`, it will still work as expected:

```ini
[core]
	pager = diff-so-fancy | less --tabs=4 -RFX
[interactive]
	diffFilter = diff-so-fancy --patch
```

## Other plugin managers

### Zplug

```shell
zplug "z-shell/zsh-diff-so-fancy", as:command, use:"bin/"
```

### Zgen

```shell
zgen load z-shell/zsh-diff-so-fancy
```

Without `as"program"`-like functionality the `.plugin.zsh` file picks up setup
and simulates adding a command to the system, so `Zgen` and others can work.
