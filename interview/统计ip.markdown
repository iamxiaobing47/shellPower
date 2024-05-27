分析log，将ip截取，统计出现次数，并按从大到小排序

http://192.169.200.19/index1.html
http://192.169.200.18/index1.html
http://192.169.200.19/index1.html
http://192.169.200.18/index1.html
http://192.169.200.18/index1.html
http://192.179.203.17/index1.html
http://192.169.291.13/index1.html

<hr>

```shell
cat 1.txt | cut -d '/' -f 3 | sort | uniq -c | sort -r
```