# .aliases_zsh

#   -----------------------------
#   1.  MAKE TERMINAL BETTER
#   -----------------------------

alias e='nvim' # Shorter Vim command because reasons
alias vs='code'
alias mod='git diff --name-only origin/trunk'
alias ls='exa'
alias l='exa -a'
alias ll='exa -lgh'
alias la='exa -lagh'
alias lt='exa -T'
alias lg='exa -lagh --git'
alias cp='cp -iv'       # Preferred 'cp' implementation
alias mv='mv -iv'       # Preferred 'mv' implementation
alias mkdir='mkdir -pv' # Preferred 'mkdir' implementation
# alias ll='ls -FGlAhp'                            # Preferred 'ls' implementation
alias less='less -FSRXc'         # Preferred 'less' implementation
alias cd..='cd ../'              # Go back 1 directory level (for fast typers)
alias ..='cd ../'                # Go back 1 directory level
alias ...='cd ../../'            # Go back 2 directory levels
alias .3='cd ../../../'          # Go back 3 directory levels
alias .4='cd ../../../../'       # Go back 4 directory levels
alias .5='cd ../../../../../'    # Go back 5 directory levels
alias .6='cd ../../../../../../' # Go back 6 directory levels
alias ~="cd ~"                   # ~: Go Home
alias c='clear'                  # c: Clear terminal display
# alias which='type -all'                          # which: Find executables
alias path='echo -e ${PATH//:/\\n}'       # path: Echo all executable Paths
alias show_options='shopt'                # Show_options: display bash options settings
alias fix_stty='stty sane'                # fix_stty: Restore terminal settings when screwed up
alias cic='set completion-ignore-case On' # cic: Make tab-completion case-insensitive
alias xclip='xclip -i'
alias ts2date="perl -wE 'say scalar(gmtime(shift() >> 32))'"
alias aptup="sudo apt-get update && sudo apt-get upgrade"
alias audioswap="~/GitLocal/scripts/audio-switch.sh"
alias kubectx="kubectl ctx"

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias numFiles='echo $(ls -1 | wc -l)' # numFiles: Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'    # make1mb: Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'    # make5mb: Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat' # make10mb: Creates a file of 10mb size (all zeros)

#   ---------------------------
#   2.  SEARCHING
#   ---------------------------

alias qfind="find . -name " # qfind: Quickly search for file

#   ---------------------------
#   3.  PROCESS MANAGEMENT
#   ---------------------------

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
alias ttop="top -R -F -s 10 -o rsize"

#   ---------------------------
#   3.  NETWORKING
#   ---------------------------

alias myip='wget http://ipinfo.io/ip -qO -'       # myip: Public facing IP Address
alias netCons='lsof -i'                           # netCons: Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'          # flushDNS: Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'           # lsock: Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP' # lsockU: Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP' # lsockT: Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'            # ipInfo0: Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'            # ipInfo1: Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'      # openPorts: All listening connections
alias showBlocked='sudo ipfw list'                # showBlocked: All ipfw rules inc/ blocked IPs

#   ---------------------------------------
#   4.  SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------

alias mountReadWrite='/sbin/mount -uw /' # mountReadWrite:   For use when booted into single-user

#   ---------------------------------------
#   5.  MISC CONFIG
#   ---------------------------------------

alias sshnds='/opt/scripts/nds-ssh.sh'
alias oplogin='eval $(op signin my)\r'
