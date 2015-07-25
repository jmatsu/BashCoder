function bit_and(x, y,  b, i, k, qx, qy) {
  k = 0
  for (i = 15; i >= 0; i--) {
  b = 2^i
  qx = int(x / b)
  qy = int(y / b)
  if (qx * qy)
    k += b
  x %= b
  y %= b
  }
  return k
}
function right_shift(x, y) {
  return int(x/(2^y))
}
function left_shift(x,y) {
  return x * (2^y)
}
function bitcount_big(num) {
  num = num - and2(rshift2(num,1) , 1431655765);
  num = and2(num , 858993459) + and2(rshift2(num, 2) , 858993459);
  num = and2(num + rshift2(num , 4) , 252645135);
  num = num + rshift2(num , 8);
  num = num + rshift2(num , 16);
  return and2(num , 63);
}
function bitcount_small(x, b) {
  for (b = 0; x != 0; x = and2(x, x - 1))
      b++

  return b;
}
function bit_or(x, y,  b, i, k, qx, qy) {
  k = 0
  for (i = 15; i >= 0; i--) {
    b = 2^i
    qx = int(x / b)
    qy = int(y / b)
    if (qx + qy)
        k += b
    x %= b
    y %= b
  }
  return k
}
function bit_xor(x, y,  b, i, k, qx, qy) {
  k = 0
  for (i = 15; i >= 0; i--) {
    b = 2^i
    qx = int(x / b)
    qy = int(y / b)
    if (qx + qy && (!qx || !qy))
        k += b
    x %= b
    y %= b
  }
  return k
}
function bit_complement(x,  b, i, k, q) {
  k = 0
  for (i = 15; i >= 0; i--) {
    b = 2^i
    q = int(x / b)
    if (!q)
        k += b
    x %= b
  }
  return k
}
function zeroume(num, x) {
  out=""
  for (j=0;j<x-length(num);j++) {
    out="0" out
  }
  return out num
}