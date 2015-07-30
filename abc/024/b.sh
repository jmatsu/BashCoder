read a
set -- $a
tail -$1|awk -v b=$2 '
{
  if(p!=0){
    if(p<$0){
      a+=b
    }else{
      a+=($0-p+b)
    }
  }
  p=$0+b
}
END{
print a+b
}'