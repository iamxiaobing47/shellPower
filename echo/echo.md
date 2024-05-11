# echo

## Show plain text

### Double Quotes (`"`)

- variables (`$variable`)
- command substitutions (`` $(command) ``)
- escape sequences (like `\n` for a newline or `\t` for a tab)
- backticks
- prevent the shell from interpreting other special characters, like the dollar sign (`$`), unless they are escaped with a backslash.

### Single Quotes (`'`)

- Everything enclosed in single quotes is treated as a literal string.No interpretation is made of any characters, including variables, backslashes (\), and special characters

## Options

1. `-n`: This option tells `echo` not to print a newline character at the end of the text

2. `-e`: This option enables interpretation of backslash escapes

3. `-E`: This is the opposite of `-e`; it disables the interpretation of backslash escapes