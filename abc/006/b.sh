read a;echo "
len=$a;res[0]=0;res[1]=0;res[2]=0;res[3]=1;
for(i=4;i<=len;i++){
  res[i%4]=(res[(i-1)%4]+res[(i-2)%4]+res[(i-3)%4])%10007;
}
res[len%4]"|bc