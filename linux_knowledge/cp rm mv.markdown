## `cp`

```bash
cp [options] source_file(s) or directory... destination_directory or file
```

- `-r` or `--recursive`: Recursively copy, used for copying directories and their contents.
- `-i` or `--interactive`: Prompt the user for confirmation before overwriting files.

1. Copy a single file:
   ```bash
   cp source.txt destination.txt
   cp *.txt /path/to/destination
   cp file1.txt file2.txt file3.txt /path/to/destination
   ```

2. Copy an entire directory and its contents:
   ```bash
   cp -r source_dir destination_dir
   ```

3. Prompt for confirmation when copying:
   ```bash
   cp -i source.txt destination.txt
   ```

## `rm`

```bash
rm [options] files or directories...
```

- `-r` or `--recursive`: Recursively delete, used for deleting directories and their contents.
- `-i` or `--interactive`: Prompt the user for confirmation before deleting files.
- `-f` or `--force`: Force deletion without prompting for confirmation.

Note: The `rm` command supports wildcards.

```bash
rm -ri *test*
```

1. Delete a single file:
   ```bash
   rm file.txt
   ```

2. Delete an entire directory and its contents:
   ```bash
   rm -r directory
   ```

3. Prompt for confirmation before deleting a file:
   ```bash
   rm -i file.txt
   ```

## `mv`

```bash
mv [options] source_file(s) or directory... destination_directory or new_file_name
```

- `-i` or `--interactive`: Prompt the user for confirmation before overwriting the target file.

1. Rename a file:
   ```bash
   mv oldname.txt newname.txt
   ```

2. Move a file to another directory:
   ```bash
   mv file.txt /path/to/destination
   ```

3. Move an entire directory to another location:
   ```bash
   mv directory /path/to/new_location
   ```

4. Prompt for confirmation during the move process:
   ```bash
   mv -i file.txt /path/to/destination
   ```
