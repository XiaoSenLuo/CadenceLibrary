#!/usr/bin/bash

steppath=
psmpath=
padpath=
devpath=
step_facet_path=

root_path=`pwd`
root_path=${root_path:1}
root_path="${root_path:0:1}:${root_path:1}"
#echo $root_path

package_dir=`ls -F Package | grep [/] | sed 's/\///g'`

tdir=

echo "psmpath:"
for tdir in $package_dir
do
  psmpath="$psmpath $root_path/Package/$tdir"
  step_facet_path="$step_facet_path $root_path/Package/$tdir/stepFacetFiles4Map"
  echo "$root_path/Package/$tdir"
done
echo "steppath:"
for tdir in `ls -F Step3D | grep [/] | sed 's/\///g'`
do
  steppath="$steppath $root_path/Step3D/$tdir"
  echo "$root_path/Step3D/$tdir"
done

padpath="$root_path/Padstack"
devpath="$root_path/Device"

echo "set steppath = $steppath" > evn_path.txt
echo "set psmpath = $psmpath" >> evn_path.txt
echo "set step_facet_path = $step_facet_path" >> evn_path.txt
echo "set padpath = $padpath" >> evn_path.txt
echo "set devpath = $devpath" >> evn_path.txt

root_path=${root_path////\\}
#echo $root_path

echo "[Allegro Footprints]"
echo "[Allegro Footprints]" > Capture.txt
i=0
echo "Dir${i}=$root_path\\Package" >> Capture.txt
echo "Dir${i}=$root_path\\Package"
for tdir in $package_dir
do
  i=$((i+1))
  echo "Dir${i}=$root_path\\Package\\$tdir" >> Capture.txt
  echo "Dir${i}=$root_path\\Package\\$tdir"
done


symbol_dir=`ls -F Symbol | grep [/] | sed 's/\///g' | grep -v '.*-PSpiceFiles'`

echo -e "\n\n\n\n\n[Part Library Directories]\n" >> Capture.txt
i=0
echo "[Part Library Directories]"
echo "Dir${i}=$root_path\\Symbol" >> Capture.txt
echo "Dir${i}=$root_path\\Symbol"
for tdir in $symbol_dir
do
  i=$((i+1))
  echo "Dir${i}=${root_path}\\Symbol\\${tdir}" >> Capture.txt
  echo "Dir${i}=${root_path}\\Symbol\\${tdir}"
done

#echo -e "$symbol_path" >> Capture.txt
