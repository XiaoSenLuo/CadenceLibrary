#!/bin/sh

echo bash
exec < new1
i=0
while read line; do

    echo "${line}"

done
