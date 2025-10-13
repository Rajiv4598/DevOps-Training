# Week 4 — Shell Scripting Basics (Bash)

## Files
- `hello.sh` — prints a greeting.
- `even_odd.sh` — accepts a number (arg or prompt) and prints EVEN/ODD.
- `loop_demo.sh` — variables + loops + conditionals demonstration.

## Quick start
```bash
chmod +x hello.sh even_odd.sh loop_demo.sh
./hello.sh
./even_odd.sh 17
./loop_demo.sh
```

## Tips
- Use `#!/usr/bin/env bash` shebang.
- `set -euo pipefail` for safer scripts.
- Use `(( ))` for math and `[[]]` for tests.
