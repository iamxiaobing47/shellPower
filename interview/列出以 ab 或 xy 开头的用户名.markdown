如何列出以 ab 或 xy 开头的用户名？

<hr>

```shell
 -E '^ab\|^xy' /etc/passwd | cut -d: -f1
```

cut 命令用于打印 /etc/passwd 文件的每行的第一个字段（用户名
-d: 指定冒号为字段分隔
-f1 表示选择第一个字段

```shell
echo "192.168.2.1" | cut -d. -f1

cut -f1,3 filename.txt
cut -d' ' -f2 filename.txt
```