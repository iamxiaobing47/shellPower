介绍read命令

<hr>


-s：静默模式，隐藏输入的字符，常用于密码输入。
-a ARRAY：将输入的行读取到数组 ARRAY 中，每个字段成为一个数组元素
-d DELIM：设置定界符 DELIM 作为输入字段的分隔符，默认是IFS（内部字段分隔符）的第一个字符
-p PROMPT：在读取之前显示提示信息 PROMPT
-r：防止反斜杠字符转义

```shell
IFS=":" read -a parts <<<"1:2:3"

echo "Username: ${parts[0]}"
echo "Password: ${parts[1]}"
echo "UID: ${parts[2]}"
```

```shell
input="1.txt"
while read line; do
    echo "$line"
done <"$input"
```