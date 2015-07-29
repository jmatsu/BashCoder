read a
if [ -z "${a}" ]; then
    echo "YES"
else
    while :; do
      b=`echo $a|sed -e 's/ch$//' -e 's/o$//' -e 's/k$//' -e 's/u$//'`
      if [ "$b" = "$a" ]; then
          if [ -z "${a}" ];then
              echo "YES"
          else
              echo "NO"
          fi
          break
      else
        a=$b
      fi
    done
fi