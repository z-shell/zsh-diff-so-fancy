# Zsh-Diff-So-Fancy

The project [so-fancy/diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) is very
interesting, however I find it difficult to a) install it, b) hook it up to git.

For the a), I just like to install things as user, in home directory, not system-wide via
package manager. So even if the package exists (like it is in e.g. Homebrew for OS X, it
has `diff-so-fancy`), I try to not use it. Think about remote shell accounts, is it good
to ask every system administrator to install your favorite packages?

With this Zsh plugin, you simply add two lines to `.zshrc`:

```zsh
zplugin ice as"program" pick"bin/git-dsf"
zplugin light zdharma/zsh-diff-so-fancy
```

This will install `diff-so-fancy` on every account where you use Zshell, and automatically
equip `git` with subcommand `dsf`. No need to use system package manager and to configure
`git`. Of course, if you have the following standard line in your `.gitconfig`, it will
still work normally:

```
[core]
        pager = diff-so-fancy | less -FXRi
```

(because this plugin adds `diff-so-fancy` to `$PATH`).

# A Few Details

[so-fancy/diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) is cloned from
Github as submodule. The plugin has `bin/git-dsf` script which adds subcommand `dsf`
to git. That's basically everything needed: convenient way of installing (single Zsh
plugin manager invocation), updating (Zsh plugin managers can easily update) and
integrating with `git`.
