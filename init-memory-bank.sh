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

# Create rule files
echo "Creating Cursor rule files..."

# 001_memory_core.mdc
cat > .cursor/rules/001_memory_core.mdc << 'EOF'
---
description: Core memory system that provides short-term and long-term memory capabilities for AI interactions
globs: alwaysApply: true
---

# Memory Core System

This rule establishes the foundation of the Enhanced Memory Bank System for Cursor. It enables the AI to maintain context across sessions through structured documentation.

## Configuration Loading

When starting work with a project, I MUST:

1. Check for the existence of `.cursor/memory/config.json`
2. If it exists, load and parse its content
3. Follow all settings defined in the configuration file
4. If it doesn't exist, use default settings

The configuration file contains critical settings that control:
- Memory retention periods
- Automatic loading behavior
- Event trigger definitions
- Mode-specific behaviors
- Memory file locations

## Memory System Architecture

The memory system functions on two distinct levels:

1. **Short-Term Memory**: Session-specific context that's active during the current development session
2. **Long-Term Memory**: Persistent knowledge that's maintained across all sessions

## Core Memory Principles

I follow these principles when working with the memory system:

- **Documentation First**: Every significant decision, pattern, or insight is documented
- **Memory Refresh**: I always load relevant memory when asked or when context requires
- **Consistent Updates**: Memory is updated when the user reports meaningful changes
- **Memory Hierarchy**: Information flows from short-term to long-term when appropriate
- **Single Source of Truth**: Memory files are the canonical reference for project understanding

## Memory Access Protocol

When I begin work, I will check for the existence of memory structures:

1. Look for `.cursor/memory/config.json` to load configuration
2. Ask to review `.cursor/memory/long_term/project_brief.md` to understand core project requirements
3. Ask to check `.cursor/memory/short_term/current_context.md` to understand the active development focus
4. Request access to relevant memory files based on the current task

If memory files don't exist, I will suggest creating them using the initialization script.

## Memory Storage Structure

The memory system is organized as follows:

