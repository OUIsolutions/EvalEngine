
<div align="center">

# EvalEngine
![VibeScript Logo](https://img.shields.io/badge/VibeScript-0.1.0-blue?style=for-the-badge&logo=lua)
[![GitHub Release](https://img.shields.io/github/release/OUIsolutions/EvalEngine.svg?style=for-the-badge)](https://github.com/OUIsolutions/EvalEngine/releases)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](https://github.com/OUIsolutions/EvalEngine/blob/main/LICENSE)
![Status](https://img.shields.io/badge/Status-Stable-brightgreen?style=for-the-badge)
![Platforms](https://img.shields.io/badge/Platforms-VibeScript-lightgrey?style=for-the-badge)

</div>

---

### Overview

EvalEngine is a powerful evaluation and monitoring tool built for the VibeScript platform. It provides automated script execution with file watching capabilities, allowing you to continuously evaluate and test VibeScript-based applications:

1. **Install VibeScript runtime** 
2. **Configure EvalEngine with your sources**
3. **Monitor and execute scripts automatically**

This tool is designed for developers who need to:
- Continuously monitor and execute VibeScript files
- Automate testing and evaluation workflows
- Build responsive development environments
- Deploy automated script execution pipelines

### Key Features

- **File Monitoring** - Watch directories for script changes and execute automatically
- **Pattern Matching** - Execute files based on naming patterns
- **Flexible Runtime** - Support for any runtime environment
- **Configurable Delays** - Control execution timing and intervals
- **Multi-source Support** - Monitor multiple directories simultaneously
- **Color-coded Output** - Clear visual feedback for execution status

## Installation

### Step 1: Install VibeScript

Choose the appropriate installation method for your operating system:

#### Option A: Pre-compiled Binary (Linux only)
```bash
curl -L https://github.com/OUIsolutions/VibeScript/releases/download/0.32.0/vibescript.out -o vibescript.out && chmod +x vibescript.out && sudo mv vibescript.out /usr/local/bin/vibescript
```

#### Option B: Compile from Source (Linux and macOS)
```bash
curl -L https://github.com/OUIsolutions/VibeScript/releases/download/0.35.0/amalgamation.c -o vibescript.c && gcc vibescript.c -o vibescript.out && sudo mv vibescript.out /usr/local/bin/vibescript
```

### Step 2: Install EvalEngine 
```bash
vibescript add_script --file https://github.com/OUIsolutions/EvalEngine/releases/download/0.1.0/cli.lua  evalengine
```

## Usage

EvalEngine will run `vibescript <file> <args>` for every file that starts with the specified pattern in your source directories.

```bash
vibescript evalengine --runtime vibescript --startswith evalengine. --sources src
```

### Command Line Options

- `--runtime`: Specify the runtime to use for executing scripts
- `--startswith`: Pattern to match file names that should be executed
- `--sources` or `--src`: Directories or files to monitor (can specify multiple)
- `--args`: Additional arguments to pass to executed scripts
- `--delay`: Wait time in seconds between execution cycles (default: 0)

### Example Usage

```bash
# Monitor src directory for files starting with "test."
vibescript evalengine --runtime vibescript --startswith test. --sources src --delay 2

# Monitor multiple directories with custom arguments
vibescript evalengine --runtime node --startswith app. --sources src tests --args '--verbose --debug'
```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
