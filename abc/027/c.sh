read a
b=`echo "
  scale=0;n=$a;x=1
  for(b=n+1;b>1;){
    b=(b+x)/2
    x=(x+1)%2
  }

  x
"|bc`
[ $b -eq 0 ] && echo "Aoki" || echo "Takahashi"