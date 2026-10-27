dirlog=../data/log-he-thong.log
diroutput=../backup/bao-cao-su-co.txt
echo "=== Báo cáo sự cố - SmartFarm ===" > $diroutput
now=$(date "+%Y-%m-%d_%H-%M-%S")
echo "Bây giờ là $now" >> $diroutput
cat $dirlog | grep -E "CRITICAL|ERROR" >> $diroutput
echo "TONG SO SU CO: $(grep -c -E "CRITICAL|ERROR" $dirlog)" >> $diroutput