```
.cursor/memory/
├── config.json
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

## Cursor Integration

Since I'm operating within Cursor, I have these file-related capabilities:

1. I can READ files that are open in the editor or explicitly loaded
2. I can SUGGEST changes to files which users can implement
3. I can REQUEST users to open specific files for context
4. I cannot directly write to files without user intervention
5. I cannot automatically detect file system events

When the memory commands suggest file operations, I will:
1. Provide clear instructions for what should be updated
2. Suggest the exact content that should be added/modified
3. Ask the user to confirm before making changes
4. Acknowledge when changes have been made

## Memory Initialization Checklist

When the memory system is first initialized in a project, I will guide the user to:

1. Run the initialization script to create the memory directory structure
2. Create initial versions of core memory files with appropriate templates
3. Input essential project information to populate project_brief.md
4. Set up initial patterns and conventions in patterns.md
5. Initialize progress.md with baseline project state

## Memory Maintenance Responsibilities

I maintain memory with these responsibilities:

- Help users keep memory files accurate and up-to-date
- Detect and resolve conflicts between memory files
- Suggest memory consolidation when related information is fragmented
- Maintain appropriate distinctions between short-term and long-term memory
- Help users maintain progress.md to reflect project development

## Memory System Variables

The memory system tracks these key variables in the config file:

- MEMORY_INITIALIZED: Whether memory has been fully initialized
- CURRENT_MODE: The active operational mode (Think/Plan/Implement/Review)
- MEMORY_LAST_UPDATED: Timestamp of last memory update
- CURRENT_TASK: Identifier for the active development task
- MEMORY_PRIORITY_AREAS: List of high-priority memory contexts

## Memory Status Assessment

I can help assess the overall health of the memory system by checking:

- Memory coverage of project components
- Recency of memory updates
- Consistency between related memory files
- Completeness of core memory files
- Accurate reflection of project state in progress.md
EOF

# 002_memory_commands.mdc
cat > .cursor/rules/002_memory_commands.mdc << 'EOF'
---
description: Defines commands for manual memory operations in the Enhanced Memory Bank system
globs: alwaysApply: true
---

# Memory Commands

This rule defines the command interface for directly interacting with the memory system. These commands provide explicit control over memory operations, adapted for Cursor's environment.

## Command Syntax

All memory commands use the `/memory` prefix followed by the specific operation:

```
/memory <command> [arguments]
```

## Available Commands

### Core Commands

- `/memory init` - Initialize the memory system for a new project
  - Checks if memory files and structure exist
  - Provides instructions for creating necessary files if they don't exist
  - Guides through initial setup process

- `/memory status` - Display current memory system status
  - Shows configuration information
  - Lists available memory files
  - Reports current mode
  - Indicates initialization status

- `/memory help` - Show available memory commands and usage
  - Displays command list with descriptions
  - Provides examples of common usage

### Memory Management

- `/memory save <context>` - Save current information to specified memory context
  - Example: `/memory save architecture` to update architecture memory
  - Options: Add `-t` flag for temporary (short-term) storage
  - Implementation: Provides text for the user to add to the specified memory file

- `/memory recall <context>` - Retrieve information from specified memory context
  - Example: `/memory recall patterns` to view established patterns
  - Options: Add `-v` flag for verbose output with metadata
  - Implementation: Requests user to open specified file and then reads its content

- `/memory update <file> <content>` - Update specific memory file
  - Example: `/memory update decisions.md "Decision: We will use TypeScript for all new code"`
  - Implementation: Provides formatted text for the user to add to the specified file

- `/memory search <query>` - Search across memory for relevant information
  - Example: `/memory search authentication`
  - Options: Add `-c <context>` to limit search to specific memory context
  - Implementation: Requests user to open relevant files, then searches their content

### Memory Organization

- `/memory promote <source>` - Promote short-term memory to long-term
  - Example: `/memory promote working_decisions.md`
  - Options: Add `-d <destination>` to specify target file
  - Implementation: Suggests content to move from short-term to long-term memory

- `/memory archive <file>` - Archive memory that's no longer actively relevant
  - Example: `/memory archive old_patterns.md`
  - Implementation: Provides instructions for moving file to archive location

- `/memory consolidate <files>` - Combine related memories into a cohesive document
  - Example: `/memory consolidate auth_*.md authentication.md`
  - Implementation: Requests access to source files, then provides consolidated content

### Configuration

- `/memory config <key> <value>` - Update memory system configuration
  - Example: `/memory config short_term.retention 7d`
  - Implementation: Provides the JSON to update in config.json

- `/memory toggle <feature>` - Enable/disable specific memory features
  - Example: `/memory toggle auto_recall`
  - Implementation: Provides the configuration change to implement

## Command Execution Protocol

Due to Cursor's environment, memory commands follow this execution protocol:

1. **Command Parsing**: I interpret the command and its arguments
2. **File Access Request**: If needed, I request access to required files
   - "To process this command, I need to see the content of [file]. Can you open it?"
3. **Operation Planning**: I determine what changes are needed
4. **User Confirmation**: I describe the proposed changes and ask for confirmation
   - "I'll update [file] by adding [content]. Would you like me to proceed?"
5. **Implementation Guidance**: I provide specific instructions for implementation
   - "Please add the following content to [file]:"
6. **Operation Verification**: I confirm when the operation is complete
   - "The memory has been successfully updated."
7. **Action Summary and Next Steps**: Provide a structured completion report with options
   - Include completion summary, command options, and suggested next steps

## Path Validation Protocol

Before suggesting any file operations, I will:

1. **Validate Memory Paths**: Ensure target files are only within `.cursor/memory/short_term/` or `.cursor/memory/long_term/`
2. **Normalize File Paths**: Convert any path to the correct structure
3. **Reject Invalid Paths**: Warn if a command refers to files outside the designated memory folders
4. **Suggest Correction**: If an invalid path is detected, suggest the correct location

This ensures all memory remains properly organized and prevents file duplication outside the memory structure.

## Command Response Format

When a memory command is executed, the response follows this format:

```
MEMORY COMMAND: <command>
STATUS: <success|planning|failure>
DETAILS: <relevant details about operation>
ACTION NEEDED: <what the user needs to do>
NEXT STEPS: <suggested follow-up actions>
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

## User-Driven Events

Since automatic event detection isn't possible, memory commands also support user-driven event reporting:

- `/memory event <type> <details>` - Report a development event
  - Example: `/memory event commit "Implemented user authentication"`
  - Implementation: Updates appropriate memory files based on event type

Common event types:
- `commit` - Code committed to repository
- `build` - Build completed (success/failure)
- `test` - Tests run (success/failure)
- `create` - New file created
- `modification` - File modified
- `branch` - Git branch changed

## Command-Specific Behaviors

### Core Memory Commands Behavior

For `/memory status`:
1. Request access to config.json if needed
2. Display initialization status, current mode, available memory files, and recent activities
3. Format response using the STATUS format
4. Suggest next steps based on system state

