read a
tail -$a|sort -nr|awk '{a=a+($0*$0)*(NR%2==1?1:-1)}END{printf "%.6f\n",a*atan2(0,-1)}'