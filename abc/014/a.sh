read a
awk -v a=$a '1,$0=(a%$0==0)?0:$0-(a%$0)'