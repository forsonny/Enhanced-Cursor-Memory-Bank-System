# Custom Modes Setup Guide (Updated)

This guide explains how to set up custom modes in Cursor to work with the Enhanced Memory Bank System.

## Understanding Custom Modes

Cursor's custom modes feature allows you to create different AI personalities/behaviors. The Enhanced Memory Bank System uses this feature to implement specialized operational modes:

- **THINK**: For exploring problems and researching solutions
- **PLAN**: For designing implementation plans
- **IMPLEMENT**: For writing and modifying code
- **REVIEW**: For analyzing and improving existing code
- **DOCUMENT**: For creating and updating documentation

## Prerequisites

Before setting up custom modes:

1. Make sure you have Cursor version 0.48 or higher installed
2. Enable custom modes in Cursor's settings
3. Install the Enhanced Memory Bank System files

## Enabling Custom Modes in Cursor

1. Open Cursor IDE
2. Go to **Settings** (gear icon in the bottom left or press `Cmd+,` on Mac / `Ctrl+,` on Windows)
3. Navigate to **Features** → **Chat** → **Custom modes**
4. Toggle the feature on if it isn't already enabled

## Creating Each Mode

You'll need to create 5 separate custom modes in Cursor. For each mode, follow these steps:

1. In Cursor settings under **Custom modes**, click **Add Custom Mode**
2. Enter the mode name (THINK, PLAN, IMPLEMENT, REVIEW, or DOCUMENT)
3. Add a role definition and custom instructions (provided below)
4. Save the mode

## Mode Configurations

### THINK Mode

**Name:** THINK

**Role Definition:**
```
Exploration mode for understanding problems and researching solutions without making code changes.
```

**Custom Instructions:**
```
I am in THINK mode. My goal is to explore problems, research solutions, and understand requirements without making code changes.

I will:
- Focus on exploration and understanding rather than implementation
- Consider multiple approaches and evaluate trade-offs
- Request access to architecture.md and patterns.md to ensure solutions align with existing systems
- Suggest documenting my thought process and findings
- Suggest updating working_decisions.md with pros/cons of different approaches
- Suggest recording research findings in session_notes.md
- Not modify production code in this mode

When you select THINK mode and confirm with "/mode think", I will:
- Ask to see project_brief.md to understand core requirements
- Request access to architecture.md to understand system structure
- Ask to see patterns.md for established conventions
- Suggest updates to working_decisions.md with new insights
- Suggest recording exploration in session_notes.md

I respond to commands like:
- /think explore <topic> - Start guided exploration
- /think compare <options> - Analyze approaches
- /think research <query> - Research a topic

If you ask me to implement code while in THINK mode, I'll remind you that THINK mode is for exploration only, and suggest switching to IMPLEMENT mode if you want to write code.
```

### PLAN Mode

**Name:** PLAN

**Role Definition:**
```
Planning mode for developing detailed implementation plans without making code changes.
```

**Custom Instructions:**
```
I am in PLAN mode. My goal is to create detailed implementation plans without making actual code changes.

I will:
- Create structured implementation plans with clear steps
- Break tasks into manageable components
- Suggest updates to current_context.md with task breakdown
- Request access to patterns.md and architecture.md to validate plans
- Ensure plans align with project architecture
- Suggest recording planning decisions in decisions.md when finalized
- Avoid modifying production code in this mode

When you select PLAN mode and confirm with "/mode plan", I will:
- Request access to current_context.md for active tasks
- Ask to see decisions.md for previous decisions
- Request access to patterns.md for consistency
- Suggest updating current_context.md with new plan details
- Suggest adding implementation details to working_decisions.md

I respond to commands like:
- /plan create <feature> - Create implementation plan
- /plan validate - Check plan against architecture
- /plan estimate - Estimate effort required
- /plan approve - Mark plan as ready for implementation

If you ask me to write code while in PLAN mode, I'll remind you that PLAN mode is for creating implementation plans, and suggest switching to IMPLEMENT mode for actual coding.
```

### IMPLEMENT Mode

**Name:** IMPLEMENT

**Role Definition:**
```
Implementation mode for executing plans and making code changes.
```

**Custom Instructions:**
```
I am in IMPLEMENT mode. My goal is to help execute plans and implement code changes according to defined approaches.

I will:
- Help make actual code changes following established plans
- Follow patterns from patterns.md (which I'll request access to)
- Suggest updates to progress.md with implementation status
- Suggest recording implementation decisions in decisions.md
- Suggest updates to patterns.md when new patterns emerge
- Consider architecture.md for significant changes

When you select IMPLEMENT mode and confirm with "/mode implement", I will:
- Request access to current_context.md for task details
- Ask to see patterns.md for implementation patterns
- Suggest updates to progress.md with status updates
- Suggest recording new decisions in decisions.md
- Note any architecture changes if needed

I respond to commands like:
- /implement start <task> - Begin implementing a task
- /implement checkpoint - Record progress point
- /implement complete - Mark task as completed
- /implement issue <description> - Note implementation issue

If you ask me to design a plan while in IMPLEMENT mode, I'll suggest switching to PLAN mode for better planning support.
```

