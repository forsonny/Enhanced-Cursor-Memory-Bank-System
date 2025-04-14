# Usage Guide

This guide explains how to use the Enhanced Memory Bank System (EMBS) for Cursor effectively.

## Basic Concepts

The Enhanced Memory Bank System provides both short-term and long-term memory capabilities for Cursor:

- **Short-Term Memory**: Session-specific context that's active during the current development session
- **Long-Term Memory**: Persistent knowledge that's maintained across all sessions

The system operates in different modes, each with specialized memory behaviors:

- **THINK**: Exploration mode for understanding problems
- **PLAN**: Planning mode for designing solutions
- **IMPLEMENT**: Implementation mode for writing code
- **REVIEW**: Review mode for analyzing code
- **DOCUMENT**: Documentation mode for updating docs

## Getting Started

### Initializing the System

After installation, initialize the memory system:

```
/memory init
```

This will set up the memory system and create initial files if they don't exist.

### Checking System Status

To see the current state of the memory system:

```
/memory status
```

This will show:
- Initialization status
- Current operational mode
- Available memory files
- Recent activities

### Updating Your Project Brief

Start by defining your project:

```
/memory update long_term/project_brief.md "Your project description..."
```

This creates a foundation for all future work.

## Working with Modes

### Mode Switching

Mode switching requires two steps:

1. **First, select the mode in Cursor's UI dropdown**:
   - Click on the mode selector in the Cursor chat interface
   - Select the desired mode (THINK, PLAN, IMPLEMENT, REVIEW, DOCUMENT)

2. **Then, confirm the mode to the AI**:
   ```
   /mode <mode_name>
   ```

Examples:
- Select "THINK" in UI, then type `/mode think`
- Select "PLAN" in UI, then type `/mode plan`

### Mode-Specific Workflows

#### THINK Mode

Use when exploring problems and researching solutions:

```
# After selecting THINK in UI
/mode think

# Explore a topic
/think explore authentication

# Compare approaches
/think compare "JWT vs session auth"

# Research a specific topic
/think research "modern auth best practices"
```

#### PLAN Mode

Use when designing implementation plans:

```
# After selecting PLAN in UI
/mode plan

# Create an implementation plan
/plan create user-authentication

# Validate against architecture
/plan validate

# Mark plan as approved
/plan approve
```

#### IMPLEMENT Mode

Use when writing actual code:

```
# After selecting IMPLEMENT in UI
/mode implement

# Start implementation
/implement start user-authentication

# Record a checkpoint
/implement checkpoint

# Mark as complete
/implement complete
```

#### REVIEW Mode

Use when analyzing existing code:

```
# After selecting REVIEW in UI
/mode review

# Review specific file
/review code src/auth/login.ts

# Generate suggestions
/review suggest

# Mark as approved
/review approve
```

#### DOCUMENT Mode

Use when creating documentation:

```
# After selecting DOCUMENT in UI
/mode document

# Update documentation
/document update api-docs

# Promote temporary documentation
/document promote session_notes.md

# Validate documentation
/document validate
```

## Memory Commands

### Core Commands

- `/memory init` - Initialize the memory system
- `/memory status` - Display current memory system status
- `/memory help` - Show available memory commands

### Memory Retrieval

- `/memory recall <context>` - Retrieve information from specified memory context
  ```
  /memory recall architecture
  /memory recall patterns
  /memory recall current_context
  ```

### Memory Updates

- `/memory save <context>` - Save current information to specified memory context
  ```
  /memory save architecture
  /memory save patterns -t  # Save as temporary (short-term)
  ```

- `/memory update <file> <content>` - Update specific memory file
  ```
  /memory update decisions.md "Decision: We will use TypeScript"
  ```

### Memory Organization

- `/memory promote <source>` - Promote short-term memory to long-term
  ```
  /memory promote working_decisions.md
  ```

