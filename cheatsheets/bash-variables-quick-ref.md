# Bash Variables Quick Reference

## Built-in Shell Variables

### Process & Script Info
| Variable | Description | Example |
|----------|-------------|---------|
| `$0` | Name of the script | `./myscript.sh` |
| `$$` | Process ID of current shell | `12345` |
| `$!` | Process ID of last background command | `12346` |
| `$?` | Exit status of last command | `0` (success) or `1-255` (error) |
| `$-` | Current shell options | `himBH` |

### Positional Parameters
| Variable | Description | Example |
|----------|-------------|---------|
| `$1, $2, $3...` | Script arguments by position | `$1` = first argument |
| `$#` | Number of arguments | `3` |
| `$*` | All arguments as single string | `"arg1 arg2 arg3"` |
| `$@` | All arguments as separate strings | `"arg1" "arg2" "arg3"` |

### User & Environment
| Variable | Description | Example |
|----------|-------------|---------|
| `$USER` | Current username | `greg` |
| `$HOME` | Home directory | `/home/greg` |
| `$PWD` | Present working directory | `/home/greg/projects` |
| `$OLDPWD` | Previous working directory | `/home/greg/Documents` |
| `$SHELL` | Current shell | `/bin/bash` |
| `$PATH` | Executable search path | `/usr/local/bin:/usr/bin` |
| `$HOSTNAME` | Computer hostname | `greg-ubuntu-desktop` |
| `$HOSTTYPE` | Machine type | `x86_64` |

### Random & Time
| Variable | Description | Example |
|----------|-------------|---------|
| `$RANDOM` | Random number (0-32767) | `15234` |
| `$SECONDS` | Seconds since shell started | `42` |
| `$EPOCHSECONDS` | Seconds since Unix epoch | `1705527600` |

### Input/Output
| Variable | Description | Example |
|----------|-------------|---------|
| `$IFS` | Internal Field Separator | ` ` (space/tab/newline) |
| `$REPLY` | Default variable for `read` | User input |
| `$LINENO` | Current line number in script | `25` |

### Special Variables
| Variable | Description | Example |
|----------|-------------|---------|
| `$BASH_VERSION` | Bash version | `5.1.16(1)-release` |
| `$BASH_SOURCE` | Script filename | `/path/to/script.sh` |
| `$FUNCNAME` | Current function name | `my_function` |
| `$UID` | User ID | `1000` |
| `$EUID` | Effective user ID | `1000` |
| `$GROUPS` | Groups user belongs to | `1000 27 999` |

## Variable Operations

### Declaration & Assignment
```bash
# Simple assignment
name="Greg"

# Read-only variable
readonly PI=3.14159

# Environment variable (available to child processes)
export PATH="/usr/local/bin:$PATH"

# Local variable (function scope only)
local temp="temporary"

# Declare with type
declare -i count=10      # Integer
declare -a array=(1 2 3) # Array
declare -A map           # Associative array
declare -r CONST=100     # Read-only
declare -x VAR="value"   # Export
```

### Accessing Variables
```bash
# Basic
echo $name
echo ${name}  # Preferred for clarity

# Default values
echo ${name:-"default"}      # Use "default" if name is unset
echo ${name:="default"}      # Set name to "default" if unset
echo ${name:?"Error message"} # Error if name is unset

# String length
echo ${#name}  # Length of value

# Substring
echo ${name:0:4}  # First 4 characters
```

### String Manipulation
```bash
string="Hello World"

# Length
${#string}  # 11

# Substring
${string:0:5}    # "Hello"
${string:6}      # "World"

# Find and replace
${string/World/Everyone}     # "Hello Everyone" (first match)
${string//o/0}               # "Hell0 W0rld" (all matches)

# Remove prefix/suffix
file="document.txt"
${file%.txt}     # "document" (remove shortest suffix)
${file%.*}       # "document" (remove shortest suffix)
${file##*/}      # "document.txt" (remove longest prefix - basename)

# Case conversion
${string^^}      # "HELLO WORLD" (all uppercase)
${string,,}      # "hello world" (all lowercase)
${string^}       # "Hello world" (first char uppercase)
```

## Arrays

### Indexed Arrays
```bash
# Declaration
fruits=("apple" "banana" "cherry")
declare -a numbers=(1 2 3 4 5)

# Access elements
${fruits[0]}     # "apple"
${fruits[@]}     # All elements
${fruits[*]}     # All elements (as single string)
${#fruits[@]}    # Number of elements (3)

# Add elements
fruits+=("date")
fruits[3]="elderberry"

# Loop through array
for fruit in "${fruits[@]}"; do
    echo $fruit
done
```

### Associative Arrays (Bash 4+)
```bash
# Declaration
declare -A person
person[name]="Greg"
person[role]="Head Distiller"
person[city]="Milwaukee"

# Access
echo ${person[name]}     # "Greg"
echo ${person[@]}        # All values
echo ${!person[@]}       # All keys

# Loop
for key in "${!person[@]}"; do
    echo "$key: ${person[$key]}"
done
```

## Useful Patterns

### Check if variable is set
```bash
if [ -z "$var" ]; then
    echo "Variable is empty or unset"
fi

if [ -n "$var" ]; then
    echo "Variable is set and not empty"
fi
```

### Provide defaults
```bash
# Use default if unset
config_file=${1:-"/etc/default.conf"}

# Set and use default
: ${PORT:=8080}  # Sets PORT to 8080 if unset
```

### Increment/Decrement
```bash
count=5
((count++))      # count is now 6
((count--))      # count is now 5
((count += 10))  # count is now 15
```

### Command substitution into variable
```bash
current_date=$(date +%Y-%m-%d)
file_count=$(ls -1 | wc -l)
user_home=$(eval echo ~$USER)
```

## Exit Status Examples
```bash
# Check last command success
if [ $? -eq 0 ]; then
    echo "Success!"
else
    echo "Failed!"
fi

# Better pattern
if command -v docker &> /dev/null; then
    echo "Docker is installed"
fi

# Set custom exit status
exit 0   # Success
exit 1   # Generic error
exit 127 # Command not found
```

## Script Arguments Example
```bash
#!/bin/bash
# Example: ./script.sh arg1 arg2 arg3

echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Number of arguments: $#"
echo "All arguments: $@"
echo "Process ID: $$"

# Check argument count
if [ $# -lt 2 ]; then
    echo "Usage: $0 <arg1> <arg2>"
    exit 1
fi
```

## Environment vs Shell Variables
```bash
# Shell variable (only in current shell)
MY_VAR="value"

# Environment variable (available to child processes)
export MY_VAR="value"

# Or combine
export MY_VAR="value"

# View all environment variables
env
printenv

# View all variables (including shell-only)
set
```

## Tips & Best Practices

1. **Always quote variables**: `"$var"` not `$var`
2. **Use braces for clarity**: `${var}` not `$var`
3. **Check if set before using**: `${var:-default}`
4. **Use descriptive names**: `user_count` not `uc`
5. **UPPERCASE for environment/constants**: `PATH`, `HOME`
6. **lowercase for local variables**: `temp_file`, `count`
7. **Test exit status immediately**: `$?` changes with each command

## Related
- [Builtins](../builtins/README.md)
- [Test Operators](../operators/README.md)
- [Examples](../examples/README.md)
