#!/bin/bash


if [[ $# != 2 ]]; then
  echo "please provide target and destnation dirs"
  exit 1
elif [[ ! -d $1 ]] || [[ ! -d $2 ]]; then
  echo "the porvided dir/s are invalid or not exists"
  exit 1
fi

###############
#########TASK#1
###############
original_dir=`pwd`
cd $1
from_dir=`pwd`

cd $original_dir

cd $2
to_dir=`pwd`
#time in millis
timestamp=$(($(date +%s%N)/1000000))
#$(($(date +%s%N -r passwords01)/1000000))
output="backup_$timestamp.tar.gz"

one_day_millis=86400000
yasterday_timestamp=$((timestamp-one_day_millis))

###############
#########TASK#2
###############


declare -a backup_files
for f in $from_dir/*; do
	echo "$f"
done

###############
#########TASK#
###############


###############
#########TASK#
###############


###############
#########TASK#
###############



###############
#########TASK#
###############


###############
#########TASK#
###############


###############
#########TASK#
###############



###############
#########TASK#
###############


###############
#########TASK#
###############


###############
#########TASK#
###############



###############
#########TASK#
###############


###############
#########TASK#
###############


###############
#########TASK#
###############



###############
#########TASK#
###############


###############
#########TASK#
###############

