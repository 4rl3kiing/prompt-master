# Perfiles de agentes, IDEs, generadores y orquestadores

*Leer cuando el destino ejecute acciones o edite archivos (Claude Code, Codex, Cursor, Cline, Copilot, Devin, Bolt/v0/Lovable, Antigravity, Perplexity/Manus, agentes de navegador).*

---

**Claude Code**
- Agentic — runs tools, edits files, executes commands autonomously
- Starting state + target state + allowed actions + forbidden actions + stop conditions + checkpoints
- Stop conditions are MANDATORY — runaway loops are the biggest credit killer
- Do not assume the Claude Code model. Apply the matching current Claude route in references/models.md; when model-specific behavior matters, ask which model is selected.
- Front-load intent, relevant paths, constraints, acceptance criteria, and verification commands. Explicitly request tool use when inspection is required.
- Current Fable/Opus models can over-scope and delegate readily. Add "Only make changes directly requested" and reserve subagents for independent, sizeable investigation or implementation tracks.
- Do not force a separate verifier on Opus 5.5 for routine work; request concrete tests and tool-backed evidence instead. For long Fable 5.1 runs, require progress claims to cite actual tool results.
- Always scope to specific files and directories — never give a global instruction without a path anchor
- Human review triggers required: "Stop and ask before deleting any file, adding any dependency, or affecting the database schema"
- For complex tasks, use Template M. It handles scope, criteria, action boundaries, and progress evidence in one structured block.

---

**Codex CLI / ChatGPT Work / Codex IDE**
- Apply the matching OpenAI model route in references/models.md, including GPT-6 Luna, GPT-6.1 Sol, GPT-6 Astra, or GPT-5.6 when selected. Do not infer the model from the Codex product name. Use Template N for complex OpenAI tasks.
- Structure implementation prompts as Goal, Context, Scope, Constraints, Approval Boundaries, and Done. Include concrete verification commands when known.
- Start with a supported default reasoning setting and adjust based on task results. Verify available Codex controls before recommending Max, Ultra, or other UI labels; do not map them directly to API settings.
- Keep one primary agent responsible for synthesis. Name each subagent's bounded deliverable and cap concurrency rather than requesting an open-ended swarm.
- Ask for a concise rationale, evidence, changed-file summary, and verification results—not hidden reasoning.

---

**Antigravity (Google's agent-first IDE, powered by Gemini 3 Pro)**
- Task-based prompting — describe outcomes, not steps
- Prompt for an Artifact (task list, implementation plan) before execution so you can review it first
- Browser automation is built-in — include verification steps: "After building, verify UI at 375px and 1440px using the browser agent"
- Specify autonomy level: "Ask before running destructive terminal commands"
- Do NOT mix unrelated tasks — scope to one deliverable per session

---

**Cursor / Windsurf**
- File path + function name + current behavior + desired change + do-not-touch list + language and version
- Never give a global instruction without a file anchor
- "Done when:" is required — defines when the agent stops editing
- For complex tasks: split into sequential prompts rather than one large prompt

---

**Cline (formerly Claude Dev)**
- Agentic VS Code extension — autonomously edits files, runs terminal commands, uses browser tools
- Powered by Claude, GPT, or other LLMs — prompting style should match the underlying model
- Starting state + target state + file scope + stop conditions + approval gates
- Always specify which files to edit and which to leave untouched
- Add "Ask before running terminal commands" or "Ask before installing dependencies" to prevent unwanted actions
- Can read file contents, search codebases, and use browser automation — leverage these for context gathering
- For multi-step tasks: break into sequential prompts with clear checkpoints
- Cline shows a task list before executing — review it and adjust scope if needed

---

**GitHub Copilot**
- Write the exact function signature, docstring, or comment immediately before invoking
- Describe input types, return type, edge cases, and what the function must NOT do
- Copilot completes what it predicts, not what you intend — leave no ambiguity in the comment

---

**Bolt / v0 / Lovable / Figma Make / Google Stitch**
- Full-stack generators default to bloated boilerplate — scope it down explicitly
- Always specify: stack, version, what NOT to scaffold, clear component boundaries
- Lovable responds well to design-forward descriptions — include visual/UX intent
- v0 is Vercel-native — specify if you need non-Next.js output
- Bolt handles full-stack — be explicit about which parts are frontend vs backend vs database
- Figma Make is design-to-code native — reference your Figma component names directly
- Google Stitch is prompt-to-UI focused — describe the interface goal not the implementation. Add "match Material Design 3 guidelines" for Google-native styling
- Add "Do not add authentication, dark mode, or features not explicitly listed" to prevent feature bloat

---

**Devin / SWE-agent**
- Fully autonomous — can browse web, run terminal, write and test code
- Very explicit starting state + target state required
- Forbidden actions list is critical — Devin will make decisions you did not intend without explicit constraints
- Scope the filesystem: "Only work within /src. Do not touch infrastructure, config, or CI files."

---

**Research / Orchestration AI** (Perplexity, Manus AI)
- Perplexity search mode: specify search vs analyze vs compare. Add citation requirements. Reframe hallucination-prone questions as grounded queries.
- Manus and Perplexity Computer are multi-agent orchestrators — describe the end deliverable, not the steps. They decompose internally.
- For Perplexity Computer: specify the output artifact type (report / spreadsheet / code / summary). Add "Flag any data point you are not confident about."
- For long multi-step tasks: add verification checkpoints since each chained step compounds hallucination risk

---

**Computer-Use / Browser Agents** (Perplexity Comet/Computer, OpenAI Atlas, Claude in Chrome, OpenClaw Agents)
- These agents control a real browser — they click, scroll, fill forms, and complete transactions autonomously
- Describe the outcome, not the navigation steps: "Find the cheapest flight from X to Y on Emirates or KLM, no Boeing 737 Max, one stop maximum"
- Specify constraints explicitly — the agent will make its own decisions without them
- Add permission boundaries: "Do not make any purchase. Research only."
- Add a stop condition for irreversible actions: "Ask me before submitting any form, completing any transaction, or sending any message"
- Comet works best with web research, comparison, and data extraction tasks
- Atlas is stronger for multi-step commerce and account management tasks
