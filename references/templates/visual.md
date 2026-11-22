# Plantillas visuales (G–I)

*Descriptor visual, Edición con referencia y ComfyUI. Cárgalas junto con `references/media.md`: la sintaxis exacta de cada herramienta está allí. El prompt final va en inglés; las etiquetas de esta plantilla son guía para ti, no texto que se pega.*

---

## Template G — Descriptor visual

*Para generar imagen o video. Rellena mentalmente estos campos y luego escríbelos en el formato que la herramienta espera: descriptores separados por comas en Midjourney, prosa detallada en GPT Image, Nano Banana, Flux y Veo, pesos `(word:1.3)` en SD 1.5/SDXL.*

```
Subject: [sujeto principal, concreto]
Action/Pose: [qué hace]
Setting: [dónde ocurre]
Style: [fotorrealista / cinematográfico / anime / óleo / vector…]
Mood: [dramático / sereno / inquietante / alegre…]
Lighting: [hora dorada / estudio / neón / nublado / velas…]
Color palette: [colores dominantes o paleta con nombre; HEX si importa]
Composition: [plano general / primer plano / cenital / ángulo holandés…]
Camera (video): [movimiento, duración, tipo de toma]
Audio (video con audio nativo): [diálogo entre comillas, efectos, ambiente]
Aspect ratio: [16:9 / 1:1 / 9:16 / 4:5]
Exclusions: [solo donde la herramienta las lea: --no en Midjourney, bloque negativo en SD 1.5/SDXL; en el resto, reescríbelas en positivo]
Style reference: [artista, película o estética, si aplica]
```

**Ejemplo (Midjourney):**
```
lone samurai standing in heavy rain at night, traditional armor, neon reflections on wet cobblestones, cinematic lighting, dramatic shadows, fog, photorealistic, shallow depth of field --ar 16:9 --raw --no text, watermark, cartoon
```

---

## Template H — Edición con referencia

*Cuando el usuario tiene una imagen y quiere modificarla. Es distinto de generar: nunca describas la escena entera, solo el cambio, y di qué debe quedar igual.*

**Antes del prompt, indica al usuario:** «Adjunta tu imagen de referencia en [herramienta] antes de pegar este prompt».

**Capacidad de edición por herramienta** (detalles en `media.md`):
- **GPT Image (ChatGPT o API):** sube la imagen y pide el cambio conversando; en la API, endpoint de edición o herramienta de imagen de Responses.
- **Nano Banana (Gemini):** edición en varios turnos; hasta 14 referencias.
- **Flux Kontext / FLUX.2:** nombra el papel de cada referencia («keep the face from image 1»).
- **Midjourney:** `--oref [URL]` (Omni Reference, V7) para mantener un personaje u objeto, con `--ow` para su peso; `--sref [URL]` para el estilo. `--cref` ya no funciona en V7 ni V8.1.
- **Stable Diffusion:** img2img, no txt2img; fuerza de eliminación de ruido 0,3–0,6 para conservar el original.
- **Seedream:** nombra cada imagen por número y di qué no cambia.

```
Reference image: [adjunta / URL]
Keep exactly the same: [todo lo que no debe cambiar]
Change: [solo la edición, precisa]
Amount of change: [sutil / moderado / notable]
Style consistency: keep the exact style, lighting and mood of the reference
```

**Ejemplo:**
```
Keep exactly the same: face, hair, clothing, background, lighting.
Change: rotate the head from facing left to facing straight at the camera.
Amount of change: subtle; preserve every facial feature exactly.
Style consistency: same photorealistic style and light direction as the reference.
```

---

## Template I — ComfyUI

*Para flujos de ComfyUI por nodos. Pregunta primero el modelo (checkpoint), porque la sintaxis, los límites y si existe el negativo cambian por familia.*

**Pregunta si no lo dijo:** «¿Qué modelo tienes cargado? (SD 1.5, SDXL, SD 3.5, Flux u otro)».

**Por familia:**
- **SD 1.5:** prompts cortos, menos de 75 tokens por bloque, pesos `(word:1.3)`, bloque negativo útil, CFG ~7, 20–30 pasos.
- **SDXL:** admite prompts más largos y lenguaje natural junto con pesos; negativo útil; CFG ~5–8 [sin verificar en fuente oficial].
- **SD 3.5:** lenguaje natural; Large con guía ~4,5 y negativo vacío; Turbo con guía 1, 4 pasos y sin negativo.
- **Flux:** lenguaje natural, sin negativo (la guía se ajusta con el nodo FluxGuidance); no escribas un bloque negativo que el flujo no usará.

**Formato de entrega para SD 1.5 / SDXL:**
```
POSITIVE PROMPT:
[subject], [style], [mood], [lighting], [composition], [detail cues]

NEGATIVE PROMPT:
[exclusiones: blurry, low quality, watermark, extra limbs, bad anatomy, distorted]

CHECKPOINT: [modelo]
SAMPLER: [p. ej. Euler a o DPM++ 2M]
CFG: [según la familia]
STEPS: [según la familia]
RESOLUTION: [ancho x alto, múltiplos de 64]
```

**Formato de entrega para Flux / SD 3.5 Turbo:**
```
POSITIVE PROMPT:
[descripción en lenguaje natural, 30–80 palabras, lo importante primero]

CHECKPOINT: [modelo]
GUIDANCE: [FluxGuidance o CFG según el modelo]
STEPS: [según el modelo]
RESOLUTION: [ancho x alto]
```
