#!/usr/bin/bash

steppath=
psmpath=
padpath=
devpath=
step_facet_path=

root_path=`pwd`
root_path=${root_path:1}
root_path="${root_path:0:1}:${root_path:1}"
echo $root_path

package_dir=`ls -F Package | grep [/] | sed 's/\///g'`

tdir=
for tdir in $package_dir
do
  psmpath="$psmpath $root_path/Package/$tdir"
  step_facet_path="$step_facet_path $root_path/Package/$tdir/stepFacetFiles4Map"
done

for tdir in `ls -F Step3D | grep [/] | sed 's/\///g'`
do
  steppath="$steppath $root_path/Step3D/$tdir"
done

padpath="$root_path/Padstack"
devpath="$root_path/Device"

echo "set steppath = $steppath" > evn_path.txt
echo "set psmpath = $psmpath" >> evn_path.txt
echo "set step_facet_path = $step_facet_path" >> evn_path.txt
echo "set padpath = $padpath" >> evn_path.txt
echo "set devpath = $devpath" >> evn_path.txt

root_path=${root_path////\\}
echo $root_path

echo "[Allegro Footprints]" > Capture.txt
i=0
echo "Dir${i}=$root_path\\Package" >> Capture.txt
for tdir in $package_dir
do
  i=$((i+1))
  echo "Dir${i}=$root_path\\Package\\$tdir" >> Capture.txt
done
