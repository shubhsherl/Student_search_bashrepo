var=$(
zenity --forms --title="Student Search|IITK" --text="Search" \
   --add-entry="Roll No." \
   --add-entry="Name" \
   --add-entry="Username" \
   --add-entry="Hostel" \
   --add-entry="Department" 2>/dev/null)
ro=\"$(echo $var | sed -e 's/|/\n/g'|sed -n 1p)
na=\"$(echo $var | sed -e 's/|/\n/g'|sed -n 2p)
un=\"$(echo $var | sed -e 's/|/\n/g'|sed -n 3p)
ho=\"$(echo $var | sed -e 's/|/\n/g'|sed -n 4p)
dp=\"$(echo $var | sed -e 's/|/\n/g'|sed -n 5p)
#echo $ro
out=$(cat data.json|grep -i "\"i\":$ro" |grep -i "\"n\":$na" |grep -i "\"u\":$un" |grep -i "\"h\":$ho" |grep -i "\"d\":$dp")
while read -r line li
do
	echo $line  $li |sed -e 's/[{}]/''/g' | sed s/\"//g | awk -v RS=',' -F: '$1=="i" {print $2}'
	echo $line  $li |sed -e 's/[{}]/''/g' | sed s/\"//g | awk -v RS=',' -F: '$1=="u" {print $2}'
	echo $line  $li |sed -e 's/[{}]/''/g' | sed s/\"//g | awk -v RS=',' -F: '$1=="n" {print $2}'
	echo $line  $li |sed -e 's/[{}]/''/g' | sed s/\"//g | awk -v RS=',' -F: '$1=="p" {print $2}'
	echo $line  $li |sed -e 's/[{}]/''/g' | sed s/\"//g | awk -v RS=',' -F: '$1=="d" {print $2}'
	echo $line  $li |sed -e 's/[{}]/''/g' | sed s/\"//g | awk -v RS=',' -F: '$1=="h" {print $2}'
	echo $line  $li |sed -e 's/[{}]/''/g' | sed s/\"//g | awk -v RS=',' -F: '$1=="r" {print $2}'
	echo $line  $li |sed -e 's/[{}]/''/g' | sed s/\"//g | awk -v RS=',' -F: '$1=="b" {print $2}'
	echo $line  $li |sed -e 's/[{}]/''/g' | sed s/\"//g | awk -v RS=',' -F: '$1=="g" {print $2}'
	echo $line  $li |sed -e 's/[{}]/''/g' | sed s/\"//g | awk -v RS=',' -F: '$1=="a" {print $2}'
done  <<<"$(echo -e "$out")"  | zenity --width=1000 --height=600 --list --title="Student Search|IITK" --text="Result:$var" --column="Roll No." --column="user_name" --column="Name" --column="Programme" --column="Department" --column="Hall" --column="Room" --column="Blood" --column="Gender" --column="Hometown" 2> /dev/null
