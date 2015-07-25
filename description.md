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

## array
    
    initialize
        foo=() #=> empty
        bar=(1 2) #=> [0]=1,[1]=2
        baz=("1" "2") #=> [0]="1",[1]="2"

    add
        foo+=( 1 ) #=> [0]=1
        bar+=( 3 ) #=> [0]=1,[1]=2,[2]=3
        baz+=( "3" ) #=> [0]="1",[1]="2",[2]="3"

    show all
        ${foo[@]}

## Output of some commands in while-loop with side-effect
    foo=()
    while read a; do
      foo+=("$a")
    done < <(some commands)
    echo "${foo[@]}" #=> path_foo,path_bar,path_baz

    ### Bad
    foo=()
    commands|while read a; do
      foo+=("$a")
    done
    echo "${foo[@]}" #=> empty