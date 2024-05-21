# Bash Arithmetic Operations

## Arithmetic Expressions

The `((...))` syntax can perform integer arithmetic operations.
The `((...))` syntax automatically ignores spaces within it.

```bash
$ ((2+2))
$ (( 2+2 ))
$ (( 2 + 2 ))
```

The `((...))` syntax supports the following arithmetic operators:

- `+`: Addition
- `-`: Subtraction
- `*`: Multiplication
- `/`: Division (integer division)
- `%`: Modulus (remainder)
- `**`: Exponentiation
- `++`: Increment (prefix or postfix)
- `--`: Decrement (prefix or postfix)

Note that the result of the division operator is always an integer. For example, dividing `5` by `2` results in `2`, not `2.5`.

The `$((...))` can use parentheses to change the order of operations.

```bash
$ echo $(( (2 + 3) * 4 ))
20
```

## Logical Operations

`$((...))` supports the following logical operators.

- `<`: Less than
- `>`: Greater than
- `<=`: Less than or equal to
- `>=`: Greater than or equal to
- `==`: Equal to
- `!=`: Not equal to
- `&&`: Logical AND
- `||`: Logical OR
- `!`: Logical NOT
- `expr1?expr2:expr3`: Ternary conditional operator. If the result of expression `expr1` is non-zero (true), then execute expression `expr2`, otherwise execute expression `expr3`.

```bash
$ a=0
$ echo $((a<1 ? 1 : 0))
1
$ echo $((a>1 ? 1 : 0))
0
```

## Assignment Operations

The arithmetic expression `$((...))` can perform assignment operations.

```bash
$ echo $((a=1))
1
$ echo $a
1
```

In the above example, `a=1` assigns the value to variable `a`. This expression itself is an expression, and its return value is the value on the right side of the equals sign.

The `$((...))` supports the following assignment operators:

- `parameter = value`: Simple assignment.
- `parameter += value`: Equivalent to `parameter = parameter + value`.

```bash
$ foo=5
$ echo $((foo*=2))
10
```

## let Command

The `let` command is used to assign the result of an arithmetic operation to a variable. If `let` is not used, the expression will be treated as a string.

```bash
$ let x=2+3
$ echo $x
5
```

In the above example, the variable `x` is equal to the result of `2+3`.

Note that there should be no spaces in the expression `x=2+3`, otherwise an error will occur.