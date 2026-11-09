# Briefs de tareas complejas (M–N)

*Current Claude Task Brief (M) y OpenAI Task Brief (N). Cargar junto con el perfil de references/models.md o agents.md.*

---

## Template M — Current Claude Task Brief

*Use for complex, multi-step, or agentic tasks on current Claude models—Claude.ai, API, or Claude Code. It front-loads the outcome, context, scope, and action boundaries while avoiding obsolete manual-thinking scaffolding.*

```
## Objective
[What needs to be built, fixed, or produced — one clear sentence. Add WHY if it affects approach.]

## Context
[What exists now — relevant files, current behavior, stack already in place, what was tried and failed]

## Target State
[What done looks like — specific files changed, behavior produced, tests passing. Binary where possible.]

## Scope
- Work only in: [specific files and directories]
- Do NOT touch: [forbidden files — .env, package-lock.json, configs, anything outside scope]

## Constraints
- [Stack version, naming conventions, no new dependencies without asking]
- Only make changes directly requested. Do not add features, abstractions, or files beyond what was asked.

## Acceptance Criteria
- [ ] [Binary check 1]
- [ ] [Binary check 2]
- [ ] [Binary check 3]

## Action Boundaries
- Proceed with reversible, in-scope inspection, edits, and validation.
- Stop and ask before destructive or irreversible actions, external writes, purchases, material scope expansion, or decisions that require user-only input.

## Progress Evidence
For long-running work, report progress only when it changes or when a checkpoint is reached. Ground every completion claim in a tool result, changed artifact, or verification output.
```

**Effort** — configure in the API or harness rather than requesting private reasoning in the prompt. Start with the model default, lower it for routine scoped work, and raise it only when task difficulty warrants the cost.

**Claude Code only — add Session Strategy block when relevant:**
```
## Session Strategy
[Pick one:]
- New session — unrelated to prior context, start fresh
- Continue — prior context still needed
- Subagent — delegate only [independent, sizeable workstream], with a bounded deliverable
- Compact first — compact around [decisions, constraints, and current state], then begin
```

**When to use:** Current Claude models on any surface when the task is complex, multi-file, ambiguous, or agentic. Not needed for simple one-shot tasks.

---

## Template N — OpenAI Task Brief

*Use for complex tasks targeting OpenAI models in ChatGPT, Codex, or the API. Keep simple requests short; omit sections that do not affect the result.*

```text
Goal:
[The concrete result to deliver.]

Context:
[Relevant inputs, current state, prior decisions, and failed attempts.]

Constraints:
[Scope, requirements, compatibility, and limits.]

Actions:
[For tool-based tasks: available tools, actions already authorized,
and actions requiring additional approval.]

Done:
[Observable acceptance criteria and appropriate verification.]

Output:
[Deliverable, format, level of detail, and required evidence.]
```

**Adaptation heuristics — evaluate on representative tasks:**
- Luna: narrow the task and make the output contract explicit.
- Sol: emphasize implementation context and acceptance criteria.
- Astra: include decision criteria and evidence requirements for difficult work.
- Preserve an explicitly selected GPT-5.6 model and apply its compatibility guidance in SKILL.md.
- Combine related tasks when they share one outcome; split when dependencies, review checkpoints, or context limits justify separate runs.
- Ask for conclusions, assumptions, concise rationale, evidence, and checks rather than hidden chain-of-thought.
- For current facts, request retrieval and citations when the environment provides those capabilities; disclose missing access rather than invent sources.
- Define tool access and authorization only for agentic tasks. For long work, request milestones and blockers instead of a message after every action.
- Keep API and harness settings in setup notes outside the prompt. Verify supported controls for the exact model, endpoint, and surface.

The task brief and adaptation heuristics are Prompt Master recommendations, not an official OpenAI template or benchmark result.
