#!/bin/bash

#ls "$1" > dir.txt

root_path=`pwd`
root_path=${root_path:1}
root_path="${root_path:0:1}:${root_path:1}"
echo $root_path

if [ -n "$1" ]; then
  ldir=`ls "$1"`
  tdir=
  ldir=${ldir//' '/''}
#  echo $ldir > dir.txt
#  "$ldir" | sed 's/[\n]/ /g'
  for tdir in $ldir; do
#    tdir=${tdir//' '/''}
    echo "创建文件夹: $tdir"
	mkdir -p "$tdir"
  done
fi
