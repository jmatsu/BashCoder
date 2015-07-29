read a
set -- $a
n=$1
x=$2

awk -v n=$n -v x=$x '{
    c=0
    for (i=0;i<n;i++) {
        if (x%2==1) {
            c+=$1
        }
        x=int(x/2)
        $0=substr($0,index($0,FS)+1)
    }
    print c
}'