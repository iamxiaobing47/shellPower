# echo

## Show plain text

### Double Quotes (`"`)

- variables (`$variable`)
- command substitutions (`` $(command) ``) or backticks
- escape sequences (like `\n` for a newline or `\t` for a tab)

### Single Quotes (`'`)

- Everything enclosed in single quotes is treated as a literal string.No interpretation is made of any characters, including variables, backslashes (\), and special characters

## Options

1. `-n`: This option tells `echo` not to print a newline character at the end of the text

2. `-e`: This option enables interpretation of backslash escapes

3. `-E`: This is the opposite of `-e`; it disables the interpretation of backslash escapes