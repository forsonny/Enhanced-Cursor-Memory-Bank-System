#!/bin/bash

# Enhanced Memory Bank System Initialization Script
# This script creates a complete memory bank system for Cursor

# Error handling
set -e  # Exit immediately if a command exits with a non-zero status

echo "=== Enhanced Memory Bank System Initialization ==="
echo "Creating directory structure..."

# Create directory structure
mkdir -p .cursor/rules
mkdir -p .cursor/memory/short_term
mkdir -p .cursor/memory/long_term

# Function to create a file with content
create_file() {
  local filepath=$1
  local content=$2
  
  echo "Creating $filepath..."
  mkdir -p "$(dirname "$filepath")"
  cat > "$filepath" << 'FILECONTENT'
$content
FILECONTENT
  
  # Replace the placeholder with the actual content
  sed -i.bak "s/\$content/$content/" "$filepath" 2>/dev/null || sed -i "s/\$content/$content/" "$filepath"
  rm -f "$filepath.bak" 2>/dev/null || true
  
  echo "✓ Created $filepath"
}

echo "Creating rule files..."

# Create 001_memory_core.mdc
cat > .cursor/rules/001_memory_core.mdc << 'EOF'
---
description: Core memory system that provides short-term and long-term memory capabilities for AI interactions
globs: alwaysApply: true
---

# Memory Core System

This rule establishes the foundation of the Enhanced Memory Bank System for Cursor. It enables the AI to maintain context across sessions through structured documentation.

## Memory System Architecture

The memory system functions on two distinct levels:

1. **Short-Term Memory**: Session-specific context that's active during the current development session
2. **Long-Term Memory**: Persistent knowledge that's maintained across all sessions

## Core Memory Principles

I follow these principles when working with the memory system:

- **Documentation First**: Every significant decision, pattern, or insight is documented
- **Memory Refresh**: I always load relevant memory before starting work
- **Consistent Updates**: Memory is updated after meaningful changes
- **Memory Hierarchy**: Information flows from short-term to long-term when appropriate
- **Single Source of Truth**: Memory files are the canonical reference for project understanding

## Memory Access Protocol

When I begin work, I MUST check for the existence of memory structures and load relevant context:

1. Review project_brief.md to understand core project requirements
2. Check current_context.md to understand the active development focus
3. Review relevant memory files based on the current task

## Memory Storage Structure

The memory system is organized as follows:

```
.cursor/memory/
├── short_term/
│   ├── current_context.md     # What I'm currently working on
│   ├── working_decisions.md   # Temporary decisions being considered
│   └── session_notes.md       # Notes from the current session
└── long_term/
    ├── project_brief.md       # Core project definition
    ├── architecture.md        # System architecture
    ├── patterns.md            # Established patterns and conventions
    ├── decisions.md           # Important project decisions
    └── progress.md            # Development progress tracking
```

## Memory Initialization Checklist

When the memory system is first initialized in a project, I will:

1. Create the memory directory structure if it doesn't exist
2. Create initial versions of core memory files with appropriate templates
3. Prompt for essential project information to populate project_brief.md
4. Set up initial patterns and conventions in patterns.md
5. Initialize progress.md with baseline project state

## Memory Maintenance Responsibilities

I maintain memory with these responsibilities:

- Ensure memory files remain accurate and up-to-date
- Detect and resolve conflicts between memory files
- Suggest memory consolidation when related information is fragmented
- Maintain appropriate distinctions between short-term and long-term memory
- Regularly update progress.md to reflect project development

## Memory System Variables

The memory system tracks these key variables:

- MEMORY_INITIALIZED: Whether memory has been fully initialized
- CURRENT_MODE: The active operational mode (Think/Plan/Implement/Review)
- MEMORY_LAST_UPDATED: Timestamp of last memory update
- CURRENT_TASK: Identifier for the active development task
- MEMORY_PRIORITY_AREAS: List of high-priority memory contexts

## Memory Status Assessment

I can assess the overall health of the memory system with checks for:

- Memory coverage of project components
- Recency of memory updates
- Consistency between related memory files
- Completeness of core memory files
- Accurate reflection of project state in progress.md
EOF

