#!/bin/bash
cd `dirname $0`

args=""

for i in $(cat flavorizr.config); do
  if [ ! "`echo $i | grep ';'`" -a ! "`echo $i | grep '~'`" ]; then
    args+=$i,;
  fi
done

flutter pub run flutter_flavorizr -p ${args%,}