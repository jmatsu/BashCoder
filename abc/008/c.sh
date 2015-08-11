read a
tail -$a|sort -n|awk '
{
  x++
  m[NR]=$0
}
END{
  for(i=1;i<=x;i++){
    for(j=1;j<=x&&m[i]>=m[j];j++){
      if(m[i]%m[j]==0){
        s++
      }
    }

    if(s%2==0){
      e+=0.5
    }else{
      e+=(int(s-1)/2+1)/s
    }

    s=0
  }

  printf "%.7f\n", e
}
'