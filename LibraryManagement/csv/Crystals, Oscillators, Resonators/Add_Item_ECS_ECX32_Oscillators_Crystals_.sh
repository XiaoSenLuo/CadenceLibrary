# "Comment","ComponentLink1Description","ComponentLink1URL","ComponentLink2Description","ComponentLink2URL","ComponentLink3Description","ComponentLink3URL","ComponentLink4Description","ComponentLink4URL","ComponentLink5Description","ComponentLink5URL","ComponentLink6Description","ComponentLink6URL","Description","Device Package","ESR (Equivalent Series Resistance)","Footprint Path","Footprint Path 2","Footprint Path 3","Footprint Ref","Footprint Ref 2","Footprint Ref 3","Frequency","Frequency Stability","Frequency Tolerance","Height - Seated (Max)","LastUpdated","Lifecycle Status","Load Capacitance","Manufacturer","Part Number","Minimum Order","Mounting Type","Operating Mode","Operating Temperature","Package / Case","Packaging","PartId","Part Status","Price","Ratings","Series","Size / Dimension","Supplier 1","Supplier Part Number 1","Supplier 2","Supplier Part Number 2","Supplier 3","Supplier Part Number 3","Supplier 4","Supplier Part Number 4","Supplier 5","Supplier Part Number 5","Supplier 6","Supplier Part Number 6","Library Path","Library Ref","Type","Value"

_Head="\"Comment\",\"ComponentLink1Description\",\"ComponentLink1URL\",\"ComponentLink2Description\",\"ComponentLink2URL\",\"ComponentLink3Description\",\"ComponentLink3URL\",\"ComponentLink4Description\",\"ComponentLink4URL\",\"ComponentLink5Description\",\"ComponentLink5URL\",\"ComponentLink6Description\",\"ComponentLink6URL\",\"Description\",\"Device Package\",\"ESR (Equivalent Series Resistance)\",\"Footprint Path\",\"Footprint Path 2\",\"Footprint Path 3\",\"Footprint Ref\",\"Footprint Ref 2\",\"Footprint Ref 3\",\"Frequency\",\"Frequency Stability\",\"Frequency Tolerance\",\"Height - Seated (Max)\",\"LastUpdated\",\"Lifecycle Status\",\"Load Capacitance\",\"Manufacturer\",\"Part Number\",\"Minimum Order\",\"Mounting Type\",\"Operating Mode\",\"Operating Temperature\",\"Package / Case\",\"Packaging\",\"PartId\",\"Part Status\",\"Price\",\"Ratings\",\"Series\",\"Size / Dimension\",\"Supplier 1\",\"Supplier Part Number 1\",\"Supplier 2\",\"Supplier Part Number 2\",\"Supplier 3\",\"Supplier Part Number 3\",\"Supplier 4\",\"Supplier Part Number 4\",\"Supplier 5\",\"Supplier Part Number 5\",\"Supplier 6\",\"Supplier Part Number 6\",\"Library Path\",\"Library Ref\",\"Type\",\"Value\""

