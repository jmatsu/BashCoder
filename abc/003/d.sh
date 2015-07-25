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

echo ""|awk -M -v R=$R -v C=$C -v X=$X -v Y=$Y -v D=$D -v L=$L '
function bit_or_e(x, y) {
  if(y==1) {
    return 1+2*int(x/2)
  }
  if(y==2) {
    return 2+4*int(x/4)+x%2
  }
  if(y==4) {
    return 4+8*int(x/8)+(x%4)
  }
  if(y==8) {
    return 8+(x%8)
  }
  return 0
}
function mod_inv(a,b,b0,t,q,x0,x1) {
    b0 = b
    x0 = 0
    x1 = 1
    if (b == 1) {
      return(1)
    }
    while (a > 1) {
      q = int(a / b)
      t = b
      b = int(a % b)
      a = t
      t = x0
      x0 = x1 - q * x0
      x1 = t
    }
    if (x1 < 0) {
      x1 += b0
    }
    return(x1)
}
function min(x, y) {
    return (x < y)?x:y
}
function comb(m, n, i,ans,min_) {
    if (m < n) {
        return 0;
    }
    
    ans = 1;
    min_ = min(m - n, n);

    if (min_ == 0) {
        return 1;
    }

    for (i = 1; i <= min_; i++) {
        ans *= m - i + 1
        ans %= MOD_BASE
        ans *= mod_inv(i, MOD_BASE)
        ans %= MOD_BASE
    }

    return ans;
}
BEGIN {
  MOD_BASE=1000000007
  result=((R-X+1)*(C-Y+1))%MOD_BASE
  cmb=comb(D+L,min(D,L))
  result*=cmb
  result%=MOD_BASE
  dp[0,0]=1
  end1=X*Y
  end2=D+L+1
  end3=2^4
  for(i=0;i<end1;i++) {
    for(j=0;j<end2;j++) {
      for(k=0;k<end3;k++) {
        m=k
        if(i<Y){
          m=bit_or_e(m,1)
        }

        mm=i%Y

        if(mm==0){
          m=bit_or_e(m,2)
        }

        if(end1-Y<=i){
          m=bit_or_e(m,4)
        }

        if(mm==Y-1){
          m=bit_or_e(m,8)
        }

        dp2[j,k]+=dp[j,k]
        dp2[j,k]%=MOD_BASE

        dp2[j+1,m]+=dp[j,k]
        dp2[j+1,m]%=MOD_BASE
      }
    }

    for(j=0;j<end2+1;j++) {
      for(k=0;k<end3;k++) {
        dp[j,k]=dp2[j,k]
        dp2[j,k]=0
      }
    }
  }

  result*=dp[end2-1,15]
  result%=MOD_BASE
  print result
}

'