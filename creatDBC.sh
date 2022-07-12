#!/bin/bash

dbc_file="allTableDBC.DBC"

echo -e "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\" ?>" > $dbc_file
echo -e "<CFGManager>\n" >> $dbc_file
echo -e "  <CISVersion>\n    <Value>CIS Version 17.2</Value>\n  </CISVersion>\n" >> $dbc_file
echo -e "  <LastModifiedTime>543976824</LastModifiedTime>\n" >> $dbc_file
echo -e "  <AllowDuplicatePartNumbers>1</AllowDuplicatePartNumbers>\n" >> $dbc_file
echo -e "  <PartTypeDelimiter>\\</PartTypeDelimiter>\n" >> $dbc_file
echo -e "  <TransferBlankProperties>0</TransferBlankProperties>\n" >> $dbc_file
echo -e "  <AssignTempPartNoAutomatically>1</AssignTempPartNoAutomatically>\n" >> $dbc_file
echo -e "  <TempPartNumberTableName>TMPPRTS</TempPartNumberTableName>\n" >> $dbc_file
echo -e "  <TempPartNumberPrefix>TMP-</TempPartNumberPrefix>\n" >> $dbc_file
echo -e "  <MultiValuesCellDelimiter>,</MultiValuesCellDelimiter>\n" >> $dbc_file
echo -e "  <UseTopSup>0</UseTopSup>\n" >> $dbc_file
echo -e "  <DoNotStuffString>Do Not Stuff</DoNotStuffString>\n" >> $dbc_file
echo -e "  <MechPartMappingTable>MechPart Mapping Table</MechPartMappingTable>\n" >> $dbc_file
echo -e "  <Version>2457</Version>\n" >> $dbc_file
echo -e "  <DSNName>CadenceLibrary</DSNName>\n" >> $dbc_file
echo -e "  <AssistMode>1</AssistMode>\n" >> $dbc_file
echo -e "  <AutoPartTypeRefresh>1</AutoPartTypeRefresh>\n" >> $dbc_file
echo -e "  <PartNumber>0</PartNumber>\n" >> $dbc_file
echo -e "  <PartRefernce>1</PartRefernce>\n" >> $dbc_file
echo -e "  <RefDesAssoc/>\n" >> $dbc_file
echo -e "  <SelectedICASupList indx=\"0\">\n    <ICASuplierList>Allied</ICASuplierList>\n  </SelectedICASupList>\n" >> $dbc_file
echo -e "  <SelectedICASupList indx=\"1\">\n    <ICASuplierList>Digi-Key</ICASuplierList>\n  </SelectedICASupList>\n" >> $dbc_file
echo -e "  <SelectedICASupList indx=\"2\">\n    <ICASuplierList>Marshall</ICASuplierList>\n  </SelectedICASupList>\n" >> $dbc_file
echo -e "  <SelectedICASupList indx=\"3\">\n    <ICASuplierList>NUHorizons</ICASuplierList>\n  </SelectedICASupList>\n" >> $dbc_file


declare -A fieldlist
tablename=

