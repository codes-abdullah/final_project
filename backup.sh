#!/bin/bash


###############
#########TASK#1 check if args are valid as per requirements
###############
if [[ $# != 2 ]]; then
  echo "please provide target and destnation dirs"
  exit 1
elif [[ ! -d $1 ]] || [[ ! -d $2 ]]; then
  echo "the porvided dir/s are invalid or not exists"
  exit 1
fi



###############
#########TASK#2 assign args to vars
###############
from_dir=$1
to_dir=$2
original_dir=`pwd`

###############
#########TASK#3 turn (from_dir / to_dir) to absolute if they are'nt
###############
cd $1
from_dir=`pwd`

cd $original_dir

cd $2
to_dir=`pwd`


###############
#########TASK#4 create timestamps in milliseconds
###############
timestamp=$(($(date +%s%N)/1000000))
one_day_millis=86400000
yasterday_timestamp=$((timestamp-one_day_millis))

###############
#########TASK#5 create backup file name
###############
output="backup_$timestamp.tar.gz"


###############
#########TASK#6 show user current resolved args
###############
echo "backup from: $from_dir"
echo "backup to: $to_dir/$output"


###############
#########TASK#7 prompt user to continue if happy with given args
###############
while read -p "Are you sure you want to continue with given args? [Y/N] " yn; do
	case $yn in
		[Yy]*) break;;
		[Nn]*) echo "exiting.."; break;  exit 0;;
		*)echo "invalid inputs, please try again"; continue;;
	esac
done



###############
#########TASK#8 loop over files
###############
declare -a backup_files
for f in $from_dir/*; do
	###############
	#########TASK#9 find last-modified-time in milliseconds
	###############	
	last_modified=$(($(date +%s%N -r $f)/1000000))
	
	###############
	#########TASK#10 check if file has been modifed since yasterday
	###############		
	if (( last_modified > yasterday_timestamp )); then
		###############
		#########TASK#11 add modifed files only to backup list
		###############	
		backup_files+=($f)
	fi
done




###############
#########TASK#12 compress the collected files
###############
tar -czvf $output ${backup_files[@]}


###############
#########TASK#13 move backup file to $to_dir
###############
mv $output $to_dir


