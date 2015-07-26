read a
set -- $a
R=$1
C=$2

read b
set -- $b
X=$1
Y=$2

read c
set -- $c
D=$1
L=$2

MOD_BASE=1000000007

echo "
define min(x, y) {
  if(x < y){
    return x
  }else{
    return y
  }
}
define comb(m, n) {
  return comb_inner(m,n,0,0)
}
define comb_inner(m, n, t1, t2) {
    t1 = min(m - n, n);

    if (t1 < 0) {
        return 0;
    }

    t2=(m*(m+1))/2+t1
    if(comb_cache[t2]==0) {
      comb_cache[t2]=(comb_inner(m-1,t1,0,0)+comb_inner(m-1,t1-1,0,0))%$MOD_BASE
    }

    return comb_cache[t2];
}
define ready_cache(s) {
  for(i=0;i<s+1;i++){
    ii=(i*(i+1))/2
    comb_cache[ii]=1
    comb_cache[ii+i]=1
  }
}
scale=0
xy=$X*$Y
dpl=$D+$L
ready_cache(xy)
result=comb(xy,dpl)
x1=$X-1
x2=$X-2
y1=$Y-1
y2=$Y-2
if(xy>dpl) {
  result-=(2*comb($X*y1,dpl))
  result-=(2*comb(x1*$Y,dpl))
  result+=(4*comb(x1*y1,dpl))
  result+=comb(x2*$Y,dpl)
  result+=comb($X*y2,dpl)
  result-=(2*comb(x1*y2,dpl))
  result-=(2*comb(x2*y1,dpl))
  result+=comb(x2*y2,dpl)
  result%=$MOD_BASE
}
result*=comb(dpl,$L)
result%=$MOD_BASE
result*=(($R-x1)*($C-y1))
result%=$MOD_BASE
if(result<0) {
  result+=$MOD_BASE
}
result
"|bc|grep -v "^0$"