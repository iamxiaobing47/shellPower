统计连接到服务器的各个ip情况，并按连接数从大到小排序

<hr>

```shell
netstat -an | grep 'ESTABLISHED' | awk '{print $4}' | sort | uniq -c | sort -nr
```