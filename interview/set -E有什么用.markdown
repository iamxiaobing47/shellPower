set -E有什么用


<hr>

Once the -e parameter is set, it will cause errors within a function not to be caught by the trap command (the -E parameter can correct this behavior, allowing functions to also inherit the trap command)