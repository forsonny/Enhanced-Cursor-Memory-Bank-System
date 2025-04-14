# Memory Structure Documentation

This document explains the memory file structure used by the Enhanced Memory Bank System, including the purpose and content of each file.

## Directory Structure

The Enhanced Memory Bank System organizes memory in a hierarchical structure:

```
.cursor/memory/
├── config.json               # System configuration
├── short_term/               # Session-specific memory
│   ├── current_context.md    # Active development focus
│   ├── working_decisions.md  # Temporary decisions
│   └── session_notes.md      # Current session notes
└── long_term/                # Persistent memory
    ├── project_brief.md      # Core project definition
    ├── architecture.md       # System architecture
    ├── patterns.md           # Established patterns
    ├── decisions.md          # Important project decisions
    └── progress.md           # Development progress
```

## Configuration File

`.cursor/memory/config.json` controls the behavior of the memory system:

```json
{
  "system": {
    "version": "1.0.0",
    "initialized": true,
    "current_mode": "THINK",
    "complexity_level": 2,
    "last_updated": "",
    "memory_root": ".cursor/memory"
  },
  "short_term": {
    "enabled": true,
    "retention": "7d",
    "auto_cleanup": true,
    "files": { ... }
  },
  "long_term": {
    "enabled": true,
    "auto_promote": true,
    "files": { ... }
  },
  "auto_context": { ... },
  "events": { ... },
  "commands": { ... },
  "modes": { ... }
}
```

Key configuration sections:
- `system`: Core system parameters
- `short_term`: Short-term memory configuration
- `long_term`: Long-term memory configuration
- `auto_context`: Automatic context loading settings
- `events`: Event-triggered update configuration
- `commands`: Command interface settings
- `modes`: Operational mode settings

## Short-Term Memory Files

Short-term memory files store information that's primarily relevant to the current development session.

### current_context.md

**Purpose**: Tracks what you're currently working on

**Structure**:
```markdown
# Current Context

## Active Task
[Task description]

## Background
[Relevant background information]

## Current Focus
[What I'm working on right now]

## Next Steps
1. [Step 1]
2. [Step 2]
3. [Step 3]

## Open Questions
- [Question 1]
- [Question 2]

## Recent Changes
- [Change 1] - [Timestamp]
- [Change 2] - [Timestamp]

## Mode: [CURRENT_MODE]

Last Updated: [TIMESTAMP]
```

**Usage**: Updated whenever your focus changes or when switching between tasks

### working_decisions.md

**Purpose**: Documents decisions being considered but not yet finalized

**Structure**:
```markdown
# Working Decisions

## Under Consideration

### [Decision Topic 1]

**Options:**
- Option A: [Description]
  - Pros: [List pros]
  - Cons: [List cons]
- Option B: [Description]
  - Pros: [List pros]
  - Cons: [List cons]

**Current Thinking:** [Preliminary decision direction]

## Recently Decided

### [Decision 1]

**Decision:** [What was decided]
**Rationale:** [Why this decision was made]
**Date:** [When decided]
**Status:** [Implemented/Pending Implementation]
```

**Usage**: Updated during exploration and planning phases; decisions may be promoted to long-term memory when finalized

### session_notes.md

**Purpose**: Captures notes, discoveries, and thoughts from the current session

**Structure**:
```markdown
# Session Notes

## Session: [DATE] - [START TIME]

### Goals
- [Goal 1]
- [Goal 2]

### Notes
- [Note 1]
- [Note 2]

### Discoveries
- [Discovery 1]
- [Discovery 2]

### Blockers
- [Blocker 1]
- [Blocker 2]

### Next Session Plan
- [Plan 1]
- [Plan 2]

Session End: [END TIME]
Total Duration: [DURATION]
```

**Usage**: Updated throughout a development session; important notes may be promoted to long-term memory

## Long-Term Memory Files

Long-term memory files store information that persists across development sessions.

### project_brief.md

**Purpose**: Defines the core project requirements and goals

