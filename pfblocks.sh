#!/usr/bin/env bash

files=`ls /var/log/pf*bz2 | head -20`

cat /var/log/pflog | /usr/sbin/tcpdump -e -tttt -nr - $* 2> /dev/null

for f in $files; do
        bzcat $f | /usr/sbin/tcpdump -e -tttt -nr - $* 2> /dev/null;
done | less
