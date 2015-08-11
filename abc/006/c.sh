awk '
{
  M=$2
  s=$2-$1*2
  for(i=s%2;!(x<0||y<0||z<0||2*x+3*y+4*z==M);i+=2){
    y=i
    z=(s-i)/2
    x=$1-y-z
  }
}
END{
  if(x<0||y<0||z<0||2*x+3*y+4*z!=M){
    x=-1
    y=-1
    z=-1
  }
  print x" "y" "z
}
'