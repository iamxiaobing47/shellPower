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

