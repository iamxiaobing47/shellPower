## `cd` `pwd`

`cd` (change directory)
`pwd` (print working directory)

## `mkdir`

1. Create a new directory named `newdir`:
   ```
   mkdir newdir
   ```

2. Create a new directory and set its permissions at the same time:
   ```
   mkdir -m 755 newdir
   ```
   
3. Create a nested directory structure, and automatically create parent directories if they do not exist:
   ```
   mkdir -p dir/subdir
   ```

4. Create multiple directories:
   ```
   mkdir dir1 dir2 dir3
   ```

5. Create directories and display a message each time a directory is created:
   ```
   mkdir -v dir1 dir2
   ```

Note: Creating directories requires permission, so it is best to operate within your HOME directory.

## `touch`

The `touch` command is used to update the timestamps of files. If the specified file does not exist, `touch` will create an empty file.
