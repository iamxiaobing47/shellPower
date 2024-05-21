# Directory Stack

For the convenience of users to switch between different directories, Bash provides a directory stack feature.

## cd -

By default, Bash only remembers the last directory, and the `cd -` command can return to the last directory.

```bash
$ cd -
```

## pushd, popd

If you want to remember multiple directories, you can use the `pushd` command and `popd` command. They are used to manipulate the directory stack.

The `pushd` command is similar to the `cd` command and can **enter a specified directory**

The `popd` command, when used without parameters, will remove the top record of the stack and enter the new top directory of the stack

** -n Option**

The `-n` option means to only operate on the stack and not change the directory.

## dirs Command

The `dirs` command can display the contents of the directory stack, usually used to view the results after `pushd` and `popd` operations.

This command will output a line of text, listing the directory stack, with directories separated by spaces. The top of the stack (the latest directory entered) is on the far left, and the bottom of the stack (the earliest directory entered) is on the far right.

```bash
$ dirs
```

It has the following options:

- `-c`: Clear the directory stack.
- `-l`: The user's home directory is not displayed with a tilde prefix, but printed in full.
- `-p`: Print each entry on a new line, by default it prints on one line.