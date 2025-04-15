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

**AI Behavior - Core Memory Commands:**
- `/memory status`: Display initialization status, current mode, available memory files, and recent activities. Request access to config.json if needed. Format response using STATUS format. 
- `/memory help`: List available commands with brief descriptions and usage examples. No file access needed.

### Memory Management Commands

| Command | Arguments | Options | Description | Example |
|---------|-----------|---------|-------------|---------|
| `/memory save` | `<context>` | `-t` (temporary)<br>`-m <message>` (message) | Suggest saving information to specified memory context | `/memory save architecture`<br>`/memory save patterns -t`<br>`/memory save decisions -m "Auth decision"` |
| `/memory recall` | `<context>` | `-v` (verbose) | Request to see information from specified memory context | `/memory recall patterns`<br>`/memory recall architecture -v` |
| `/memory update` | `<file> <content>` | None | Suggest updates to specific memory file | `/memory update decisions.md "Decision: We will use TypeScript"` |
| `/memory search` | `<query>` | `-c <context>` (context) | Search across memory for relevant information | `/memory search authentication`<br>`/memory search -c architecture database` |

**AI Behavior - Memory Management Commands:**
- `/memory save`: Request user to identify information to save. Generate formatted content appropriate for target file. Provide full content to add. Ask for confirmation after updating.
- `/memory recall`: Request user to open specified file. Read content when provided. Acknowledge receiving content and reference key points in subsequent responses.
- `/memory update`: Generate properly formatted content for specified file. Provide complete update text. Suggest placement within file. Ask for confirmation after updating.
- `/memory search`: Request access to relevant files. Search content for query terms. Summarize findings with file sources. Format results clearly.

### Memory Organization Commands

| Command | Arguments | Options | Description | Example |
|---------|-----------|---------|-------------|---------|
| `/memory promote` | `<source>` | `-d <destination>` (destination) | Suggest promoting short-term memory to long-term | `/memory promote working_decisions.md`<br>`/memory promote working_decisions.md -d decisions.md` |
| `/memory archive` | `<file>` | None | Suggest archiving memory that's no longer actively relevant | `/memory archive old_patterns.md` |
| `/memory consolidate` | `<files> <target>` | None | Suggest combining related memories into a cohesive document | `/memory consolidate auth_*.md authentication.md` |

**AI Behavior - Memory Organization Commands:**
- `/memory promote`: Request access to source file. Identify content to promote. Generate properly formatted content for destination file. Provide both content and instructions for adding to destination.
- `/memory archive`: Suggest creating archive directory if needed. Provide shell command to move file. Suggest updating references if necessary.
- `/memory consolidate`: Request access to source files. Generate consolidated content maintaining original structure. Provide complete new content for target file.

### Event Reporting Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/memory event` | `<type> <details>` | Report a development event | `/memory event commit "Implemented auth"`<br>`/memory event build_success "All tests passing"` |

**AI Behavior - Event Reporting Commands:**
- `/memory event`: Acknowledge the event. Identify affected memory files based on event type. Generate appropriate updates for each file. Provide formatted content. Ask for confirmation after updates.

### Configuration Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/memory config` | `<key> <value>` | Suggest updates to memory system configuration | `/memory config short_term.retention 7d`<br>`/memory config auto_context.max_files 10` |
| `/memory toggle` | `<feature>` | Suggest enabling/disabling specific memory features | `/memory toggle auto_recall`<br>`/memory toggle events.fileCreation` |

**AI Behavior - Configuration Commands:**
- `/memory config`: Request access to config.json. Generate JSON update for specified setting. Provide exact text to update. Explain impact of change.
- `/memory toggle`: Request access to config.json. Identify setting to toggle. Generate JSON update to enable/disable feature. Explain what will change.

### Command Shortcuts

| Shortcut | Full Command | Description | Example |
|----------|--------------|-------------|---------|
| `/ms` | `/memory status` | Check memory system status | `/ms` |
| `/mr` | `/memory recall` | Request memory context | `/mr patterns` |
| `/mu` | `/memory update` | Suggest memory file update | `/mu decisions.md "New decision"` |

**AI Behavior - Shortcuts:**
- Interpret shortcuts identically to their full command counterparts.
- Acknowledge using shortcut in response.

## Mode Commands

### Mode Confirmation

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/mode` | `<mode_name>` | Confirm current operational mode (after UI selection) | `/mode think`<br>`/mode plan`<br>`/mode implement`<br>`/mode review`<br>`/mode document` |

**AI Behavior - Mode Confirmation:**
- `/mode`: Verify mode matches UI selection. Load appropriate memory files for mode. Acknowledge mode change. Explain mode focus. Request access to mode-specific memory files.

### THINK Mode Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/think explore` | `<topic>` | Start guided exploration of a topic | `/think explore authentication` |
| `/think compare` | `<options>` | Analyze trade-offs between approaches | `/think compare "JWT vs session auth"` |
| `/think research` | `<query>` | Research and document findings on a topic | `/think research "modern auth best practices"` |

**AI Behavior - THINK Mode Commands:**
- `/think explore`: Check mode is THINK. Guide systematic exploration of topic. Structure findings. Suggest updating session_notes.md and working_decisions.md with exploration results.
- `/think compare`: Check mode is THINK. Analyze all options with pros/cons. Create comparison table. Suggest preliminary decision. Suggest updating working_decisions.md with comparison.
- `/think research`: Check mode is THINK. Organize research plan. Suggest information sources. Structure findings. Suggest adding research to session_notes.md.

