read a
set -- $a

tail -$2|awk -v N="$1" '
    function find(num) {
        if (union[num]!=num) {
            tmp2=find(union[num]);
            union[num]=tmp2;
        }

        return union[num];
    };
    function unite(x, y) {
        left=find(x);
        right=find(y);
        if (left != right) {
            union[union[left]]=right;
        }
    };
    function same(x, y) {
        left=find(x);
        right=find(y);
        return left == right;
    };
    BEGIN {
        for(i=0;i<N;i++) {
            union[i]=i
        }
    }
    {
        if ($1 == 0) {
            unite($2,$3)
        } else {
            if (same($2, $3)) {
            print "Yes"
            }else {
            print "No"
            }
        }
    }'