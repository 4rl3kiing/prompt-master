# Perfiles de imagen, 3D, vídeo, voz y automatización

*Leer cuando el destino sea Midjourney, DALL-E, Stable Diffusion, SeeDream, ComfyUI, Meshy/Tripo/Rodin, Unity/Blender, Sora/Runway/Kling, ElevenLabs o Zapier/Make/n8n.*

---

**Image AI — Generation** (Midjourney, DALL-E 3, Stable Diffusion, SeeDream)
First detect: generation from scratch or editing an existing image?

- **Midjourney**: Comma-separated descriptors, not prose. Subject first, then style, mood, lighting, composition. Parameters at end: `--ar 16:9 --v 6 --style raw`. Negative prompts via `--no [unwanted elements]`
- **DALL-E 3**: Prose description works. Add "do not include text in the image unless specified." Describe foreground, midground, background separately for complex compositions.
- **Stable Diffusion**: `(word:weight)` syntax. CFG 7-12. Negative prompt is MANDATORY. Steps 20-30 for drafts, 40-50 for finals.
- **SeeDream**: Strong at artistic and stylized generation. Specify art style explicitly (anime, cinematic, painterly) before scene content. Mood and atmosphere descriptors work well. Negative prompt recommended.

---

**Image AI — Reference Editing** (when user has an existing image to modify)
Detect when: user mentions "change", "edit", "modify", "adjust" anything in an existing image, or uploads a reference.
Always instruct the user to attach the reference image to the tool first. Build the prompt around the delta ONLY — what changes, what stays the same.
Read references/templates/visual.md Template J for the full reference editing template.

---

**ComfyUI**
Node-based workflow — not a single prompt box. Ask which checkpoint model is loaded before writing.
Always output two separate blocks: Positive Prompt and Negative Prompt. Never merge them.
Read references/templates/visual.md Template K for the full ComfyUI template.

---

**3D AI — Text to 3D/Game Systems** (Meshy, Tripo, Rodin)
- Describe: style keyword (low-poly / realistic / stylized cartoon) + subject + key features + primary material + texture detail + technical spec
- Negative prompt supported — use it: "no background, no base, no floating parts"
- Meshy: best for game assets and teams. Game asset prompts work best here.
- Tripo: fastest for clean topology. Rapid prototyping and concept assets.
- Rodin: highest quality for photorealistic prompts. Slower and more expensive.
- Specify intended export use: game engine (GLB/FBX), 3D printing (STL), web (GLB)
- For characters: specify A-pose or T-pose if the model will be rigged

---

**3D AI — In-Engine AI** (Unity AI, Blender AI tools)
- Unity AI (Unity 6.2+, replaces retired Muse): use /ask for documentation and project queries, /run for automating repetitive Editor tasks, /code for generating or reviewing C# code. Be precise — state exactly what needs to happen in the Editor.
- Unity AI Generators: text-to-sprite, text-to-texture, text-to-animation. Describe the asset type, art style, and technical constraints (resolution, color palette, animation loop or one-shot).
- BlenderGPT / Blender AI add-ons: these generate Python scripts that execute in Blender. Be specific about geometry, material names, and scene context. Include "apply to selected object" or "apply to entire scene" to avoid ambiguity.

---

**Video AI** (Sora, Runway, Kling, LTX Video, Dream Machine)
- Sora: describe as if directing a film shot. Camera movement is critical — static vs dolly vs crane changes output dramatically. Add duration in seconds and cut style (e.g. slow dolly, static shot, crane up).
- Runway Gen-3: responds to cinematic language — reference film styles for consistent aesthetic.
- Kling: strong at realistic human motion — describe body movement explicitly, specify camera angle and shot type.
- LTX Video: fast generation, prompt-sensitive — keep descriptions concise and visual. Specify resolution and motion intensity explicitly.
- Dream Machine (Luma): cinematic quality — reference lighting setups, lens types, and color grading styles.

---

**Voice AI** (ElevenLabs)
- Specify emotion, pacing, emphasis markers, and speech rate directly
- Use SSML-like markers for emphasis: indicate which words to stress, where to pause
- Prose descriptions do not translate — specify parameters directly

---

**Workflow AI** (Zapier, Make, n8n)
- Trigger app + trigger event → action app + action + field mapping. Step by step.
- Auth requirements noted explicitly — "assumes [app] is already connected"
- For multi-step workflows: number each step and specify what data passes between steps
