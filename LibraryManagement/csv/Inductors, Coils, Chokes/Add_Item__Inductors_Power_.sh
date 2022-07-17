# "Comment","ComponentLink1Description","ComponentLink1URL","ComponentLink2Description","ComponentLink2URL","ComponentLink3Description","ComponentLink3URL","ComponentLink4Description","ComponentLink4URL","ComponentLink5Description","ComponentLink5URL","ComponentLink6Description","ComponentLink6URL","Current Rating (Amps)","Current - Saturation","DC Resistance (DCR)","Description","Device Package","Features","Footprint Path","Footprint Path 2","Footprint Path 3","Footprint Ref","Footprint Ref 2","Footprint Ref 3","Frequency - Self Resonant","Height - Seated (Max)","Inductance","Inductance Frequency - Test","LastUpdated","Lifecycle Status","Manufacturer","Part Number","Material - Core","Minimum Order","Mounting Type","Operating Temperature","Package / Case","Packaging","PartId","Part Status","Price","Q @ Freq","Ratings","Series","Shielding","Size / Dimension","Supplier 1","Supplier Part Number 1","Supplier 2","Supplier Part Number 2","Supplier 3","Supplier Part Number 3","Supplier 4","Supplier Part Number 4","Supplier 5","Supplier Part Number 5","Supplier 6","Supplier Part Number 6","Supplier Device Package","Library Path","Library Ref","Tolerance","Type","Value"

_Head="\"Comment\",\"ComponentLink1Description\",\"ComponentLink1URL\",\"ComponentLink2Description\",\"ComponentLink2URL\",\"ComponentLink3Description\",\"ComponentLink3URL\",\"ComponentLink4Description\",\"ComponentLink4URL\",\"ComponentLink5Description\",\"ComponentLink5URL\",\"ComponentLink6Description\",\"ComponentLink6URL\",\"Current Rating (Amps)\",\"Current - Saturation\",\"DC Resistance (DCR)\",\"Description\",\"Device Package\",\"Features\",\"Footprint Path\",\"Footprint Path 2\",\"Footprint Path 3\",\"Footprint Ref\",\"Footprint Ref 2\",\"Footprint Ref 3\",\"Frequency - Self Resonant\",\"Height - Seated (Max)\",\"Inductance\",\"Inductance Frequency - Test\",\"LastUpdated\",\"Lifecycle Status\",\"Manufacturer\",\"Part Number\",\"Material - Core\",\"Minimum Order\",\"Mounting Type\",\"Operating Temperature\",\"Package / Case\",\"Packaging\",\"PartId\",\"Part Status\",\"Price\",\"Q @ Freq\",\"Ratings\",\"Series\",\"Shielding\",\"Size / Dimension\",\"Supplier 1\",\"Supplier Part Number 1\",\"Supplier 2\",\"Supplier Part Number 2\",\"Supplier 3\",\"Supplier Part Number 3\",\"Supplier 4\",\"Supplier Part Number 4\",\"Supplier 5\",\"Supplier Part Number 5\",\"Supplier 6\",\"Supplier Part Number 6\",\"Supplier Device Package\",\"Library Path\",\"Library Ref\",\"Tolerance\",\"Type\",\"Value\""

_Comment='=Value'
_ComponentLink1Description='Datasheet'
_ComponentLink1URL='https://atta.szlcsc.com/upload/public/pdf/source/20200311/C492284_B3F3380E09B9B31F28DB8FDC74520E7F.pdf'
_ComponentLink2Description='SZLCSC'
_ComponentLink2URL=
_ComponentLink3Description=
_ComponentLink3URL=
_ComponentLink4Description=
_ComponentLink4URL=
_ComponentLink5Description=
_ComponentLink5URL=
_ComponentLink6Description=
_ComponentLink6URL=
_CurrentRatingAmps=
_CurrentSaturation=
_DCResistanceDCR=
_Description=
_DevicePackage='2-SMD'
_Features=
_FootprintPath=
_FootprintPath2=
_FootprintPath3=
_FootprintRef='INDC450X400X350L140N'
_FootprintRef2=
_FootprintRef3=
_FrequencySelfResonant=
_HeightSeatedMax='0.138(3.50mm)'
_Inductance=
_InductanceFrequencyTest='100KHz'
_LastUpdated=
_LifecycleStatus=
_Manufacturer='YJYCOIN(益嘉源)'
_PartNumber=
_MaterialCore='Ferrite'
_MinimumOrder='1'
_MountingType='Surface Mount'
_OperatingTemperature='-40°C ~ +125°C'
_PackageCase='2-SMD'
_Packaging='TapeAndReel'
_PartId=
_PartStatus=
_Price=
_QFreq=
_Ratings=
_Series='YP0403'
_Shielding='Unshielded'
_SizeDimension='0.177 L x 0.157 W (4.50mm x 4.00mm)'
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
_SupplierDevicePackage='YP0403 '
_LibraryPath=
_LibraryRef='INDUCTORS\Inductor'
_Tolerance='±20%'
_Type='Wirewound'
_Value=