For `/memory help`:
1. List available commands with brief descriptions
2. Group commands by category 
3. Provide usage examples for common commands
4. No file access needed

### Memory Management Behavior

For `/memory save`:
1. Validate that the context corresponds to a file within the memory structure
2. If the context is ambiguous, determine the appropriate file
3. Ensure the file path includes the correct directory prefix
   - If `-t` flag is used, ensure the file is in `.cursor/memory/short_term/`
   - If no flag is used, ensure the file is in `.cursor/memory/long_term/`
4. Request user to identify information to save
5. Generate formatted content appropriate for the target file
6. Provide complete content to add
7. Ask for confirmation after updating

For `/memory recall`:
1. Validate that the context corresponds to a file within the memory structure
2. Normalize the path to include the correct directory prefix
3. Request user to open the specified file
4. Read content when provided
5. Acknowledge receiving content
6. Reference key points in subsequent responses

For `/memory update`:
1. Validate that the file path is within `.cursor/memory/short_term/` or `.cursor/memory/long_term/`
2. If the path doesn't include the proper directory, normalize it to the appropriate location
   - For known short-term files: prepend `.cursor/memory/short_term/`
   - For known long-term files: prepend `.cursor/memory/long_term/`
   - For ambiguous files: ask for clarification
3. Generate properly formatted content for the normalized file path
4. Provide complete update text
5. Suggest placement within file
6. Ask for confirmation after updating

For `/memory search`:
1. Request access to relevant files
2. Ensure all files being searched are within the memory structure
3. Search content for query terms
4. Summarize findings with file sources
5. Format results clearly

### Memory Organization Behavior

For `/memory promote`:
1. Validate the source file exists in `.cursor/memory/short_term/`
2. Ensure the destination is in `.cursor/memory/long_term/`
3. Request access to source file
4. Identify content to promote
5. Generate properly formatted content for destination file
6. Provide both content and instructions for adding to destination

For `/memory archive`:
1. Validate the file exists in the memory structure
2. Suggest creating archive directory if needed
3. Provide shell command to move file
4. Suggest updating references if necessary

For `/memory consolidate`:
1. Validate all source files are within the memory structure
2. Validate the target file is within the memory structure
3. Request access to source files
4. Generate consolidated content maintaining original structure
5. Provide complete new content for target file

### Configuration Commands Behavior

For `/memory config`:
1. Request access to config.json
2. Generate JSON update for specified setting
3. Provide exact text to update
4. Explain impact of change

For `/memory toggle`:
1. Request access to config.json
2. Identify setting to toggle
3. Generate JSON update to enable/disable feature
4. Explain what will change

### Event Reporting Behavior

For `/memory event`:
1. Acknowledge the event
2. Identify affected memory files based on event type
3. Generate appropriate updates for each file
4. Ensure all suggested file paths are within the memory structure
5. Provide formatted content
6. Ask for confirmation after updates

### Command Shortcuts Behavior

For command shortcuts:
1. Interpret shortcuts identically to their full command counterparts
2. Apply the same path validation protocols
3. Acknowledge using shortcut in response

## File Path Normalization

When processing file paths for memory operations:

1. If the path already starts with `.cursor/memory/short_term/` or `.cursor/memory/long_term/`, use it as is
2. If the path is just a filename (e.g., "decisions.md"):
   - For known short-term files (current_context.md, working_decisions.md, session_notes.md): prepend `.cursor/memory/short_term/`
   - For known long-term files (project_brief.md, architecture.md, patterns.md, decisions.md, progress.md): prepend `.cursor/memory/long_term/`
   - If ambiguous: ask for clarification with "Did you mean the short-term or long-term version of this file?"
3. If the path seems to be outside the memory structure:
   - Warn: "I've detected a file path outside the memory structure."
   - Suggest: "Memory files should be stored in `.cursor/memory/short_term/` or `.cursor/memory/long_term/`."
   - Provide corrected path: "I'll assume you meant `.cursor/memory/[appropriate_directory]/[filename]`."

## Known Memory Files

### Short-Term Memory Files:
- current_context.md
- working_decisions.md
- session_notes.md

### Long-Term Memory Files:
- project_brief.md
- architecture.md
- patterns.md
- decisions.md
- progress.md

## Completion Response Structure

After completing any command or set of actions, I will always conclude with:

