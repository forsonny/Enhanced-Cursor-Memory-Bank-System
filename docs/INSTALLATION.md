# Installation Guide

This guide provides detailed instructions for installing and setting up the Enhanced Memory Bank System for Cursor.

## Prerequisites

- **Cursor IDE**: Make sure you have Cursor version 0.48 or higher installed
- **Bash Shell**: For running the installation script
- **Git** (optional): For cloning the repository

## Installation Methods

### Method 1: Using the Installation Script

The simplest way to install the Enhanced Memory Bank System is using the provided initialization script:

1. **Download the script**:

   ```bash
   curl -L -o init-memory-bank.sh https://raw.githubusercontent.com/your-username/cursor-memory-bank/main/init-memory-bank.sh
   ```

2. **Make it executable**:

   ```bash
   chmod +x init-memory-bank.sh
   ```

3. **Run the script in your project root**:

   ```bash
   ./init-memory-bank.sh
   ```

This script will:
- Create the necessary directory structure
- Add the required rule files (.mdc files)
- Set up the memory configuration
- Create template memory files

### Method 2: Manual Installation

If you prefer to install the system manually:

1. **Create the directory structure**:

   ```bash
   mkdir -p .cursor/rules
   mkdir -p .cursor/memory/short_term
   mkdir -p .cursor/memory/long_term
   ```

2. **Copy the rule files**:

   Download or copy these files to `.cursor/rules/`:
   - `001_memory_core.mdc`
   - `002_memory_commands.mdc`
   - `003_mode_definitions.mdc`
   - `004_auto_context.mdc`
   - `005_memory_events.mdc`

3. **Create the configuration file**:

   Create `.cursor/memory/config.json` with the appropriate configuration.

4. **Create memory file templates**:

   Create the required memory files in their respective directories:
   
   **Short-term memory**:
   - `.cursor/memory/short_term/current_context.md`
   - `.cursor/memory/short_term/working_decisions.md`
   - `.cursor/memory/short_term/session_notes.md`
   
   **Long-term memory**:
   - `.cursor/memory/long_term/project_brief.md`
   - `.cursor/memory/long_term/architecture.md`
   - `.cursor/memory/long_term/patterns.md`
   - `.cursor/memory/long_term/decisions.md`
   - `.cursor/memory/long_term/progress.md`

## Setting Up Custom Modes

After installing the file structure, you'll need to configure Custom Modes in Cursor:

1. Go to **Cursor Settings** → **Features** → **Chat** → **Custom modes**
2. Create modes for THINK, PLAN, IMPLEMENT, REVIEW, and DOCUMENT
3. Configure each mode with appropriate instructions

See [CUSTOM_MODES.md](CUSTOM_MODES.md) for detailed instructions on setting up each mode.

## Verifying Installation

To verify that the memory bank system is properly installed:

1. Open Cursor and navigate to your project
2. Run this command in Cursor's chat interface:

   ```
   /memory status
   ```

You should see a response indicating the memory system status, including:
- Initialization status
- Current operational mode
- Available memory files
- System configuration

If you encounter any issues, check the [Troubleshooting](#troubleshooting) section.

## Project-Specific Setup

After installation, you should configure the memory bank for your specific project:

1. Update your project brief:
   ```
   /memory update long_term/project_brief.md "Your project description and details..."
   ```

2. Initialize your architecture:
   ```
   /memory update long_term/architecture.md "Your system architecture details..."
   ```

3. Set initial patterns:
   ```
   /memory update long_term/patterns.md "Your coding patterns and conventions..."
   ```

## How the System Works with Cursor

The Enhanced Memory Bank System is designed to work with Cursor's capabilities:

1. **Rule files (.mdc)** tell the AI how to behave
2. **The AI requests to see memory files** when it needs context
3. **You report significant events** using commands
4. **The AI suggests memory updates** based on your activities
5. **You implement the suggested updates** to maintain persistent memory

This approach ensures that context is maintained effectively while working within Cursor's actual capabilities.

## Troubleshooting

### Common Issues

1. **Missing Permissions**:
   
   If you encounter permission errors:
   ```bash
   chmod -R 755 .cursor
   ```

2. **Files Not Created**:
   
   If some files are missing, try running:
   ```bash
   ls -la .cursor/rules
   ls -la .cursor/memory
   ```
   And manually create any missing files.

3. **Command Not Recognized**:
   
   If memory commands aren't recognized, ensure:
   - The rule files are properly named
   - They're in the correct location
   - Cursor has been restarted after installation

4. **Memory System Not Responding**:
   
   Try reinitializing:
   ```
   /memory init
   ```

### Still Having Issues?

If you're still experiencing problems:

1. Check the structure of your `.cursor` directory
2. Verify the content of your `.mdc` rules files
3. Make sure Cursor's custom modes feature is enabled

For additional assistance, please [open an issue](https://github.com/your-username/cursor-memory-bank/issues) on the GitHub repository.

## Next Steps

Once installation is complete, refer to the following guides:

- [USAGE.md](USAGE.md) - Learn how to use the memory bank system
- [CUSTOM_MODES.md](CUSTOM_MODES.md) - Set up custom modes in Cursor
- [COMMANDS.md](COMMANDS.md) - Explore all available commands
