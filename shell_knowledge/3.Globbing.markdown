# Globbing

## Introduction

After the Shell receives the user's input

- it breaks down the input into ***individual tokens based on space**s*
- Then, the Shell **_expands special characters_** within the tokens before executing the corresponding command.

This expansion of special characters is known as **pattern expansion (globbing)**. Some of these involve wildcards, also referred to as wildcard expansion. Bash provides a total of **eight** expansions.


### Tilde `~` expansion

The tilde `~` automatically expands to ***the current user's home directory***

```bash
cd ~
```

### `?` expansion

The filename extension `?` represents **_a single character_** in a **_file path_**, and `??` can be used to match two characters

```bash
ls ?.txt # a.txt, b.txt
ls ??.txt # ab.txt
echo ?.txt # b.txt"
```

If you want to match **_directory names_**, you would use the command:

```bash
ls -ld AVAJ? #AVAJ
```

- `-l` flag stands for "long format," which provides information such as permissions, owner, size, and the last modified time.
- `-d` flag specifies that the command should only match directory names

### `*` expansion

The `*` character is a wildcard that represents any number of any characters, including zero characters

```bash
ls *.txt  
ls a*.txt 
ls *b*  
```

❗ The `*` character does not match hidden files. To match hidden files, you would write:

```bash
echo .*  # Lists all hidden files in the current directory.
```

To match hidden files while excluding the special hidden files `.`  and `..`, which are special hidden files, you can use bracket expansion:

```bash
echo .[!.]*
```

In Unix and Unix-like systems, every directory contains two special hidden files: `.` and `..`. Their special nature lies in the fact that they represent the current and parent directory locations, respectively, rather than actual files or directories.

1. `.` (dot): This file represents **_the current directory_**. When used in the command line, it refers to the current working directory. For example, if you run `ls .` in the `/home/user` directory, it will list all files and subdirectories within `/home/user`.
2. `..` (double dot): This file represents the **_parent directory_** of the current directory. It is used to reference the directory one level above the current directory. For instance, if you run `ls ..` in the `/home/user/documents` directory, it will list all files and subdirectories within `/home/user`.

❗ Both `?` and `*` are filename extensions, and they will only expand if the files actually exist. If the files do not exist, they will be output as-is.

```bash
echo c*.txt
```

The `*` character only matches files in the current directory and does not match files in subdirectories.

```bash
# Incorrect way to find 'a.txt' in subdirectories.
ls *.txt
ls */*.txt
```

For each level of subdirectories, you must write a corresponding number of asterisks. **Bash 4.0** introduced a parameter `globstar`, which when enabled, allows `**` to match one or more subdirectories. Therefore, `**/*.txt` can match text files at the top level and text files in any depth of subdirectories

### `[]` Expansion

- The form of bracket expansion is `[...]`, which is used for filename matching and only expands if the files actually exist. If the files do not exist, it will output the characters as-is.
- It matches any one of the characters within the brackets. For example, `[aeiou]` can match any one of the five vowels.

```bash
# If files a.txt and b.txt exist
$ ls [ab].txt
a.txt b.txt

# If only file a.txt exists
$ ls [ab].txt
a.txt
```

`[^...]` and `[!...]` are used to match characters that are not within the brackets, and these two notations are equivalent. For instance, `[^abc]` or `[!abc]` means to match any character except `a`, `b`, and `c`.

```bash
# If files aaa, bbb, and aba exist
$ ls ?[!a]?
aba bbb
```

Note that:

- if you need to match the character `[`, you can place it inside the brackets, like `[[aeiou]`.
- If you need to match the hyphen `-`, it must be placed at the beginning or the end inside the brackets, like `[-aeiou]` or `[aeiou-]`.

### [start-end] Expansion

Bracket expansion has a shorthand form [start-end], which represents a continuous range of characters. For example, [a-c] is equivalent to [abc], and [0-9] matches [0123456789].

```bash
# If files a.txt, b.txt, and c.txt exist
$ ls [a-c].txt
a.txt
b.txt
c.txt
```

```bash
# If files report1.txt, report2.txt, and report3.txt exist
$ ls report[0-9].txt
report1.txt
report2.txt
report3.txt
```

🚀️ Case matters! 

Here are some common shorthand examples:

- `[a-z]`: All lowercase letters.
- `[a-zA-Z]`: All lowercase and uppercase letters.
- `[a-zA-Z0-9]`: All lowercase letters, uppercase letters, and numbers.
- `[abc]*`: All filenames starting with any one of the characters a, b, or c.
- `program.[co]`: The files program.c and program.o.
- `BACKUP.[0-9][0-9][0-9]`: All filenames starting with BACKUP. followed by three digits.

This shorthand form also has a negated form [!start-end], which matches characters that do not belong to this range. For example, `[!a-zA-Z]` indicates matching characters that are not English letters.

