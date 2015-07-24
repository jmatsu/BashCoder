awk '{
dir=""
if ($1>=112.5) {
    if ($1<337.5) {
        dir="NNE"
    } else if ($1<562.5) {
        dir="NE"
    } else if ($1<787.5) {
        dir="ENE"
    } else if ($1<1012.5) {
        dir="E"
    } else if ($1<1237.5) {
        dir="ESE"
    } else if ($1<1462.5) {
        dir="SE"
    } else if ($1<1687.5) {
        dir="SSE"
    } else if ($1<1912.5) {
        dir="S"
    } else if ($1<2137.5) {
        dir="SSW"
    } else if ($1<2362.5) {
        dir="SW"
    } else if ($1<2587.5) {
        dir="WSW"
    } else if ($1<2812.5) {
        dir="W"
    } else if ($1<3037.5) {
        dir="WNW"
    } else if ($1<3262.5) {
        dir="NW"
    } else if ($1<3487.5) {
        dir="NNW"
    } else {
        dir="N"
    }  
} else {
    dir="N"
}
po=$2/60

if (po<0.25) {
    dir="C"
    po=0
} else if (po<1.55) {
    po=1
} else if (po<3.35) {
    po=2
} else if (po<5.45) {
    po=3
} else if (po<7.95) {
    po=4
} else if (po<10.75) {
    po=5
} else if (po<13.85) {
    po=6
} else if (po<17.15) {
    po=7
} else if (po<20.75) {
    po=8
} else if (po<24.45) {
    po=9
} else if (po<28.45) {
    po=10
} else if (po<32.65) {
    po=11
}else {
    po=12
}
print dir" "po
}'