- `/memory archive <file>` - Archive memory that's no longer relevant
  ```
  /memory archive old_patterns.md
  ```

- `/memory consolidate <files>` - Combine related memories
  ```
  /memory consolidate auth_*.md authentication.md
  ```

### Memory Search

- `/memory search <query>` - Search across memory for information
  ```
  /memory search authentication
  /memory search -c architecture database  # Search in specific context
  ```

## Automatic Context Loading

The system automatically loads relevant memory files based on:

- **File Types**: Different file extensions trigger loading specific memory
- **File Locations**: Files in specific directories load relevant memory
- **Current Mode**: Each mode prioritizes different memory files
- **Project Complexity**: More complex projects load more comprehensive context

For example:
- Opening a `.ts` file loads TypeScript patterns
- Editing files in `/api/` loads API-related memory
- Being in THINK mode loads architecture and patterns

## Memory Annotations

You can update memory automatically using code comments:

```javascript
// @memory:note This approach handles edge cases better
function handleAuth() {
  // ...
}

// @memory:decision We're using JWT for authentication
const authType = 'jwt';

// @memory:pattern This pattern should be followed for all API routes
router.get('/api/:resource', authMiddleware, (req, res) => {
  // ...
});
```

Available annotations:
- `@memory:note` - Adds to session_notes.md
- `@memory:decision` - Adds to decisions.md
- `@memory:pattern` - Adds to patterns.md
- `@memory:architecture` - Adds to architecture.md
- `@memory:todo` - Adds to current_context.md
- `@memory:progress` - Updates progress.md

## Advanced Usage

### Configuration Customization

Adjust memory system behavior:

```
/memory config short_term.retention 14d
/memory config auto_context.max_files 10
/memory config events.notification_level verbose
```

### Feature Toggling

Enable/disable specific features:

```
/memory toggle auto_context
/memory toggle events.fileCreation
/memory toggle auto_promote
```

### Command Shortcuts

Quick access to common commands:

- `/ms` - Alias for `/memory status`
- `/mr <context>` - Alias for `/memory recall <context>`
- `/mu <file> <content>` - Alias for `/memory update <file> <content>`

## Memory-First Workflow

For best results, follow this workflow:

1. Start in **THINK mode** to explore problems
2. Switch to **PLAN mode** to design solutions
3. Move to **IMPLEMENT mode** for code changes
4. Use **REVIEW mode** to analyze implementation
5. Finish with **DOCUMENT mode** to update docs

Throughout this process, memory is automatically maintained, ensuring continuity across sessions.

## Best Practices

1. **Keep memory files focused**: Don't try to put everything in one file
2. **Use consistent terminology**: Be consistent in naming and descriptions
3. **Regularly review memory**: Periodically check for outdated information
4. **Promote important short-term memory**: Don't let valuable insights remain temporary
5. **Use appropriate memory for the task**: Patterns in patterns.md, decisions in decisions.md, etc.
6. **Let the system work automatically**: Use annotations and let events trigger updates
7. **Switch modes deliberately**: Each mode has specific strengths for different tasks

## Troubleshooting

If memory context seems missing:

1. Check if the memory file exists:
   ```
   ls -la .cursor/memory/long_term/
   ```

2. Verify file content:
   ```
   cat .cursor/memory/long_term/patterns.md
   ```

3. Manually load context:
   ```
   /memory recall patterns
   ```

If the system isn't using the right mode:

1. Check current mode:
   ```
   /memory status
   ```

2. Reset mode if needed (remember to select in UI first):
   ```
   /mode think
   ```
   
## Next Steps

Explore these additional resources:

- [COMMANDS.md](COMMANDS.md) - Complete command reference
- [CUSTOM_MODES.md](CUSTOM_MODES.md) - Custom modes configuration
- [MEMORY_STRUCTURE.md](MEMORY_STRUCTURE.md) - Memory file structure details
- [EVENTS.md](EVENTS.md) - Event system documentation
