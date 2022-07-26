<h1 align="center"><p>
  <a href="https://github.com/z-shell/zi">
    <img src="https://github.com/z-shell/zi/raw/main/docs/images/logo.svg" alt="Logo" width="80px" height="80px" />
  </a>
❮ ZI ❯ Plugin - zsh-diff-so-fancy
</p></h1>

<div align="center">
  <img align="center" src="img/zsh-diff-so-fancy.gif" alt="zsh-diff-so-fancy" width="80%" height="auto" />
</div>

## The `diff-so-fancy`

```diff
──────────────────────────────────────────────────────────────────────────────────────────────────────
modified: .github/lighthouse/lighthouserc.json
──────────────────────────────────────────────────────────────────────────────────────────────────────
@ .github/lighthouse/lighthouserc.json:11 @
    "collect": {
-     "skipAudits":
-       [
-         "robots-txt",
-         "canonical",
-       ]
+     "skipAudits": ["robots-txt", "canonical"]
    }
  }
```

## A Few Details

The [so-fancy/diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) is cloned from Github as a submodule.

The plugin has `bin/git-dsf` script which adds subcommand `dsf` to git, that's everything needed:

- The convenient way of installing (single Zsh plugin manager invocation)
- Updating (Zsh plugin managers can easily update)
- Integrating with `git`

## Options

### Improved colors for the highlighted bits

```shell
git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.func       "146 bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"
```

### markEmptyLines

Should the first block of an empty line be colored. (Default: true)

```shell
git config --bool --global diff-so-fancy.markEmptyLines false
```

### changeHunkIndicators

Simplify git header chunks to a more human readable format. (Default: true)

```shell
git config --bool --global diff-so-fancy.changeHunkIndicators false
```

### stripLeadingSymbols

Should the pesky `+` or `-` at line-start be removed. (Default: true)

```shell
git config --bool --global diff-so-fancy.stripLeadingSymbols false
```

### useUnicodeRuler

By default, the separator for the file header uses Unicode line-drawing characters. If this is causing output errors on your terminal, set this to `false` to use ASCII characters instead. (Default: true)

```shell
git config --bool --global diff-so-fancy.useUnicodeRuler false
```

### rulerWidth

By default, the separator for the file header spans the full width of the terminal. Use this setting to set the width of the file header manually.

```shell
git config --global diff-so-fancy.rulerWidth 47    # git log's commit header width
```

## Install with [Zi](https://github.com/z-shell/zi)

The project [so-fancy/diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) integration with Zi.

Simply add two lines to `.zshrc`:

```zsh
zi ice as"program" pick"bin/git-dsf"
zi light z-shell/zsh-diff-so-fancy
```

This will install `diff-so-fancy` on every account where you use Z shell and automatically equip `git` with subcommand `dsf`. No need to use the system package manager and to configure `git`. Of course, if you have the following standard line in your `.gitconfig`, it will still work normally:

```ini
[core]
	pager = diff-so-fancy | less --tabs=4 -RFX
[interactive]
	diffFilter = diff-so-fancy --patch
```

> because this plugin adds `diff-so-fancy` to `$PATH`.

Think about Puppet or Chef, i.e. about a declarative approach to system configuration. In this case `.zshrc` is like a declarative setup guarding you will have `diff-so-fancy` on your accounts.

## Other plugin managers

### Zplug

```zsh
zplug "z-shell/zsh-diff-so-fancy", as:command, use:"bin/"
```

### Zgen

```zsh
zgen load z-shell/zsh-diff-so-fancy
```

Without `as"program"`-like functionality the `.plugin.zsh` file picks up setup
and simulates adding a command to the system, so `Zgen` and others can work.
