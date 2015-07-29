psi-dotfiles(1) -- Bash and vim konfiguration
=============================================

## INSTALLATION
`curl -sSL https://raw.githubusercontent.com/psi-4ward/dotfiles/master/install.sh | bash -s -- [OPTIONS]`

* `-t <dir>`:
  Target directory to store the files. Default is $PWD/.dotfiles
* `-g`: Global installation using /etc/{bashrc.bashrc,vimrc,inputrc}


## ALIASES/FUNCTIONS

* `back`:
  Go to last directory
* `backup <file> [file ...]`:
  Create a copy of the files or directories and append current date-time
* `clip`:
  Copy stdin to clipboard
* `curl-head`:
  Curl GET-Request but drop the content body
* `curl-resolve IP URL`:
  Curl GET-Request but resolve Host to given IP (useful for vHost checking)
* `diff`:
  Use colordiff if installed
* `dotfiles-update`:
  Update the dotfiles
* `dotfiles-remoteinstall user@host[:port]`:
  install dotfiles using ssh on a remote machine
* `ips`:
  Show my IPs
* `listen [proc]`:
  List all TCP/UDP connections (for a given process)
* `mcd <dir>`:
  Make a directory and cd into it
* `mysqldump`:
  Mysqldump with utf8 charset
* `now`:
  Outputs current date with time
* `nowdate`:
  Outputs current date
* `pscpu`:
  Get top process eating cpu ##
* `psg <proc>`:
  Find a process by name
* `psmem`:
  Get top process eating memory
* `showhelp`:
  Show this helpscreen
* `uscp`:
  scp command but ignore KnownHostsFile
* `ussh`:
  ssh command but ignore KnownHostsFile


## Author
Christoph Wiechert <wio@psitrax.de>

LICENSE: MIT

https://github.com/psi-4ward/dotfiles
