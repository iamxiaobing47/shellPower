# **Quote and Escape**

Bash has only one data type, string. No matter what data the user enters, Bash treats it as a string.

## **Escape**


Certain characters have special meanings in Bash (such as `$`, `&`, `*`).

To output these special characters as-is, you must place a backslash in front of them, turning them into regular characters. This is called "escaping."

```bash
$ echo \$date #$date
```

The backslash itself is also a special character. To output a backslash literally, you need to escape it as well, by using two consecutive backslashes (`\\`).

```bash
$ echo \\ #\\
```

In addition to being used for escaping, the backslash can also represent some non-printable characters:

- `\n`: Newline
- `\t`: Tab

To use these non-printable characters, you can place them inside quotes and use the `-e` flag with the `echo` command.

```bash
$ echo a\tb #atb
$ echo -e "a\tb" #a        b
```

**The newline character is a special character.**

The newline character signifies the end of a command. When Bash receives this character, it interprets and executes the input command. By escaping the newline character with a backslash, it becomes an ordinary character. Bash treats it as a zero-length null character, which allows a single command to be written across multiple lines.

```bash
$ mv \
/path/to/foo \
/path/to/bar

# Equivalent to
$ mv /path/to/foo /path/to/bar
```

## **Single Quote**

Everything enclosed in single quotes is treated as a literal string.No interpretation is made of any characters(`*`, `$`), including variables, backslashes (`\ `), and special characters

```bash
echo '$((2+2))' #$((2+2))
echo '$(echo foo)'  #$(echo foo)
echo -e 'Current date and time: $(date)' #Current date and time: $(date)
echo -e 'Newline: \n, Tab: \t'
#Newline: 
#, Tab:  
```

## **Double Quotes**

```bash
$ echo "*"  #*
```
In the example above, the wildcard character `*` is a special character. When placed inside double quotes, it becomes an ordinary character and will be output as-is. This requires special attention, as it means that no filename expansion will occur inside double quotes.

However, there are three exceptions to this rule: the **dollar sign (`$`)**, **backticks (``)**, and **backslash (`\ `)**. These three characters retain their special meanings even when inside double quotes and will be automatically expanded by Bash.

```bash
$ echo "$SHELL" #/bin/bash

$ echo "`date`" #Mon Jan 27 13:33:18 CST 2020

$ echo "I'd say: \"hello.\""  #I'd say: "hello."

$ echo "\\"   #\
```

**Another common use for double quotes is when a filename contains spaces**

```bash
$ ls "two words.txt"
```

## **Here Document**

Here Document is a method for inputting multi-line strings, formatted as follows:

```bash
<< token
text
token
```
The end delimiter is a single line with the name of the Here Document written at the beginning, and if it is not at the beginning, the end delimiter will not work

Inside the Here Document, **variable substitution occurs, and backslash escaping is supported**, but wildcard expansion is not supported, and double quotes and single quotes lose their syntactic function and become ordinary characters.

**If you do not want variable substitution to occur, you can place the start delimiter of the Here Document within single quotes**.

```bash
$ foo='hello world'
$ cat << '_example_'
$foo
"$foo"
'$foo'
_example_

$foo
"$foo"
'$foo'
```

**The essence of the Here Document is redirection, it redirects the string to output to a command, which is equivalent to including the `echo` command**.

```bash
$ command << token
  string
token

# Equivalent to
$ echo string | command
```

Therefore, Here strings are only suitable for commands that can accept standard input as arguments, and are invalid for other commands, such as the `echo` command, which cannot use Here Document as an argument.

**In addition, Here Documents cannot be used as the value of a variable, they can only be used as command arguments**.

## **Here String**

Here Document also has a variant called Here String, represented by three less-than signs (`<<<`).

```bash
<<< string
```

Its function is to pass the string through standard input to a command.

Some commands accept parameters directly, and the results are different from accepting parameters through standard input. That's why this syntax is useful for passing strings through standard input to commands, such as the `cat` command which only accepts strings inputted through standard input.

```bash
$ md5sum <<< 'ddd'
# Equivalent to
$ echo 'ddd' | md5sum
```

In the above examples, the `md5sum` command can only accept parameters through standard input and cannot directly place strings behind the command, which would be interpreted as a filename, i.e., `ddd` in `md5sum ddd` would be interpreted as a filename. At this time, the Here String can be used to pass the string to the `md5sum` command.