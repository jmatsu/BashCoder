read a
read b
c="0"
for i in $b
do
  d=`echo "i=$i;k=0;for(;i>0&&(i%2==0||i%3==2);i--){k+=1};print k;"|bc`
  c=`expr $c + $d`
done
echo $c