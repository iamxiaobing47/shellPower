set -o pipefail是什么.markdown

<hr>

As long as the last sub-command does not fail, the pipeline command will always execute successfully

set -o pipefail is used to address this situation, where if any sub-command fails, the entire pipeline command fails, and the script will terminate.


```shell
set -eo pipefail
```
