# "Absolute Pull Range (APR)","Base Resonator","Comment","ComponentLink1Description","ComponentLink1URL","ComponentLink2Description","ComponentLink2URL","ComponentLink3Description","ComponentLink3URL","ComponentLink4Description","ComponentLink4URL","ComponentLink5Description","ComponentLink5URL","ComponentLink6Description","ComponentLink6URL","Current - Supply (Max)","Description","Device Package","Footprint Path","Footprint Path 2","Footprint Path 3","Footprint Ref","Footprint Ref 2","Footprint Ref 3","Frequency","Frequency Stability","Function","Height - Seated (Max)","LastUpdated","Lifecycle Status","Manufacturer","Part Number","Minimum Order","Mounting Type","Operating Temperature","Output","Package / Case","Packaging","PartId","Part Status","Price","Ratings","Series","Size / Dimension","Spread Spectrum Bandwidth","Supplier 1","Supplier Part Number 1","Supplier 2","Supplier Part Number 2","Supplier 3","Supplier Part Number 3","Supplier 4","Supplier Part Number 4","Supplier 5","Supplier Part Number 5","Supplier 6","Supplier Part Number 6","Library Path","Library Ref","Type","Value","Voltage - Supply"

_Head="\"Absolute Pull Range (APR)\",\"Base Resonator\",\"Comment\",\"ComponentLink1Description\",\"ComponentLink1URL\",\"ComponentLink2Description\",\"ComponentLink2URL\",\"ComponentLink3Description\",\"ComponentLink3URL\",\"ComponentLink4Description\",\"ComponentLink4URL\",\"ComponentLink5Description\",\"ComponentLink5URL\",\"ComponentLink6Description\",\"ComponentLink6URL\",\"Current - Supply (Max)\",\"Description\",\"Device Package\",\"Footprint Path\",\"Footprint Path 2\",\"Footprint Path 3\",\"Footprint Ref\",\"Footprint Ref 2\",\"Footprint Ref 3\",\"Frequency\",\"Frequency Stability\",\"Function\",\"Height - Seated (Max)\",\"LastUpdated\",\"Lifecycle Status\",\"Manufacturer\",\"Part Number\",\"Minimum Order\",\"Mounting Type\",\"Operating Temperature\",\"Output\",\"Package / Case\",\"Packaging\",\"PartId\",\"Part Status\",\"Price\",\"Ratings\",\"Series\",\"Size / Dimension\",\"Spread Spectrum Bandwidth\",\"Supplier 1\",\"Supplier Part Number 1\",\"Supplier 2\",\"Supplier Part Number 2\",\"Supplier 3\",\"Supplier Part Number 3\",\"Supplier 4\",\"Supplier Part Number 4\",\"Supplier 5\",\"Supplier Part Number 5\",\"Supplier 6\",\"Supplier Part Number 6\",\"Library Path\",\"Library Ref\",\"Type\",\"Value\",\"Voltage - Supply\""

_AbsolutePullRangeAPR=
_BaseResonator="Crystal"
_Comment="Value"
_ComponentLink1Description="Datasheet"
_ComponentLink1URL='https://atta.szlcsc.com/upload/public/pdf/source/20210329/C669065_30B18CFE780D377BA4E84F6ED1951959.pdf'
_ComponentLink2Description=
_ComponentLink2URL=
_ComponentLink3Description=
_ComponentLink3URL=
_ComponentLink4Description=
_ComponentLink4URL=
_ComponentLink5Description=
_ComponentLink5URL=
_ComponentLink6Description=
_ComponentLink6URL=
_CurrentSupplyMax="5mA"
_Description="XTAL OSC XO ${Frequency}MHZ CMOS SMD"
_DevicePackage=
_FootprintPath=
_FootprintPath2=
_FootprintPath3=
_FootprintRef="OSCCC320X250X100L75X100N"
_FootprintRef2=
_FootprintRef3=
_Frequency=
_FrequencyStability="±20ppm"
_Function='Enable/Disable'
_HeightSeatedMax='0.039 (1.00mm)'
_LastUpdated=
_LifecycleStatus=
_Manufacturer='YXC'
_PartNumber=
_MinimumOrder=1
_MountingType='Surface Mount'
_OperatingTemperature='-40°C ~ 80°C, -40°C ~ 125°C'
_Output='CMOS'
_PackageCase='4-SMD, No Lead'
_Packaging='TapeAndReel'
_PartId=
_PartStatus=
_Price=
_Ratings=
_Series='YSO110TR'
_SizeDimension='0.126 L x 0.098 W (3.20mm x 2.50mm)'
_SpreadSpectrumBandwidth=
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
_LibraryRef='oscillators\XO_Crystal_4P_1T3C'
_Type='XO (Standard)'
_Value=$Frequency
_VoltageSupply='1.8V ~ 3.3V'


csvfile="yxc_ot_3325.csv"

echo $_Head > ${csvfile}

freq=(1.8432 2 2.048 3.579545 4 4.096 6 8 10 11.2896 12 12.288 13.56 14.31818 14.7456 16 18.432 20 22.1184 24 24.576 25 26 27 30 32 33.3333 37.125 38.4 40 48 50 54)

for fre in ${freq[@]}; do
  _PartNumber="OT3225${fre}MJBA4SL"
  _Description="XTAL OSC XO ${fre}MHZ CMOS SMD"
  _Value=$fre
  
  item="\"$_AbsolutePullRangeAPR\",\"$_BaseResonator\",\"$_Comment\",\"$_ComponentLink1Description\",\"$_ComponentLink1URL\",\"$_ComponentLink2Description\",\"$_ComponentLink2URL\",\"$_ComponentLink3Description\",\"$_ComponentLink3URL\",\"$_ComponentLink4Description\",\"$_ComponentLink4URL\",\"$_ComponentLink5Description\",\"$_ComponentLink5URL\",\"$_ComponentLink6Description\",\"$_ComponentLink6URL\",\"$_CurrentSupplyMax\",\"$_Description\",\"$_DevicePackage\",\"$_FootprintPath\",\"$_FootprintPath2\",\"$_FootprintPath3\",\"$_FootprintRef\",\"$_FootprintRef2\",\"$_FootprintRef3\",\"$_Frequency\",\"$_FrequencyStability\",\"$_Function\",\"$_HeightSeatedMax\",\"$_LastUpdated\",\"$_LifecycleStatus\",\"$_Manufacturer\",\"$_PartNumber\",\"$_MinimumOrder\",\"$_MountingType\",\"$_OperatingTemperature\",\"$_Output\",\"$_PackageCase\",\"$_Packaging\",\"$_PartId\",\"$_PartStatus\",\"$_Price\",\"$_Ratings\",\"$_Series\",\"$_SizeDimension\",\"$_SpreadSpectrumBandwidth\",\"$_Supplier1\",\"$_SupplierPartNumber1\",\"$_Supplier2\",\"$_SupplierPartNumber2\",\"$_Supplier3\",\"$_SupplierPartNumber3\",\"$_Supplier4\",\"$_SupplierPartNumber4\",\"$_Supplier5\",\"$_SupplierPartNumber5\",\"$_Supplier6\",\"$_SupplierPartNumber6\",\"$_LibraryPath\",\"$_LibraryRef\",\"$_Type\",\"$_Value\",\"$_VoltageSupply\""
  
  echo $item >> ${csvfile}
done

