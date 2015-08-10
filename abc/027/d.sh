rev|sed 's/\(.\)/\1 /g'|tr \  \\n|awk '
BEGIN { x=0;i=0;m=0 }
{
  if($0=="+"){
    x++
  }else if($0=="-"){
    x--
  }else if($0=="M"){
    if(m>x)m=x
    print x
    i++
  }
}
END { print m-1" "i/2+1 }
'|sort -n|awk '
BEGIN { s=0;e=1 }
NR==1 { e=$2 }
1<NR&&NR<=e { s-=$0 }
e<NR { s+=$0 }
END { print s }
'