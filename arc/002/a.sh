function is_uruu() {
  local year=$1
  local a
  local b
  local c

  let "a=year%400"
  let "b=year%100"
  let "c=year%4"

  [ $a -eq 0 -o ! $b -eq 0 -a $c -eq 0 ] && echo "YES" || echo "NO"
}

read a
is_uruu $a