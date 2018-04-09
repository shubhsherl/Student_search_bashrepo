data=$(curl https://search.pclub.in/api/students)
echo "" >> data.json
rm data.json
echo $data |sed 's/"a":""/"a":"-,-"/g' |sed 's/""/"-"/g'|sed 's/\[{//g'|sed 's/[}\]]//g'|sed 's/},{/\n/g' >> data.json
