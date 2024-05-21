# Read Command

The `read` command in shell scripting is used to read input from the user or from a file

## Usage

It stores the user's input into a variable for later use in the script. The user's input is concluded when they press the Enter key.

```bash
read [-options] [variable...]
```

```bash
#!/bin/bash

echo -n "Enter some text > "
read text
echo "Your input: $text"
```

- The `read` command can accept multiple values from the user.

1. If the user enters fewer items than the number of variables specified in the `read` command, the extra variables will be empty.

2. If the user enters more items than the defined variables, the excess input will be included in the last variable. 

3. If no variable name is specified after the `read` command, the environment variable `REPLY` will contain all the input.

```bash
#!/bin/bash
echo "Please, enter your first name and last name"
read FN LN
echo "Hi! $LN, $FN!"
```

```bash
#!/bin/bash
# read-single: read multiple values into default variable
echo -n "Enter one or more values > "
read
echo "REPLY = '$REPLY'"
```

- The `read` command can also be used to read from a file, in addition to reading keyboard input.

Using the `read` command to read the contents of a file. The `done` command with the redirection operator `<` after it directs the file's contents to the `read` command, reading one line at a time into the variable `myline`, until the end of the file is reached.

```bash
#!/bin/bash

filename='/etc/hosts'

while read myline
do
  echo "$myline"
done < $filename
```

## Options

The options for the `read` command are as follows.

**-p option**

The `-p` option specifies the prompt message for user input.

```bash
read -p "Enter one or more values > "
echo "REPLY = '$REPLY'"
```

**-e option**

The `read` command accepts a filename from the user. At this point, the user might want to use the Tab key for filename "auto-completion", but the input for `read` command does not support `readline` library features by default. The `-e` option allows the user to use auto-completion.

```bash
#!/bin/bash

echo "Please input the path to the file:"

read -e fileName

echo $fileName
```

## IFS Variable

The values read by the `read` command are, by default, separated by spaces. You can change the delimiter by customizing the environment variable `IFS` (Internal Field Separator).

**The default value of `IFS` is a space, Tab, and newline, usually taking the first one (i.e., space).**

If you set `IFS` to a colon (`:`) or semicolon (`;`), you can separate values that are delimited by these two symbols, which is very useful for reading files.