_Comment="=Value"
_ComponentLink1Description="Datasheet"
_ComponentLink1URL='https://atta.szlcsc.com/upload/public/pdf/source/20200102/C435190_15FDBCBB9AFFC535735183D95BE2AF57.pdf'
_ComponentLink2Description="SZLCSC"
_ComponentLink2URL=
_ComponentLink3Description=
_ComponentLink3URL=
_ComponentLink4Description=
_ComponentLink4URL=
_ComponentLink5Description=
_ComponentLink5URL=
_ComponentLink6Description=
_ComponentLink6URL=
_Description="CRYSTAL ${_Frequency}MHz 20PF SMD"
_DevicePackage=
_ESREquivalentSeriesResistance=
_FootprintPath=
_FootprintPath2=
_FootprintPath3=
_FootprintRef="OSCCC320X250X100L75X100N"
_FootprintRef2=
_FootprintRef3=
_Frequency=
_FrequencyStability="±20ppm"
_FrequencyTolerance="±20ppm"
_HeightSeatedMax="0.035 (0.90mm)"
_LastUpdated=
_LifecycleStatus=
_LoadCapacitance="20PF"
_Manufacturer="ECS"
_PartNumber=
_MinimumOrder=1
_MountingType="Surface Mount"
_OperatingMode=
_OperatingTemperature="-20°C ~ 70°C"
_PackageCase="4-SMD, No Lead"
_Packaging="TapeAndReel"
_PartId=
_PartStatus=
_Price=
_Ratings=
_Series="ECX-32"
_SizeDimension="0.126 L x 0.098 W (3.20mm x 2.50mm)"
_Supplier1=
_SupplierPartNumber1=
_Supplier2=
_SupplierPartNumber2=
_Supplier3=
_SupplierPartNumber3=
_Supplier4=
_SupplierPartNumber4=
_Supplier5=
_SupplierPartNumber5=
_Supplier6=
_SupplierPartNumber6=
_LibraryPath=
_LibraryRef='oscillators\Crystal'
_Type="MHz Crystal"
_Value=$_Frequency

csvfile="ecs_ecx-32.csv"

freq=(8.000 10.000 12.000 12.288 14.31818 14.7456 16.000 18.432 19.200 19.6608 20.000 24.000 24.576 25.000 26.000 27.000 30.000 32.000 36.000 40.000 48.000)
Abbreviation=(80 100 120 122.8 143 147.4 160 184 192 196 200 240 245.7 250 260 270 300 320 360 400 480)
esr=(400 100 100 100 100 100 80 80 80 80 60 40 40 40 40 40 40 40 40 40 40)


echo $_Head > ${csvfile}

i=0
for fre in ${freq[@]}; do
  _Description="CRYSTAL ${fre}MHz 20PF SMD"
  _PartNumber="ECS-${Abbreviation[i]}-20-33-JGN-TR"
  _Frequency=$fre
  _Value="${fre}MHz"
  _ESREquivalentSeriesResistance=${esr[i]}
  
  i=$(( i+1 ))
  
  echo $_Description,$_PartNumber,$_ESREquivalentSeriesResistance Ohms
  item="\"$_Comment\",\"$_ComponentLink1Description\",\"$_ComponentLink1URL\",\"$_ComponentLink2Description\",\"$_ComponentLink2URL\",\"$_ComponentLink3Description\",\"$_ComponentLink3URL\",\"$_ComponentLink4Description\",\"$_ComponentLink4URL\",\"$_ComponentLink5Description\",\"$_ComponentLink5URL\",\"$_ComponentLink6Description\",\"$_ComponentLink6URL\",\"$_Description\",\"$_DevicePackage\",\"$_ESREquivalentSeriesResistance\",\"$_FootprintPath\",\"$_FootprintPath2\",\"$_FootprintPath3\",\"$_FootprintRef\",\"$_FootprintRef2\",\"$_FootprintRef3\",\"$_Frequency\",\"$_FrequencyStability\",\"$_FrequencyTolerance\",\"$_HeightSeatedMax\",\"$_LastUpdated\",\"$_LifecycleStatus\",\"$_LoadCapacitance\",\"$_Manufacturer\",\"$_PartNumber\",\"$_MinimumOrder\",\"$_MountingType\",\"$_OperatingMode\",\"$_OperatingTemperature\",\"$_PackageCase\",\"$_Packaging\",\"$_PartId\",\"$_PartStatus\",\"$_Price\",\"$_Ratings\",\"$_Series\",\"$_SizeDimension\",\"$_Supplier1\",\"$_SupplierPartNumber1\",\"$_Supplier2\",\"$_SupplierPartNumber2\",\"$_Supplier3\",\"$_SupplierPartNumber3\",\"$_Supplier4\",\"$_SupplierPartNumber4\",\"$_Supplier5\",\"$_SupplierPartNumber5\",\"$_Supplier6\",\"$_SupplierPartNumber6\",\"$_LibraryPath\",\"$_LibraryRef\",\"$_Type\",\"$_Value\""
  echo ${item} >> ${csvfile}
done
