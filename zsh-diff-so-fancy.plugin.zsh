# Use as"command" (or as"program") feature of your plugin manager (like Zplug
# or Zplugin), this file will be then ignored. If no such feature is available
# in your plugin manager, load this plugin normally, this file will then set
# up $PATH for "git dsf" to work. This file can be also plainly sourced.

# See following web page for explanation of the line "ZERO=...":
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

ZERO="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
local _pth="${ZERO:h}/bin"

if [[ -z "${path[(r)$_pth]}" ]]; then
    path+=( "$_pth" )
fi