function csv_parse() {
    local row="$1"
    local field=""
	local q="$3"
	local c="$2"
	local OIFS=IFS
	local fl=()
    local i=0
    local j=0
    
    if [[ -z "$csvrow" || "$row" =~ ^[\ ]*#+ ]]; then
        return
    fi

    if [ -n "$q" ]; then
	    IFS="$q"
	else
	    if [ -n "$c" ]; then
		    IFS="$c"
		else
		    IFS=','
			c=','
		fi
	fi
	
	read -ra fl <<< "$row"
	
	for i in ${!fl[@]}; do
	    field="${fl[i]}"
	    if [[ -n "$field" && "$field" != "$c" && "$field" =~ [^[:cntrl:]] ]]; then
		    field=${field//[[:cntrl:]]/''}
	        fieldlist[$((j++))]="$field"
			#((j += 1))
			#echo $field
		fi
	done
	IFS=OIFS
}


#csvrow=`head -n 1 table.csv`
#csv_parse "$csvrow" , \"

#for field in "${fieldlist[@]}"; do
#    echo "$field"
#done

tablefile="$1"
table_parttype_file="$2"

part_type="Manufacturer"
pcb_footprint="Footprint Ref"
schematic_part="Library Ref"
part_number="Part Number"
manufacturer="Manufacturer"
value="Value"
tolerance="Tolerance"
packagetype="Package / Case"
description="Description"

tablecfg=""
tablecfgi=0
dbfielddef=""
dbfielddefi=0

fieldname=""
dbfieldname=""
icafieldname=""
dbfieldtype=12
dbfieldprecision=255
dbfieldlength=510
dbfieldscale=32484
dbfieldradix=32484
dbfieldnullable=0
browse=0
protected=0
key=0
ignore=1
visibility=0
propertytype=0
updatepartprop=1


if [ -z "$tablefile" ]; then
    exit
fi

declare -A parttype_table_list
declare -A parttype_list

if [ -n "$table_parttype_file" ]; then

    unset parttype_table_list
    unset parttype_list
    
    OIFS=IFS
    i=0
    while IFS= read -r csvrow; do
	    if [[ -z "$csvrow" || "$csvrow" =~ ^[\ ]*#+ ]]; then
	        continue
	    fi
		
        csv_parse "$csvrow"
        tablename="${fieldlist[0]}"
        if [[ -z "$tablename" || "$tablename" == "TMPPRTS" ]]; then
            continue
        fi
        parttype_table_list[$i]="$tablename"
		field="${fieldlist[1]}"
        parttype_list[$i]=${field//[[:cntrl:]]/''}
        ((i += 1))
        #echo -e "$tablename:${fieldlist[1]}"
    done < "$table_parttype_file"
    IFS=OIFS
fi

#echo "${parttype_table_list[@]}"
#echo "${parttype_list[@]}"

#for field in "${parttype_list[@]}"; do
 #   echo "$field"
#done

#exit

function find_parttype() {
    local tn="$1" # table name
    local i=0
    
    if [ -z "$tn" ]; then
        return
    fi
    for (( i=0; i<${#parttype_table_list[@]}; i=i+1 )); do  # 设置 Part Type
        if [[ -z "${parttype_table_list[$i]}" ]]; then
            continue
        fi
        if [ "${parttype_table_list[$i]}" == "$tn" ]; then # 查找表对应的 Part Type
            part_type="${parttype_list[$i]}"
			#echo "${tn}  : ${part_type}"
            break
        fi
    done
}

function set_dbfielddef() {
    local tn="$1" # table name
    local fd="$2" # field
    local i=0

    if [[ -z "$tn" ]]; then
        return
    fi
    
    dbfieldname="$fd"
    
    if [ "$fd" == "$part_type" ]; then # Part Type
        #fieldname="$fd"
        browse=0
        key=0
        if [ "$part_type" == "$manufacturer" ]; then
		    fieldname="$manufacturer"
            ignore=0             # 属性更新到原理图
        else
		    fieldname=""
            ignore=1             # 属性不更新到原理图
        fi
        visibility=0
        propertytype=2
        updatepartprop=1

    elif [ "$fd" == "$pcb_footprint" ]; then # PCB Footprint
        fieldname='PCB Footprint'
        browse=0
        key=0
        ignore=0                # 属性更新到原理图
        visibility=0
        propertytype=4
        updatepartprop=1

    elif [ "$fd" == "$schematic_part" ]; then # Schematic Part
        fieldname=''
        browse=0
        key=0
        ignore=1                # 属性不更新到原理图
        visibility=0
        propertytype=3
        updatepartprop=1

    elif [ "$fd" == "$part_number" ]; then # Part Number
        fieldname='Part Number'
        browse=0
        key=0
        ignore=0                # 属性更新到原理图
        if [[ "${tn:0:12}" == "Capacitors -" || "${tn:0:11}" == "Inductors -" || "${tn:0:11}" == "Resistors -" ]]; then
		   key=0
           visibility=0
        else
		   key=1
           visibilty=1
        fi
        propertytype=1
        updatepartprop=1
    elif [ "$fd" == "$value" ]; then 
        fieldname='Value'
        propertytype=0
        if [[ "${tn:0:12}" == "Capacitors -" || "${tn:0:11}" == "Inductors -" || "${tn:0:11}" == "Resistors -" ]]; then
           ignore=0
		   key=1
           visibility=1
        else
           ignore=0
		   key=0
           visibilty=0
        fi
    elif [ "$fd" == "$tolerance" ]; then
        fieldname='Tolerance'
        ignore=0
    elif [ "$fd" == "$packagetype" ]; then
        fieldname='Package Type'
        ignore=0
	elif [ "$fd" == "$description" ]; then
	    fieldname="$description"
        browse=0
        key=0
        ignore=0                # 属性更新到原理图
        visibility=0
        propertytype=0
        updatepartprop=1
	else
	    if [[ "$fd" == "ComponentLink1URL" || "$fd" == "ComponentLink2URL" ]]; then
            browse=1
        else
            browse=0
        fi
		if [ "$fd" == "Comment" ]; then
		    ignore=1
		fi
		if [[ "$fd" == "ComponentLink1Description" || "$fd" == "ComponentLink1URL" || "$fd" == "ComponentLink2Description" || "$fd" == "ComponentLink2URL" || "$fd" == "ComponentLink3Description" || "$fd" == "ComponentLink3URL" || "$fd" == "ComponentLink4Description" || "$fd" == "ComponentLink4URL" || "$fd" == "ComponentLink5Description" || "$fd" == "ComponentLink5URL" || "$fd" == "ComponentLink6Description" || "$fd" == "ComponentLink6URL" ]]; then
            ignore=1
        
		elif [[ "$fd" == "Footprint Path" || "$fd" == "Footprint Path 2" || "$fd" == "Footprint Path 3" ]];then
            ignore=1
        elif [[ "$fd" == "LastUpdated" || "$fd" == "Lifecycle Status" || "$fd" == "Minimum Order" || "$fd" == "PartId" || "$fd" == "Part Status" || "$fd" == "Price" ]];then
            ignore=1
        elif [[ "$fd" == "Library Path" ]]; then
		    ignore=1
		elif [[ "$fd" == "Supplier 2" || "$fd" == "Supplier Part Number 2" || "$fd" == "Supplier 3" || "$fd" == "Supplier Part Number 3" || "$fd" == "Supplier 4" || "$fd" == "Supplier Part Number 4" || "$fd" == "Supplier 5" || "$fd" == "Supplier Part Number 5" || "$fd" == "Supplier 6" || "$fd" == "Supplier Part Number 6" ]]; then
		    ignore=1
		else
		    fieldname="$fd"
		    ignore=0
		fi
    fi
}

while IFS= read -r csvrow; do
    #echo "$csvrow"
	
	if [[ "$csvrow" =~ ^[\ ]*#+ ]]; then
	    continue
	fi
	
	unset fieldlist
    csv_parse "$csvrow" , '"'
    tablename="${fieldlist[0]}"

    if [[ -z "$tablename" || "$tablename" == "TMPPRTS" ]]; then
        continue
    fi
    echo "$tablename"
    fieldlist[0]=''
    unset ${fieldlist[0]}

    #tablecfg=""
    dbfielddef=""
    dbfielddefi=0
	part_type="Manufacturer"
	
    tablecfg="  <DbTableCfg indx=\"$((tablecfgi++))\">\n    <NewPartDB>0</NewPartDB>\n    <TableName>${tablename}</TableName>\n    <TableUsed>1</TableUsed>"
    #tablecfg="${tablecfg}    <NewPartDB>0</NewPartDB>\n"
    #tablecfg="${tablecfg}    <TableName>${tablename}</TableName>\n"
    #tablecfg="${tablecfg}    <TableUsed>1</TableUsed>"
    echo -e "$tablecfg" >> $dbc_file
	
	find_parttype "$tablename"
	
	field=''
    for field in "${fieldlist[@]}"; do
        if [[ -z "$field" || "$field" =~ [[:cntrl:]] ]]; then
            continue
        fi

        fieldname=""
        dbfieldname=""
        icafieldname=""
        dbfieldtype=12
        dbfieldprecision=255
        dbfieldlength=510
        dbfieldscale=32484
        dbfieldradix=32484
        dbfieldnullable=0
        browse=0
        protected=0
        key=0
        ignore=1
        visibility=0
        propertytype=0
        updatepartprop=1
	    
        set_dbfielddef "$tablename" "$field"

        echo -e "    <DbFieldDef indx=\"$((dbfielddefi++))\">" >> $dbc_file
        echo "      <FieldName>${fieldname}</FieldName>" >> $dbc_file
        echo "      <DBFieldName>${dbfieldname}</DBFieldName>" >> $dbc_file
        dbfielddef="      <ICAFieldName>${icafieldname}</ICAFieldName>\n      <DBFieldType>${dbfieldtype}</DBFieldType>\n      <DBFieldPrecision>${dbfieldprecision}</DBFieldPrecision>\n      <DBFieldLength>${dbfieldlength}</DBFieldLength>\n      <DBFieldScale>${dbfieldscale}</DBFieldScale>\n      <DBFieldRadix>${dbfieldradix}</DBFieldRadix>\n      <DBFieldNullable>${dbfieldnullable}</DBFieldNullable>\n      <Browse>${browse}</Browse>\n      <Protected>${protected}</Protected>\n      <Key>${key}</Key>\n      <Ignore>${ignore}</Ignore>\n      <Visibility>${visibility}</Visibility>\n      <PropertyType>${propertytype}</PropertyType>\n      <UpdatePartProp>${updatepartprop}</UpdatePartProp>"
        echo -e "${dbfielddef}" >> $dbc_file
        echo -e "    </DbFieldDef>" >> $dbc_file
        #((dbfielddefi += 1))
    done

    echo -e "  </DbTableCfg>\n" >> $dbc_file

    #((tablecfgi += 1))
done < "$tablefile"

echo -e "</CFGManager>" >> $dbc_file





















