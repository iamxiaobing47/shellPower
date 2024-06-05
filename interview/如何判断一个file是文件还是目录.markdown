如何判断一个file是文件还是目录

<hr>

```shell
if [[ -e $input ]]; then
    echo "$input exists"
    if [[ -f $input ]]; then
        echo "$input is a file"
    elif [[ -d $input ]]; then
        echo "$input is a dir"
    fi
fi
```

[ -e file ]: If file exists, it is true.

[ -d file ]: If file exists and is a directory, it is true.

[ -f file ]: If file exists and is a regular file, it is true.

[ -s file ]: If file exists and its size is greater than zero, it is true.

[ -r file ]: If file exists and is readable (the current user has read permissions), it is true.

[ -w file ]: If file exists and is writable (the current user has write permissions), it is true.

[ -x file ]: If file exists and is executable (the effective user has execute/search permissions), it is true.