awk 'function zeroume(num){out="";for (j=0;j<2-length(num);j++) {out="0" out;}return out num;};
1,$0=zeroume(int($0/3600))":"zeroume(int(int($0/60)%60))":"zeroume(int($0%60))'