# Create 002_memory_commands.mdc
cat > .cursor/rules/002_memory_commands.mdc << 'EOF'
---
description: Defines commands for manual memory operations in the Enhanced Memory Bank system
globs: alwaysApply: true
---

# Memory Commands

This rule defines the command interface for directly interacting with the memory system. These commands provide explicit control over memory operations.

## Command Syntax

All memory commands use the `/memory` prefix followed by the specific operation:

```
/memory <command> [arguments]
```

## Available Commands

### Core Commands

- `/memory init` - Initialize the memory system for a new project
- `/memory status` - Display current memory system status
- `/memory help` - Show available memory commands and usage

### Memory Management

- `/memory save <context>` - Save current information to specified memory context
  - Example: `/memory save architecture` to update architecture memory
  - Optional: Add `-t` flag for temporary (short-term) storage

- `/memory recall <context>` - Retrieve information from specified memory context
  - Example: `/memory recall patterns` to view established patterns
  - Optional: Add `-v` flag for verbose output with metadata

- `/memory update <file> <content>` - Update specific memory file
  - Example: `/memory update decisions.md "Decision: We will use TypeScript for all new code"`
  - Supports inline content or file paths

- `/memory search <query>` - Search across memory for relevant information
  - Example: `/memory search authentication`
  - Optional: Add `-c <context>` to limit search to specific memory context

### Memory Organization

- `/memory promote <source>` - Promote short-term memory to long-term
  - Example: `/memory promote working_decisions.md`
  - Optional: Add `-d <destination>` to specify target file

- `/memory archive <file>` - Archive memory that's no longer actively relevant
  - Example: `/memory archive old_patterns.md`
  - Moves to .cursor/memory/archive/ with timestamp

- `/memory consolidate <files>` - Combine related memories into a cohesive document
  - Example: `/memory consolidate auth_*.md authentication.md`
  - Creates new consolidated file with references to sources

### Configuration

- `/memory config <key> <value>` - Update memory system configuration
  - Example: `/memory config short_term.retention 7d`
  - Updates .cursor/memory/config.json

- `/memory toggle <feature>` - Enable/disable specific memory features
  - Example: `/memory toggle auto_recall`
  - Supports multiple features in comma-separated list

## Command Response Format

When a memory command is executed, the response follows this format:

```
MEMORY COMMAND: <command>
STATUS: <success|failure>
DETAILS: <relevant details about operation>
NEXT STEPS: <suggested follow-up actions>
```

## Command Persistence

Memory commands are recorded in a command history file (.cursor/memory/command_history.json) that tracks:

- Command executed
- Timestamp
- Status code
- Affected memory files
- User notes (if provided)

## Command Chaining

Commands can be chained using the `&&` operator:

```
/memory recall architecture && /memory update architecture.md "Updated architecture"
```

## Command Shortcuts

Quick access shortcuts for common operations:

- `/ms` - Alias for `/memory status`
- `/mr <context>` - Alias for `/memory recall <context>`
- `/mu <file> <content>` - Alias for `/memory update <file> <content>`

## Command Authorization

All memory commands are available in any operational mode, but some have mode-specific behaviors:

- Save operations in Review mode include review metadata
- Update operations in Implement mode include implementation details
- Consolidate operations in Think mode include decision reasoning

## Command Help System

Each command provides contextual help with the `-h` flag:

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
EOF

# Create 003_mode_definitions.mdc
cat > .cursor/rules/003_mode_definitions.mdc << 'EOF'
---
description: Defines operational modes with specialized memory behaviors
globs: alwaysApply: true
---

# Operational Mode Definitions

This rule defines distinct operational modes that change how I interact with the codebase and memory system. Each mode has specialized memory behaviors optimized for different phases of development.

## Mode Switching Protocol

Mode switching requires two steps:

1. **UI Selection**: First, manually select the mode from Cursor's UI dropdown menu
2. **Mode Confirmation**: Then, signal your intent to the AI:

```
/mode <mode_name>
```

Example: Select "THINK" in the UI dropdown, then type `/mode think` to confirm

The AI will verify you're in the correct mode before proceeding.

## Mode Overview

