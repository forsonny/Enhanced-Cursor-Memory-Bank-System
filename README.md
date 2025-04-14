# Enhanced Memory Bank System for Cursor

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A comprehensive memory system for Cursor IDE that provides both short-term session memory and long-term persistent memory without relying on external tools or databases.

## 🧠 Features

- **Dual Memory Architecture**: Short-term session memory + long-term persistent memory
- **Operational Modes**: Different modes (THINK, PLAN, IMPLEMENT, REVIEW, DOCUMENT) with specialized memory behaviors
- **Context Request System**: AI requests relevant memory files based on context
- **User-Reported Events**: Report key events to trigger memory updates
- **Rich Command Interface**: Commands for explicit memory operations
- **Annotation Support**: Use code annotations for memory updates
- **Memory Promotion**: Convert short-term memory to long-term when valuable

## 🚀 Quick Start

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/cursor-memory-bank.git

# Navigate to your project
cd your-project

# Run the initialization script
path/to/init-memory-bank.sh
```

Or download and run directly:

```bash
curl -L -o init-memory-bank.sh https://raw.githubusercontent.com/your-username/cursor-memory-bank/main/init-memory-bank.sh
chmod +x init-memory-bank.sh
./init-memory-bank.sh
```

### Basic Usage

1. **Initialize the system**:
   The initialization script creates all necessary files and directories.

2. **Check system status**:
   ```
   /memory status
   ```

3. **Select and confirm a mode**:
   - Select "THINK" from Cursor's UI dropdown
   - Type `/mode think` to confirm

4. **Update memory files**:
   ```
   /memory update project_brief.md "Your content here"
   ```

5. **Report development events**:
   ```
   /memory event commit "Implemented authentication"
   ```

For detailed instructions, see [USAGE.md](docs/USAGE.md).

## 📚 Documentation

- [Installation Guide](docs/INSTALLATION.md) - Detailed installation instructions
- [Usage Guide](docs/USAGE.md) - How to use the memory bank system
- [Custom Modes Setup](docs/CUSTOM_MODES.md) - Setting up Cursor's custom modes
- [Memory Structure](docs/MEMORY_STRUCTURE.md) - Understanding the memory file structure
- [Command Reference](docs/COMMANDS.md) - Complete command documentation
- [Event System](docs/EVENTS.md) - How to report events and trigger memory updates

## 🏗️ System Architecture

```
your-project/
├── .cursor/
│   ├── rules/                   # Cursor rules (.mdc files)
│   │   ├── 001_memory_core.mdc  # Core memory system
│   │   ├── 002_memory_commands.mdc  # Memory commands
│   │   ├── 003_mode_definitions.mdc  # Operational modes
│   │   ├── 004_auto_context.mdc  # Context request system
│   │   └── 005_memory_events.mdc  # Event-based updates
│   └── memory/                  # Memory storage
│       ├── config.json          # System configuration
│       ├── short_term/          # Session-specific memory
│       │   ├── current_context.md
│       │   ├── working_decisions.md
│       │   └── session_notes.md
│       └── long_term/           # Persistent memory
│           ├── project_brief.md
│           ├── architecture.md
│           ├── patterns.md
│           ├── decisions.md
│           └── progress.md
```

## 🌟 Key Concepts

### Memory Types

- **Short-Term Memory**: Session-specific context that's active during the current development session
- **Long-Term Memory**: Persistent knowledge that's maintained across all sessions

### Operational Modes

- **THINK**: Exploration mode for understanding problems
- **PLAN**: Planning mode for designing solutions
- **IMPLEMENT**: Implementation mode for writing code
- **REVIEW**: Review mode for analyzing code
- **DOCUMENT**: Documentation mode for updating docs

### Memory Commands

The system responds to commands like:
- `/memory init`: Initialize the memory system
- `/memory status`: Check memory system status
- `/memory recall <context>`: Request to see specific memory
- `/memory update <file> <content>`: Suggest memory updates
- `/memory event <type> <details>`: Report development events
- `/mode <mode_name>`: Confirm operational mode (after UI selection)

## How It Works

The Enhanced Memory Bank System works with Cursor's capabilities:

1. **AI uses rules in .mdc files** to guide behavior
2. **AI requests to see memory files** based on context 
3. **You report significant events** that trigger memory updates
4. **AI suggests updates to memory files** that you can implement
5. **Memory persists across sessions** through the file structure

This approach ensures that context is maintained effectively while working within Cursor's actual capabilities.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

## 🙏 Acknowledgments

This project was inspired by:
- [Cline Memory Bank](https://github.com/nickbaumann98/cline_docs/blob/main/prompting/custom%20instructions%20library/cline-memory-bank.md)
- [Roo Code Memory Bank](https://github.com/GreatScottyMac/roo-code-memory-bank)
- [vanzan01's Cursor Memory Bank](https://github.com/vanzan01/cursor-memory-bank)

## 📱 Contact

Your Name - [@your_twitter](https://twitter.com/your_twitter) - email@example.com

Project Link: [https://github.com/your-username/cursor-memory-bank](https://github.com/your-username/cursor-memory-bank)
