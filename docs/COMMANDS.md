# Command Reference

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
- `events` - Event system operations

## Memory Commands

### Core Memory Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/memory init` | None | Initialize the memory system | `/memory init` |
| `/memory status` | None | Display current memory system status | `/memory status` |
| `/memory help` | None | Show available memory commands and usage | `/memory help` |

### Memory Management Commands

| Command | Arguments | Options | Description | Example |
|---------|-----------|---------|-------------|---------|
| `/memory save` | `<context>` | `-t` (temporary)<br>`-m <message>` (message) | Save current information to specified memory context | `/memory save architecture`<br>`/memory save patterns -t`<br>`/memory save decisions -m "Auth decision"` |
| `/memory recall` | `<context>` | `-v` (verbose) | Retrieve information from specified memory context | `/memory recall patterns`<br>`/memory recall architecture -v` |
| `/memory update` | `<file> <content>` | None | Update specific memory file | `/memory update decisions.md "Decision: We will use TypeScript"` |
| `/memory search` | `<query>` | `-c <context>` (context) | Search across memory for relevant information | `/memory search authentication`<br>`/memory search -c architecture database` |

### Memory Organization Commands

| Command | Arguments | Options | Description | Example |
|---------|-----------|---------|-------------|---------|
| `/memory promote` | `<source>` | `-d <destination>` (destination) | Promote short-term memory to long-term | `/memory promote working_decisions.md`<br>`/memory promote working_decisions.md -d decisions.md` |
| `/memory archive` | `<file>` | None | Archive memory that's no longer actively relevant | `/memory archive old_patterns.md` |
| `/memory consolidate` | `<files> <target>` | None | Combine related memories into a cohesive document | `/memory consolidate auth_*.md authentication.md` |

### Configuration Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/memory config` | `<key> <value>` | Update memory system configuration | `/memory config short_term.retention 7d`<br>`/memory config auto_context.max_files 10` |
| `/memory toggle` | `<feature>` | Enable/disable specific memory features | `/memory toggle auto_recall`<br>`/memory toggle events.fileCreation` |

### Command Shortcuts

| Shortcut | Full Command | Description | Example |
|----------|--------------|-------------|---------|
| `/ms` | `/memory status` | Check memory system status | `/ms` |
| `/mr` | `/memory recall` | Recall memory context | `/mr patterns` |
| `/mu` | `/memory update` | Update memory file | `/mu decisions.md "New decision"` |

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
| `/context load` | `<memory_file>` | Explicitly load specific memory file | `/context load patterns.md` |
| `/context unload` | `<memory_file>` | Remove specific memory file from context | `/context unload architecture.md` |
| `/context refresh` | None | Reload all context based on current state | `/context refresh` |
| `/context status` | None | Show currently loaded memory files | `/context status` |
| `/context suggest` | None | Get suggestions for additional relevant context | `/context suggest` |

## Event Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/events status` | None | Check event system status | `/events status` |
| `/events enable` | `<type>` | Enable specific event type | `/events enable fileCreation` |
| `/events disable` | `<type>` | Disable specific event type | `/events disable buildEvents` |
| `/events trigger` | `<type>` | Manually trigger event processing | `/events trigger gitOperations` |
| `/events config` | `<key> <value>` | Configure event system | `/events config notification_level verbose` |

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
STATUS: <success|failure>
DETAILS: <relevant details about operation>
NEXT STEPS: <suggested follow-up actions>
```

## Command Chaining

Commands can be chained using the `&&` operator:

```
/memory recall architecture && /memory update architecture.md "Updated architecture"
```

## Command Permissions

All memory commands are available in any operational mode, but some have mode-specific behaviors:

- Save operations in Review mode include review metadata
- Update operations in Implement mode include implementation details
- Consolidate operations in Think mode include decision reasoning

## Annotation Commands

These aren't typed as commands, but are used in code comments to trigger memory updates:

| Annotation | Purpose | Example |
|------------|---------|---------|
| `// @memory:note` | Add note to session_notes.md | `// @memory:note This approach handles edge cases better` |
| `// @memory:decision` | Add to decisions.md | `// @memory:decision We're using JWT for authentication` |
| `// @memory:pattern` | Add to patterns.md | `// @memory:pattern This pattern for API routing should be followed` |
| `// @memory:architecture` | Add to architecture.md | `// @memory:architecture This service handles payment processing` |
| `// @memory:todo` | Add to current_context.md | `// @memory:todo Refactor this component to use the new pattern` |
| `// @memory:progress` | Update progress.md | `// @memory:progress Completed user authentication flow` |

## Examples

### Basic Workflow Examples

Setting up a new project:
```
/memory init
/memory update long_term/project_brief.md "Project description..."
/memory status
```

Starting a new feature in THINK mode:
```
# First, select THINK in UI dropdown
/mode think
/think explore "user authentication"
/memory save working_decisions.md
```

Moving to planning:
```
# First, select PLAN in UI dropdown
/mode plan
/plan create "user authentication"
/memory update current_context.md "Planning user authentication..."
/plan approve
```

Starting implementation:
```
# First, select IMPLEMENT in UI dropdown
/mode implement
/implement start "user authentication"
/memory update progress.md "Started implementing user authentication..."
/implement checkpoint
```

Reviewing implementation:
```
# First, select REVIEW in UI dropdown
/mode review
/review code "src/auth/login.ts"
/memory save session_notes.md
/review approve
```

Documenting completed work:
```
# First, select DOCUMENT in UI dropdown
/mode document
/document update api-docs
/memory promote working_decisions.md
/document validate
```

### Advanced Examples

Complex search:
```
/memory search -c architecture,patterns "authentication flow"
```

Consolidating related memories:
```
/memory consolidate "auth_flow.md,auth_api.md,auth_security.md" "authentication.md"
```

Configuring event notifications:
```
/memory config events.notification_level verbose
/events enable gitOperations
/events disable fileModification
```

Using annotations in code:
```javascript
// @memory:pattern This factory pattern should be used for all service initialization
function createAuthService(config) {
  // Implementation
}

// @memory:decision We're using JWT with asymmetric keys for auth
const authType = 'jwt-asymmetric';

// @memory:todo Need to implement refresh token flow
function handleLogin() {
  // Current implementation
}
```

## Troubleshooting Commands

If commands aren't working as expected:

1. Check command syntax:
   ```
   /memory help
   /memory <command> -h
   ```

2. Verify memory system status:
   ```
   /memory status
   /context status
   ```

3. Reload context if needed:
   ```
   /context refresh
   ```

4. Reset to default mode:
   ```
   # Select THINK in UI dropdown
   /mode think
   ```