```mermaid
graph TD
    T[THINK] -->|Exploration Complete| P[PLAN]
    P -->|Plan Approved| I[IMPLEMENT]
    I -->|Implementation Complete| R[REVIEW]
    R -->|Issues Found| T
    T -->|Small Change| I
    R -->|Approved| D[DOCUMENT]
    D -->|New Feature| T
    
    style T fill:#f9f,stroke:#333,stroke-width:2px
    style P fill:#bbf,stroke:#333,stroke-width:2px
    style I fill:#bfb,stroke:#333,stroke-width:2px
    style R fill:#fbb,stroke:#333,stroke-width:2px
    style D fill:#ffb,stroke:#333,stroke-width:2px
```

## Mode Definitions

### THINK Mode

Purpose: Explore problems, research solutions, and understand requirements before implementation.

Memory Behavior:
- Prioritizes loading architecture.md and patterns.md
- Creates temporary solution exploration documents
- Updates working_decisions.md with pros/cons of approaches
- Records research findings in session_notes.md
- Does not modify production code

Commands:
- `/think explore <topic>` - Start guided exploration of a topic
- `/think compare <options>` - Analyze trade-offs between approaches
- `/think research <query>` - Research and document findings on a topic

Memory Files:
- Primary: working_decisions.md, session_notes.md
- Reference: architecture.md, patterns.md, project_brief.md

### PLAN Mode

Purpose: Develop detailed implementation plans without making code changes.

Memory Behavior:
- Creates structured implementation plans
- Updates current_context.md with task breakdown
- Adds implementation details to working_decisions.md
- Validates plans against patterns.md and architecture.md
- Records planning decisions in decisions.md when finalized

Commands:
- `/plan create <feature>` - Create plan for implementing feature
- `/plan validate` - Check plan against system architecture
- `/plan estimate` - Estimate effort for current plan
- `/plan approve` - Mark plan as approved and ready for implementation

Memory Files:
- Primary: current_context.md, working_decisions.md
- Reference: architecture.md, patterns.md, decisions.md

### IMPLEMENT Mode

Purpose: Execute plans and implement code changes according to defined approaches.

Memory Behavior:
- References current_context.md for task details
- Updates progress.md with implementation status
- Records implementation decisions in decisions.md
- Updates patterns.md when new patterns emerge
- May update architecture.md for significant structural changes

Commands:
- `/implement start <task>` - Begin implementation of specific task
- `/implement checkpoint` - Record progress checkpoint
- `/implement complete` - Mark current task as complete
- `/implement issue <description>` - Record implementation issue

Memory Files:
- Primary: progress.md, current_context.md
- Reference: patterns.md, architecture.md, decisions.md

### REVIEW Mode

Purpose: Analyze existing code and suggest improvements.

Memory Behavior:
- Checks implementation against patterns.md
- Creates review notes in session_notes.md
- Updates working_decisions.md with improvement suggestions
- References architecture.md to ensure architectural alignment
- May suggest updates to patterns.md based on code quality findings

Commands:
- `/review code <file>` - Review specific file
- `/review feature <feature>` - Review entire feature
- `/review suggest` - Generate improvement suggestions
- `/review approve` - Mark current implementation as reviewed and approved

Memory Files:
- Primary: session_notes.md, working_decisions.md
- Reference: patterns.md, architecture.md, progress.md

### DOCUMENT Mode

Purpose: Create and update documentation.

Memory Behavior:
- Updates long-term memory files with implementation details
- Consolidates related short-term memories into long-term
- Ensures consistency between memory files
- Promotes temporary decisions to permanent records
- Maintains project progress history

Commands:
- `/document update <file>` - Update specific documentation
- `/document generate <type>` - Generate documentation from code
- `/document promote <temp_file>` - Promote temporary documentation to permanent
- `/document validate` - Check documentation for consistency

Memory Files:
- Primary: All long-term memory files
- Reference: All short-term memory files

## Mode-Specific Memory Protocols

### Automatic Memory Loading

When switching modes, memory files are automatically loaded:

```
THINK: project_brief.md, architecture.md, patterns.md
PLAN: current_context.md, decisions.md, patterns.md
IMPLEMENT: current_context.md, progress.md, patterns.md
REVIEW: patterns.md, architecture.md, progress.md
DOCUMENT: All relevant memory files
```

