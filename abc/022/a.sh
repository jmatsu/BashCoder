read a
set -- $a
tail -$1|awk -v b=$2 -v t=$3 '
{
    a+=$0
    if (b<=a&&a<=t) {
        num++
    }
}
END{
    print num
}
'