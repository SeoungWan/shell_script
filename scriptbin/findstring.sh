if [ $# -ne 2 ]; then
    echo "Usage: $0 <pattern> <filename>"
    exit 1
fi
PATTERN=$1
FILE=$2

: << EOF
if grep $PATTERN $FILE >/dev/null 2>&1 ; then
    echo "[  OK  ] Pattern found in $FILE."
else
    echo "[ WARN ] Pattern not found in $FILE."
fi  
EOF

grep $PATTERN $FILE >/dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "[  OK  ] Pattern found in $FILE."
else
    echo "[ WARN ] Pattern not found in $FILE."
fi
