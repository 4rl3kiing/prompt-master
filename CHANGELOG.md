# Changelog

Formato: una entrada por versión, la más reciente primero.

- **2.0.0** — Revisión completa (22 mejoras). Todo en español.
  - **Idioma y tono:** las etiquetas del prompt, el bloque de memoria y el aviso agéntico salen en el idioma del usuario. Los prompts de imagen, video, 3D y música van en inglés. Se quitó la regla «MUST sobre should» y ahora se dan instrucciones directas con su razón, como recomienda Anthropic.
  - **Activación:** descripción nueva, en español con palabras clave en inglés, que cubre peticiones sin la palabra «prompt» y aclara cuándo no usarla.
  - **Menos preguntas:** regla «preguntar o suponer», con campos y una línea `Supuestos:`. Si la tarea es clara pero no hay herramienta, entrega un prompt universal.
  - **Funciones nuevas:** modo ajuste (`Cambio:`); prompts permanentes con la plantilla M (system prompts, GPTs, Proyectos, Gems, CLAUDE.md, AGENTS.md, reglas de Cursor, Devin y Copilot); oferta de 3 entradas de prueba para prompts que van a producción.
  - **Verificación final:** «¿funcionaría a la primera?» se sustituyó por una prueba de lectura concreta. Se completó la lista de excepciones al formato de un solo bloque y se aclaró la regla de campos.
  - **Plantillas (de 14 a 13):** B, C y D se unieron en un solo Brief de escritura. La plantilla de agente autónomo (antes H) deja verificar con pruebas y servidor local, y no duplica el brief de Claude. Letras nuevas A–M (equivalencias en `references/templates.md`).
  - **Perfiles verificados el 2026-11-22 con fuentes oficiales:**
    - Modelos: Claude 5.5 y Fable 5.2, GPT-6.2 Astra y Sol, Grok 4.7, Gemini 4, DeepSeek V4, Qwen4, Mistral 4, MiniMax M3.
    - Agentes: Windsurf pasa a Devin Desktop; Antigravity es multimodelo; Copilot tiene agente en la nube.
    - Imagen: Midjourney V7/V8.1 con `--oref` en lugar de `--cref`; GPT Image en lugar de DALL·E; Nano Banana; Flux sin prompt negativo; SD 3.5; Ideogram 4; Seedream 5.
    - Video: Veo 3.1; Sora en retiro; Runway Gen-4.5; Kling 3; Luma Ray3.2; LTX-2.3.
    - Voz, música y automatización: etiquetas de audio de ElevenLabs v4; Suno v5.5; Unity AI Assistant; AI by Zapier.
    - Cada perfil lleva fecha de revisión, y la Puerta de recencia se activa si tiene más de 60 días.
  - **Patrones:** de 37 a 40, traducidos. Nuevos: énfasis en mayúsculas, versiones obsoletas y tarea puntual en un prompt permanente.
  - **Pruebas:** 6 casos nuevos (19 en total) y comparación contra la 1.10.1 en `evals/benchmark.md`. `check.sh` avisa de MUST/NEVER en el núcleo y de perfiles sin revisar. README en español y sin promesas que no se pueden medir.
- **1.10.1** — Made the whole-app rule explicit: ask the critical questions first (max 3), then decompose into sequential prompts delivered one at a time. Matches existing behavior; documents the decision. Added a 13-case simulated eval baseline (`evals/outputs/`) and an extended `scripts/run_evals.py`.
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

