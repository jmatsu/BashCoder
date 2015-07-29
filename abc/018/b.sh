read a
read b

tail -$b|awk -v a=$a '
function rev(str,rev_str,i) {
    for (i = length(str); i > 0; i--) {
        rev_str = rev_str substr(str, i, 1);
    }

    return rev_str;
}
{
  a=substr(a,1,$1-1) rev(substr(a,$1,$2-$1+1),"",0) substr(a,$2+1,length(a)-$2)
}
END{
  print a
}
'