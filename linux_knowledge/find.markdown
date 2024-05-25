## `find`

`find` is used to search for files and directories in the filesystem. You can search for files based on name, type, size, modification date, and more.

```bash
find [search_path] [search_criteria]
```

- `-name`: Search by file name, supports wildcards.
- `-type`: Search by file type (e.g., `f` for files, `d` for directories).
- `-size`: Search by file size (e.g., `+10M` for files larger than 10MB).
- `-exec`: Execute a specific command on the search results.

1. Search for files named `file.txt` in the current directory and its subdirectories:
   ```bash
   find . -name "file.txt"
   ```

2. Search for all directories in the current directory:
   ```bash
   find . -type d
   ```

3. Search for files larger than 10MB in the user's home directory:
   ```bash
   find ~ -type f -size +10M
   ```

4. Search for files modified in the past 7 days in the `/var/log` directory:
   ```bash
   find /var/log -mtime -7
   ```

5. Execute the `ls -l` command on each found file:
   ```bash
   find . -name "*.txt" -exec ls -l {} + | sort -r;
   find . -type f -name "*.tmp" -exec rm {} \;
   ```

6. Exclude specific directories with `! -path`
   ```bash
   find . -name "[1-9][!.]*" -type f ! -path "./*/.git/*"
   ```
