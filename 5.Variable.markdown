# Variable

## Introduction

Bash variables are divided into two categories: **environment variables** and **user-defined variables**.

### Environment Variables

Environment variables are typically predefined by the system and can also be passed from the parent shell to the child shell by the user.

The `env` command or `printenv` command can display all environment variables.

```bash
$ env
$ printenv
```

Here are some common environment variables.

- `BASHPID`: The process ID of the Bash process.
- `BASHOPTS`: The current shell options, which can be modified using the `shopt` command.
- `HOME`: The user's home directory.
- `HOST`: The name of the current host.
- `LANG`: The character set and language encoding, such as `zh_CN.UTF-8`.
- `PATH`: A colon-separated list of directories that will be searched when a command name is entered.
- `PWD`: The current working directory.
- `UID`: The user ID number of the current user.
- `USER`: The username of the current user.

Note that Bash variable names are case-sensitive, `HOME` and `home` are two different variables.

To view the value of a single environment variable, you can use the `printenv` command or the `echo` command.

```bash
$ printenv PATH
$ echo $PATH
```

Note that the variable name following the `printenv` command does not need the prefix `$`

### Custom Variables

Custom variables are variables defined by the user within the current shell and are only available in the current shell. Once the current shell is exited, the variable no longer exists.

The `set` command can display all variables (**including both environment variables and custom variables**), as well as all Bash functions.

```bash
$ set
```

## Creating Variables

The variable name must follow these rules:

- Composed of letters, numbers, and underscore characters.
- The first character must be a letter or an underscore and cannot be a number.
- Spaces and punctuation are not allowed.

Note, there should be no spaces around the equals sign. If the variable's value contains spaces, it must be enclosed in quotes.

```bash
myvar="hello world"
```

Bash does not have the concept of data types; all variable values are strings.

Here are some examples of custom variables.

```bash
a=z                     
b="a string"            
c="a string and $b"     
d="\t\ta string\n"      
e=$(ls -l foo.txt)      
f=$((5 * 7))   
```

Variables can be reassigned, with later assignments overriding earlier ones.

## Reading Variables

```bash
$ foo=bar
$ echo $foo #bar
```

When reading a variable, the variable name can also be enclosed in curly braces `{}`, for example, `$a` can also be written as `${a}`. This notation can be used when the variable name is used in conjunction with other characters.

```bash
$ a=foo

$ echo $a_file
$ echo ${a}_file
```

## Unsetting Variables

The `unset` command is used to delete a variable.

```bash
unset NAME
```

This command is not very useful. Since non-existent Bash variables are all equivalent to an **empty string**, even if the `unset` command deletes a variable, you can still read the variable, and its value will be an empty string.

**Therefore, to delete a variable, you can also set the variable to an empty string.**

## Outputting Variables, the export Command

Variables created by the user are only usable in the current shell, and child shells do not, by default, read the variables defined by the parent shell. To pass a variable to a child shell, you need to use the `export` command. This makes the exported variable an environment variable for the child shell.

The `export` command is used to output variables to child shells.

```bash
NAME=foo
export NAME

export NAME=value
```
**Note:** If a child shell modifies an inherited variable, it does not affect the parent shell.

## Special Variables

Bash provides some special variables. The values of these variables are provided by the Shell, and users cannot assign values to them.

(1) `$?`

`$?` is the exit status of the last command, used to determine whether the last command was executed successfully. A return value of `0` indicates that the last command was executed successfully; if it is not zero, it indicates that the last command failed.

```bash
$ ls doesnotexist
ls: cannot access 'doesnotexist': No such file or directory

$ echo $?
1
```

In the example above, the `ls` command looks for a non-existent file, resulting in an error. `$?` is 1, indicating that the last command failed.

(2) `$$`

`$$` is the process ID of **_the current shell_**.

```bash
$ echo $$
10662
```

This special variable can be used to name temporary files.

```bash
LOGFILE=/tmp/output_log.$$
```

(3) `$0`

`$0` is the name of the current shell (when executed directly from the command line) or the script name (when executed within a script).

```bash
$ echo $0
bash
```

In the example above, `$0` returns that the current shell being run is Bash.

(4) `$@` and `$#`

`$#` represents the number of script arguments, 

`$@` represents the values of the script arguments.

## Default Values for Variables

Bash provides four special syntaxes related to the default values of variables, which are designed to ensure that variables are not empty.

```bash
${varname:-word}
```

- If the variable `varname` exists and is not empty, it returns its value; otherwise, it returns `word`. Its purpose is to return a default value. For example, `${count:-0}` means that if the variable `count` does not exist, it returns `0`.

```bash
${varname:=word}
```

- The above syntax means that if the variable `varname` exists and is not empty, it returns its value; otherwise, it sets it to `word` and returns `word`. Its purpose is to set the default value of a variable. For example, `${count:=0}` means that if the variable `count` does not exist, it returns `0` and sets `count` to `0`.

```bash
${varname:+word}
```

- If the variable name exists and is not empty, it returns `word`; otherwise, it returns an empty value. Its purpose is to test whether the variable exists. For example, `${count:+1}` means that if the variable `count` exists, it returns `1` (indicating `true`), otherwise it returns an empty value.

```bash
${varname:?message}
```

- If the variable `varname` exists and is not empty, it returns its value; otherwise, it prints `varname: message` and terminates the script execution. If `message` is omitted, the default message "parameter null or not set." is output. Its purpose is to prevent variables from being undefined, for example, `${count:?"undefined!"}` means that if the variable `count` is undefined, it will terminate the execution and throw an error, returning the given error message `undefined!`.

## readonly Command

The `readonly` command is equivalent to `declare -r` and is used to declare read-only variables, which cannot change the variable value, nor can they `unset` variables.

```bash
$ readonly foo=1
$ foo=2
bash: foo: read-only variable
$ echo $?
1
```

## let Command

The `let` command can declare variables and directly execute arithmetic expressions.

```bash
$ let foo=1+2
$ echo $foo
3
```

In the above example, the `let` command can directly calculate `1 + 2`.

If the parameter expression of `let` command contains spaces, it needs to be enclosed in quotes.

```bash
$ let "foo = 1 + 2"
```

`let` can assign values to multiple variables at the same time, with assignment expressions separated by spaces.

```bash
$ let "v1 = 1" "v2 = v1++"
$ echo $v1,$v2
2,1
```

In the above example, `let` declares two variables `v1` and `v2`, where `v2` is equal to `v1++`, which means it first returns the value of `v1`, then `v1` is incremented.