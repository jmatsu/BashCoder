read a
read b
set -- $b
read c
read d
[ $(echo "$b $d"|tr \  \\n|sort|uniq -c|grep -e " 1 [0-9]*\$"|wc -l) -eq $(expr 2 + $c) ] && echo "YES" || echo "NO"