#!/bin/bash

echo "[!] U27. RPC service enable check ..."

file_list=`ls -a /etc/xinetd.d`
cnt=0

for filename in ${file_list[@]}
do
    if [ $filename = "." ] || [ $filename = ".." ];then
	    continue
    fi
    check_count=`cat /etc/xienctd.d/$filename | grep disable | awk -F "=" '{print $2}' | wc -w`
    check=`cat /etc/xientd.d/$filename | grep disable | awk -F "=" '{print $2}' | grep yes | wc -w`

    if [ $check != $check_count ];then
	    echo "[-] U27.RPC service is enalbe(/etc/xinetd.d/$filename), Result: Vul"
	    cnt=`expr $cnt + 1`
    fi

done


if [ $cnt = 0 ];then
	echo "[+] U27. RPC service is disable, Result : Good"
fi
