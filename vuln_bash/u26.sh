#!/bin/bash

echo "[!] U26. automountd service enable check"
AM=`ps -ef | grep 'automount\|autofs' | sed '$d'`

if [ $AM ]
	then
		echo "[-] U26. automount service enable, Result : Vul"
		echo  $AM

else
	echo "[+] U26. automount service disable, Result : Good"
fi
