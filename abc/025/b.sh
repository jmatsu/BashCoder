read l
set -- $l

tail -$1|awk -v a=$2 -v b=$3 '
{
d=($2>b)?b:($2<a)?a:$2
d=($1=="East")?d:-1*d
n+=d
}
END {
  if(n==0){
    print 0
  }else{
    printf (n<0)?"West ":"East "
    print (n<0)?-1*n:n
  }
}
'