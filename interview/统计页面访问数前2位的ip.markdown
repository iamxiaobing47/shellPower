127.0.0.1 index.html
127.0.1.1 index.html
127.0.2.1 index.html
127.0.3.1 index.html
127.1.0.1 index.html
127.0.0.1 index.html
127.0.0.1 index.html

<hr>

```shell
cat 1.txt | awk '{print$1}' | sort | uniq -c | sort -nr | head -n 2
```