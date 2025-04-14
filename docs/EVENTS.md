# Event System Documentation (Updated)

This document explains the user-reported event system in the Enhanced Memory Bank System.

## Overview

The event system allows you to report significant development events that should trigger memory updates. Since the AI can't automatically detect events, you need to explicitly report them using commands.

## Reporting Events

To report a development event, use this command:

```
/memory event <event_type> <description>
```

For example:
```
/memory event commit "Implemented user authentication flow"
```

This tells the AI that you've committed code that implements authentication, and it will suggest appropriate memory updates based on this information.

## Supported Event Types

The system recognizes these event categories:

### File Events

| Event Type | Description | Example |
|------------|-------------|---------|
| `create` | New file added | `/memory event create "Created auth middleware"` |
| `modify` | File modified | `/memory event modify "Updated login component"` |
| `delete` | File removed | `/memory event delete "Removed legacy auth"` |

### Build Events

| Event Type | Description | Example |
|------------|-------------|---------|
| `build_success` | Build completed successfully | `/memory event build_success "All tests passing"` |
| `build_failure` | Build failed | `/memory event build_failure "Auth module failing"` |

### Test Events

| Event Type | Description | Example |
|------------|-------------|---------|
| `test_success` | Tests passed | `/memory event test_success "Auth tests passing"` |
| `test_failure` | Tests failed | `/memory event test_failure "Login tests failing"` |

### Git Events

| Event Type | Description | Example |
|------------|-------------|---------|
| `commit` | Code committed | `/memory event commit "Implemented authentication"` |
| `branch` | Branch changed | `/memory event branch "Switched to feature/auth"` |
| `merge` | Branches merged | `/memory event merge "Merged auth branch to main"` |

### Session Events

| Event Type | Description | Example |
|------------|-------------|---------|
| `session_start` | Beginning development session | `/memory event session_start "Starting auth work"` |
| `session_end` | Ending development session | `/memory event session_end "Completed login feature"` |

### Mode Events

| Event Type | Description | Example |
|------------|-------------|---------|
| `mode_change` | Switched operational modes | `/memory event mode_change "PLAN to IMPLEMENT"` |

## Event Response Process

When you report an event, the AI will follow this process:

1. **Acknowledge the event**: Confirm that it understands the reported event
   - "I've noted your report of committing code for authentication implementation"

2. **Suggest memory updates**: Based on the event type, suggest appropriate memory updates
   - "Based on this commit event, I suggest updating these memory files:"

3. **Provide update content**: Offer specific content to be added to memory files
   - "Here's the content you can add to progress.md:"

4. **Confirm implementation**: Ask for confirmation when updates are completed
   - "Have you updated the memory files? Let me know when it's done."

## Event-Memory Relationships

Different events typically trigger updates to specific memory files:

```
File Creation:
  → Updates to progress.md with new component information
  → Updates to architecture.md for structural additions
  → Updates to current_context.md if related to active task

File Modification:
  → Updates to current_context.md with latest changes
  → Possible pattern extraction for repeated modifications
  → Updates to progress.md for significant milestones

Successful Build:
  → Updates to progress.md with build success
  → Updates to current_context.md with next steps
  → Additions to session_notes.md with build information

Failed Build:
  → Additions to current_context.md with issues
  → Updates to session_notes.md with error details
  → Possible additions to patterns.md for recurring problems

Test Execution:
  → Updates to progress.md with test results
  → Additions to session_notes.md with testing notes
  → Possible pattern updates for test approaches

Git Commit:
  → Updates to progress.md with commit milestone
  → Possible decision documentation from commit message
  → Updates to current_context.md with next steps

Branch Change:
  → Updates to current_context.md with branch context
  → Loading relevant feature context from long-term memory
  → Possible context switch in progress.md

Mode Transition:
  → Updates to specific memory files based on mode rules
  → Promoting/consolidating memory based on transition type
  → Updates to current_context.md with mode-specific focus

Session Start:
  → Loading relevant memory context
  → Resuming current_context.md from previous session
  → Updates to session_notes.md with session start

Session End:
  → Consolidating session_notes.md
  → Updates to progress.md with session accomplishments
  → Promoting important short-term to long-term memory
```

## Code Annotations

In addition to explicit event reporting, the system recognizes annotations in code comments that suggest memory updates:

```javascript
// @memory:note This approach handles edge cases better than alternatives
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

When the AI sees these annotations in code, it will suggest appropriate memory updates.

## Memory Update Format

When suggesting memory updates, the AI formats content appropriately for the target file:

### Progress Updates

```markdown
### User Authentication
**Completed:** 2025-04-14
**Description:** Implemented basic authentication flow
**Status:** In progress (70%)
**Next Steps:** Add password reset functionality
```

### Decision Records

```markdown
### Authentication Approach
**Decision:** Use JWT with asymmetric keys
**Date:** 2025-04-14
**Rationale:** Better security and support for microservices
**Implications:**
- Need to implement key rotation
- Simplifies cross-service authentication
```

### Pattern Documentation

```markdown
### Repository Pattern
**Usage:** Data access abstraction
**Implementation:** Interface + concrete implementation
**Example:**
```typescript
interface UserRepository {
  findById(id: string): Promise<User>;
}
```

## Event Reporting Best Practices

To get the most out of the event system:

1. **Report meaningful events**: Focus on events that actually change project state
2. **Be specific in descriptions**: Include relevant details about what changed
3. **Report events promptly**: Report events when they occur for accurate history
4. **Use consistent event types**: Be consistent in how you categorize events
5. **Implement suggested updates**: When the AI suggests memory updates, add them
6. **Use annotations in code**: Add annotations when writing significant code
7. **Report session boundaries**: Use session_start and session_end to mark boundaries

## Event Reporting Automation

While the system requires manual event reporting, you can make this easier by:

1. **Creating shell aliases** for common event commands
2. **Adding git hooks** that prompt you to report commit events
3. **Using IDE snippets** for common annotations
4. **Setting up build scripts** that report build events

## Mode-Specific Event Behavior

Different operational modes influence how the AI responds to events:

- **THINK Mode**: Emphasizes research findings and exploration notes
- **PLAN Mode**: Focuses on task breakdown and implementation plans
- **IMPLEMENT Mode**: Prioritizes progress updates and implementation details
- **REVIEW Mode**: Highlights improvement suggestions and issue tracking
- **DOCUMENT Mode**: Balances updates across all long-term memory files

The AI adjusts its event response based on the current operational mode.

## Troubleshooting Event Reporting

If event reporting isn't working as expected:

1. **Check command syntax**: Make sure you're using the correct event type
2. **Verify mode alignment**: Some events make more sense in certain modes
3. **Check file existence**: Make sure the target memory files exist
4. **Be specific in descriptions**: Provide enough detail for meaningful updates
5. **View suggested updates**: Make sure to implement the AI's suggested changes

If the AI seems confused by an event, try providing more context about what happened and why it's significant.
