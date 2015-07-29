read a
awk -v a=$a '{
  c=a-$0
  d=$0-a
  c=((c<0)?c+10:c)
  d=((d<0)?d+10:d)
  print (d<c)?d:c
}'