# Bash File Test Operators

## What is a File Test Operator?

A **file test operator** is a special operator used in bash conditionals to test properties of files and directories. They're used inside `[ ]` or `[[ ]]` test commands to check things like "does this file exist?", "is this a directory?", "can I write to this file?", etc.

## Where and Why They're Used

**Where:**
- Inside `if` statements
- In `while` or `until` loops
- Any conditional expression in bash scripts

**Why:**
- Prevent errors (check if file exists before trying to read it)
- Validate input (ensure a path is actually a directory)
- Control script flow (do different things based on file properties)
- Check permissions before operations

**Common Use Cases:**
- Backup scripts (check if destination directory exists)
- Log rotation (check if log file is too large)
- Installation scripts (verify files are in place)
- Security checks (ensure config files have correct permissions)

## File Test Operators Table

| Operator | Returns True If... | Example |
|----------|-------------------|---------|
| **Existence Tests** |||
| `-e` | Path exists (file or directory) | `[ -e /etc/passwd ]` |
| `-f` | Is a regular file (not directory/link) | `[ -f /etc/passwd ]` |
| `-d` | Is a directory | `[ -d /home ]` |
| `-L` or `-h` | Is a symbolic link | `[ -L /usr/bin/python ]` |
| `-S` | Is a socket | `[ -S /var/run/docker.sock ]` |
| `-p` | Is a named pipe (FIFO) | `[ -p /tmp/mypipe ]` |
| `-b` | Is a block device | `[ -b /dev/sda ]` |
| `-c` | Is a character device | `[ -c /dev/tty ]` |
| **Permission Tests** |||
| `-r` | File is readable by you | `[ -r config.txt ]` |
| `-w` | File is writable by you | `[ -w logfile.log ]` |
| `-x` | File is executable by you | `[ -x script.sh ]` |
| `-u` | File has SUID bit set | `[ -u /usr/bin/passwd ]` |
| `-g` | File has SGID bit set | `[ -g /usr/bin/wall ]` |
| `-k` | File has sticky bit set | `[ -k /tmp ]` |
| **Content/State Tests** |||
| `-s` | File exists and is NOT empty (size > 0) | `[ -s data.txt ]` |
| `-z` | String has zero length | `[ -z "$VAR" ]` |
| `-n` | String has non-zero length | `[ -n "$VAR" ]` |
| **Ownership Tests** |||
| `-O` | You own the file | `[ -O myfile.txt ]` |
| `-G` | File's group matches yours | `[ -G project.txt ]` |
| **Age/Comparison Tests** |||
| `file1 -nt file2` | file1 is newer than file2 (modification time) | `[ config.new -nt config.old ]` |
| `file1 -ot file2` | file1 is older than file2 | `[ backup.tar -ot data.db ]` |
| `file1 -ef file2` | Files have same inode (hard links) | `[ file1 -ef file2 ]` |

## Practical Examples
```bash
# Check if config file exists before reading it
if [ -f /etc/myapp/config.conf ]; then
    source /etc/myapp/config.conf
else
    echo "Config file not found!"
    exit 1
fi

# Check if directory exists before creating it
if [ ! -d /backup ]; then
    mkdir -p /backup
fi

# Check if file is readable and not empty
if [ -r data.txt ] && [ -s data.txt ]; then
    cat data.txt
fi

# Check if script is executable
if [ ! -x /usr/local/bin/myscript.sh ]; then
    chmod +x /usr/local/bin/myscript.sh
fi

# Check if running as file owner
if [ -O important.txt ]; then
    echo "You own this file"
fi

# Compare file modification times
if [ backup.tar -ot database.db ]; then
    echo "Backup is outdated, creating new backup..."
    tar -czf backup.tar database.db
fi
```

## Important Notes

1. **Always quote variables**: `[ -f "$filename" ]` not `[ -f $filename ]`
2. **`[[ ]]` vs `[ ]`**: `[[ ]]` is bash-specific and more powerful, `[ ]` is POSIX-compliant
3. **Combine with logical operators**:
```bash
   # AND
   if [ -f file.txt ] && [ -r file.txt ]; then
   
   # OR
   if [ -f config ] || [ -f config.default ]; then
   
   # NOT
   if [ ! -d /tmp/work ]; then
```

For **LFCS certification**, you should know the common ones: `-f`, `-d`, `-e`, `-r`, `-w`, `-x`, `-s`, and how to combine them with `&&`, `||`, and `!`.
