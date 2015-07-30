read a

[ $(echo "$a%2"|bc) -eq 0 ] && echo "-1" && exit 0

read b

[ "$b" = "b" ] && echo "0" && exit 0

x="b"
idx=0
ans="-1"
while [ ${#x} -lt ${#b} ]; do
x="a${x}c"
idx=$(echo "${idx}+1"|bc)
[ "$x" = "$b" ] && ans=$idx && break
x="c${x}a"
idx=$(echo "${idx}+1"|bc)
[ "$x" = "$b" ] && ans=$idx && break
x="b${x}b"
idx=$(echo "${idx}+1"|bc)
[ "$x" = "$b" ] && ans=$idx && break
done

echo $ans