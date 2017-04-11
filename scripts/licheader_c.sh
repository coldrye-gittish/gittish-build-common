#!/bin/sh

TPL_DIR=$(dirname $0)/../templates

LIC=$(cat $TPL_DIR/lic_header_c.txt | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/\\n/g' | sed 's/"/LICDQUOTE/g')

while [ $# -gt 0 ]; do
  FILE=$1
  sed -i "s%// TBD:LICENSE%${LIC}%" $FILE
  sed -i 's/LICDQUOTE/"/g' $FILE
  shift
done

