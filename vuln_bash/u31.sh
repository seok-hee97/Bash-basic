#!/bin/bash

# Function to validate files in a specific path
file_chk() {
    ls -l "$1" 2>/dev/null | wc -l
}

echo "[!] U31. Spam mail relay denied check..."

cffile_chk=$(file_chk "/etc/mail/sendmail.cf")

# Check if the file exists
if [ "$cffile_chk" -ne 0 ]; then
    conf_chk=$(cat /etc/mail/sendmail.cf 2>/dev/null | grep "R$\*" | grep "Relaying denied" | grep -v "^#" | wc -l)

    # Check if the line containing the #Relaying denied option is commented out (or if the setting exists)
    if [ "$conf_chk" -eq 0 ]; then
        echo "[-] U31. Spam mail relay not denied (/etc/mail/sendmail.cf), Result: Vul"
    else
        echo "[+] U31. Spam mail relay denied, Result: Good"
    fi
else
    echo "[+] U31. Spam mail relay denied, Result: Good"
fi
