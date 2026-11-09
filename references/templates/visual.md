# Plantillas visuales (I–K)

*Visual Descriptor, Reference Image Editing y ComfyUI. Cargar junto con references/media.md.*

---

## Template I — Visual Descriptor

*Use for Midjourney, DALL-E 3, Stable Diffusion, Sora, Runway, and any image or video generation tool.*

```
Subject: [Main subject — specific, not vague]
Action/Pose: [What the subject is doing]
Setting: [Where the scene takes place]
Style: [photorealistic / cinematic / anime / oil painting / vector / etc.]
Mood: [dramatic / serene / eerie / joyful / etc.]
Lighting: [golden hour / studio / neon / overcast / candlelight / etc.]
Color Palette: [dominant colors or named palette]
Composition: [wide shot / close-up / aerial / Dutch angle / etc.]
Aspect Ratio: [16:9 / 1:1 / 9:16 / 4:3]
Negative Prompts: [blurry, watermark, extra fingers, distortion, low quality]
Style Reference: [artist / film / aesthetic reference if applicable]
```

**Tool-specific syntax:** see `references/media.md` (Image AI — Generation, Video AI). Load it together with this template.

---

## Template J — Reference Image Editing

*Use when the user has an existing image they want to modify. Completely different from generation — never describe the whole scene from scratch, only describe the change.*

**Before writing the prompt, always tell the user:**
"Attach your reference image to [tool name] before sending this prompt."

**Detect the tool's editing capability:**
- Midjourney: use `--cref [image URL]` for character reference or `--sref` for style reference
- DALL-E 3: use the Edit endpoint, not the Generate endpoint. User must be in ChatGPT with image editing enabled
- Stable Diffusion: use img2img mode, not txt2img. Set denoising strength 0.3-0.6 to preserve the original

```
Reference image: [attached / URL]
What to keep exactly the same: [list everything that must not change]
What to change: [specific edit only — be precise]
How much to change: [subtle / moderate / significant]
Style consistency: maintain the exact style, lighting, and mood of the reference
Negative prompt: [what to avoid introducing]
```

**Example:**
```
Reference image: [attached portrait photo]
What to keep exactly the same: face, hair, clothing, background, lighting
What to change: head angle — rotate from facing left to facing straight forward
How much to change: subtle, preserve all facial features exactly
Style consistency: maintain photorealistic style, same lighting direction
Negative prompt: no new elements, no style changes, no background changes
```

---

## Template K — ComfyUI

*Use for ComfyUI node-based workflows. Always output Positive and Negative prompts as separate blocks. Ask for the checkpoint model before writing — syntax and token limits differ per model.*

**Ask first if not stated:**
"Which checkpoint model are you using? (SD 1.5, SDXL, Flux, or other)"

**Model-specific notes:**
- SD 1.5: shorter prompts work better, under 75 tokens per block, use (word:weight) syntax
- SDXL: handles longer prompts, supports more natural language alongside weighted syntax
- Flux: natural language works well, less reliance on weighted syntax, very responsive to style descriptions

```
POSITIVE PROMPT:
[subject], [style], [mood], [lighting], [composition], [quality boosters: highly detailed, sharp focus, 8k]

NEGATIVE PROMPT:
[what to exclude: blurry, low quality, watermark, extra limbs, bad anatomy, distorted, oversaturated]

CHECKPOINT: [model name]
SAMPLER: Euler a (recommended starting point)
CFG SCALE: 7 (increase for stricter prompt adherence)
STEPS: 20-30
RESOLUTION: [width x height — must be divisible by 64]
```
