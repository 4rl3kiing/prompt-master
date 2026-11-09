# Changelog

Formato: una entrada por versión, la más reciente primero.

- **1.10.0** — Added a language rule (reply and prompt follow the user's language). Split `references/templates.md` into an index plus five files under `references/templates/`. README patterns section now summarizes and links to `references/patterns.md` (single source). Moved history to this file. Added fork credit, GitHub Actions check, and machine-checkable evals (`evals/cases.json`, `scripts/run_evals.py`). Clarified that Decompiler mode returns its own format.
- **1.9.0** — Reorganization. Split `SKILL.md` (499 → ~220 lines) into a core file plus on-demand `references/models.md`, `agents.md`, `media.md`. Added an execution flow, a routing table, and a defined Token Efficiency Audit. Unified the unknown-tool rule. Aligned README examples with the skill's own rules (no framework names, no token estimates, `--no` for Midjourney). Added `evals/` and `scripts/check.sh`. Model profiles carried over unchanged and not re-verified against provider docs.
- **1.8.1–1.8.2** — Minor fixes; not documented in earlier history.
- **1.8.0** — Current-model refresh. Added Claude Fable 5, Opus 5, Sonnet 5, GPT-5.6 Sol/Terra/Luna, Codex, and Grok 4.6 routing. Replaced hidden chain-of-thought requests with auditable reasoning and generalized the Claude task brief for current adaptive-thinking models.
- **1.7.0** — Opus 4.8 compatibility. Made Claude 4.x routing version-aware: durable advice generalized across 4.6/4.7/4.8, added Opus 4.8 (current default) profile, kept Opus 4.7 labeled. De-hardcoded the effort-level note (now harness-managed). Template M and pattern 36 cover 4.7 and 4.8. Fixed a stray fragment in patterns.md.
- **1.6.0** — Opus 4.7 update. Added Template M (Opus 4.7 Task Brief). Updated Claude and Claude Code routing for literalism, adaptive thinking, xhigh effort, and session hygiene. Added patterns 36–37.
- **1.5.0** — Added more tool routing. New Agentic AI and 3D Model AI routing added. Fixed description to 189 chars. Removed token estimate from output. Added instruction layer and copywriting placeholders
- **1.4.0** — Added reference image editing detection, ComfyUI support, Prompt Decompiler mode. Fixed trigger description to invoke correctly in Claude Code. 3 new templates added to references folder
- **1.3.0** — Rebuilt around PAC2026 positional structure (30/55/15). Silent routing replaces user-facing framework selection. References folder introduced
- **1.2.0** — Restructured for attention architecture. Removed fabrication-prone techniques (ToT, GoT, USC, prompt chaining). Templates and patterns moved to references folder
- **1.1.0** — Expanded tool coverage, added memory block system, 35 credit killing patterns
- **1.0.0** — Initial release

