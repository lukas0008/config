# config.nu
#
# Installed by:
# version = "0.110.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

alias conf = cd ~/.config
alias code = cd ~/code
alias rust = cd ~/code/rust
alias c = cd ~/code/c
alias py = cd ~/code/py
alias web = cd ~/code/web
alias nv = nvim
alias proton = `~/.local/share/Steam/steamapps/common/Proton - Experimental/proton`
alias clanker = opencode

$env.config.buffer_editor = "nvim"
$env.config.show_banner = false
