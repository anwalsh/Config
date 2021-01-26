# .functions_zsh

    em() {
        emacsclient -n -e "(if (> (length (frame-list)) 1) 't)" 2> /dev/null | grep t &> /dev/null
        if [ "$?" -eq "1" ]; then
            emacsclient -a '' -nqc "$@" &> /dev/null
        else
            emacsclient -nq "$@" &> /dev/null
        fi
    }

    fromEpoch() {
        date -u -d @$(  echo "("$1" + 500) / 1000" | bc)
    }

# mans: Search manpage given in agument '1' for term given in argument '2' (case insensitive)
# displays paginated result with colored search terms and two lines surrounding each hit. Example: mans mplayer codec
#   --------------------------------------------------------------------
    mans () {
        man $1 | grep -iC2 --color=always $2 | less
    }

#   always list directory contents upon 'cd'
#   ------------------------------------------------------------
    cd() { builtin cd "$@"; exa -lagh; }

#   mcd: Makes new Dir and jumps inside
#   ------------------------------------------------------------
    mcd () { mkdir -p "$1" && cd "$1"; }

#   -------------------------------
#   1.  FILE AND FOLDER MANAGEMENT
#   -------------------------------

    zipf () { zip -r "$1".zip "$1" ; }              # zipf: To create a ZIP archive of a folder

#   extract: Do the needful
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }
    # extract() {
    #     local c e i

    #     (($#)) || return

    #     for i; do
    #         c=''
    #         e=1

    #         if [[ ! -r $i ]]; then
    #             echo "$0: file is unreadable: \`$i'" >&2
    #             continue
    #         fi

    #         case $i in
    #             *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
    #                    c=(bsdtar xvf);;
    #             *.7z)  c=(7z x);;
    #             *.Z)   c=(uncompress);;
    #             *.bz2) c=(bunzip2);;
    #             *.exe) c=(cabextract);;
    #             *.gz)  c=(gunzip);;
    #             *.rar) c=(unrar x);;
    #             *.xz)  c=(unxz);;
    #             *.zip) c=(unzip);;
    #             *)     echo "$0: unrecognized file extension: \`$i'" >&2
    #                    continue;;
    #         esac

    #         command "${c[@]}" "$i"
    #         ((e = e || $?))
    #     done
    #     return "$e"
    # }

#   ---------------------------
#   2.  SEARCHING
#   ---------------------------

    ff () { /usr/bin/find . -name "$@" ; }          # ff: Find file under the current directory
    ffs () { /usr/bin/find . -name "$@"'*' ; }      # ffs: Find file whose name starts with a given string
    ffe () { /usr/bin/find . -name '*'"$@" ; }      # ffe: Find file whose name ends with a given string

#   ---------------------------
#   3.  PROCESS MANAGEMENT
#   ---------------------------

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
    findPid () { lsof -t -c "$@" ; }


#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
    my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

#   ---------------------------
#   4.  NETWORKING
#   ---------------------------


#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }
