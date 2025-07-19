# Use as"command" (or as"program") feature of your plugin manager (like Zplug
# or ZI), this file will be then ignored. If no such feature is available
# in your plugin manager, load this plugin normally, this file will then set
# up $PATH for "git dsf" to work. This file can be also plainly sourced.

# See following web page for explanation of the line "ZERO=...":
# https://wiki.zshell.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Ensure consistent behavior and set recommended options
builtin emulate -L zsh ${=${options[xtrace]:#off}:+-o xtrace}
setopt extended_glob warn_create_global typeset_silent no_short_loops rc_quotes no_auto_pushd

# Check if diff-so-fancy is installed
if ! command -v diff-so-fancy >/dev/null 2>&1; then
  print -Pr "%F{yellow}Warning: zsh-diff-so-fancy plugin loaded, but 'diff-so-fancy' command not found in PATH.%f" >&2
  print -Pr "%F{yellow}Please install diff-so-fancy: https://github.com/so-fancy/diff-so-fancy#installation%f" >&2
  return 1
fi

# Create the variables in the correct scope using typeset
# This prevents them from leaking into the global namespace
# Reference: https://github.com/z-shell/zsh-diff-so-fancy/issues/30
() {
  # Default options for `less` used by `fancy-diff`.
  # Users can override this by setting FANCY_DIFF_LESS_OPTS in their zshrc.
  typeset -g FANCY_DIFF_LESS_OPTS="${FANCY_DIFF_LESS_OPTS:---tabs=4 -FRXSi}"

  # Default options for `less` used by `git-dsf`.
  # Users can override this by setting GIT_DSF_LESS_OPTS in their zshrc.
  typeset -g GIT_DSF_LESS_OPTS="${GIT_DSF_LESS_OPTS:---tabs=4 -FRXSi}"
}

# https://wiki.zshell.dev/community/zsh_plugin_standard#binaries-directory
if [[ $PMSPEC != *b* ]] {
  path+=( "${0:h}/bin" )
}

# Optional unload function
zsh_diff_so_fancy_plugin_unload() {
  if [[ $PMSPEC != *b* ]]; then
    # Remove the bin path if it was added by this plugin.
    # This reconstructs the path based on $0, relying on its initial normalization.
    path=( "${(@)path:#${0:h}/bin}" )
  fi

  # Unset the global variables if they were set by this plugin
  # Note: We avoid unsetting if they might have been set by the user
  unset FANCY_DIFF_LESS_OPTS GIT_DSF_LESS_OPTS 2>/dev/null

  # Clean up the function itself
  unfunction zsh_diff_so_fancy_plugin_unload
}
