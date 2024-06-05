`tr`命令是一个文本处理工具

**删除字符**：
   `tr -d '字符'` 删除指定的字符

```shell
echo "hello world" | tr -d 'l'
```

**替换字符**：
   `tr '原字符' '新字符'` 将所有原字符替换为新字符。

```shell
echo "hello" | tr 'l' 'x'
```   

**字符范围替换**：

```shell
echo "a1b2c3" | tr 'abc' '123'
```

**压缩字符**：
   `tr -s '字符'` 压缩所有连续的指定字符为一个字符。
 
```shell
echo "hello" | tr -s 'l'
```

**转换大小写**：

```shell
tr '[:upper:]' '[:lower:]'
tr '[:lower:]' '[:upper:]
```

**组合使用**：
   `tr`命令可以与其他命令结合使用，通过管道来处理文本。

```shell
#将删除文件中的所有换行符。
cat file.txt | tr -d '\n' 
```
