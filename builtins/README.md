BUILT IN SHELL UTILITIES

## Job Control & Process Management
- **`bg`** - Resume suspended jobs in background
- **`fg`** - Bring jobs to foreground
- **`jobs`** - List active jobs
- **`kill`** - Send signals to processes
- **`wait`** - Wait for process completion

## Navigation & Directory
- **`cd`** - Change directory
- **`pwd`** - Print working directory
- **`dirs`** - Display directory stack (bash-specific)
- **`pushd`** / **`popd`** - Directory stack manipulation (bash-specific)

## Variable & Environment
- **`export`** - Set environment variables
- **`unset`** - Remove variables or functions
- **`readonly`** - Mark variables as read-only
- **`local`** - Declare local variables (bash-specific)
- **`declare`** / **`typeset`** - Declare variables with attributes (bash-specific)
- **`set`** - Set shell options and positional parameters
- **`unalias`** - Remove aliases
- **`alias`** - Create command aliases

## Command Execution
- **`command`** - Execute command bypassing shell functions
- **`exec`** - Replace shell with command
- **`eval`** - Evaluate arguments as shell command
- **`source`** / **`.`** - Execute commands from file in current shell
- **`builtin`** - Execute shell builtin directly (bash-specific)
- **`enable`** - Enable/disable shell builtins (bash-specific)

## Control Flow & Functions
- **`break`** - Exit from loop
- **`continue`** - Skip to next loop iteration
- **`return`** - Return from function
- **`exit`** - Exit the shell
- **`shift`** - Shift positional parameters
- **`getopts`** - Parse command options

## Testing & Comparison
- **`test`** / **`[`** - Evaluate conditional expressions
- **`[[`** - Extended test command (bash-specific)
- **`true`** - Return success (exit 0)
- **`false`** - Return failure (exit 1)

## I/O & Text
- **`read`** - Read input into variables
- **`echo`** - Output text
- **`printf`** - Formatted output
- **`mapfile`** / **`readarray`** - Read lines into array (bash-specific)

## Shell Information
- **`type`** - Display command type information
- **`hash`** - Remember/display command locations
- **`help`** - Display help for builtins (bash-specific)
- **`shopt`** - Set shell options (bash-specific)

## Process Limits
- **`ulimit`** - Control user resource limits
- **`umask`** - Set file creation mask

## History (Bash-specific)
- **`history`** - Display command history
- **`fc`** - Fix/re-execute commands from history

## Traps & Signals
- **`trap`** - Set signal handlers

## Misc
- **`times`** - Display process times
- **`let`** - Arithmetic evaluation (bash-specific)
- **`caller`** - Return execution context (bash-specific)
- **`bind`** - Bind key sequences (bash-specific)
- **`complete`** / **`compgen`** - Programmable completion (bash-specific)
- **`disown`** - Remove jobs from job table (bash-specific)
- **`logout`** - Exit login shell (bash-specific)
- **`suspend`** - Suspend shell execution (bash-specific)

**Note:** Items marked "bash-specific" are Bash extensions and may not be available in strict POSIX shells like `dash` or `sh`. The POSIX-compliant builtins work across all modern shells.

You can see which builtins are available in your shell with:
```bash
compgen -b  # List all builtins (bash)
help        # Display help for all builtins (bash)
```
