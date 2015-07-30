read a
tail -$a|awk '{
if(arr[$0]!=null){
    num++
}
arr[$0]=1
}
END{
    print num
}
'