#!/bin/bash

HELP() {
cat << EOF
명령을 간략하게 표시할 수 있습니다. 명령은 다음과 같습니다.

!               delete          literal         prompt          send
?               debug           ls              put             status
append          dir             mdelete         pwd             trace
ascii           disconnect      mdir            quit            type
bell            get             mget            quote           user
binary          glob            mkdir           recv            verbose
bye             hash            mls             remotehelp
cd              help            mput            rename
close           lcd             open            rmdir  

EOF
}

LS() {
    ls -l
}

ERROR() {
    echo "올바르지 않은 명령입니다."
}

while true
do
    echo -n "ftp> "
    read CMD

    [ -z "$CMD" ] && continue
    case $CMD in
        'help') HELP  ;;
        'quit') break ;;
        'ls'  ) LS    ;;
        *) ERROR      ;;
    esac
done
echo