### Memory Update Triggers

Each mode has specific events that trigger memory updates:

```
THINK: New approach identified, Research finding, Decision framework established
PLAN: Task breakdown created, Plan finalized, Risk identified
IMPLEMENT: Code committed, Test created, Feature completed
REVIEW: Issue found, Improvement identified, Review completed
DOCUMENT: Documentation updated, Memory consolidated, Diagram created
```

## Mode Persistence

The current active mode is stored in `.cursor/memory/config.json` under `system.current_mode`. Mode history is tracked in `.cursor/memory/mode_history.json`.
EOF

# Create 004_auto_context.mdc
cat > .cursor/rules/004_auto_context.mdc << 'EOF'
---
description: Rules for automatically loading relevant memory context based on file types, locations, and current activity
globs: **/*.*
---

# Automatic Context Loading

This rule defines when and how memory files are automatically loaded into the AI's context based on file types, locations, current activity, and project complexity.

## Context Loading Principles

- Load only the most relevant context to avoid overwhelming the AI
- Prioritize recently updated memory files over older ones
- Include both short-term and long-term memory as appropriate
- Adapt context loading based on current operational mode
- Scale context depth with project complexity

## File Type Associations

Different file types trigger loading of specific memory contexts:

```
*.ts, *.tsx, *.js, *.jsx → patterns.md (TypeScript/JavaScript patterns)
*.py → patterns.md (Python patterns)
*.go → patterns.md (Go patterns)
*.rs → patterns.md (Rust patterns)
*.java, *.kt → patterns.md (Java/Kotlin patterns)
*.rb → patterns.md (Ruby patterns)
*.php → patterns.md (PHP patterns)
*.cs → patterns.md (C# patterns)
*.cpp, *.c, *.h → patterns.md (C/C++ patterns)
**/test/**, **/tests/**, **/*.test.*, **/*.spec.* → patterns.md (Testing patterns)
**/docs/**, **/*.md → documentation.md
**/config/**, **/*.config.* → configuration.md
**/db/**, **/database/**, **/*db*.* → database.md
**/api/**, **/*api*.* → api.md
**/ui/**, **/components/**, **/*component*.* → ui.md
**/auth/**, **/*auth*.* → auth.md
```

## Location-Based Context

The file's location in the project structure determines additional context loading:

```
/ (root) → project_brief.md
/src/ → architecture.md
/src/components/ → ui.md
/src/api/ → api.md
/src/utils/ → utilities.md
/src/hooks/ → hooks.md
/src/contexts/ → contexts.md
/src/reducers/ → state.md
/src/db/ → database.md
/src/auth/ → auth.md
/src/types/ → types.md
/tests/ → testing.md
/docs/ → documentation.md
/config/ → configuration.md
/scripts/ → build.md
```

## Activity-Based Context

Recent user activity influences which memory files are loaded:

```
Recently edited test files → testing.md
Recently ran build commands → build.md
Recently viewed documentation → documentation.md
Recently modified API endpoints → api.md
Recently accessed database files → database.md
Recently changed configuration → configuration.md
Recently edited UI components → ui.md
```

## Mode-Based Context Overrides

The current operational mode overrides default context loading behavior:

```
THINK → Prioritizes loading project_brief.md, architecture.md, patterns.md
PLAN → Prioritizes loading current_context.md, decisions.md, patterns.md
IMPLEMENT → Prioritizes loading current_context.md, progress.md, patterns.md
REVIEW → Prioritizes loading patterns.md, architecture.md, progress.md
DOCUMENT → Loads all relevant memory files based on documentation target
```

## Complexity-Based Scaling

The system scales context loading based on project complexity:

```
Level 1 (Simple): Only load immediately relevant memory files
Level 2 (Moderate): Load relevant files plus direct dependencies
Level 3 (Complex): Load extended context including architectural considerations
Level 4 (Enterprise): Load comprehensive context with system-wide implications
```

## Context Loading Implementation

1. When a file is opened, the system:
   - Identifies file type and location
   - Checks current operational mode
   - Determines project complexity level
   - Evaluates recent user activity
   - Loads appropriate memory files based on these factors

2. Context is loaded in this order:
   - Mode-specific priority files
   - Location-specific memory
   - File type associations
   - Activity-based context
   - Additional context based on complexity level

## Context Refresh Rules

Memory context is automatically refreshed when:

- Switching between files
- Changing operational modes
- Updating memory files
- After a configurable idle period (default: 30 minutes)
- Explicitly requested via `/memory refresh`

## Memory Access Tracking

The system maintains a memory access log (.cursor/memory/access_log.json) that tracks:

- Which memory files were loaded
- When they were accessed
- In what context they were used
- Which files/features they were applied to

This log is used to improve future context loading decisions by learning from usage patterns.

## Context Loading Commands

Manual control over context loading:

- `/context load <memory_file>` - Explicitly load specific memory file
- `/context unload <memory_file>` - Remove specific memory file from context
- `/context refresh` - Reload all context based on current state
- `/context status` - Show currently loaded memory files
- `/context suggest` - Get suggestions for additional relevant context
EOF

# Create 005_memory_events.mdc
cat > .cursor/rules/005_memory_events.mdc << 'EOF'
---
description: Rules for event-triggered memory system updates based on development activities
globs: alwaysApply: true
---

# Memory Events System

This rule defines how the memory system automatically updates based on development events and activities without requiring explicit commands.

## Event Detection

The memory system monitors these development events:

- **File Creation**: New files added to the project
- **File Modification**: Changes to existing files
- **File Deletion**: Removal of project files
- **Build Events**: Successful/failed build operations
- **Test Execution**: Test runs and their results
- **Git Operations**: Commits, branch changes, merges
- **Session Boundaries**: Start/end of development sessions
- **Mode Transitions**: Changes between operational modes (manually selected in UI)
- **Memory Commands**: Explicit memory system interactions
- **User Annotations**: Comments marked with specific tags (e.g., `// @memory`)

