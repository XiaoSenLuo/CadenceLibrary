#!/bin/bash


pwdpath=`pwd`
lspath="$pwdpath/table"
csvlist=`ls -F "$lspath" | grep ".csv"`

csvfile=
fildlist=
for csvfile in $csvlist; do
    echo "解析文件头:$csvfile"
	headtxt=`head -1 "$lspath/$csvfile"`
	csvhead=`echo ${headtxt} | sed -E 's/["]/\\\"/g'`
    fildlist=`echo $headtxt | sed -E 's/[^0-9a-zA-Z"",]//g'`
    shfile=`echo "$csvfile" | sed -E 's/(.csv)//g'`
    shfile="Add_Item_${shfile}.sh"
    if test -a $shfile; then
        rm $shfile
    fi
    echo -e "# ${headtxt}\n" > $shfile
    IFS=","
    item=
    itemfild=
    for fild in $fildlist; do
        IFS=
        fildva=`echo $fild | sed -E 's/[""]//g'`
        fildva="_${fildva}"
        itemfild="${itemfild}${fildva}=\n"
        item="${item},\\\"\$${fildva}\\\""
    done
    echo "生成模板..."
   
    echo -e "_Head=\"${csvhead}\"\n" >> $shfile 
    echo -e "$itemfild" >> $shfile
    item=${item:1}
    echo -e "item=\"${item}\"" >> $shfile
    echo -e '\n\n\necho $_Head > ${csvfile}\n\n\n\n\necho $item >> ${csvfile}\n' >> $shfile
	
    IFS=
done



