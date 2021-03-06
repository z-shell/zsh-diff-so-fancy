<h2 align="center">
  <a href="https://github.com/z-shell/zi">
    <img src="https://github.com/z-shell/zi/raw/main/docs/images/logo.svg" alt="Logo" width="80" height="80" />
  </a>
❮ ZI ❯ Plugin - zsh-diff-so-fancy
</h2>

<div align="center">
  <img src="img/zsh-diff-so-fancy.gif" alt="zsh-diff-so-fancy" width="70%" height="70%" />
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

## Install with ❮ ZI ❯

The project [so-fancy/diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) integration with ZI.

With this [ZI](https://github.com/z-shell/zi) plugin, you simply add two lines to `.zshrc`:

```shell
zi ice as"program" pick"bin/git-dsf"
zi light z-shell/zsh-diff-so-fancy
```

This will install `diff-so-fancy` on every account where you use Z shell and automatically equip `git` with subcommand `dsf`.

No need to use the system package manager and to configure `git`.

 Of course, if you have the following standard line in your `.gitconfig`, it will still work normally:

```
[core]
pager = diff-so-fancy | less -FXRi
```

> because this plugin adds `diff-so-fancy` to `$PATH`.

Think about Puppet or Chef,  i.e. about a declarative approach to system configuration.

In this case `.zshrc` is like a declarative setup guarding you will have `diff-so-fancy` on your accounts.

## Other plugin managers

```zsh
# Zplug
zplug "z-shell/zsh-diff-so-fancy", as:command, use:"bin/"

# Zgen
zgen load z-shell/zsh-diff-so-fancy
```

Without `as"program"`-like functionality the `.plugin.zsh` file picks up setup
and simulates adding a command to the system, so `Zgen` and others can work.
