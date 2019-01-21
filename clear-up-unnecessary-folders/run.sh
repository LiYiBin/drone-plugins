#!/bin/bash

set -e

FOLDER_PREFIX=${PLUGIN_FOLDER_PREFIX:-$FOLDER_PREFIX}
BACKUP_NUM=${PLUGIN_BACKUP_NUM:-$BACKUP_NUM}

echo --- Start: Clear folders $(date +'%Y/%m/%d %H:%M:%S')

# validate variables
if [[ -z "$FOLDER_PREFIX" || -z "$BACKUP_NUM" ]]; then
  echo 'You must have folder_prefix AND backup_num variables.'
  exit 1
fi

# filter folders
folders=$(ls | grep ^$FOLDER_PREFIX)

# sort folders
IFS=$'\n'
sorted=(`echo "${folders[*]}" | sort`)
unset IFS

# Remove unnecessary folders
folderLength=${#sorted[@]}
if [ $folderLength -gt $BACKUP_NUM ]; then
    let num=$folderLength-$BACKUP_NUM

    for i in ${sorted[@]:0:$num}; do
      echo --- Remove $i ---

      rm -rf $i
    done
else
  echo --- No any unnecessary folders
fi

echo --- End: Clear folders $(date +'%Y/%m/%d %H:%M:%S')
