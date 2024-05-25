1. **Basic Usage**:
    - `ls`: List the contents of the current directory.
    - `ls directory_name`: List the contents of the specified directory.

2. **Show Hidden Files**:
    - `ls -a`: Show all files, including hidden files starting with a dot (.).

3. **Long Listing**:
    - `ls -l`: Display files and directories in a long listing format, including permissions, owner, size, and last modification time.

4. **Recursive Listing**:
    - `ls -R`: Recursively list the contents of all subdirectories.

5. **Sort by Modification Time**:
    - `ls -lt`: Sort by modification time, with the most recently modified files appearing first.
    - `ls -ltr`: Sort by modification time, but display in reverse order (older first).

6. **Sort by Size**:
    - `ls -lS`: Sort by file size.

7. **Display File Size**:
    - `ls -lh`: Display file sizes in a human-readable format.

Example:

```bash
libingyudeMBP:Desktop xiaobing$ ls -lSh
total 24
-rw-r--r--@ 1 xiaobing  staff   1.4K May 22 22:46 count.txt
drwxr-xr-x@ 9 xiaobing  staff   288B May 20 22:41 WORKSPACE
-rwxr-xr-x@ 1 xiaobing  staff   207B May 22 21:50 1.sh
-rw-r--r--@ 1 xiaobing  staff    63B May 22 22:06 1.txt
```