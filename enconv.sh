#!/bin/bash

directorypresent=0
extensionpresent=0
frompresent=0
topresent=0

while [[ $# > 0 ]]
do
	key="$1"

	case $key in
	    -d|--directory)
	    directory="$2"
	    directorypresent=1
	    shift # past argument
	    ;;
	    -e|--extension)
	    extension="$2"
	    extensionpresent=1
	    shift # past argument
	    ;;
	    -f|--from)
	    from="$2"
	    frompresent=1
	    shift # past argument
	    ;;
	    -t|--to)
	    to="$2"
	    topresent=1
	    shift # past argument
	    ;;
	    *)
	    # unknown option
	    ;;
	esac
	shift # past argument or value
done

usage="Error: Directory is required. Usage: ./encconv.sh -d /home/foo/example/directory -e \".txt\" -f \"iso-8859-1\" -t \"utf-8\""

if [ $directorypresent != 1 ]; then
	echo $usage
	exit 1;
fi

if [ $extensionpresent != 1 ]; then
	echo $usage
	exit 2;
fi

if [ $frompresent != 1 ]; then
	echo $usage
	exit 3;
fi

if [ $topresent != 1 ]; then
	echo $usage
	exit 4;
fi

if [[ ${extension:0:1} != "." ]]; then
	extension="."$extension
fi

echo "Converting all files that ends with \"$extension\" from $from to $to"

for curfile in $(find "$directory" -name "*$extension")
do 
	enc="$(file -b --mime-encoding $curfile)"

	if [ "$enc" = "$from" ]; then

		# Documentation
		# http://mindspill.net/computing/linux-notes/determine-and-change-file-character-encoding/
		iconv -f $from -t $to -o $curfile.tmp $curfile
		mv $curfile.tmp $curfile
		echo "The file $curfile was converted from $enc to $to successfuly"
	fi
done
