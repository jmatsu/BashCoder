read a;
tail -$a|awk -F- '
  function ceil(num) {
      if (int(num) == num) {
          return num;
      } else if (num > 0) {
          return int(num) + 1;
      } else {
          return num;
      }
  };
  function zeroume(num) {
    out="";
    for (j=0;j<4-length(num);j++) {
      out="0" out;
    }
    return out num;
  };
  {
    $1=int($1/5)*5

    $2=int(ceil($2/5))*5

    if ($2%100==60) {
      $2=$2+40
    }

    rec[int($1)]++
    rec[int($2)]--
  }; 
  END {
    cnt=0
    for (i = 0; i <= 2400; i++) {
        if (rec[i] > 0) {
          if (cnt == 0) {
            printf "%s", zeroume(i)
          }
          cnt+=rec[i]
        }else if (rec[i] < 0) {
          cnt+=rec[i]
          if (cnt == 0) {
            printf "-%s\n", zeroume(i)
          }
        }
    }
  }'