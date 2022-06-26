# "TMPPRTNO","RELPRTNO","USERNAME","CREATETIME"

_Head="\"TMPPRTNO\",\"RELPRTNO\",\"USERNAME\",\"CREATETIME\""

_TMPPRTNO=
_RELPRTNO=
_USERNAME=
_CREATETIME=

item="\"$_TMPPRTNO\",\"$_RELPRTNO\",\"$_USERNAME\",\"$_CREATETIME\""



echo $_Head > ${csvfile}




echo $item >> ${csvfile}

