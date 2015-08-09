tail -1|rev|sed 's/\(.\)/\1 /g'|tr \  \\n|awk '
BEGIN { x=0;i=0 }
{
  if($0=="+"){
    x++
  }else if($0=="-"){
    x--
  }else if($0=="M"){
    m[i]=x
    i++
  }
}
END {
  mm=1000000000
  for(j=0;j<i;j++){
    if(mm>m[j]){ mm=m[j] }
    print m[j]
  }
  print mm-1" "i
}
'|sort -n|awk '
BEGIN { e=1000000000000 }
NR==1 { e=$2/2+1 }
1<NR&&NR<=e { s+=$0 }
e<NR { t+=$0 }
END { print t-s }
'