### PLAN Mode Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/plan create` | `<feature>` | Create plan for implementing feature | `/plan create user-authentication` |
| `/plan validate` | None | Check plan against system architecture | `/plan validate` |
| `/plan estimate` | None | Estimate effort for current plan | `/plan estimate` |
| `/plan approve` | None | Mark plan as approved and ready for implementation | `/plan approve` |

**AI Behavior - PLAN Mode Commands:**
- `/plan create`: Check mode is PLAN. Generate step-by-step implementation plan. Break into tasks. Suggest updating current_context.md with plan details.
- `/plan validate`: Check mode is PLAN. Request access to architecture.md and patterns.md. Verify plan compatibility. Suggest changes if needed.
- `/plan estimate`: Check mode is PLAN. Request access to current_context.md. Generate time/effort estimates for each step. Suggest updating plan with estimates.
- `/plan approve`: Check mode is PLAN. Request access to current_context.md. Suggest promoting plan to decisions.md. Update progress.md with planned items.

### IMPLEMENT Mode Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/implement start` | `<task>` | Begin implementation of specific task | `/implement start user-authentication` |
| `/implement checkpoint` | None | Record progress checkpoint | `/implement checkpoint` |
| `/implement complete` | None | Mark current task as complete | `/implement complete` |
| `/implement issue` | `<description>` | Record implementation issue | `/implement issue "Edge case in login flow"` |

**AI Behavior - IMPLEMENT Mode Commands:**
- `/implement start`: Check mode is IMPLEMENT. Request access to current_context.md. Update progress.md with task start. Focus assistance on implementation details.
- `/implement checkpoint`: Check mode is IMPLEMENT. Record current implementation progress. Suggest updating progress.md with checkpoint details. Confirm next steps.
- `/implement complete`: Check mode is IMPLEMENT. Request confirmation of completion. Suggest updating progress.md and current_context.md to reflect completion.
- `/implement issue`: Check mode is IMPLEMENT. Document issue details. Suggest adding to session_notes.md and current_context.md. Propose resolution approach.

### REVIEW Mode Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/review code` | `<file>` | Review specific file | `/review code src/auth/login.ts` |
| `/review feature` | `<feature>` | Review entire feature | `/review feature authentication` |
| `/review suggest` | None | Generate improvement suggestions | `/review suggest` |
| `/review approve` | None | Mark current implementation as reviewed and approved | `/review approve` |

**AI Behavior - REVIEW Mode Commands:**
- `/review code`: Check mode is REVIEW. Request access to specified file and patterns.md. Analyze code against patterns. List improvements. Suggest updating session_notes.md with findings.
- `/review feature`: Check mode is REVIEW. Request access to relevant files and patterns.md. Perform broad feature review. Check consistency. Suggest updating session_notes.md with review.
- `/review suggest`: Check mode is REVIEW. Generate prioritized improvement list based on recent reviews. Suggest adding to working_decisions.md.
- `/review approve`: Check mode is REVIEW. Suggest updating progress.md to indicate review approval. Add approval details to decisions.md if needed.

### DOCUMENT Mode Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/document update` | `<file>` | Update specific documentation | `/document update api-docs` |
| `/document generate` | `<type>` | Generate documentation from code | `/document generate api` |
| `/document promote` | `<temp_file>` | Promote temporary documentation to permanent | `/document promote session_notes.md` |
| `/document validate` | None | Check documentation for consistency | `/document validate` |

**AI Behavior - DOCUMENT Mode Commands:**
- `/document update`: Check mode is DOCUMENT. Request access to specified documentation file. Suggest updated content. Provide formatted updates. Confirm after changes.
- `/document generate`: Check mode is DOCUMENT. Request access to relevant code files. Generate documentation based on code structure and comments. Suggest file for storing documentation.
- `/document promote`: Check mode is DOCUMENT. Request access to temporary file. Identify content to promote. Generate formatted content for permanent documentation. Suggest additions to appropriate long-term files.
- `/document validate`: Check mode is DOCUMENT. Request access to documentation files. Check for inconsistencies. Identify outdated information. Generate list of suggested updates.

## Context Commands

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `/context load` | `<memory_file>` | Request to see a specific memory file | `/context load patterns.md` |
| `/context status` | None | Report which memory files the AI has seen | `/context status` |
| `/context suggest` | None | Get suggestions for helpful memory files | `/context suggest` |

**AI Behavior - Context Commands:**
- `/context load`: Request user to open specified memory file. Read content when provided. Acknowledge loading. Reference file in subsequent responses.
- `/context status`: List all memory files currently in context. Indicate when each was last accessed. Note any files that need refreshing.
- `/context suggest`: Based on current task and files, suggest relevant memory files to load. Explain why each would be helpful. Prioritize suggestions.

## Command Response Format

When a memory command is executed, the response follows this format:

```
MEMORY COMMAND: <command>
STATUS: <success|planning|failure>
DETAILS: <relevant details about operation>
ACTION NEEDED: <what you need to do>
NEXT STEPS: <suggested follow-up actions>
```

Additionally, after completing any command or action, the AI will provide:

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

**AI Behavior - Code Annotations:**
- When annotation is identified in code, extract content.
- Generate properly formatted update for appropriate memory file.
- Suggest adding content to the specific file mentioned in annotation.
- Include file path, extracted content, and formatted entry in suggestion.

## Mode-Specific Response Templates

Each operational mode has a standardized response format for when actions are completed:

### THINK Mode Response Template
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
