tr \/ \ |awk '
function is_uruu(y){
  return y%400==0||(y%100!=0&&y%4==0)
}
function zeroume(num, x,j) {
  out=""
  for (j=0;j<x-length(num);j++) {
    out="0" out
  }
  return out num
}
function next_day(year,month,date) {
  validate(year,month,date+1)
}
function validate(year,month,date) {
  if(month>12){
    refresh_days(year+1)
    validate(year+1,1,1)
  }else if(year%month!=0){
    validate(year, month+1, 1)
  }else if(date>days[int(month)]){
    validate(year,month+1,1)
  }else{
    y=year
    m=month
    d=date
  }
}
function refresh_days(y) {
  if(is_uruu(y)){
    days[2]=29
  }else{
    days[2]=28
  }
}
BEGIN{
  days[1]=31
  days[2]=28
  days[3]=31
  days[4]=30
  days[5]=31
  days[6]=30
  days[7]=31
  days[8]=31
  days[9]=30
  days[10]=31
  days[11]=30
  days[12]=31
}
{
  y=$1
  m=$2
  d=$3

  refresh_days(y)

  for(;y%(m*d)!=0;){
    next_day(y,m,d)
  }
  
  printf "%4d/%s/%s\n", y, zeroume(m,2), zeroume(d,2)
}
'