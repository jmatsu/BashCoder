read a
b=`echo "
  a=$a
  x=1;y=1;t=0
  for(t=0;y<a;t++){
    x*=2
    y=2*y+1
  }

  c=t%2

  for(m=1;t>0;t--){
    m=2*m+((t+1)%2)
  }

  if(c==0&&m<=a&&a<=y||c==1&&x<=a&&a<m){
    0
  }else{
    1
  }
"|bc`
[ $b -eq 0 ] && echo "Aoki" || echo "Takahashi"