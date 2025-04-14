# Command Reference (Updated)

This document provides a complete reference for all commands available in the Enhanced Memory Bank System.

## Command Syntax

All commands follow this general syntax:

```
/<command_group> <command> [arguments] [options]
```

Command groups include:
- `memory` - Core memory operations
- `mode` - Mode confirmation operations
- `think` - THINK mode operations
- `plan` - PLAN mode operations
- `implement` - IMPLEMENT mode operations
- `review` - REVIEW mode operations
- `document` - DOCUMENT mode operations
- `context` - Context management operations

## Memory Commands

### Core Memory Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/memory status` | None | Display current memory system status | `/memory status` |
| `/memory help` | None | Show available memory commands and usage | `/memory help` |

### Memory Management Commands

| Command | Arguments | Options | Description | Example |
|---------|-----------|---------|-------------|---------|
| `/memory save` | `<context>` | `-t` (temporary)<br>`-m <message>` (message) | Suggest saving information to specified memory context | `/memory save architecture`<br>`/memory save patterns -t`<br>`/memory save decisions -m "Auth decision"` |
| `/memory recall` | `<context>` | `-v` (verbose) | Request to see information from specified memory context | `/memory recall patterns`<br>`/memory recall architecture -v` |
| `/memory update` | `<file> <content>` | None | Suggest updating specific memory file | `/memory update decisions.md "Decision: We will use TypeScript"` |
| `/memory search` | `<query>` | `-c <context>` (context) | Search across memory for relevant information | `/memory search authentication`<br>`/memory search -c architecture database` |

### Memory Organization Commands

| Command | Arguments | Options | Description | Example |
|---------|-----------|---------|-------------|---------|
| `/memory promote` | `<source>` | `-d <destination>` (destination) | Suggest promoting short-term memory to long-term | `/memory promote working_decisions.md`<br>`/memory promote working_decisions.md -d decisions.md` |
| `/memory archive` | `<file>` | None | Suggest archiving memory that's no longer actively relevant | `/memory archive old_patterns.md` |
| `/memory consolidate` | `<files> <target>` | None | Suggest combining related memories into a cohesive document | `/memory consolidate auth_*.md authentication.md` |

### Event Reporting Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/memory event` | `<type> <details>` | Report a development event | `/memory event commit "Implemented auth"`<br>`/memory event build_success "All tests passing"` |

### Configuration Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/memory config` | `<key> <value>` | Suggest updates to memory system configuration | `/memory config short_term.retention 7d`<br>`/memory config auto_context.max_files 10` |
| `/memory toggle` | `<feature>` | Suggest enabling/disabling specific memory features | `/memory toggle auto_recall`<br>`/memory toggle events.fileCreation` |

### Command Shortcuts

| Shortcut | Full Command | Description | Example |
|----------|--------------|-------------|---------|
| `/ms` | `/memory status` | Check memory system status | `/ms` |
| `/mr` | `/memory recall` | Request memory context | `/mr patterns` |
| `/mu` | `/memory update` | Suggest memory file update | `/mu decisions.md "New decision"` |

## Mode Commands

### Mode Confirmation

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/mode` | `<mode_name>` | Confirm current operational mode (after UI selection) | `/mode think`<br>`/mode plan`<br>`/mode implement`<br>`/mode review`<br>`/mode document` |

### THINK Mode Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/think explore` | `<topic>` | Start guided exploration of a topic | `/think explore authentication` |
| `/think compare` | `<options>` | Analyze trade-offs between approaches | `/think compare "JWT vs session auth"` |
| `/think research` | `<query>` | Research and document findings on a topic | `/think research "modern auth best practices"` |

### PLAN Mode Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/plan create` | `<feature>` | Create plan for implementing feature | `/plan create user-authentication` |
| `/plan validate` | None | Check plan against system architecture | `/plan validate` |
| `/plan estimate` | None | Estimate effort for current plan | `/plan estimate` |
| `/plan approve` | None | Mark plan as approved and ready for implementation | `/plan approve` |

### IMPLEMENT Mode Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/implement start` | `<task>` | Begin implementation of specific task | `/implement start user-authentication` |
| `/implement checkpoint` | None | Record progress checkpoint | `/implement checkpoint` |
| `/implement complete` | None | Mark current task as complete | `/implement complete` |
| `/implement issue` | `<description>` | Record implementation issue | `/implement issue "Edge case in login flow"` |

### REVIEW Mode Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/review code` | `<file>` | Review specific file | `/review code src/auth/login.ts` |
| `/review feature` | `<feature>` | Review entire feature | `/review feature authentication` |
| `/review suggest` | None | Generate improvement suggestions | `/review suggest` |
| `/review approve` | None | Mark current implementation as reviewed and approved | `/review approve` |

### DOCUMENT Mode Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/document update` | `<file>` | Update specific documentation | `/document update api-docs` |
| `/document generate` | `<type>` | Generate documentation from code | `/document generate api` |
| `/document promote` | `<temp_file>` | Promote temporary documentation to permanent | `/document promote session_notes.md` |
| `/document validate` | None | Check documentation for consistency | `/document validate` |

