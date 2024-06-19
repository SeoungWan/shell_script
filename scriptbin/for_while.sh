#!/bin/bash

cat << EOF > file1
user01 pass1
user02 pass2
user03 pass3
EOF

:<<EOF
for i in $(cat file1)
do
    echo "${i}"
done
EOF

echo "-----"

cat file1 | while read USER1 PASS1
do
    echo "$USER1:$PASS1"
done
