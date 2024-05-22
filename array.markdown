# Arrays

Array elements are **indexed starting from 0**.

## Creating Arrays

Arrays can be created by assigning values all at once.

```bash
ARRAY=(value1 value2 ... valueN)

# Equivalent to

ARRAY=(
  value1
  value2
  value3
  ...
)
```

When creating an array in the above manner, you can assign values in the default order, or you can specify the position for each value.

```bash
$ array=(a b c)
$ array=([2]=c [0]=a [1]=b)
```

It is also possible to specify positions for only some values.

```bash
names=(hatter [5]=duchess alice)
```

Array elements that are not assigned have a default value of an empty string.

When defining an array, you can use wildcards.

```bash
$ mp3s=( *.mp3 )
```

In the above example, all MP3 files in the current directory are placed into an array.

The `read -a` command stores user command line input into an array.

```bash
$ read -a dice
```

## Reading Arrays

### Reading a Single Element

```bash
$ echo ${array[i]}     # i is the index
```

### Reading All Members

`@` and `*` are special indices for arrays, representing all members of the array. These special indices can be used with `for` loops to iterate over arrays.

```bash
for i in "${names[@]}"; do
  echo $i
done
```

There is a difference whether `@` and `*` are enclosed in double quotes or not.

```bash
$ activities=( swimming "water skiing" canoeing "white-water rafting" surfing )
$ for act in ${activities[@]}; \
do \
echo "Activity: $act"; \
done

Activity: swimming
Activity: water
Activity: skiing
Activity: canoeing
Activity: white-water
Activity: rafting
Activity: surfing
```

In the above example, the array `activities` actually contains 5 members, but the `for...in` loop directly iterates over `${activities[@]}`, resulting in 7 results. To avoid this, it is common to put `${activities[@]}` in double quotes.

```bash
$ for act in "${activities[@]}"; \
do \
echo "Activity: $act"; \
done

Activity: swimming
Activity: water skiing
Activity: canoeing
Activity: white-water rafting
Activity: surfing
```

In the above example, `${activities[@]}` is enclosed in double quotes, and the iteration returns the correct results.

- The most convenient way to copy an array is to write it like this.

```bash
$ hobbies=( "${activities[@]}" )
```

This method can also be used to add members to a new array.

```bash
$ hobbies=( "${activities[@]}" diving )
```

### Default Position

Referencing an array variable without a subscript refers to the element at position `0`.

```bash
$ foo=(a b c d e f)
$ echo ${foo}
a
```

## Array Length

To find out the length of an array (i.e., how many members it contains), you can use the following two syntaxes.

```bash
${#array[*]}
${#array[@]}
```

```bash
$ a[100]=foo

$ echo ${#a[*]}
1

$ echo ${#a[@]}
1
```

Note that if you use this syntax to read a specific array member, it will return the string length of that member. This must be done with care.

```bash
$ a[100]=foo
$ echo ${#a[100]}
3
```

## Extracting Array Members

The syntax `${array[@]:position:length}` can be used to extract array members.

```bash
$ food=( apples bananas cucumbers dates eggs fajitas grapes )
$ echo ${food[@]:1:1}
bananas
```

If the length parameter `length` is omitted, it returns all members starting from the specified position.

```bash
$ echo ${food[@]:4}
eggs fajitas grapes
```

## Appending Array Members

To append a member to the end of an array, you can use the `+=` assignment operator. It automatically appends the value to the end of the array.

```bash
$ foo=(a b c)
$ foo+=(d e f)
$ echo ${foo[@]}
a b c d e f
```

## Deleting Arrays

- To delete an array member, use the `unset` command.

```bash
$ foo=(a b c d e f)
$ echo ${foo[@]}
a b c d e f

$ unset foo[2]
$ echo ${foo[@]}
a b d e f
```

Setting a member to an empty value can "hide" this member from the return value.

```bash
$ foo=(a b c d e f)
$ foo[1]=''
$ echo ${foo[@]}
a c d e f
```

In the above example, setting the second member of the array to an empty string "hides" this member from the array's return value.

**Note that this is "hiding", not deleting, because the member still exists, it's just that the value has become an empty value.**

- `unset ArrayName` can clear the entire array.

```bash
$ unset ARRAY

$ echo ${ARRAY[*]}
<--no output-->
```