**Structure**:
```markdown
# Project Brief

## Overview
[Project description]

## Goals
- [Goal 1]
- [Goal 2]

## Requirements
- [Requirement 1]
- [Requirement 2]

## Constraints
- [Constraint 1]
- [Constraint 2]

## Stakeholders
- [Stakeholder 1]
- [Stakeholder 2]

## Timeline
- Start: [Start Date]
- Milestones:
  - [Milestone 1]: [Date]
  - [Milestone 2]: [Date]
- Target Completion: [End Date]

## Success Criteria
- [Criterion 1]
- [Criterion 2]
```

**Usage**: Updated when project requirements or goals change; referenced when making significant decisions

### architecture.md

**Purpose**: Documents the system architecture and component relationships

**Structure**:
```markdown
# System Architecture

## Overview
[High-level architecture description]

## Components

### [Component 1]
**Purpose:** [What this component does]
**Responsibilities:**
- [Responsibility 1]
- [Responsibility 2]

### [Component 2]
**Purpose:** [What this component does]
**Responsibilities:**
- [Responsibility 1]
- [Responsibility 2]

## Data Flow
[Describe how data flows through the system]

## Technologies
- [Technology 1]: [Purpose/Usage]
- [Technology 2]: [Purpose/Usage]

## Interfaces

### [Interface 1]
**Between:** [Component A] and [Component B]
**Protocol:** [Protocol]
**Data:** [Data exchanged]

## Deployment Architecture
[Describe how the system is deployed]

## Security Considerations
[Describe security architecture]
```

**Usage**: Updated when the system architecture changes; referenced during design and implementation

### patterns.md

**Purpose**: Records established coding patterns and conventions

**Structure**:
```markdown
# Patterns & Conventions

## Coding Standards

### Naming Conventions
- [Convention 1]
- [Convention 2]

### Structure Patterns
- [Pattern 1]
- [Pattern 2]

### Error Handling
- [Approach 1]
- [Approach 2]

## Design Patterns

### [Pattern Category 1]

#### [Pattern 1]
**Usage:** [When to use]
**Implementation:** [How to implement]
**Example:**
```[language]
[Code example]
```

## Anti-patterns

### [Anti-pattern 1]
**Problem:** [Description]
**Solution:** [Better approach]
```

**Usage**: Updated when new patterns emerge; referenced during implementation and code review

### decisions.md

**Purpose**: Records important project decisions

**Structure**:
```markdown
# Project Decisions

## Architecture Decisions

### [Decision 1]
**Decision:** [What was decided]
**Date:** [When decided]
**Status:** [Implemented/In Progress/Planned]
**Context:** [Background and context]
**Options Considered:**
- [Option 1]: [Description]
- [Option 2]: [Description]
**Decision Rationale:** [Why this option was chosen]
**Consequences:**
- [Consequence 1]
- [Consequence 2]

## Implementation Decisions

### [Decision 1]
**Decision:** [What was decided]
**Date:** [When decided]
**Status:** [Implemented/In Progress/Planned]
**Context:** [Background and context]
**Options Considered:**
- [Option 1]: [Description]
- [Option 2]: [Description]
**Decision Rationale:** [Why this option was chosen]
**Consequences:**
- [Consequence 1]
- [Consequence 2]

## Technology Decisions

### [Decision 1]
**Decision:** [What was decided]
**Date:** [When decided]
**Status:** [Implemented/In Progress/Planned]
**Context:** [Background and context]
**Options Considered:**
- [Option 1]: [Description]
- [Option 2]: [Description]
**Decision Rationale:** [Why this option was chosen]
**Consequences:**
- [Consequence 1]
- [Consequence 2]
```

**Usage**: Updated when significant decisions are made; referenced when making related decisions

### progress.md

**Purpose**: Tracks development progress and milestones

