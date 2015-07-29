read a
awk -v a=$a '
function ceil(x) {
    if (int(x)==x) {
        return x
    } else {
        return int(x)+1
    }
}
{
    sum=0
    idx=0
    for (i=0;i<a;i++) {
        if ($1!=0) {
            idx+=1
            sum+=$1
        }
        $0=substr($0,index($0,FS)+1)
    }
    print ceil(sum/idx)
}'