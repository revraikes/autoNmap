#!/bin/bash

echo "What is the IP/range?:"
read IPR
echo -e "What do you want to call the file?\n(No spaces or slashes):"
read FN

FILE=nmap_"$FN"_$(date +%F).csv
DIP() {
grep "Nmap scan report" <n.tmp | while
 read a b c d e
do
 echo $e, >>IP
done
}
MAC() {
grep "MAC Address" <n.tmp | while 
 read a b c d
do
 echo $c, >>MAC
 echo $d >>MODEL
done
}

echo -e "Query made from $(hostname),IP range: $IPR\nIP,MAC,MODEL" >$FILE
sudo nmap -sP $IPR >n.tmp
DIP
MAC
sed -i '/_gateway/d' IP
sed -i 's/(//' MODEL
sed -i 's/)//' MODEL
array=( $(cat IP | head -n -1) )
array2=( $(<MAC) )
array3=( $(cat MODEL | tr -s ' ' '_' ) )
for i in "${!array[@]}"; do
    printf "%s%s%s\n" "${array[i]}" "${array2[i]}" "${array3[i]}" | tr -s '_' ' ' >>$FILE
done
rm IP MAC MODEL n.tmp
echo -e "Your file is at $(pwd)/$FILE \nDo you want to open it? [Y/N]":
read YN
if [[ $YN = "Y" ]] || [[ $YN = "y" ]]
  then xdg-open $FILE &
else
  echo "Well, you know where to find it when you want it"
fi

