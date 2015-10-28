#!/bin/bash
# DMA
# 27/10/2015
# check and upload dico listed on dicoLink.txt

# configuration
INPUT=dbDicoLink.txt
OLDIFS=$IFS
IFS=,

# list
Ltypes=( )
Lactive=( )
Lfilename=( )
Lurl=( )

#check no arg == help
[ $# -eq 0 ] && { ./${0##*/} -h; exit 98; }

# create list
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read type active filename url
do
	#echo "type : $type"
	Ltype+=($type)
	#echo "active : $active"
	Lactive+=($active)
	#echo "filename : $filename"
	Lfilename+=($filename)
	#echo "url : $url"
	Lurl+=($url)
done < $INPUT

while getopts "hLlDd:" option
do
case $option in

	h)
		echo "dicoLink help :"
		echo "-h to get this help"
		echo "-L list all db"
		echo "-l listall db without url"
		echo "-D Download active url"
		echo "-d <id> upload id url "
	;;
	L)
		echo "Liste all db"
		out="id Type active filename url"
		for a in "${!Ltype[@]}"
		do
			out="$out\n$a ${Ltype[$a]} ${Lactive[$a]} ${Lfilename[$a]} ${Lurl[$a]} \n"
		done
		echo -ne $out | column -t
	;;
        l)
                echo "Liste all db without url"
                out="id Type active filename"
                for a in "${!Ltype[@]}"
                do
                        out="$out\n$a ${Ltype[$a]} ${Lactive[$a]} ${Lfilename[$a]} \n"
                done
                echo -ne $out | column -t
        ;;
	D)
		echo "Download all active dico"
                for a in "${!Ltype[@]}"
                do
			if [ ${Lactive[$a]} = "1" ]
			then

				echo -e "Get ${Lfilename[$a]}"
				wget -O ${Lfilename[$a]} -q ${Lurl[$a]}
                    	fi
                done
	;;
	d)
		[ -z $OPTARG ] && { echo "-d need arg. example -d 3"; exit 99; }
		echo -e "GET ${Lfilename[$OPTARG]}"
                wget -O ${Lfilename[$OPTARG]} -q ${Lurl[$OPTARG]}
	;;
	\?)
		echo "no option selected"
	;;

esac
done







# end
IFS=$OLDIFS
