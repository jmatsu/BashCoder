awk '
NR==1{
  T=$0
}
NR==2{
  N=$0
}
NR==3{
  for(i=1;i<=NF;i++){
    m[$i]++
  }
}
NR==4{
  M=$0
}
NR==5{
  flg=0
  msg="yes"
  for(i=1;i<=NF;i++){
    for(j=$i-T;j<=$i&&flg==0;j++){
      if(m[j]>0){
        m[j]--
        flg=1
        break
      }
    }

    if(flg==0){
      msg="no"
      break
    }

    flg=0
  }
}
END{
  print msg
}
'