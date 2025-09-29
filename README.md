
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


### Usage
it will run `vibescript <file> <args> ` for every file that starts with 
`evalengine.` in the `src` folder.

```bash
vibescript evalengine --runtime vibescript --startswith evalengine. --sources src
```