```bash
$ ls report[!1–3].txt
report4.txt report5.txt
```

In the code above, `[!1-3]` means to exclude the numbers 1, 2, and 3.

### Brace `{}` Expansion

Brace epansion `{...}` indicates that the contents within the braces are expanded into all the values separated by commas. For example, `{1,2,3}` expands to `1 2 3`.

```bash
$ echo {1,2,3}  #1 2 3
```

```bash
$ echo d{a,e,i,u,o}g  #dag deg dig dug dog
```

```bash
$ echo Front-{A,B,C}-Back
#Front-A-Back Front-B-Back Front-C-Back
```

📒 Note that brace expansion is not filename expansion. ***It expands into all given values regardless of whether corresponding files exist.***

```bash
$ ls {a,b,c}.txt
ls: cannot access 'a.txt': No such file or directory
ls: cannot access 'b.txt': No such file or directory
ls: cannot access 'c.txt': No such file or directory
```

In the example above, even if there are no corresponding files, `{a,b,c}` still expands into three filenames, causing the `ls` command to report three errors.

Another thing to note is that there should be ***no spaces before or after the comma*** inside the braces. Otherwise, brace expansion will not work.

```bash
$ echo {1 , 2}
{1 , 2}
```

You can omit a value before the comma, indicating that the first expansion is empty.

```bash
$ cp a.log{,.bak}

# Equivalent to
# cp a.log a.log.bak
```

Braces can be nested.

```bash
$ echo {j{p,pe}g,png}
jpg jpeg png
```

```bash
$ echo a{A{1,2},B{3,4}}b
aA1b aA2b aB3b aB4b
```

Braces can also be used in conjunction with other patterns and are always expanded ***before other patterns.***

***Braces can be used for multi-character patterns, which is not possible with bracket expansion (only single characters can be matched).***

```bash
$ echo /bin/{cat,b*}
/bin/cat /bin/b2sum /bin/base32 /bin/base64 ...
```

Since brace expansion `{...}` is not a filename expansion, it will always expand. This is very different from bracket expansion `[...]`, which will not expand if the matched files do not exist. This distinction should be noted.

**If a.txt and b.txt do not exist**

```bash
$ echo [ab].txt
[ab].txt
```

```bash
$ echo {a,b}.txt
a.txt b.txt
```

### {start..end} Expansion
Brace expansion has a shorthand form {start..end}, which represents an expansion into a continuous sequence. For example, {a..z} can expand into the 26 lowercase letters of the English alphabet.

```bash
$ echo {a..c}
#a b c

$ echo d{a..d}g
#dag dbg dcg ddg

$ echo {1..4}
#1 2 3 4

$ echo Number_{1..5}
Number_1 Number_2 Number_3 Number_4 Number_5
```

This shorthand form supports reverse order.

```bash
$ echo {c..a}
c b a

$ echo {5..1}
5 4 3 2 1
```

Note that if the shorthand is not understood, the brace pattern will be output as-is and will not expand.

```bash
$ echo {a1..3c}
{a1..3c}
```

This shorthand form can be used nested to create complex expansions.

```bash
$ echo .{mp{3..4},m4{a,b,p,v}}
.mp3 .mp4 .m4a .m4b .m4p .m4v
```

A common use for brace expansion is to create a series of directories.

```bash
$ mkdir {2007..2009}-{01..12}
```

This command will create 36 subdirectories, each named with a "year-month" format.

Another common use for this syntax is direct use in a `for` loop.

```bash
for i in {1..4}
do
  echo $i
done
```

If there are leading zeros in the integers, each expanded output item will have leading zeros.

```bash
$ echo {01..5}
01 02 03 04 05

$ echo {001..5}
001 002 003 004 005
```

This shorthand form can also use a second double-dot notation (start..end..step) to specify the expansion step.

```bash
$ echo {0..8..2}
0 2 4 6 8
```

The code above expands from 0 to 8, incrementing by 2 each time, resulting in five numbers output.

Multiple shorthand forms used together can have a looping effect.

```bash
$ echo {a..c}{1..3}
a1 a2 a3 b1 b2 b3 c1 c2 c3
```

### Command substitution

`$(...)` can be expanded to the output of another command, with all the output being treated as a return value.

```bash
$ echo $(date)
Tue Jan 28 00:01:13 CST 2020
```
In the example above, `$(date)` returns the result of the `date` command's execution.

There is also an older syntax where the command is placed within backticks, which can also be expanded to the output of the command.

```bash
$ echo `date`
Tue Jan 28 00:01:13 CST 2020
```

`$(...)` can be nested, for example, `$(ls $(pwd))`.

```bash
$(...) can be nested, for example, $(ls $(pwd)).
```