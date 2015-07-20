## Split the string into N string

### fold command

    `$ echo "FooBarBuz"|fold -s -w 3`
    Foo
    Bar
    Buz

### while-read pattern

`$ echo "FooBarBuz"|while read -n 3 i
do
    [ -n "$i" ]&&echo $i
done`
Foo
Bar
Buz