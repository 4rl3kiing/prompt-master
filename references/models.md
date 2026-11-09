# Perfiles de modelos de lenguaje

*Leer cuando la herramienta de destino sea un LLM (Claude, GPT, o-series, Grok, Gemini, Qwen, Ollama, Llama/Mistral, DeepSeek, MiniMax). Aplicar antes la Puerta de Recencia de SKILL.md.*

---

> **Estado de verificación:** perfiles heredados de v1.8.2 y movidos sin cambios en v1.9.0. NO re-verificados contra documentación oficial de los proveedores. Antes de afirmar nombres de modelo, slugs o parámetros, aplicar la Puerta de Recencia de `SKILL.md`. Última revisión de estructura: 2026-11-08.

---

**Claude (claude.ai, Claude API, Claude 5.x / current Claude models)**

Do not assume one universal Claude default. When unsure, start with the **Opus 5** family for complex agentic coding and enterprise work, **Fable 5** for the highest-capability long-running agents, **Sonnet 5** for speed plus frontier intelligence, and **Haiku** for fast, economical workloads. Ask which model only when the distinction changes the prompt. Always verify the current model slug against official Anthropic documentation — version numbers change frequently.

*Durable across current Claude models:*
- Be clear and direct. State the desired output, constraints, and scope explicitly; explain why when the reason affects judgment.
- Use XML tags such as `<context>`, `<task>`, `<constraints>`, and `<output_format>` for complex mixed-content prompts; use a few relevant, diverse examples when format or tone must be locked.
- For long context, put source documents before the query and wrap documents plus metadata in descriptive XML tags.
- Prefer positive instructions that describe the desired result over long lists of prohibitions.
- Do not request hidden reasoning or reproduce thinking. Ask for a concise rationale, evidence, and verification results.
- Current Claude 5 models use adaptive thinking and an effort control. Do not hardcode manual thinking budgets; recommend an effort level only when the user controls API or harness settings.
- Use Template M for complex or agentic tasks.

*Fable 5.1 (and Fable 5):*
- Fable 5.1 is optimized for the hardest long-horizon autonomous work. Give it a complete outcome-focused specification, explicit action boundaries, and infrastructure suitable for long asynchronous runs.
- Ground every long-run progress claim in actual tool results. Delegate independent workstreams to subagents when useful and establish interval-based verification for long builds; cap concurrency or spend when cost matters.

*Opus 5.5 (and Opus 5):*
- Opus 5.5 is the recommended starting point for complex agentic coding and enterprise work. Keep scope tight: "Deliver what was asked. Do not add features, refactors, or abstractions beyond the task."
- Opus 5.5 already self-verifies strongly. Avoid redundant "double-check everything" instructions and verifier subagents for routine work; delegate only genuinely independent, sizeable tracks.

*Sonnet 5.5 (and Sonnet 5):*
- Sonnet 5.5 follows instructions literally, especially at lower effort. State when a rule applies to every item or section.
- Raise effort for difficult multi-step work rather than compensating with elaborate reasoning prompts. Use explicit style and design direction instead of non-default sampling parameters.

*Claude 4.8 and earlier selectable models:*
- Existing explicit, front-loaded prompts remain compatible. If the model is 4.7 or later, use adaptive thinking and effort rather than `budget_tokens`.

---

**ChatGPT / OpenAI GPT models**

Identify the surface (ChatGPT, Codex, or API), preserve the selected model, and use the Model Recency Gate for availability and exact controls.
- Route GPT-6 Luna (`gpt-6-luna`) to focused, high-volume tasks; GPT-6.1 Sol (`gpt-6.1-sol`) to complex coding, computer use, and professional work; GPT-6 Astra (`gpt-6-astra`) to demanding reasoning, research, coding, and document work.
- Preserve GPT-5.6 choices: Sol (`gpt-5.6-sol`, alias `gpt-5.6`) for flagship capability, Terra (`gpt-5.6-terra`) for balanced everyday work, and Luna (`gpt-5.6-luna`) for fast, repeatable tasks. ChatGPT availability depends on the user's plan.
- Start lean; use Template N for complex tasks and omit irrelevant sections. As heuristics to evaluate, narrow Luna tasks, give Sol implementation context and acceptance criteria, and give Astra decision criteria and evidence requirements.
- State domain context, constraints, approval boundaries, success criteria, and when ambiguity requires a question. Honor existing authorization, allow routine in-scope work, and specify milestones, delegation limits, and proportionate verification when relevant.
- For GPT-6 API tools, use Responses: Astra and GPT-6.1 Sol do not support tool calling through Chat Completions; Luna supports function calling there only with `reasoning_effort: "none"`.
- Use the lowest reasoning effort that meets the quality bar; verify supported values for the exact model and endpoint. Do not transfer GPT-5.6-specific controls to newer models without verification.
- Keep runtime settings outside the copyable prompt. For GPT-5.6, use higher effort, `reasoning.mode: "pro"`, or Responses multi-agent beta only when measured quality justifies cost and latency; pro mode is not a separate model slug.
- Treat ChatGPT/Codex controls such as Sol Pro, Max, or Ultra as surface-specific; do not translate them into API parameters. Prompt text does not change the selected model or runtime settings.
- State tool-use expectations and evidence requirements; use orchestration only for bounded, divisible work. Ask for conclusions, assumptions, evidence, and checks, never hidden reasoning; control visible length with the output contract (and API `text.verbosity`).

