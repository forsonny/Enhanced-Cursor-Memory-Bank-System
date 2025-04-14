# Usage Guide (Updated)

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

## Understanding the System's Approach

The Enhanced Memory Bank System works with Cursor's capabilities:

1. **AI reads and follows rules** in .mdc files
2. **AI requests to see memory files** when they're relevant
3. **You provide access to memory files** when requested
4. **You report significant events** to trigger memory updates
5. **AI suggests memory updates** that you can implement

This approach ensures memory persists across sessions while working within Cursor's environment.

## Getting Started

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

The AI will verify the currently selected mode matches your command before proceeding.

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

- `/memory status` - Display current memory system status
- `/memory help` - Show available memory commands

### Memory Retrieval

- `/memory recall <context>` - Request to see specific memory context
  ```
  /memory recall architecture
  /memory recall patterns
  /memory recall current_context
  ```
  The AI will ask you to open the relevant file.

### Memory Updates

- `/memory update <file> <content>` - Suggest updates to specific memory file
  ```
  /memory update decisions.md "Decision: We will use TypeScript"
  ```
  The AI will provide formatted content for you to add to the file.

- `/memory save <context>` - Save current information to specified memory context
  ```
  /memory save architecture
  /memory save patterns -t  # Save as temporary (short-term)
  ```
  The AI will suggest content to add to the appropriate file.

### Memory Organization

- `/memory promote <source>` - Promote short-term memory to long-term
  ```
  /memory promote working_decisions.md
  ```
  The AI will suggest what content to move from short-term to long-term memory.

- `/memory archive <file>` - Archive memory that's no longer relevant
  ```
  /memory archive old_patterns.md
  ```
  The AI will provide instructions for archiving.

- `/memory consolidate <files>` - Combine related memories
  ```
  /memory consolidate auth_*.md authentication.md
  ```
  The AI will ask to see the source files, then provide consolidated content.

### Memory Search

- `/memory search <query>` - Search across memory for information
  ```
  /memory search authentication
  /memory search -c architecture database  # Search in specific context
  ```
  The AI will request to see relevant files to search.

## Event Reporting

Since the system can't automatically detect events, you need to report significant events:

```
/memory event <event_type> <details>
```

For example:
```
/memory event commit "Implemented user authentication"
```

Common event types:
- `commit` - Code committed to repository
- `build_success` - Build completed successfully
- `build_failure` - Build failed
- `test_success` - Tests passed
- `test_failure` - Tests failed
- `create` - New file created
- `modify` - File modified
- `branch` - Git branch changed
- `session_start` - Beginning development session
- `session_end` - Ending development session

When you report an event, the AI will suggest appropriate memory updates based on the event type.

## Memory Annotations

You can create code annotations that the AI recognizes when it sees them:

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
- `@memory:note` - For session_notes.md
- `@memory:decision` - For decisions.md
- `@memory:pattern` - For patterns.md
- `@memory:architecture` - For architecture.md
- `@memory:todo` - For current_context.md
- `@memory:progress` - For progress.md

When the AI sees these annotations, it will suggest appropriate memory updates.

## Memory-First Workflow

For best results, follow this workflow:

1. Start in **THINK mode** to explore problems
2. Switch to **PLAN mode** to design solutions
3. Move to **IMPLEMENT mode** for code changes
4. Use **REVIEW mode** to analyze implementation
5. Finish with **DOCUMENT mode** to update docs

Throughout this process, report significant events and implement suggested memory updates to maintain continuity across sessions.

## Best Practices

1. **Keep memory files focused**: Don't try to put everything in one file
2. **Use consistent terminology**: Be consistent in naming and descriptions
3. **Regularly review memory**: Periodically check for outdated information
4. **Report significant events**: Use the event reporting system consistently
5. **Implement suggested updates**: When the AI suggests memory updates, implement them
6. **Promote important short-term memory**: Don't let valuable insights remain temporary
7. **Switch modes deliberately**: Each mode has specific strengths for different tasks

## Troubleshooting

If the AI seems to be missing context:

1. Check if the memory file exists:
   ```
   ls -la .cursor/memory/long_term/
   ```

2. Open the relevant file when requested:
   ```
   cat .cursor/memory/long_term/patterns.md
   ```

3. Manually provide context:
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
