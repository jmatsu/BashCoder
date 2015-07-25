read a
set -- $a
c=0
while read b; do
  c=`echo "scale=10;($c+$b)/2"|bc`
done < <(tail -1|tr " " "\n"|sort -n|tail -$2)
echo $c