## Read standard input

### read command (depends on Bash)
e.g. input string is "foo"

    $ read a;echo $a
    foo

## Loop (N times)

### for 

    $ for i in `0 seq $(expr N - 1)`
    do
        echo "$i"
    done

### while

    $ i=0;while [ ! $i -eq N ]
    do
        echo "$i"
        i=`expr $i + 1`
    done

## Caluculate

### Integers

#### expr
    $ expr 10 / 3
    3

### Floats

#### bc

    $ echo "scale=4; 10/3"|bc
    0.3333

## Split the string into N string

### fold command

    $ echo "FooBarBuz"|fold -s -w 3
    Foo
    Bar
    Buz

### while-read pattern

    $ echo "FooBarBuz"|while read -n 3 i
    do
        [ -n "$i" ]&&echo $i
    done
    Foo
    Bar
    Buz