**Structure**:
```markdown
# Project Progress

## Current Status
**Overall Progress:** [percentage]
**Current Phase:** [phase]
**Active Areas:** [areas]

## Completed Items

### [Feature/Component 1]
**Completed:** [Date]
**Description:** [What was completed]
**Notes:** [Any relevant notes]

## In Progress

### [Feature/Component 1]
**Started:** [Date]
**Estimated Completion:** [Date]
**Progress:** [percentage]
**Current Focus:** [What's being worked on]
**Blockers:** [Any blockers]

## Planned Items

### [Feature/Component 1]
**Priority:** [High/Medium/Low]
**Estimated Start:** [Date]
**Estimated Effort:** [Effort]
**Dependencies:** [Any dependencies]

## Milestone Tracking

### [Milestone 1]
**Target Date:** [Date]
**Current Status:** [On Track/At Risk/Delayed]
**Completion:** [percentage]
**Notes:** [Any notes]
```

**Usage**: Updated as development progresses; referenced when planning and reporting

## Optional Specialized Memory Files

You can extend the memory system with additional specialized files:

### test_coverage.md

**Purpose**: Tracks test coverage and testing priorities

**Structure**:
```markdown
# Test Coverage

## Overall Status
**Unit Test Coverage:** [percentage]
**Integration Test Coverage:** [percentage]
**E2E Test Coverage:** [percentage]

## Component Coverage

### [Component 1]
**Coverage:** [percentage]
**Critical Areas:**
- [Area 1]: [Coverage]
- [Area 2]: [Coverage]
**Gaps:**
- [Gap 1]
- [Gap 2]

## Recent Test Improvements
- [Improvement 1] - [Date]
- [Improvement 2] - [Date]

## Testing TODOs
- [TODO 1]
- [TODO 2]
```

### api.md

**Purpose**: Documents API endpoints and usage

**Structure**:
```markdown
# API Documentation

## Endpoints

### [Endpoint 1]
**Path:** `[path]`
**Method:** `[method]`
**Description:** [description]
**Request Parameters:**
- `[param1]`: [description]
- `[param2]`: [description]
**Response:**
```json
[Example response]
```

## Authentication
[Authentication mechanism details]

## Error Handling
[How API errors are handled and returned]
```

### database.md

**Purpose**: Documents database schema and operations

**Structure**:
```markdown
# Database Documentation

## Schema

### [Table/Collection 1]
**Purpose:** [What this stores]
**Fields:**
- `[field1]`: [type] - [description]
- `[field2]`: [type] - [description]
**Indexes:**
- [index1]
- [index2]
**Relationships:**
- [relationship1]
- [relationship2]

## Migrations

### [Migration 1]
**Date:** [Date]
**Description:** [What changed]
**Reason:** [Why it changed]

## Performance Considerations
- [Consideration 1]
- [Consideration 2]
```

## Memory Flow

The memory system follows these information flow patterns:

1. **Short-Term to Long-Term**:
   - Working decisions → Decisions
   - Session notes → Various long-term files
   - Current context → Progress

2. **Event-Based Updates**:
   - File creation → Progress, Current context
   - Git operations → Progress, Current context
   - Build events → Progress, Session notes

3. **Mode-Specific Focus**:
   - THINK mode → Working decisions, Session notes
   - PLAN mode → Current context, Working decisions
   - IMPLEMENT mode → Progress, Current context
   - REVIEW mode → Session notes, Working decisions
   - DOCUMENT mode → All long-term memory

## Extending Memory Structure

You can extend the memory structure by:

1. **Adding new memory files** in either short-term or long-term directories
2. **Updating config.json** to include references to new files
3. **Creating specialized files** for specific aspects of your project
4. **Defining new memory relationships** through events and mode configurations

When extending, maintain the hierarchy and update flow to ensure consistency.

## Best Practices

1. **Keep files focused**: Each memory file should have a clear purpose
2. **Follow established formats**: Maintain consistent structure across memory files
3. **Date and timestamp entries**: Include timestamps for all updates
4. **Regular consolidation**: Periodically merge related information
5. **Cleanup outdated information**: Archive or remove obsolete content
6. **Cross-reference related content**: Link between memory files when appropriate
7. **Maintain hierarchy**: Respect the short-term to long-term promotion flow
