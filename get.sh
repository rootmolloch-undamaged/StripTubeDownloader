export xs="`cat index`"
export i=0

for x in $xs; do
	echo --------- $x
	wget -O $i.txt $x

	export ys="`cat $i.txt | grep -v '#'`"
	export j=0

	echo "" > $i.mp4

	for y in $ys; do
		echo ----------------- $y
		export base=`echo $x | sed "s/\(.*[/]\).*/\1/"`
		wget -O $j.ts "$base/$y"
		cat $j.ts >> $i.mp4
		export j=$(( $j + 1 ))
	done
	
	ffmpeg -i $i.mp4 strip$i.mp4

	export i=$(( $i + 1 ))
done



