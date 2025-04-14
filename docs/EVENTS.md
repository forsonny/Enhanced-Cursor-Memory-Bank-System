# Event System Documentation

This document explains the event-triggered memory update system in the Enhanced Memory Bank System.

## Overview

The event system automatically updates memory files based on development activities without requiring explicit commands. It monitors for specific events and triggers appropriate memory updates.

## Event Types

The system detects and responds to these event types:

### File Events

| Event | Description | Memory Updates |
|-------|-------------|----------------|
| **File Creation** | New files added to the project | progress.md, current_context.md |
| **File Modification** | Changes to existing files | current_context.md, progress.md |
| **File Deletion** | Removal of project files | current_context.md, progress.md |

### Build Events

| Event | Description | Memory Updates |
|-------|-------------|----------------|
| **Successful Build** | Build completes successfully | progress.md, current_context.md |
| **Failed Build** | Build fails | current_context.md, session_notes.md |

### Test Events

| Event | Description | Memory Updates |
|-------|-------------|----------------|
| **Successful Tests** | Tests pass | progress.md |
| **Failed Tests** | Tests fail | current_context.md, session_notes.md |

### Git Events

| Event | Description | Memory Updates |
|-------|-------------|----------------|
| **Git Commit** | Code committed to repository | progress.md, current_context.md |
| **Branch Change** | Switch between git branches | current_context.md |
| **Merge Operation** | Merging between branches | current_context.md, progress.md |

### Session Events

| Event | Description | Memory Updates |
|-------|-------------|----------------|
| **Session Start** | Beginning of development session | current_context.md, session_notes.md |
| **Session End** | End of development session | progress.md, session_notes.md |

### Mode Events

| Event | Description | Memory Updates |
|-------|-------------|----------------|
| **Mode Transition** | Switching between operational modes | Depends on specific transition |

### User Annotation Events

| Event | Description | Memory Updates |
|-------|-------------|----------------|
| **@memory:note** | User adds a note annotation | session_notes.md |
| **@memory:decision** | User documents a decision | decisions.md |
| **@memory:pattern** | User identifies a pattern | patterns.md |
| **@memory:architecture** | User notes architecture detail | architecture.md |
| **@memory:todo** | User flags a todo item | current_context.md |
| **@memory:progress** | User records progress | progress.md |

## Event Processing

### Priority Order

Events are processed in this priority order (high to low):

1. Explicit commands (e.g., `/memory update`)
2. User annotations (e.g., `// @memory:decision`)
3. Mode transitions
4. Git operations
5. Build/test events
6. File operations
7. Session boundaries

### Event Batching

Similar events within a short timeframe are batched to prevent excessive updates:

- Multiple file modifications are treated as a single logical change
- Multiple test runs are consolidated into a single result
- Related memory updates are combined for consistency

### Conflict Resolution

When events conflict, the system resolves them using these rules:

- Explicit commands override automatic events
- Later events override earlier ones in same priority level
- User is prompted for resolution when automatic resolution fails

### Threshold Filtering

Events are filtered based on significance:

- Minor file changes may not trigger updates
- Frequent build attempts may be consolidated
- Trivial git operations may be ignored

## Configuration

The event system is configured in `.cursor/memory/config.json`:

```json
{
  "events": {
    "enabled": true,
    "notification_level": "standard",
    "batch_window": "5s",
    "fileCreation": {
      "enabled": true,
      "memoryUpdates": ["progress", "current_context"]
    },
    "fileModification": {
      "enabled": true,
      "threshold": "significant",
      "memoryUpdates": ["current_context", "progress"]
    },
    "buildEvents": {
      "enabled": true,
      "failureUpdates": ["current_context", "session_notes"],
      "successUpdates": ["progress"]
    },
    "testExecution": {
      "enabled": true,
      "failureUpdates": ["current_context", "session_notes"],
      "successUpdates": ["progress"]
    },
    "gitOperations": {
      "enabled": true,
      "commitUpdates": ["progress"],
      "branchUpdates": ["current_context"]
    },
    "sessionBoundaries": {
      "enabled": true,
      "startUpdates": ["current_context", "session_notes"],
      "endUpdates": ["progress", "session_notes"]
    },
    "modeTransitions": {
      "enabled": true,
      "updates": {
        "THINK": ["working_decisions", "session_notes"],
        "PLAN": ["current_context", "working_decisions"],
        "IMPLEMENT": ["progress", "current_context"],
        "REVIEW": ["session_notes", "working_decisions"],
        "DOCUMENT": ["progress", "decisions", "patterns", "architecture"]
      }
    },
    "annotations": {
      "enabled": true,
      "patterns": {
        "note": "session_notes.md",
        "decision": "decisions.md",
        "pattern": "patterns.md",
        "architecture": "architecture.md",
        "todo": "current_context.md",
        "progress": "progress.md"
      }
    }
  }
}
```

### Configuration Options

| Option | Description | Values |
|--------|-------------|--------|
| `enabled` | Master toggle for event system | `true`/`false` |
| `notification_level` | How much feedback on events | `none`, `minimal`, `standard`, `verbose` |
| `batch_window` | Time window for batching similar events | Time string (e.g., `5s`, `1m`) |
| `<event_type>.enabled` | Enable/disable specific event type | `true`/`false` |
| `<event_type>.memoryUpdates` | Which files to update for event | Array of memory file names |
| `<event_type>.threshold` | Significance threshold for triggering | `any`, `minor`, `significant`, `major` |