csvfile="$1"
echo $_Head > ${csvfile}


current_rate=('3.8A' '3.3A' '2.91A' '2.6A' '2.43A' '2.15A' '1.98A' '1.7A' '1.6A' '1.41A' '1.26A' '1.15A' '1.05A' '920mA' '840mA' '760mA' '710mA' '640mA' '590mA' '540mA' '500mA' '460mA' '450mA' '440mA' '430mA' '420mA' '380mA' '360mA' '340mA' '280mA' '240mA' '210mA' '200mA' '180mA' '150mA' '140mA')

dc_resistance=('33mOhm' '38mOhm' '42mOhm' '47mOhm' '52mOhm' '76mOhm' '94mOhm' '101mOhm' '117mOhm' '132mOhm' '182mOhm' '210mOhm' '235mOhm' '338mOhm' '378mOhm' '522mOhm' '540mOhm' '587mOhm' '844mOhm' '937mOhm' '1117mOhm' '1345mOhm' '1.52Ohm' '1.8Ohm' '2.0Ohm' '3.2Ohm' '3.90Ohm' '5.30Ohm' '5.90Ohm' '6.80Ohm' '8.50Ohm' '10.0Ohm' '13.4Ohm' '15.6Ohm')

part_number_suf=('1R0' '1R5' '1R8' '2R2' '2R7' '3R3' '3R9' '4R7' '5R6' '6R8' '8R2' 100 120 150 180 220 330 390 470 560 680 820 101 121 151 181 2201 271 331 391 471 561 681 821 102)

inductance=(1.00 1.50 1.80 2.20 2.70 3.30 3.90 4.70 5.60 6.80 8.20 10.0 12.0 15.0 18.0 22.0 27.0 33.0 39.0 47.0 56.0 68.0 82.0 100 120 150 180 220 270 330 390 470 560 680 820 1000)

i=0
for part_item in "${part_number_suf[@]}"; do
    
	_CurrentRatingAmps="${current_rate[i]}"
	_CurrentSaturation="${current_rate[i]}"
	_DCResistanceDCR="${dc_resistance[i]}"
	UCURRENT="${current_rate[i]}"
	UCURRENT="${UCURRENT^^}"
	UDC="${dc_resistance[i]}"
	UDC="${UDC^^}"
	_Description="FIXED IND ${inductance[i]}UH ${UCURRENT} ${UDC} SMD"
	_Inductance="${inductance[i]}uH"
	_PartNumber="YP0403-${part_number_suf[i]}M"
	_Value="${inductance[i]}uH"
	
    item="\"$_Comment\",\"$_ComponentLink1Description\",\"$_ComponentLink1URL\",\"$_ComponentLink2Description\",\"$_ComponentLink2URL\",\"$_ComponentLink3Description\",\"$_ComponentLink3URL\",\"$_ComponentLink4Description\",\"$_ComponentLink4URL\",\"$_ComponentLink5Description\",\"$_ComponentLink5URL\",\"$_ComponentLink6Description\",\"$_ComponentLink6URL\",\"$_CurrentRatingAmps\",\"$_CurrentSaturation\",\"$_DCResistanceDCR\",\"$_Description\",\"$_DevicePackage\",\"$_Features\",\"$_FootprintPath\",\"$_FootprintPath2\",\"$_FootprintPath3\",\"$_FootprintRef\",\"$_FootprintRef2\",\"$_FootprintRef3\",\"$_FrequencySelfResonant\",\"$_HeightSeatedMax\",\"$_Inductance\",\"$_InductanceFrequencyTest\",\"$_LastUpdated\",\"$_LifecycleStatus\",\"$_Manufacturer\",\"$_PartNumber\",\"$_MaterialCore\",\"$_MinimumOrder\",\"$_MountingType\",\"$_OperatingTemperature\",\"$_PackageCase\",\"$_Packaging\",\"$_PartId\",\"$_PartStatus\",\"$_Price\",\"$_QFreq\",\"$_Ratings\",\"$_Series\",\"$_Shielding\",\"$_SizeDimension\",\"$_Supplier1\",\"$_SupplierPartNumber1\",\"$_Supplier2\",\"$_SupplierPartNumber2\",\"$_Supplier3\",\"$_SupplierPartNumber3\",\"$_Supplier4\",\"$_SupplierPartNumber4\",\"$_Supplier5\",\"$_SupplierPartNumber5\",\"$_Supplier6\",\"$_SupplierPartNumber6\",\"$_SupplierDevicePackage\",\"$_LibraryPath\",\"$_LibraryRef\",\"$_Tolerance\",\"$_Type\",\"$_Value\""

    echo $item >> ${csvfile}
    (( i += 1 ))
done