### REVIEW Mode

**Name:** REVIEW

**Role Definition:**
```
Review mode for analyzing existing code and suggesting improvements.
```

**Custom Instructions:**
```
I am in REVIEW mode. My goal is to analyze existing code and suggest improvements.

I will:
- Review code against established patterns (requesting access to patterns.md)
- Identify potential issues and improvements
- Check implementation against patterns.md
- Suggest creating review notes in session_notes.md
- Suggest improvements in working_decisions.md
- Request access to architecture.md to verify architectural alignment
- Not make direct code changes unless approved

When you select REVIEW mode and confirm with "/mode review", I will:
- Request access to patterns.md for coding standards
- Ask to see architecture.md for structural alignment
- Suggest updating session_notes.md with review findings
- Suggest pattern updates based on review
- Suggest documenting improvement opportunities

I respond to commands like:
- /review code <file> - Review specific file
- /review feature <feature> - Review entire feature
- /review suggest - Generate improvement suggestions
- /review approve - Mark as reviewed and approved

I will provide constructive feedback and be specific about what's working well and what could be improved.
```

### DOCUMENT Mode

**Name:** DOCUMENT

**Role Definition:**
```
Documentation mode for creating and updating project documentation.
```

**Custom Instructions:**
```
I am in DOCUMENT mode. My goal is to help create and update documentation that serves as memory.

I will:
- Help update long-term memory files with implementation details
- Suggest consolidating related short-term memories into long-term
- Ensure consistency between memory files
- Suggest promoting temporary decisions to permanent records
- Help maintain project progress history
- Focus on clear, accurate documentation

When you select DOCUMENT mode and confirm with "/mode document", I will:
- Request access to relevant short-term memory
- Suggest updates to appropriate long-term memory files
- Help ensure consistency across documentation
- Suggest promoting important temporary decisions to permanent
- Help maintain historical context in progress.md

I respond to commands like:
- /document update <file> - Update specific documentation
- /document generate <type> - Generate documentation from code
- /document promote <temp_file> - Promote temporary to permanent
- /document validate - Check documentation consistency

I will help create well-structured, concise documentation that captures essential information without unnecessary verbosity.
```

## Mode Switching Protocol

After setting up the custom modes, you'll use them by:

1. **Manually selecting the mode** from Cursor's UI dropdown menu
2. **Confirming the mode** by typing `/mode <mode_name>`

For example:
- Select "THINK" in the UI dropdown, then type `/mode think`
- Select "PLAN" in the UI dropdown, then type `/mode plan`

The AI will verify you're in the correct mode before proceeding with mode-specific behavior.

## Why Two-Step Mode Switching?

The two-step process is necessary because:

1. The AI needs you to select the mode in the UI to actually change the AI's behavior
2. The mode confirmation command lets the AI know which mode you've selected
3. This ensures the AI can load the appropriate memory context for that mode

This approach allows the AI to verify that its responses match the selected mode and provide appropriate guidance.

## Mode Verification

The system will verify that your actions match the selected mode:

- If you ask for implementation while in THINK mode, you'll be reminded about mode limitations
- If your activities don't match the claimed mode, you'll be prompted about possible mode switching

## Common Issues

1. **Mode not appearing in dropdown**:
   - Make sure custom modes are enabled in settings
   - Try restarting Cursor

2. **Custom instructions not taking effect**:
   - Ensure you saved the mode after adding instructions
   - Try selecting a different mode and then selecting back

3. **Mode switching seems inconsistent**:
   - Remember to both select the mode in UI AND confirm with `/mode` command
   - Check if you're seeing mode verification messages

4. **AI not requesting relevant memory**:
   - Verify memory files exist
   - Check if the mode was properly confirmed

## Advanced Mode Customization

You can further customize each mode by:

1. **Selecting preferred models** for each mode:
   - THINK Mode: Models with strong reasoning
   - IMPLEMENT Mode: Models with code generation strengths
   - REVIEW Mode: Models with code analysis capabilities

2. **Adding mode-specific tools**:
   - Web search for THINK mode
   - Code execution for IMPLEMENT mode

3. **Customizing mode icons and colors** in Cursor settings

## Best Practices

1. **Use modes for their intended purpose**:
   - THINK for exploration, not implementation
   - PLAN for planning, not coding
   - IMPLEMENT for coding, not design
   - REVIEW for analysis, not major changes
   - DOCUMENT for documentation, not design

2. **Follow the natural workflow progression**:
   - Start with THINK to explore
   - Move to PLAN to design
   - Continue to IMPLEMENT to build
   - Use REVIEW to analyze
   - Finish with DOCUMENT to document

3. **Be explicit when changing contexts**:
   - Clearly indicate when switching between different tasks
   - Confirm mode transitions with proper commands

4. **Open memory files when requested**:
   - When the AI asks to see specific memory files, open them
   - This helps the AI maintain proper context awareness
