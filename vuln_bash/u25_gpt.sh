#!/bin/bash

# Check if NFS service is running
nfs_status=$(systemctl is-active nfs.service 2>/dev/null)
if [ "$nfs_status" != "active" ]; then
  echo "NFS service is not running."
  exit 0
fi

# Check if NFS configuration file exists
nfs_config_file="/etc/exports"
if [ ! -f "$nfs_config_file" ]; then
  echo "NFS configuration file not found: $nfs_config_file"
  exit 0
fi

# Check if NFS configuration file contains 'everyone' share
everyone_share=$(grep -E "^\s*/\s+" "$nfs_config_file")
if [ -n "$everyone_share" ]; then
  echo "Vulnerable: 'everyone' share found in NFS configuration file."
  exit 1
fi

echo "No NFS access control issues found."
exit 0
