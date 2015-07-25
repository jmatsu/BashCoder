read a
set -- $a

if [ $2 -eq 0 ];then
  echo 1
else
tail -$2|awk -v N="$1" '
    function and2(x, y,  b, i, k, qx, qy) {
      k = 0
      for (i = 15; i >= 0; i--) {
      b = 2^i
      qx = int(x / b)
      qy = int(y / b)
      if (qx * qy)
        k += b
      x %= b
      y %= b
      }
      return k
    }
    function rshift2(x, y) {
      return int(x/(2^y))
    }
    function lshift2(x,y) {
      return x * (2^y)
    }
    function bitcount(num) {
      num = num - and2(rshift2(num,1) , 1431655765);
      num = and2(num , 858993459) + and2(rshift2(num, 2) , 858993459);
      num = and2(num + rshift2(num , 4) , 252645135);
      num = num + rshift2(num , 8);
      num = num + rshift2(num , 16);
      return and2(num , 63);
    }
    function bitcount_h(x, b) {
      for (b = 0; x != 0; x = and2(x, x - 1))
          b++

      return b;
    }
    END {
        max=0
        end=lshift2(1,N)
        for(i=0;i<end;i++) {
          tmp=bitcount_h(i)
          flg=0
          for(j=0;flg==0&&j<N;j++) {
            for(k=0;k<j;k++) {
              if ((rshift2(i,j)%2==1)&&((rshift2(i,k)%2)==1)&&relation[j, k]!=1) {
                flg=1
                break
              }
            }
          }

          if (flg==0) {
            if (max < tmp) {
              max=tmp
            }
          }
        }
        print max
    }
    {
        relation[$1-1, $2-1]=1
        relation[$2-1, $1-1]=1
    }'
fi