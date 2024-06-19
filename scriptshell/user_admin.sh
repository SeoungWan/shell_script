#!/bin/bash

UserAdd() {
    echo "(사용자 추가)"
    echo -n "추가할 사용자 이름? : "
    read UNAME
    echo "------------------------------------"
    useradd $UNAME >/dev/null 2>&1
    [ $? -eq 0 ] && echo "[  OK  ] 정상적으로 추가 되었습니다."
    echo $UNAME | passwd --stdin $UNAME >/dev/null 2>&1
    echo "------------------------------------"
}

UserVerify() {
    PASSWD=/etc/passwd
    cat << EOF
------------------------------------
$(awk -F: '$3 >= 1000 && $3 <= 60000 {print $1 " (UID=" $3 ")"}' $PASSWD | cat -n | cut -c6-)
------------------------------------   
EOF
}

UserDel() {
    echo "(사용자 삭제)"
    echo -n "삭제할 사용자 이름? : "
    read UNAME
    echo "------------------------------------"
    userdel -r $UNAME
    [ $? -eq 0 ] && echo "[  OK  ] 정상적으로 삭제 되었습니다."
    echo "------------------------------------"
}

Error() {
    echo "다시 입력하세you~~"
}

while true
do
    cat << EOF
(관리 목록)
------------------------------------
1) 사용자 추가
2) 사용자 확인
3) 사용자 삭제
4) 종료
------------------------------------
EOF
    echo -n "선택 번호? : "
    read CHOICE
    # echo $CHOICE

    case $CHOICE in
        1) UserAdd ;;
        2) UserVerify ;;
        3) UserDel ;;
        4) break ;;
        *) Error ;;
    esac
    echo
done

