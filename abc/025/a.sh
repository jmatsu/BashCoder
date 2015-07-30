read a
tail -1|awk -v a=$a '{
al=length(a)
d=int($0/al)+1
i=$0%al
d=(i==0)?d-1:d
i=(i==0)?al:i
print substr(a,d,1) substr(a,i,1)
}'