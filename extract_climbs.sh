#!/bin/bash
fitdump=./Garmin-FIT/fitdump.pl
gdata=garmin_data
cdata=climb_data

for f in $gdata/*.fit; do
	ff=${f/.fit/.txt}
	echo "Converting $f to $ff" 
	test -f $ff || $fitdump $f > $ff
	gg=${f/.fit/.json}
	test -f $gg || $fitdump -print_json=1 $f > $gg
done

export LC_NUMERIC="C"
cdata1=$cdata/details
test -d $cdata1 ||mkdir -p $cdata1
for f in $gdata/*.txt; do 
	gg=${f/.txt/.climbout}
	ff=$cdata1/$(basename $gg)
	echo "Converting $f to $ff"
	test -f $ff ||cat $f |awk '/timestamp/{ts=$2}/0_5_Level_Grade/{lg1=lg;lg=$2}/0_0_Level_Name/{l=$2}/0_3_Successful/{su=$2}/0_7_Ascent/{as=$2}/total_elapsed_time/{ti=$2}/timestamp/{t=$2}/avg_heart_rate/{ahr=$2}/max_heart_rate/{mhr=$2}/0_7_Ascent/{print t,l,lg1,su,ti,ahr,mhr,as,ts}'|sed 's/"//g;s/,//g' > $ff
done

cat $cdata1/*.climbout > $cdata/climbing_data.txt