## Event-Triggered Actions

When events are detected, the memory system automatically:

1. Updates relevant memory files
2. Prompts for important information when needed
3. Reorganizes memory based on emerging patterns
4. Suggests memory consolidation for related updates
5. Adjusts memory prioritization based on development focus

## Event-Memory Mappings

Different events trigger updates to specific memory files:

```
File Creation:
  - Update progress.md with new component information
  - Consider updating architecture.md for structural additions
  - Add to current_context.md if related to active task

File Modification:
  - Update current_context.md with latest changes
  - Consider pattern extraction for repeated modifications
  - Update progress.md for significant milestones

Successful Build:
  - Update progress.md with build success
  - Consider updating current_context.md with next steps
  - Add build information to session_notes.md

Failed Build:
  - Add issues to current_context.md
  - Update session_notes.md with error details
  - Consider adding to patterns.md for recurring problems

Test Execution:
  - Update progress.md with test results
  - Add testing notes to session_notes.md
  - Consider pattern updates for test approaches

Git Commit:
  - Update progress.md with commit milestone
  - Consider extracting commit message for decision documentation
  - Update current_context.md with next steps

Branch Change:
  - Update current_context.md with branch context
  - Load relevant feature context from long-term memory
  - Consider context switch in progress.md

Mode Transition:
  - Update specific memory files based on mode rules
  - Promote/consolidate memory based on transition type
  - Update current_context.md with mode-specific focus

Session Start:
  - Load relevant memory context
  - Resume current_context.md from previous session
  - Update session_notes.md with session start

Session End:
  - Consolidate session_notes.md
  - Update progress.md with session accomplishments
  - Consider promoting short-term to long-term memory
```

## User Annotation Processing

Special comment annotations trigger specific memory actions:

```
// @memory:note This approach handles edge cases better than alternatives
→ Adds note to session_notes.md

// @memory:decision We're using JWT for authentication
→ Adds to decisions.md

// @memory:pattern This pattern for API routing should be followed
→ Adds to patterns.md

// @memory:architecture This service handles payment processing
→ Adds to architecture.md

// @memory:todo Refactor this component to use the new pattern
→ Adds to current_context.md

// @memory:progress Completed user authentication flow
→ Updates progress.md
```

