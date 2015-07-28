read a
n=`echo "$a%30-1"|bc`
card=(1 2 3 4 5 6)

for i in `seq 0 $n`
do
  ii=`echo "$i%5"|bc`
  iii=`echo "$ii+1"|bc`

  tmp=${card[$ii]}
  card[$ii]=${card[$iii]}
  card[$iii]=$tmp
done

echo "${card[@]}"|tr -d \ 