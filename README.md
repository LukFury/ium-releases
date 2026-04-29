# IUM — by COPE
**Give your AI a map of your codebase.**

AI coding assistants are powerful — but they navigate your code blind. They grep, they guess, they read files they don't need. IUM fixes that. It builds a precise symbol index of your entire codebase so your AI can find exactly what it needs, instantly, without reading thousands of files.

---

## What it does

IUM indexes your codebase and exposes it as tools your AI can call:

- **Find any symbol** — where it's defined, called, mutated, or referenced. Exact file and line, every time.
- **Search by concept** — ask "license validation" and get ranked results. No exact name needed.
- **Trace call graphs** — walk callers and callees to any depth in milliseconds.
- **Show source** — pull up the definition of any function without opening a file.
- **Stay current** — watches your project for changes and updates the index automatically.

Everything runs locally. Your code never leaves your machine.

---

## Why it works

Most "AI code tools" dump files into context and hope. IUM is built specifically for how AI navigates code — precise coordinates, not approximate chunks.

Real-world benchmark against DataFusion (1,538 files): **93.7% fewer tokens** vs grep for equivalent queries.

---

## Works with

Any MCP-compatible AI assistant — Claude Code, Cursor, Cline, Windsurf, and more.

---

## Supported languages

Rust, Python, TypeScript, CSS, SCSS, HTML — more added regularly.

---

## Install

```sh
curl -fsSL https://raw.githubusercontent.com/LukFury/ium-releases/master/install.sh | sh
```

Then in your project:

```sh
ium scan .     # index your codebase
ium embed      # build semantic search (one-time, ~130MB model download)
ium mcp        # start the MCP server
```

---

## Pricing

**Founder tier — $10/mo forever** (limited slots) → [Get founder license](https://buy.stripe.com/14A5kFd7P5wd5JE5gM2oE01)

Standard — $15/mo → [Get license](https://buy.stripe.com/dRm14p7NvaQxdc610w2oE00)

---

## Questions

support@copecode.dev

*by COPE — [copecode.dev](https://copecode.dev)*