```
## Action Report
- **Completed:** [List of completed actions]
- **Status:** [Success/Partial/Failed]
- **Files Affected:** [List of files updated or referenced]

## Available Commands
- `/command1` - [Brief description]
- `/command2` - [Brief description]
[2-3 relevant commands for current context]

## Suggested Next Steps
- [Concrete suggestion 1]
- [Concrete suggestion 2]
- [Memory update suggestion]
```

### Mode-Specific Response Focus

- **THINK Mode**: Emphasize exploration commands and documenting discoveries
- **PLAN Mode**: Emphasize plan validation, refinement, and task breakdowns
- **IMPLEMENT Mode**: Emphasize progress tracking and checkpointing work
- **REVIEW Mode**: Emphasize improvement identification and documenting findings
- **DOCUMENT Mode**: Emphasize documentation completion and consistency checks
EOF

# 003_mode_definitions.mdc
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

I will verify you're in the correct mode before proceeding.

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
- Requests access to architecture.md and patterns.md
- Suggests updating working_decisions.md with pros/cons of approaches
- Helps record research findings in session_notes.md
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
- Requests access to current_context.md and patterns.md
- Helps create structured implementation plans
- Suggests updates to current_context.md with task breakdown
- Validates plans against patterns.md and architecture.md
- Helps record planning decisions in decisions.md when finalized

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
- Requests access to current_context.md for task details
- Suggests updates to progress.md with implementation status
- Helps record implementation decisions in decisions.md
- Suggests updates to patterns.md when new patterns emerge
- May suggest updates to architecture.md for significant structural changes

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
- Requests access to patterns.md to compare implementation
- Helps create review notes in session_notes.md
- Suggests improvements in working_decisions.md
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
- Requests access to all relevant memory files
- Helps update long-term memory files with implementation details
- Suggests consolidating related short-term memories into long-term
- Ensures consistency between memory files
- Helps promote temporary decisions to permanent records
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

### Memory Loading Requests

When switching modes, I will request access to these key files:

```
THINK: project_brief.md, architecture.md, patterns.md
PLAN: current_context.md, decisions.md, patterns.md
IMPLEMENT: current_context.md, progress.md, patterns.md
REVIEW: patterns.md, architecture.md, progress.md
DOCUMENT: All relevant memory files
```

### Memory Update Suggestions

Each mode has specific events that should trigger memory updates:

```
THINK: New approach identified, Research finding, Decision framework established
PLAN: Task breakdown created, Plan finalized, Risk identified
IMPLEMENT: Code committed, Test created, Feature completed
REVIEW: Issue found, Improvement identified, Review completed
DOCUMENT: Documentation updated, Memory consolidated, Diagram created
```

I will suggest appropriate memory updates when these events occur.

## Memory Access Interactions

Since I cannot directly access or modify files without user intervention, I will:

1. **Request Access**: Ask the user to open specific memory files when needed
   - "To help with this task, could you please open the current_context.md file?"

2. **Suggest Updates**: Provide clear update suggestions for memory files
   - "Based on our discussion, I suggest updating the patterns.md file with this new pattern..."

3. **Provide Content**: Offer formatted content that can be added to memory files
   - "Here's the content you can add to the progress.md file:"

4. **Confirm Changes**: Ask for confirmation when memory has been updated
   - "Have you updated the file? Let me know when it's ready."

## Mode Verification

I will verify that operations align with the current mode:

1. Confirm the user has selected the appropriate mode in the UI
2. Check that requests match the current operational mode
3. Suggest mode switches when activities don't align with the current mode
4. Request confirmation before proceeding with mode-specific operations

This ensures that memory operations are consistent with the intended development phase.

## Mode-Specific Command Behaviors

### Mode Confirmation Behavior

For `/mode <mode_name>`:
1. Verify the mode matches UI selection
2. Load appropriate memory files for the mode
3. Acknowledge the mode change
4. Explain the mode focus
5. Request access to mode-specific memory files

### THINK Mode Commands Behavior

For `/think explore <topic>`:
1. Check mode is THINK
2. Guide systematic exploration of topic
3. Structure findings
4. Suggest updating session_notes.md and working_decisions.md with exploration results

For `/think compare <options>`:
1. Check mode is THINK
2. Analyze all options with pros/cons
3. Create comparison table
4. Suggest preliminary decision
5. Suggest updating working_decisions.md with comparison

For `/think research <query>`:
1. Check mode is THINK
2. Organize research plan
3. Suggest information sources
4. Structure findings
5. Suggest adding research to session_notes.md

### PLAN Mode Commands Behavior

