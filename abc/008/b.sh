read a;tail -$a|sort|uniq -c|sort -nr|head -1|awk '1,$0=$2'