## Context Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/context load` | `<memory_file>` | Request to see a specific memory file | `/context load patterns.md` |
| `/context status` | None | Report which memory files the AI has seen | `/context status` |
| `/context suggest` | None | Get suggestions for helpful memory files | `/context suggest` |

## How Commands Work

In the Enhanced Memory Bank System, commands follow this execution flow:

1. **You type a command** in Cursor's chat interface
2. **The AI interprets the command** based on its rule files
3. **The AI requests necessary information** if it needs to see specific files
4. **The AI suggests appropriate actions** based on the command
5. **You implement the suggested actions** to maintain the memory system

Since the AI cannot directly modify files, most commands result in suggestions that you need to implement manually.

## Command Help System

All commands provide contextual help with the `-h` flag:

```
/memory save -h

COMMAND: /memory save <context>
DESCRIPTION: Saves current information to specified memory context
ARGUMENTS:
  <context> - Target memory context (required)
OPTIONS:
  -t - Store as temporary (short-term) memory
  -m <message> - Add descriptive message
EXAMPLES:
  /memory save architecture
  /memory save patterns -t
  /memory save decisions -m "Updated authentication approach"
```

## Command Response Format

When a memory command is executed, the response follows this format:

```
MEMORY COMMAND: <command>
STATUS: <success|planning|failure>
DETAILS: <relevant details about operation>
ACTION NEEDED: <what you need to do>
NEXT STEPS: <suggested follow-up actions>
```

## Event Types for /memory event

The `/memory event` command supports these event types:

### File Events
- `create` - New file created
- `modify` - File modified
- `delete` - File deleted

### Build Events
- `build_success` - Build completed successfully
- `build_failure` - Build failed

### Test Events
- `test_success` - Tests passed
- `test_failure` - Tests failed

### Git Events
- `commit` - Code committed
- `branch` - Branch changed
- `merge` - Branches merged

### Session Events
- `session_start` - Beginning development session
- `session_end` - Ending development session

### Mode Events
- `mode_change` - Changed operational modes

## Code Annotations

While not commands in the traditional sense, these code annotations trigger memory updates when the AI sees them:

| Annotation | Purpose | Example |
|------------|---------|---------|
| `@memory:note` | Add to session_notes.md | `// @memory:note This approach handles edge cases better` |
| `@memory:decision` | Add to decisions.md | `// @memory:decision We're using JWT for authentication` |
| `@memory:pattern` | Add to patterns.md | `// @memory:pattern This pattern should be followed for all API routes` |
| `@memory:architecture` | Add to architecture.md | `// @memory:architecture This service handles payment processing` |
| `@memory:todo` | Add to current_context.md | `// @memory:todo Refactor this component to use the new pattern` |
| `@memory:progress` | Update progress.md | `// @memory:progress Completed user authentication flow` |

## Examples

### Basic Workflow Examples

Setting up a new project:
```
# Check memory system status
/memory status

# Request to see project brief
/memory recall project_brief

# Suggest updates to project brief
/memory update long_term/project_brief.md "Project description..."
```

Starting a new feature in THINK mode:
```
# First, select THINK in UI dropdown
/mode think

# Explore authentication approaches
/think explore "user authentication"

# Save working decisions
/memory save working_decisions.md
```

Moving to planning:
```
# First, select PLAN in UI dropdown
/mode plan

# Create implementation plan
/plan create "user authentication"

# Update current context
/memory update current_context.md "Planning user authentication..."

# Mark plan as approved
/plan approve
```

Starting implementation:
```
# First, select IMPLEMENT in UI dropdown
/mode implement

# Start implementation
/implement start "user authentication"

# Report a code commit event
/memory event commit "Implemented basic auth flow"

# Record checkpoint
/implement checkpoint
```

Reviewing implementation:
```
# First, select REVIEW in UI dropdown
/mode review

# Review code file
/review code "src/auth/login.ts"

# Generate suggestions
/review suggest

# Mark as approved
/review approve
```

Documenting completed work:
```
# First, select DOCUMENT in UI dropdown
/mode document

# Update documentation
/document update api-docs

# Promote temporary documentation
/document promote session_notes.md
```

### Advanced Examples

Complex search:
```
/memory search -c architecture,patterns "authentication flow"
```

Reporting a build event:
```
/memory event build_success "Authentication system passing all tests"
```

Promoting short-term memory to long-term:
```
/memory promote working_decisions.md -d decisions.md
```

## Best Practices for Using Commands

1. **Use appropriate commands for each task**: Different commands are designed for different purposes
2. **Follow the two-step mode switching process**: Select in UI, then confirm with `/mode`
3. **Be specific when reporting events**: Include relevant details in event descriptions
4. **Implement suggested updates**: When the AI suggests memory updates, add them
5. **Use shortcuts for common operations**: Save time with command shortcuts
6. **Add annotations in code**: Use `@memory` annotations for automatic update suggestions
7. **Request help when needed**: Use the `-h` flag to get command help

## Troubleshooting Commands

If commands aren't working as expected:

1. **Check command syntax**: Make sure you're using the correct format
2. **Verify memory system initialization**: Run `/memory status` to check
3. **Ensure the AI has context**: Open memory files when requested
4. **Check mode alignment**: Some commands only make sense in certain modes
5. **Be explicit**: When in doubt, provide more details in your command