## Memory Event Configuration

The event system is configurable in `.cursor/memory/config.json`:

```json
{
  "events": {
    "enabled": true,
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

## Event Processing Rules

The system processes events with these rules:

1. **Priority Order**: Events are processed in priority order (high to low):
   - Explicit commands
   - User annotations
   - Mode transitions
   - Git operations
   - Build/test events
   - File operations
   - Session boundaries

2. **Batching**: Similar events within a short timeframe are batched
   - Multiple file modifications treated as a single logical change
   - Multiple test runs consolidated into a single result
   - Related memory updates combined for consistency

3. **Conflict Resolution**: When events conflict:
   - Explicit commands override automatic events
   - Later events override earlier ones in same priority level
   - User is prompted for resolution when automatic resolution fails

4. **Threshold Filtering**: Events are filtered based on significance:
   - Minor file changes may not trigger updates
   - Frequent build attempts may be consolidated
   - Trivial git operations may be ignored
   - Significance thresholds are configurable

## Event Notification

The system notifies users about memory updates:

```
MEMORY UPDATE: progress.md
TRIGGER: Successful build
CHANGES: Added milestone "Authentication API completed"
```

Notification levels are configurable:
- `none`: No notifications
- `minimal`: Essential updates only
- `standard`: All significant updates
- `verbose`: All updates with details

## Event Command Interface

Manual control over the event system:

- `/events status` - Check event system status
- `/events enable <type>` - Enable specific event type
- `/events disable <type>` - Disable specific event type
- `/events trigger <type>` - Manually trigger event processing
- `/events config <key> <value>` - Configure event system
EOF

# Create config.json
cat > .cursor/memory/config.json << 'EOF'
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
    "files": {
      "current_context": {
        "path": "short_term/current_context.md",
        "description": "Active development focus",
        "auto_load": true
      },
      "working_decisions": {
        "path": "short_term/working_decisions.md",
        "description": "Temporary decisions being considered",
        "auto_load": false
      },
      "session_notes": {
        "path": "short_term/session_notes.md",
        "description": "Notes from the current session",
        "auto_load": false
      }
    }
  },
  "long_term": {
    "enabled": true,
    "auto_promote": true,
    "files": {
      "project_brief": {
        "path": "long_term/project_brief.md",
        "description": "Core project definition",
        "auto_load": true
      },
      "architecture": {
        "path": "long_term/architecture.md",
        "description": "System architecture",
        "auto_load": false
      },
      "patterns": {
        "path": "long_term/patterns.md",
        "description": "Established patterns and conventions",
        "auto_load": false
      },
      "decisions": {
        "path": "long_term/decisions.md",
        "description": "Important project decisions",
        "auto_load": false
      },
      "progress": {
        "path": "long_term/progress.md",
        "description": "Development progress tracking",
        "auto_load": false
      }
    }
  },
  "auto_context": {
    "enabled": true,
    "max_files": 5,
    "refresh_interval": "30m",
    "context_depth": {
      "level_1": 2,
      "level_2": 3, 
      "level_3": 5,
      "level_4": 8
    }
  },
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
  },
  "commands": {
    "enabled": true,
    "log_history": true,
    "shortcuts_enabled": true,
    "shortcuts": {
      "/ms": "/memory status",
      "/mr": "/memory recall",
      "/mu": "/memory update"
    }
  },
  "modes": {
    "enabled": true,
    "default": "THINK",
    "available": ["THINK", "PLAN", "IMPLEMENT", "REVIEW", "DOCUMENT"],
    "manual_ui_selection": true,
    "verification_required": true,
    "prompt_messages": {
      "mode_mismatch": "Please select the %s mode in Cursor's UI dropdown first, then confirm with /mode %s",
      "mode_confirmed": "Confirmed: You're now in %s mode",
      "mode_reminder": "Remember to manually select modes through Cursor's UI dropdown"
    },
    "auto_transition": {
      "enabled": false,
      "requires_ui_selection": true,
      "suggestions_only": true,
      "rules": [
        {
          "from": "PLAN",
          "to": "IMPLEMENT",
          "condition": "plan_approved",
          "suggestion": "The plan is approved. Would you like to switch to IMPLEMENT mode? Please select IMPLEMENT from the UI dropdown, then confirm with /mode implement"
        },
        {
          "from": "IMPLEMENT",
          "to": "REVIEW",
          "condition": "implementation_complete",
          "suggestion": "Implementation is complete. Would you like to switch to REVIEW mode? Please select REVIEW from the UI dropdown, then confirm with /mode review"
        }
      ]
    }
  },
  "templates": {
    "project_brief": "# Project Brief\n\n## Overview\n\n[Project description]\n\n## Goals\n\n- [Goal 1]\n- [Goal 2]\n\n## Requirements\n\n- [Requirement 1]\n- [Requirement 2]\n\n## Constraints\n\n- [Constraint 1]\n- [Constraint 2]",
    "architecture": "# System Architecture\n\n## Components\n\n- [Component 1]\n- [Component 2]\n\n## Data Flow\n\n[Describe how data flows through the system]\n\n## Technologies\n\n- [Technology 1]\n- [Technology 2]",
    "current_context": "# Current Context\n\n## Active Task\n\n[Task description]\n\n## Next Steps\n\n1. [Step 1]\n2. [Step 2]\n\n## Open Questions\n\n- [Question 1]\n- [Question 2]"
  }
}
EOF

# Create short-term memory files
echo "Creating short-term memory files..."

# current_context.md
timestamp=$(date +"%Y-%m-%d %H:%M:%S")
cat > .cursor/memory/short_term/current_context.md << EOF
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

- [Change 1] - $timestamp
- [Change 2] - $timestamp

## Mode: THINK

Last Updated: $timestamp
EOF

# working_decisions.md
cat > .cursor/memory/short_term/working_decisions.md << EOF
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

### [Decision Topic 2]

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

Last Updated: $timestamp
EOF

# session_notes.md
cat > .cursor/memory/short_term/session_notes.md << EOF
# Session Notes

## Session: $(date +"%Y-%m-%d") - $(date +"%H:%M:%S")

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

Last Updated: $timestamp
EOF

# Create long-term memory files
echo "Creating long-term memory files..."

# project_brief.md
cat > .cursor/memory/long_term/project_brief.md << EOF
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

Last Updated: $timestamp
EOF

# architecture.md
cat > .cursor/memory/long_term/architecture.md << EOF
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

Last Updated: $timestamp
EOF

# patterns.md
cat > .cursor/memory/long_term/patterns.md << 'EOF'
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

### [Pattern Category 2]

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

Last Updated: TIMESTAMP
EOF

# Replace timestamp in patterns.md
sed -i.bak "s/TIMESTAMP/$timestamp/" .cursor/memory/long_term/patterns.md 2>/dev/null || sed -i "s/TIMESTAMP/$timestamp/" .cursor/memory/long_term/patterns.md
rm -f .cursor/memory/long_term/patterns.md.bak 2>/dev/null || true

# decisions.md
cat > .cursor/memory/long_term/decisions.md << EOF
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

Last Updated: $timestamp
EOF

# progress.md
cat > .cursor/memory/long_term/progress.md << EOF
# Project Progress

## Current Status

**Overall Progress:** 0%
**Current Phase:** Initialization
**Active Areas:** System setup

## Completed Items

### Memory Bank System Initialization

**Completed:** $(date +"%Y-%m-%d")
**Description:** Set up the Enhanced Memory Bank System
**Notes:** Initial structure and templates created

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

Last Updated: $timestamp
EOF

echo "✅ Enhanced Memory Bank System has been successfully initialized!"
echo ""
echo "You can now use memory commands in Cursor:"
echo "  - /memory status - Check memory system status"
echo "  - /memory recall <context> - Load specific memory"
echo "  - /memory update <file> <content> - Update memory files"
echo ""
echo "To use mode-specific features:"
echo "  1. Select the desired mode from Cursor's UI dropdown"
echo "  2. Type /mode <mode_name> to confirm (e.g., /mode think)"
echo ""
echo "Next steps:"
echo "  1. Update your project_brief.md with project details"
echo "  2. Configure Cursor's custom modes"
echo "  3. Begin using the memory commands during development"
