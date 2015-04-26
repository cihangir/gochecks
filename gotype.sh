#!/bin/bash
if [[ -z "$GOFILES" ]]; then
    GOFILES=./go/src/socialapi/*/**/**
fi

# echo $GOFILES
found=""
for i in $(ls -d $GOFILES);
do
    if [ -d $i ]; then
        v=$(./go/bin/gotype -e -seq $i 2>&1)
        if [ -n "$v" ]; then
            #log it
            ./go/bin/gotype -e -seq $i
            found="found"
        fi
    fi
done;
if [[ -n "$found" ]]; then exit 1; fi