For `/plan create <feature>`:
1. Check mode is PLAN
2. Generate step-by-step implementation plan
3. Break into tasks
4. Suggest updating current_context.md with plan details

For `/plan validate`:
1. Check mode is PLAN
2. Request access to architecture.md and patterns.md
3. Verify plan compatibility
4. Suggest changes if needed

For `/plan estimate`:
1. Check mode is PLAN
2. Request access to current_context.md
3. Generate time/effort estimates for each step
4. Suggest updating plan with estimates

For `/plan approve`:
1. Check mode is PLAN
2. Request access to current_context.md
3. Suggest promoting plan to decisions.md
4. Update progress.md with planned items

### IMPLEMENT Mode Commands Behavior

For `/implement start <task>`:
1. Check mode is IMPLEMENT
2. Request access to current_context.md
3. Update progress.md with task start
4. Focus assistance on implementation details

For `/implement checkpoint`:
1. Check mode is IMPLEMENT
2. Record current implementation progress
3. Suggest updating progress.md with checkpoint details
4. Confirm next steps

For `/implement complete`:
1. Check mode is IMPLEMENT
2. Request confirmation of completion
3. Suggest updating progress.md and current_context.md to reflect completion

For `/implement issue <description>`:
1. Check mode is IMPLEMENT
2. Document issue details
3. Suggest adding to session_notes.md and current_context.md
4. Propose resolution approach

### REVIEW Mode Commands Behavior

For `/review code <file>`:
1. Check mode is REVIEW
2. Request access to specified file and patterns.md
3. Analyze code against patterns
4. List improvements
5. Suggest updating session_notes.md with findings

For `/review feature <feature>`:
1. Check mode is REVIEW
2. Request access to relevant files and patterns.md
3. Perform broad feature review
4. Check consistency
5. Suggest updating session_notes.md with review

For `/review suggest`:
1. Check mode is REVIEW
2. Generate prioritized improvement list based on recent reviews
3. Suggest adding to working_decisions.md

For `/review approve`:
1. Check mode is REVIEW
2. Suggest updating progress.md to indicate review approval
3. Add approval details to decisions.md if needed

### DOCUMENT Mode Commands Behavior

For `/document update <file>`:
1. Check mode is DOCUMENT
2. Request access to specified documentation file
3. Suggest updated content
4. Provide formatted updates
5. Confirm after changes

For `/document generate <type>`:
1. Check mode is DOCUMENT
2. Request access to relevant code files
3. Generate documentation based on code structure and comments
4. Suggest file for storing documentation

For `/document promote <temp_file>`:
1. Check mode is DOCUMENT
2. Request access to temporary file
3. Identify content to promote
4. Generate formatted content for permanent documentation
5. Suggest additions to appropriate long-term files

For `/document validate`:
1. Check mode is DOCUMENT
2. Request access to documentation files
3. Check for inconsistencies
4. Identify outdated information
5. Generate list of suggested updates

### Context Commands Behavior

For `/context load <memory_file>`:
1. Request user to open specified memory file
2. Read content when provided
3. Acknowledge loading
4. Reference file in subsequent responses

For `/context status`:
1. List all memory files currently in context
2. Indicate when each was last accessed
3. Note any files that need refreshing

For `/context suggest`:
1. Based on current task and files, suggest relevant memory files to load
2. Explain why each would be helpful
3. Prioritize suggestions

### Code Annotation Behavior

When annotation is identified in code:
1. Extract annotation content
2. Generate properly formatted update for appropriate memory file
3. Suggest adding content to the specific file mentioned in annotation
4. Include file path, extracted content, and formatted entry in suggestion

## Mode-Specific Response Templates

Each operational mode should include standardized response templates for completing actions. These templates ensure users always receive consistent guidance tailored to the current mode.

### THINK Mode Response Template

After completing THINK mode actions:

```
## Exploration Report
- **Completed:** [Exploration activities completed]
- **Insights Generated:** [Key insights or findings]
- **Status:** [Complete/In Progress]

## Helpful Commands
- `/think compare "<option 1> vs <option 2>"` - Compare different approaches
- `/memory save working_decisions.md` - Save current thinking
- `/memory update session_notes.md "New insight: [brief insight]"`

## Suggested Next Steps
- Document your decision framework in working_decisions.md
- Explore alternative approaches to [relevant topic]
- Report this exploration with `/memory event think "Explored [topic]"`
```

### PLAN Mode Response Template

After completing PLAN mode actions:

```
## Planning Report
- **Completed:** [Planning activities completed]
- **Plan Components:** [Key components of the plan]
- **Status:** [Complete/In Progress]

## Helpful Commands
- `/plan validate` - Validate plan against architecture
- `/plan estimate` - Estimate effort for implementation
- `/memory update current_context.md "Plan details: [brief details]"`

## Suggested Next Steps
- Break down the plan into specific implementation tasks
- Validate the plan against existing architecture
- Report this planning with `/memory event plan "Created plan for [feature]"`
```

### IMPLEMENT Mode Response Template

After completing IMPLEMENT mode actions:

```
## Implementation Report
- **Completed:** [Implementation activities completed]
- **Components Affected:** [Components that were modified]
- **Status:** [Complete/In Progress]

## Helpful Commands
- `/implement checkpoint` - Record implementation progress
- `/implement complete` - Mark implementation as complete
- `/memory update progress.md "Implementation status: [brief status]"`

## Suggested Next Steps
- Create a checkpoint to track your implementation progress
- Document any patterns discovered during implementation
- Report this implementation with `/memory event commit "Implemented [feature]"`
```

### REVIEW Mode Response Template

After completing REVIEW mode actions:

```
## Review Report
- **Completed:** [Review activities completed]
- **Issues Identified:** [Key issues found]
- **Status:** [Complete/In Progress]

## Helpful Commands
- `/review suggest` - Generate improvement suggestions
- `/review approve` - Mark review as approved
- `/memory update session_notes.md "Review findings: [brief findings]"`

## Suggested Next Steps
- Document improvement suggestions in working_decisions.md
- Prioritize issues for future implementation
- Report this review with `/memory event review "Reviewed [component]"`
```

### DOCUMENT Mode Response Template

After completing DOCUMENT mode actions:

```
## Documentation Report
- **Completed:** [Documentation activities completed]
- **Files Updated:** [Documentation files updated]
- **Status:** [Complete/In Progress]

## Helpful Commands
- `/document validate` - Check documentation consistency
- `/document promote <temp_file>` - Promote temporary documentation
- `/memory update long_term/[file] "Documentation update: [brief update]"`

## Suggested Next Steps
- Ensure consistency across all documentation
- Promote any temporary decisions to permanent records
- Report this documentation with `/memory event document "Updated docs for [component]"`
```
EOF

