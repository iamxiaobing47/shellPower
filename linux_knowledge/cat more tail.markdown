## `cat`

`cat` is short for "concatenate" and is used to view, create, and concatenate files.

1. View the contents of a file:
   ```bash
   cat file.txt
   ```

2. View the contents of multiple files at the same time:
   ```bash
   cat file1.txt file2.txt
   ```

3. Create a new file and write content into it:
   ```bash
   echo "Hello, World" | cat > newfile.txt
   cat 1.txt > 66.txt
   ```

4. Display line numbers of a file:
   ```bash
   cat -n file.txt
   ```

## `more`

`more` is a pager program used to view the contents of a file page by page. In contrast, `cat` will display all content at once.

```bash
more filename
```

1. View the contents of a file:
   ```bash
   more largefile.txt
   ```

2. Search for specific text within a file:
   ```bash
   more +/searchtext largefile.txt
   ```

## `tail`

The `tail` command is used to display the last few lines of a file. By default, `tail` displays the last 10 lines of a file

```bash
tail [options] file...
```

- `-f` or `--follow`: Follow the file, i.e., continuously output new content added to the file.

1. Display the last 10 lines of a file:
   ```bash
   tail filename.txt
   ```

2. Display the last 20 lines of a file:
   ```bash
   tail -20 filename.txt
   ```

3. View new content added to a file in real-time:
   ```bash
   tail -f filename.txt
   ```