## Notifications

The system notifies users about memory updates with configurable detail levels:

### Notification Levels

- `none`: No notifications
- `minimal`: Essential updates only
- `standard`: All significant updates
- `verbose`: All updates with details

### Notification Format

```
MEMORY UPDATE: progress.md
TRIGGER: Successful build
CHANGES: Added milestone "Authentication API completed"
```

## Using Annotations

Code annotations allow direct memory updates from code comments:

### Syntax

```
// @memory:<type> <content>
```

For example:

```javascript
// @memory:note This approach handles edge cases better
function handleEdgeCases() {
  // Implementation
}

// @memory:decision We're using JWT for authentication
const authType = 'jwt';

// @memory:pattern This pattern for API routing should be followed
router.get('/api/:resource', authMiddleware, (req, res) => {
  // Implementation
});

// @memory:architecture This service handles payment processing
class PaymentService {
  // Implementation
}

// @memory:todo Refactor this component to use the new pattern
function legacyComponent() {
  // Implementation
}

// @memory:progress Completed user authentication flow
function authenticationFlow() {
  // Implementation
}
```

### Available Annotation Types

| Annotation | Target File | Purpose |
|------------|-------------|---------|
| `@memory:note` | session_notes.md | Record observations and findings |
| `@memory:decision` | decisions.md | Document important decisions |
| `@memory:pattern` | patterns.md | Establish coding patterns |
| `@memory:architecture` | architecture.md | Document architectural details |
| `@memory:todo` | current_context.md | Track development tasks |
| `@memory:progress` | progress.md | Record development progress |

## Manual Event Control

The event system can be manually controlled with these commands:

| Command | Purpose | Example |
|---------|---------|---------|
| `/events status` | Check event system status | `/events status` |
| `/events enable <type>` | Enable specific event type | `/events enable fileCreation` |
| `/events disable <type>` | Disable specific event type | `/events disable buildEvents` |
| `/events trigger <type>` | Manually trigger event processing | `/events trigger gitOperations` |
| `/events config <key> <value>` | Configure event system | `/events config notification_level verbose` |

## Event Logs

The system maintains an event log in `.cursor/memory/event_log.json` that tracks:

- Event type and timestamp
- Trigger source
- Affected memory files
- Changes made
- Batching information

This log can be used to audit and debug memory changes.

## Mode-Specific Event Behavior

Different operational modes influence how events are processed:

| Mode | Event Handling |
|------|----------------|
| **THINK** | Emphasizes research findings and exploration notes |
| **PLAN** | Focuses on task breakdown and implementation plans |
| **IMPLEMENT** | Prioritizes progress updates and implementation details |
| **REVIEW** | Highlights improvement suggestions and issue tracking |
| **DOCUMENT** | Balances updates across all long-term memory files |

## Best Practices

1. **Enable relevant events only**: Turn off events you don't need
2. **Use annotations liberally**: They're the most direct way to update memory
3. **Set appropriate thresholds**: Tune significance thresholds to avoid noise
4. **Review event logs periodically**: Look for patterns or missed updates
5. **Adjust notification levels**: Use verbose during setup, standard for daily use
6. **Create custom event mappings**: Configure which files update for each event

## Advanced Configuration

### Custom Event Types

You can define custom event types in the configuration:

```json
"customEvents": {
  "deploymentEvents": {
    "enabled": true,
    "memoryUpdates": ["progress", "architecture"],
    "triggers": ["*deploy*", "*release*"]
  }
}
```

### Event Filters

Filter events based on file patterns:

```json
"fileModification": {
  "enabled": true,
  "filters": {
    "include": ["src/**/*.ts", "src/**/*.tsx"],
    "exclude": ["**/*.test.ts", "**/*.spec.ts"]
  },
  "memoryUpdates": ["current_context", "progress"]
}
```

### Complex Update Rules

Define complex rules for updates:

```json
"gitOperations": {
  "enabled": true,
  "rules": [
    {
      "condition": "commit.message.includes('fix')",
      "updates": ["progress.md:bugs", "current_context.md:fixes"]
    },
    {
      "condition": "commit.message.includes('feat')",
      "updates": ["progress.md:features", "current_context.md:new_features"]
    }
  ]
}
```

## Troubleshooting Events

### Common Issues

1. **Events not triggering**:
   - Check if event type is enabled in config
   - Verify the significance threshold isn't too high
   - Ensure memory files exist

2. **Too many updates**:
   - Increase significance threshold
   - Adjust batch window duration
   - Disable event types you don't need

3. **Updates going to wrong files**:
   - Check memoryUpdates configuration
   - Verify annotation type matches intended target

4. **Annotation not working**:
   - Ensure syntax is correct (// @memory:type content)
   - Check that annotations are enabled in config
   - Verify target memory file exists

### Resetting Event System

If the event system becomes misconfigured:

```
/events config reset
```

This resets event configuration to defaults without losing memory content.