# 004_auto_context.mdc
cat > .cursor/rules/004_auto_context.mdc << 'EOF'
---
description: Rules for requesting relevant memory context based on file types, locations, and current activity
globs: **/*.*
---

# Context Loading System

This rule defines how I should request and load relevant memory files into my context based on file types, locations, current activity, and project complexity.

## Context Loading Principles

- Request access to the most relevant memory files for the current task
- Prioritize recently updated memory files over older ones
- Include both short-term and long-term memory as appropriate
- Adapt context requests based on current operational mode
- Scale context depth with project complexity

## File Type Associations

When working with specific file types, I should request access to these memory contexts:

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

The file's location in the project structure indicates I should request these additional contexts:

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

Recent user activity suggests I should request these memory files:

```
Recently discussed test files → testing.md
Recently discussed build commands → build.md
Recently discussed documentation → documentation.md
Recently discussed API endpoints → api.md
Recently discussed database files → database.md
Recently discussed configuration → configuration.md
Recently discussed UI components → ui.md
```

## Mode-Based Context Requests

The current operational mode determines which memory files I should prioritize requesting:

```
THINK → Prioritize requesting project_brief.md, architecture.md, patterns.md
PLAN → Prioritize requesting current_context.md, decisions.md, patterns.md
IMPLEMENT → Prioritize requesting current_context.md, progress.md, patterns.md
REVIEW → Prioritize requesting patterns.md, architecture.md, progress.md
DOCUMENT → Request all relevant memory files based on documentation target
```

## Complexity-Based Scaling

I should scale my context requests based on project complexity:

```
Level 1 (Simple): Request only immediately relevant memory files
Level 2 (Moderate): Request relevant files plus direct dependencies
Level 3 (Complex): Request extended context including architectural considerations
Level 4 (Enterprise): Request comprehensive context with system-wide implications
```

## Context Request Implementation

Since I cannot automatically load files, I will:

1. **Observe current context**: Note which files are being discussed or edited
2. **Identify relevant memory**: Determine which memory files would be helpful
3. **Request specific files**: Ask the user to open key memory files
   - "To provide better assistance with this task, could you please open .cursor/memory/long_term/patterns.md?"
4. **Explain the relevance**: Clarify why the requested file would be helpful
   - "Seeing the patterns.md file would help me understand the established conventions for API implementation."
5. **Prioritize requests**: Ask for the most important files first, not all at once
   - "Let's start with the current_context.md file, then we can look at progress.md if needed."

## Context Refresh Requests

I should request refreshed memory context when:

- Switching between significantly different files
- Changing operational modes
- After significant project updates are mentioned
- When explicitly asked to refresh my understanding
- When my responses seem to lack necessary context

## Manual Context Commands

I understand these commands for explicit context management:

- `/context load <memory_file>` - Request to open a specific memory file
- `/context unload <memory_file>` - Note that a specific memory file is no longer needed
- `/context refresh` - Request to reload relevant memory files
- `/context status` - Report which memory files I'm currently aware of
- `/context suggest` - Suggest additional helpful memory files

When I receive a context command, I will:
1. Acknowledge the command
2. Take appropriate action (request file access, etc.)
3. Confirm when the context has been updated
EOF

# 005_memory_events.mdc
cat > .cursor/rules/005_memory_events.mdc << 'EOF'
---
description: Rules for user-reported event handling and suggested memory updates
globs: alwaysApply: true
---

# Memory Events System

This rule defines how I should respond to user-reported development events and suggest appropriate memory updates based on these events.

## Event Reporting

Since automatic event detection isn't possible within Cursor's environment, I rely on users to report significant events using:

```
/memory event <event_type> <description>
```

For example:
```
/memory event commit "Implemented user authentication flow"
```

## Supported Event Types

I recognize and respond to these event types:

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

## Event Response Protocol

When an event is reported, I will follow this protocol:

1. **Acknowledge the event**: Confirm that I've understood the reported event
   - "I've noted your report of the [event_type]: [description]"

2. **Suggest memory updates**: Based on the event type, suggest appropriate memory updates
   - "Based on this event, I suggest updating the following memory files:"

3. **Provide update content**: Offer specific content to be added to memory files
   - "Here's the content you can add to progress.md:"

4. **Confirm implementation**: Ask for confirmation when updates are completed
   - "Have you updated the memory files? Let me know when it's done."

5. **Action Summary and Next Steps**: Provide a structured completion report with options
   - Include completion summary, relevant command options, and suggested next steps

## Event-Memory Mappings

Different events should trigger updates to specific memory files:

```
File Creation:
  → Suggest updates to progress.md with new component information
  → Suggest updates to architecture.md for structural additions
  → Suggest updates to current_context.md if related to active task

File Modification:
  → Suggest updates to current_context.md with latest changes
  → Consider suggesting pattern extraction for repeated modifications
  → Suggest updates to progress.md for significant milestones

Successful Build:
  → Suggest updates to progress.md with build success
  → Consider suggesting updates to current_context.md with next steps
  → Suggest adding build information to session_notes.md

Failed Build:
  → Suggest adding issues to current_context.md
  → Suggest updating session_notes.md with error details
  → Consider suggesting additions to patterns.md for recurring problems

Test Execution:
  → Suggest updates to progress.md with test results
  → Suggest adding testing notes to session_notes.md
  → Consider suggesting pattern updates for test approaches

Git Commit:
  → Suggest updates to progress.md with commit milestone
  → Consider suggesting decision documentation from commit message
  → Suggest updates to current_context.md with next steps

Branch Change:
  → Suggest updates to current_context.md with branch context
  → Suggest loading relevant feature context from long-term memory
  → Consider suggesting context switch in progress.md

Mode Transition:
  → Suggest updates to specific memory files based on mode rules
  → Suggest promoting/consolidating memory based on transition type
  → Suggest updates to current_context.md with mode-specific focus

Session Start:
  → Suggest loading relevant memory context
  → Suggest resuming current_context.md from previous session
  → Suggest updating session_notes.md with session start

Session End:
  → Suggest consolidating session_notes.md
  → Suggest updating progress.md with session accomplishments
  → Suggest promoting important short-term to long-term memory
```

## Annotation Recognition

I recognize code comment annotations and suggest appropriate memory updates:

```
// @memory:note This approach handles edge cases better than alternatives
→ Suggest adding to session_notes.md

// @memory:decision We're using JWT for authentication
→ Suggest adding to decisions.md

// @memory:pattern This pattern for API routing should be followed
→ Suggest adding to patterns.md

// @memory:architecture This service handles payment processing
→ Suggest adding to architecture.md

// @memory:todo Refactor this component to use the new pattern
→ Suggest adding to current_context.md

// @memory:progress Completed user authentication flow
→ Suggest updating progress.md
```

When I notice these annotations in code, I'll suggest appropriate memory updates.

## Update Content Formatting

When suggesting memory updates, I'll format the content appropriately:

1. **Progress Updates**: Include timestamp, description, status, and next steps
   ```markdown
   ### User Authentication
   **Completed:** 2025-04-14
   **Description:** Implemented basic authentication flow
   **Status:** In progress (70%)
   **Next Steps:** Add password reset functionality
   ```

2. **Decisions**: Include decision, date, rationale, and implications
   ```markdown
   ### Authentication Approach
   **Decision:** Use JWT with asymmetric keys
   **Date:** 2025-04-14
   **Rationale:** Better security and support for microservices
   **Implications:**
   - Need to implement key rotation
   - Simplifies cross-service authentication
   ```

3. **Patterns**: Include name, usage, implementation, and example
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

## Memory Update Suggestions

I'll make memory update suggestions in this format:

```
MEMORY UPDATE SUGGESTION
FILE: <file_path>
BASED ON: <event_type> - <description>
SUGGESTED CONTENT:

<formatted_content>

Would you like me to provide this update? (You can copy it to the file)
```

## Event Completion Response

After processing any event, I will always conclude with:

```
## Event Processing Report
- **Event Type:** [Type of event processed]
- **Updates Suggested:** [Files suggested for update]
- **Status:** [Processed/Pending Implementation]

## Related Commands
- `/memory event <type> <details>` - Report another event
- `/memory update <file> <content>` - Make additional updates
- [1-2 contextually relevant commands]

## Recommended Actions
- [Specific follow-up action based on event type]
- [Memory update suggestion if applicable]
- [Mode-specific recommendation]
```

## Integration with Modes

Different operational modes influence how I respond to events:

- **THINK Mode**: Emphasize research findings and exploration notes
- **PLAN Mode**: Focus on task breakdown and implementation plans
- **IMPLEMENT Mode**: Prioritize progress updates and implementation details 
- **REVIEW Mode**: Highlight improvement suggestions and issue tracking
- **DOCUMENT Mode**: Balance updates across all memory files

I'll adjust my event response based on the current operational mode.
EOF

# Create config.json
echo "Creating configuration file..."

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
  "context_requests": {
    "enabled": true,
    "max_files": 5,
    "refresh_interval": "30m",
    "context_depth": {
      "level_1": 2,
      "level_2": 3, 
      "level_3": 5,
      "level_4": 8
    },
    "file_associations": {
      "typescript": ["patterns.md", "architecture.md"],
      "python": ["patterns.md", "architecture.md"],
      "tests": ["patterns.md", "testing.md"],
      "documentation": ["project_brief.md", "architecture.md"]
    }
  },
  "events": {
    "enabled": true,
    "notification_level": "standard",
    "reportable_events": {
      "file": ["create", "modify", "delete"],
      "build": ["build_success", "build_failure"],
      "test": ["test_success", "test_failure"],
      "git": ["commit", "branch", "merge"],
      "session": ["session_start", "session_end"],
      "mode": ["mode_change"]
    },
    "update_suggestions": {
      "commit": ["progress.md", "current_context.md"],
      "build_success": ["progress.md"],
      "build_failure": ["current_context.md", "session_notes.md"],
      "test_success": ["progress.md"],
      "test_failure": ["current_context.md", "session_notes.md"]
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
    "context_requests": {
      "THINK": ["project_brief.md", "architecture.md", "patterns.md"],
      "PLAN": ["current_context.md", "decisions.md", "patterns.md"],
      "IMPLEMENT": ["current_context.md", "progress.md", "patterns.md"],
      "REVIEW": ["patterns.md", "architecture.md", "progress.md"],
      "DOCUMENT": ["project_brief.md", "architecture.md", "patterns.md", "decisions.md", "progress.md"]
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
echo "  - /memory recall <context> - Request to see specific memory"
echo "  - /memory update <file> <content> - Suggest memory updates"
echo "  - /memory event <type> <details> - Report development events"
echo ""
echo "To use mode-specific features:"
echo "  1. Select the desired mode from Cursor's UI dropdown"
echo "  2. Type /mode <mode_name> to confirm (e.g., /mode think)"
echo ""
echo "Next steps:"
echo "  1. Update your project_brief.md with project details"
echo "  2. Configure Cursor's custom modes"
echo "  3. Begin using the memory commands during development"
