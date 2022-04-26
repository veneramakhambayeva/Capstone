#!/bin/bash
DIR=/home/vm/test_dir
cp $DIR/vm_bak $DIR/vm
sed -i "s/ w//" $DIR/vmm
#cat vmm
arr=()
if [[ -n $(awk 'NF' $DIR/vmm | cut -d/ -f 2 | sort -u | grep -vw 'var' | grep -vw 'run' | grep -vw '##file_placeholder,'| grep -vw 'proc'| grep -vw 'sys') ]]; then
	awk 'NF' $DIR/vmm | cut -d/ -f 2 | sort -u | grep -vw 'var' | grep -vw 'run' | grep -vw '##file_placeholder,' | grep -vw 'proc'| grep -vw 'sys' |
		while read dir
		do
			#grep $dir $DIR/vm
			#echo $dir
			grep $dir $DIR/vmm | sed "s!  /${dir}/!!" | 
				while read line
				do
					m=$(echo $line)
					v=$(echo "${m##*/}")
					arr+=$(echo "$v")

					p=$(echo $arr)	
					vv=$(echo "[^{$p}]**")
					echo "$vv" > p.txt
				done
			i=$(cat p.txt)
			grep $dir $DIR/vm | sed "s!\*\*!${i}!" >> $DIR/vm
			sed -i "0,/${dir}/{/${dir}/d;}" $DIR/vm
		done
fi

sed -i "s/\,\}\]\*\*/\}\]\*\*/" $DIR/vm
#sed -i "s/\, /\,/g" $DIR/vm
