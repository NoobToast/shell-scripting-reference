# command

Built-in shell utility for command lookup and execution.

## Syntax
```bash
command [-pVv] command_name [arguments]
```

## Options
- `-p` - Use default PATH (ignore custom PATH)
- `-v` - Print pathname or description of command
- `-V` - Verbose description of command

## Common Use Cases

### 1. Check if a command exists
```bash
if command -v docker &> /dev/null; then
    echo "Docker is installed"
else
    echo "Docker is not installed"
fi
```

### 2. Get command location
```bash
command -v python3
# Output: /usr/bin/python3
```

### 3. Bypass shell functions/aliases
```bash
# Even if 'ls' is aliased, this runs the actual ls binary
command ls -la
```

## Why use `command -v` over alternatives?

| Method | Pros | Cons |
|--------|------|------|
| `command -v` | POSIX, builtin, fast | None |
| `which` | Familiar | External binary, not always available |
| `type` | Shows more info | Output format varies by shell |
| `hash` | Fast lookup | Different purpose (hash table) |

**Recommendation:** Use `command -v` for portability and reliability.

## Related
- type
- hash
- which (external command)
