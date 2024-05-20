# Globbing

## Introduction

After the Shell receives the user's input, it breaks down the input into individual tokens based on spaces. Then, the Shell expands special characters within the tokens before executing the corresponding command.

This expansion of special characters is known as pattern expansion (globbing). Some of these involve wildcards, also referred to as wildcard expansion. Bash provides a total of eight expansions.

- `~` Expansion
- `?` Character Expansion
<!-- - * Character Expansion
- Bracket Expansion
- Brace Expansion
- Variable Expansion
- Command Substitution
- Arithmetic Expansion -->

### Tilde `~` expansion

The tilde ~ automatically expands to *the current user's home directory*

```bash
cd ~
```

### `?` expansion

The filename extension `?` represents a single character in a file path, and `??` can be used to match two characters.

```bash
ls ?.txt # a.txt, b.txt

ls ??.txt # ab.txt

echo ?.txt # b.txt"
```

If you want to match directory names, you would use the command:

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

❗ Both `?` and `*` are filename extensions, and they will only expand if the files actually exist. If the files do not exist, they will be output as-is.

```bash
echo c*.txt  # If no files matching 'c' followed by any characters and '.txt' exist, it will output 'c*.txt' literally.
```

The `*` character only matches files in the current directory and does not match files in subdirectories.

```bash
# Incorrect way to find 'a.txt' in subdirectories.
ls *.txt
ls */*.txt
```

For each level of subdirectories, you must write a corresponding number of asterisks. Bash 4.0 introduced a parameter `globstar`, which when enabled, allows `**` to match one or more subdirectories. Therefore, `**/*.txt` can match text files at the top level and text files in any depth of subdirectories
