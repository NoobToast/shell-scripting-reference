# Test Operators Quick Reference

Quick reference for all test operators used with `test`, `[`, and `[[` commands.

## File Test Operators

### File Existence & Type
| Operator | Description | Example |
|----------|-------------|---------|
| `-e file` | File exists (any type) | `[ -e /etc/passwd ]` |
| `-f file` | Regular file exists | `[ -f script.sh ]` |
| `-d file` | Directory exists | `[ -d /home/greg ]` |
| `-L file` | Symbolic link exists | `[ -L /usr/bin/python ]` |
| `-h file` | Symbolic link exists (same as -L) | `[ -h link ]` |
| `-b file` | Block device exists | `[ -b /dev/sda ]` |
| `-c file` | Character device exists | `[ -c /dev/tty ]` |
| `-p file` | Named pipe (FIFO) exists | `[ -p /tmp/pipe ]` |
| `-S file` | Socket exists | `[ -S /var/run/docker.sock ]` |

### File Permissions & Attributes
| Operator | Description | Example |
|----------|-------------|---------|
| `-r file` | File is readable | `[ -r config.txt ]` |
| `-w file` | File is writable | `[ -w logfile.log ]` |
| `-x file` | File is executable | `[ -x /usr/bin/ls ]` |
| `-s file` | File has size > 0 (not empty) | `[ -s data.txt ]` |
| `-u file` | File has SUID bit set | `[ -u /usr/bin/sudo ]` |
| `-g file` | File has SGID bit set | `[ -g /usr/bin/wall ]` |
| `-k file` | File has sticky bit set | `[ -k /tmp ]` |
| `-O file` | File is owned by effective UID | `[ -O myfile.txt ]` |
| `-G file` | File is owned by effective GID | `[ -G myfile.txt ]` |
| `-N file` | File was modified since last read | `[ -N /var/log/syslog ]` |

### File Comparisons
| Operator | Description | Example |
|----------|-------------|---------|
| `file1 -nt file2` | file1 is newer than file2 | `[ script.sh -nt script.bak ]` |
| `file1 -ot file2` | file1 is older than file2 | `[ old.txt -ot new.txt ]` |
| `file1 -ef file2` | file1 and file2 are same file (hard links) | `[ /bin/sh -ef /bin/bash ]` |

### File Descriptor Tests
| Operator | Description | Example |
|----------|-------------|---------|
| `-t fd` | File descriptor is open and is a terminal | `[ -t 0 ]` (stdin is terminal) |

## String Test Operators

### String Existence & Length
| Operator | Description | Example |
|----------|-------------|---------|
| `-z string` | String length is zero (empty) | `[ -z "$var" ]` |
| `-n string` | String length is non-zero | `[ -n "$var" ]` |
| `string` | String is not empty (same as -n) | `[ "$var" ]` |

### String Comparison
| Operator | Description | Example | Note |
|----------|-------------|---------|------|
| `str1 = str2` | Strings are equal | `[ "$a" = "$b" ]` | POSIX |
| `str1 == str2` | Strings are equal | `[[ "$a" == "$b" ]]` | Bash only |
| `str1 != str2` | Strings are not equal | `[ "$a" != "$b" ]` | |
| `str1 < str2` | str1 sorts before str2 | `[[ "$a" < "$b" ]]` | Use [[ ]] only |
| `str1 > str2` | str1 sorts after str2 | `[[ "$a" > "$b" ]]` | Use [[ ]] only |
| `str =~ regex` | String matches regex | `[[ "$email" =~ @.+\. ]]` | [[ ]] only |

## Numeric Test Operators

### Arithmetic Comparisons
| Operator | Description | Example |
|----------|-------------|---------|
| `n1 -eq n2` | Equal to | `[ $count -eq 10 ]` |
| `n1 -ne n2` | Not equal to | `[ $count -ne 0 ]` |
| `n1 -lt n2` | Less than | `[ $count -lt 100 ]` |
| `n1 -le n2` | Less than or equal to | `[ $count -le 100 ]` |
| `n1 -gt n2` | Greater than | `[ $count -gt 0 ]` |
| `n1 -ge n2` | Greater than or equal to | `[ $count -ge 5 ]` |

## Logical Operators

### Within [ ] (POSIX)
| Operator | Description | Example |
|----------|-------------|---------|
| `! expr` | Logical NOT | `[ ! -f file.txt ]` |
| `expr1 -a expr2` | Logical AND | `[ -f file.txt -a -r file.txt ]` |
| `expr1 -o expr2` | Logical OR | `[ -f file.txt -o -d file.txt ]` |

### Within [[ ]] (Bash)
| Operator | Description | Example |
|----------|-------------|---------|
| `! expr` | Logical NOT | `[[ ! -f file.txt ]]` |
| `expr1 && expr2` | Logical AND | `[[ -f file.txt && -r file.txt ]]` |
| `expr1 || expr2` | Logical OR | `[[ -f file.txt || -d file.txt ]]` |

### Between Commands
| Operator | Description | Example |
|----------|-------------|---------|
| `cmd1 && cmd2` | Execute cmd2 only if cmd1 succeeds | `[ -f file ] && cat file` |
| `cmd1 || cmd2` | Execute cmd2 only if cmd1 fails | `[ -f file ] || touch file` |

## Common Patterns

### Check if command exists
```bash
