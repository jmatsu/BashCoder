tail -1|awk '
{
  for(i=1;i<=NF;i++){
    s+=$i
  }
  ave=int(s/NF)
  if(s%NF!=0){
    print -1
  }else if(ave==0){
    print 0
  }else{
    s=0
    ans=0
    k=0
    for(i=1;i<=NF;i++){
      s+=$i
      k+=ave
      if(s==k){
        ans+=(k/ave-1)
        k=0;s=0
      }
    }
    if(s!=0){
      print -1
    }else{
      print ans
    }
  }
}
'