---

**OpenAI reasoning models (o3, o4-mini, and successors)**
- SHORT clean instructions ONLY — these models reason across thousands of internal tokens
- NEVER add CoT, "think step by step", or reasoning scaffolding — it actively degrades output
- Prefer zero-shot first — add few-shot only if strictly needed and tightly aligned
- State what you want and what done looks like. Nothing more.
- Keep instructions concise while preserving necessary context, constraints, examples, and verification. Do not impose an arbitrary word limit.

---

**Grok / Grok 4.6 / xAI**
- Use `grok-4.6` for current general chat, coding, agentic, and knowledge-work prompts. It supports text and image input, configurable reasoning, function calling, web search, X search, and code execution.
- Keep the task outcome-focused: Goal, Context/Input, Constraints, Tools/Permissions, and Done. Grok 4.6 is OpenAI-API compatible, but the prompt must still name the tools and evidence the task requires.
- Choose reasoning effort intentionally: `low` for scoped or latency-sensitive work, `medium` for balanced work, `high` (the API default) for difficult tasks, and `xhigh` only when deeper exploration is worth the cost. Grok 4.6 reasoning cannot be disabled. Do not ask for chain-of-thought.
- For current facts, explicitly require Web Search or X Search and citations. Grok's base model does not have realtime knowledge without search tools enabled.
- For long, tool-heavy agent loops, define stop conditions, approval boundaries, retry limits, and context-compaction checkpoints. Keep stable instructions at the front to preserve prompt-cache reuse.
- For API setup notes, recommend `prompt_cache_key` on the Responses API or `x-grok-conv-id` on Chat Completions for reliable cache routing; do not place secret values in the prompt.
- Consumer Grok and the xAI API expose different controls. If the user is in grok.com or X and cannot set model parameters, encode only behavioral requirements in the prompt rather than API settings.

---

**Gemini / Google AI models (Gemini 4 Argon, Gemini 3.x Flash, and current Gemini family)**
- Gemini 4 Argon is the current flagship — built for deep reasoning, long-horizon agentic work, coding, and multimodal tasks. 1M token context window. Verify the current model slug against Google AI documentation before recommending one.
- Strong at long-context and multimodal — leverage its large context window for document-heavy prompts
- Prone to hallucinated citations — always add "Cite only sources you are certain of. If uncertain, say [uncertain]."
- Can drift from strict output formats — use explicit format locks with a labelled example
- For grounded tasks add "Base your response only on the provided context. Do not extrapolate."
- Gemini 4 Argon supports tunable thinking levels (low, medium, high) — do not hardcode reasoning steps, set thinking level instead

---

**Qwen 2.5 (instruct variants)**
- Excellent instruction following, JSON output, structured data — leverage these strengths
- Provide a clear system prompt defining the role — Qwen2.5 responds well to role context
- Works well with explicit output format specs including JSON schemas
- Shorter focused prompts outperform long complex ones — scope tightly

---

**Qwen3 (thinking mode)**
- Two modes: thinking mode (/think or enable_thinking=True) and non-thinking mode
- Thinking mode: treat exactly like o3 — short clean instructions, no CoT, no scaffolding
- Non-thinking mode: treat like Qwen2.5 instruct — full structure, explicit format, role assignment

---

**Ollama (local model deployment)**
- ALWAYS ask which model is running before writing — Llama3, Mistral, Qwen2.5, CodeLlama all behave differently
- System prompt is the most impactful lever — include it in the output so user can set it in their Modelfile
- Shorter simpler prompts outperform complex ones — local models lose coherence with deep nesting
- Temperature 0.1 for coding/deterministic tasks, 0.7-0.8 for creative tasks
- For coding: CodeLlama or Qwen2.5-Coder, not general Llama

---

**Llama / Mistral / open-weight LLMs**
- Shorter prompts work better — these models lose coherence with deeply nested instructions
- Simple flat structure — avoid heavy nesting or multi-level hierarchies
- Be more explicit than you would with Claude or GPT — instruction following is weaker
- Always include a role in the system prompt

---

**DeepSeek-R1**
- Reasoning-native like o3 — do NOT add CoT instructions
- Short clean instructions only — state the goal and desired output format
- Outputs reasoning in `<think>` tags by default — add "Output only the final answer, no reasoning." if needed

---

**MiniMax (M3 / M2.7)**
- OpenAI-compatible API — prompts that work with GPT models transfer directly
- Strong at instruction following, structured output, and long-context synthesis — 1M context window on M2.7
- M2.7-highspeed is optimized for speed — use for latency-sensitive tasks
- Temperature must be between 0 and 1 (inclusive) — prompts that set temperature above 1 will fail
- May output reasoning in `<think>` tags — add "Output only the final answer, no reasoning tags." if the user does not want visible thinking
- Good at code generation, JSON output, and multi-step analysis — leverage these strengths
- Responds well to explicit role assignment and structured prompts with clear output format specifications
- For function calling: supports OpenAI-style tool definitions — include tool schemas directly
