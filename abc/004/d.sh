awk '
function abs(a){
  return (a>0)?a:-a
}
function min(a,b){
  return (a>b)?b:a
}
function max(a,b){
  return (a>b)?a:b
}
function s(p,r,g,b,i,x,y,z)
{
  x=min(p-r, -100-int(r/2))
  y=max(p+g, 100-int(b/2))
  for(i=p+g-1;i>=p;i--){
    z+=abs(i)
  }
  for(i=x+r-1;i>=x;i--){
    z+=abs(-100-i)
  }
  for(i=y+b-1;i>=y;i--){
    z+=abs(100-i)
  }
  return z
}
{
  r=$1;g=$2;b=$3
  result=30942094204709273490
  for(i=-300;i<301;i++){
    result=min(result,s(i,r,g,b))
  }
  print result
}
'