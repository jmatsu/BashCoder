awk '{
idx=0
idx2=0
a=$0
if(a%2){
    idx2++
    a--
}
while(a!=0) {
    idx++
    a=int(a/2)
}
print idx+idx2
if(idx2>0) {
    print 1
}
while(idx>0){
    idx--
    print 2
}
}'