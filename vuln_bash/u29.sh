#!/bin/bash

# Function to validate files in a specific path
file_chk() {
    ls -l "$1" 2>/dev/null | wc -l
}

# Function to search for a specific process and return the number of matches
ps_chk() {
    ps aux | grep "$1" | grep -v grep | grep -v bash | wc -l
}

echo "[!] U29. tftp, talk service enable check..."

tftp_chk=$(file_chk "/usr/bin/tftp")
talk_chk=$(file_chk "/usr/bin/talk")
tftp_ps=$(ps_chk "tftp")
talk_ps=$(ps_chk "talk")

cnt=0

if [ "$tftp_chk" -ne 0 ] || [ "$tftp_ps" -ne 0 ]; then
    echo "[-] U29. tftp service enabled, Result: Vul"
    cnt=$((cnt + 1))
fi

if [ "$talk_chk" -ne 0 ] || [ "$talk_ps" -ne 0 ]; then
    echo "[-] U29. talk service enabled, Result: Vul"
    cnt=$((cnt + 1))
fi

if [ "$cnt" -eq 0 ]; then
    echo "[+] U29. tftp, talk service disabled, Result: Good"
fi
