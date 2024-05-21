# Operation History

## Introduction

Bash retains the user's operation history, which defaults to saving the last 500 commands.

When exiting the current Shell, Bash writes the user's operation history into the `~/.bash_history` file, which stores 500 operations by default.

The environment variable `HISTFILE` always points to this file.

```bash
$ echo $HISTFILE
/home/me/.bash_history
```

## The history Command

The `history` command outputs the entire content of the `.bash_history` file, i.e., the operation history.

If you want to search for a previously executed command, you can use the `grep` command to search the operation history.

```bash
$ history | grep /usr/bin
```

The `-c` parameter of the `history` command can clear the operation history, i.e., empty the `.bash_history` file.

```bash
$ history -c
```

## Environment Variables

### HISTTIMEFORMAT

By customizing the environment variable `HISTTIMEFORMAT`, the output of `history` can also display the time of each operation.

```bash
$ export HISTTIMEFORMAT='%F %T  '
$ history
1  2013-06-09 10:40:12   cat /etc/issue
2  2013-06-09 10:40:12   clear
```

In the above code, `%F` is equivalent to `%Y - %m - %d` (year-month-day), and `%T` is equivalent to `%H : %M : %S` (hour:minute:second).

As long as the `HISTTIMEFORMAT` environment variable is set, the execution timestamp of the command will be saved in the `.bash_history` file. If it is not set, the timestamp will not be saved.

### HISTSIZE

The environment variable `HISTSIZE` sets the number of historical operations to be saved.

```bash
$ export HISTSIZE=10000
```

If you do not want to save the history of this session, you can set `HISTSIZE` to 0.

If `HISTSIZE=0` is written into the user's home directory `~/.bashrc` file, the operation history of that user will not be retained. If written into `/etc/profile`, the operation history of the entire system will not be retained.

### HISTIGNORE

The environment variable `HISTIGNORE` can set which commands are not written into the operation history.

```bash
export HISTIGNORE='pwd:ls:exit:cd'
```

## ! Command

### ! + Line Number

Each record in the operation history has a line number. After knowing the line number of the command, you can execute the command in the `.bash_history` with `exclamation mark + line number`.

If you want to execute the 8th command in the `.bash_history`, you can operate as follows.

```bash
$ !8
```

### !!

The `!!` command returns the last command.

## histverify Option

The above shortcut commands (such as the `!!` command) are executed directly after finding the matching command. If you want to add a confirmation step, first output what the command is, and then execute it after the user confirms, you can turn on the Shell's `histverify` option.

```bash
$ shopt -s histverify
```

After turning on the `histverify` option, the command returned by the `!` shortcut key will first be output, and then executed after the user presses the Enter key.