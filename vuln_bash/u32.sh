#!/bin/bash

# Function to validate files in a specific path
file_chk() {
    ls -l "$1" 2>/dev/null | wc -l
}

echo "[!] U32. normal user sendmail q option enable check..."

file_chk_result=$(file_chk "/etc/mail/sendmail.cf")

# File validation
if [ "$file_chk_result" -ne 0 ]; then
    config_chk=$(grep -v '^ *#' /etc/mail/sendmail.cf | grep PrivacyOptions | grep restrictqrun | wc -l)

    # Check if restrictqurun option is set in #PrivacyOption setting
    if [ "$config_chk" -eq 0 ]; then
        echo "[-] U32. q option deny not set (/etc/mail/sendmail.cf), Result: Vul"
    else
        echo "[+] U32. q option deny set, Result: Good"
    fi
else
    echo "[+] U32. q option deny set, Result: Good"
fi
