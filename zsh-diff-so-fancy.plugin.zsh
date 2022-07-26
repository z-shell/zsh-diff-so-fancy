# Use as"command" (or as"program") feature of your plugin manager (like Zplug
# or ZI), this file will be then ignored. If no such feature is available
# in your plugin manager, load this plugin normally, this file will then set
# up $PATH for "git dsf" to work. This file can be also plainly sourced.

# See following web page for explanation of the line "ZERO=...":
# https://wiki.zshell.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# https://wiki.zshell.dev/community/zsh_plugin_standard#binaries-directory
if [[ $PMSPEC != *b* ]] {
  path+=( "${0:h}/bin" )
}
