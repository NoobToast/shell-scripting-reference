# File Test Operators

Used to test file properties in conditional expressions.

## Existence
- `-e file` - True if file exists (any type)
- `-f file` - True if file exists and is a regular file
- `-d file` - True if file exists and is a directory
- `-L file` or `-h file` - True if file exists and is a symbolic link

## Permissions
- `-r file` - True if file exists and is readable
- `-w file` - True if file exists and is writable
- `-x file` - True if file exists and is executable

## Attributes
- `-s file` - True if file exists and has size > 0
- `-u file` - True if file has SUID bit set
- `-g file` - True if file has SGID bit set
- `-k file` - True if file has sticky bit set

## Examples
```bash
# Check if file exists and is readable
if [ -f /etc/passwd ] && [ -r /etc/passwd ]; then
    echo "Can read /etc/passwd"
fi

# Check if directory exists
if [ -d ~/.ssh ]; then
    echo "SSH directory exists"
fi

# Check if file is not empty
if [ -s myfile.txt ]; then
    echo "File has content"
fi
```

## Related
- [String Tests](string-tests.md)
- [Numeric Tests](numeric-tests.md)
