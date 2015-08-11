read rc
read s
read g
set -- $rc
r=$1
c=$2
set -- $s
sx=$1
sy=$2
set -- $g
gx=$1
gy=$2

tail -$r|sed 's/\(.\)/\1 /g'|awk -v r=$r -v c=$c -v sx=$sx -v sy=$sy -v gx=$gx -v gy=$gy '
function find(i,x,y) {
  if(m[x" "y]!="#"){
    if(m[x" "y]!="."){
      if(m[x" "y]>i){
        m[x" "y]=i
      }
    }else{
      m[x" "y]=i
    }

    if(m[x+1" "y]=="."){
      m[x+1" "y]=i+1
      enqueue(i,x+1,y)
    }

    if(m[x-1" "y]=="."){
      m[x-1" "y]=i+1
      enqueue(i,x-1,y)
    }

    if(m[x" "y+1]=="."){
      m[x" "y+1]=i+1
      enqueue(i,x,y+1)
    }

    if(m[x" "y-1]=="."){
      m[x" "y-1]=i+1
      enqueue(i,x,y-1)
    }
  }
}
function enqueue(i,x,y,ixy) {
  if(tail==null) tail=0
  queue_i[tail]=i
  queue_x[tail]=x
  queue_y[tail]=y
  tail++
}
function dequeue_i() {
  if(head_i==null) head_i=0
  head_i++
  return queue_i[head_i-1]
}
function dequeue_x() {
  if(head_x==null) head_x=0
  head_x++
  return queue_x[head_x-1]
}
function dequeue_y() {
  if(head_y==null) head_y=0
  head_y++
  return queue_y[head_y-1]
}
{
  for(i=1;i<=NF;i++){
    m[NR" "i]=$i
  }
}
END{
  find(0,sx,sy)
  while(tail-head_i>0){
    i=dequeue_i()
    x=dequeue_x()
    y=dequeue_y()
    find(i+1,x,y)
  }
  print m[gx" "gy]
}
'