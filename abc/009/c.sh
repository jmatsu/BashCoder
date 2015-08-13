read a
set -- $a
tail -1|sed 's/\(.\)/\1 /g'|awk -v n=$1 -v k=$2 '
{
  alphabet="a b c d e f g h i j k l m n o p q r s t u v w x y z"
  split(alphabet, alpha)

  for(i=1;i<=n;i++){
    cnt_org[$i]++
    cnt_src[$i]++
    ans[i]=$i
  }

  for(i=1;i<=n;i++){
    for(j=1;j<27;j++){
      if(cnt_src[alpha[j]] <= 0) {
        continue
      }

      if($i!=alpha[j]) {
        k_t=0

        if(cnt_org[alpha[j]]>=cnt_src[alpha[j]])
          k_t++

        if(cnt_org[$i]<=cnt_src[$i])
          k_t++

        if(k-k_t<0){
          continue
        }
        
        k-=k_t
      }

      cnt_org[$i]--
      cnt_src[alpha[j]]--
      ans[i]=alpha[j]
      break
    }
  }

  for(i=1;i<=n;i++){
    printf "%s", ans[i]
  }
  print ""
}
'