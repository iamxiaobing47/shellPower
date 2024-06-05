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

**删除字符**：
   删除输入中的所有数字：
   ```bash
   echo "abc123xyz" | tr -d '0-9'
   ```

**字符补集**：
   保留除了小写字母以外的所有字符：
   ```bash
   echo "Hello World! 123" | tr -c '[:lower:]' '\n' | tr '\n' '*'
   ```

**压缩重复字符**：
   压缩输入中的连续空格：
   ```bash
   echo "this is  a test" | tr -s ' '
   ```

**删除换行符**：
   删除输入中的所有换行符：
   ```bash
   echo -e "line1\nline2\nline3" | tr -d '\n' | xargs -I {} echo {} 
   ```

**删除特殊字符**：
   删除输入中的所有特殊字符，只保留字母和数字：
   ```bash
   echo "Hello! How are you?" | tr -d '[:punct:]'
   ```

