awk 'NR==1 {
a=$1
b=$2
c=$3
d=$4
}
NR==2 {
k=a*$1+b*$2
s=$1+$2
if(s<d){
    print k
}else{
    print k-c*s
}
}'