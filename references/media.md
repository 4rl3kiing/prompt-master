# Perfiles de imagen, 3D, video, voz, música y automatización

*Lee este archivo cuando el destino sea un generador de medios o una automatización. Los prompts de imagen, video, 3D y música van en inglés (regla de idioma de SKILL.md); las notas, en el idioma del usuario.*

> **Última revisión: 2026-11-22.** Verificado contra documentación oficial en esa fecha; lo marcado [sin verificar] no se confirmó en una fuente oficial. Estos productos cambian de versión cada pocos meses: si la fecha tiene más de 60 días, confirma versión y parámetros antes de fijarlos en el prompt.

**Primero detecta:** ¿generar desde cero o editar una imagen existente? Para editar, plantilla H; para ComfyUI, plantilla I; para el resto, plantilla G.

**Exclusiones:** cada herramienta las maneja distinto. Midjourney usa `--no`; SD 1.5/SDXL aceptan un bloque negativo; Flux, GPT Image, Nano Banana y Veo no tienen prompt negativo, así que lo que no quieres se describe en positivo («sharp focus» en vez de «not blurry»). Poner un negativo donde no se lee es texto inútil.

---

## Imagen — generación

- **Midjourney:** el modelo por defecto es V7; V8.1 es el más reciente y se elige a mano. Descriptores separados por comas, no prosa: sujeto primero, luego estilo, ambiente, iluminación y composición. Parámetros al final: `--ar 16:9`, `--stylize`/`--s`, `--chaos`, `--raw` (estilo crudo), `--no [elementos]`, `--sref [URL]` para estilo, `--draft` (V7, mitad de coste). En V8.1: `--hd`/`--sd`. No añadas `--v` salvo que el usuario quiera una versión distinta de la predeterminada. [rangos exactos de `--s`/`--chaos` en V7 y V8.1 sin verificar]
- **GPT Image (OpenAI, ChatGPT y API):** reemplazó a DALL·E, que ya no existe en la API (cerrado el 2026-05-12). Acepta prosa detallada y edición conversando. El texto literal que debe aparecer en la imagen va entre comillas; aun así la colocación precisa de texto puede fallar, así que mantenlo corto. Variantes de la familia: una para precisión de edición y otra rápida para el día a día [identificadores exactos sin verificar: confírmalos antes de citarlos].
- **Nano Banana (Gemini, Google):** la familia de imagen de Gemini (varias versiones, de la original a Nano Banana Pro y 2.x); Imagen está retirado. Descripciones de escena en lenguaje natural y con detalle. Admite hasta 14 imágenes de referencia; la forma recomendada de editar es en varios turnos de conversación. Salidas 1K, 2K o 4K.
- **Flux (Black Forest Labs):** familia FLUX.2 ([max], [pro], [flex], [klein], [dev]) y FLUX.1 Kontext para edición; FLUX 3 anunciado [disponibilidad sin verificar]. Sin prompt negativo: todo en positivo. Estructura Sujeto + Acción + Estilo + Contexto; las primeras palabras pesan más; 30–80 palabras suele ser lo ideal. Colores HEX ligados a un objeto («a car in hex #1A73E8 color»). Con varias referencias, di el papel de cada una («subject from image 1, style from image 2»). Solo FLUX.2 [flex] expone guía (~4,5) y pasos.
- **Stable Diffusion:** SD 1.5/SDXL usan sintaxis `(word:1.3)` y bloque negativo opcional pero útil; CFG 7–12 es razonable solo en esas generaciones [sin verificar en fuente oficial]. SD 3.5 Large: lenguaje natural, orden estilo > sujeto/acción > composición > luz/color > técnica, guía ~4,5, 28–40 pasos y negativo vacío; SD 3.5 Turbo: guía 1, 4 pasos y sin negativo. Texto literal entre comillas dobles.
- **Ideogram:** la versión 4.0 (2026-06-03) destaca en texto dentro de imagen y en varios idiomas, y permite control de composición por recuadros. Pon el texto literal entre comillas. [uso de negativo y JSON sin verificar]
- **Seedream (ByteDance):** 5.0 Pro (2026-07-08) y 4.5. Nombra cada imagen de entrada por número («Image 1») con su papel y di qué debe quedar igual; composición y jerarquía primero, luego detalles; edita por etapas en vez de sobrecargar un prompt. Especifica el estilo artístico al principio.

## Imagen — edición con referencia

Se detecta cuando el usuario quiere cambiar, editar o ajustar algo de una imagen existente o sube una referencia. Indica que adjunte la imagen en la herramienta antes de pegar el prompt y construye el prompt solo sobre el cambio: qué cambia y qué se queda igual. Lee la plantilla H en `references/templates/visual.md`.

## ComfyUI

Es un flujo por nodos, no una caja de texto. Pregunta qué modelo (checkpoint) está cargado antes de escribir: cambia todo. Para SD 1.5/SDXL, bloques POSITIVO y NEGATIVO separados; para Flux y SD 3.5 Turbo, solo positivo (la guía de Flux se ajusta con el nodo FluxGuidance). Lee la plantilla I en `references/templates/visual.md`.

---

## 3D

- **Texto a 3D (Meshy, Tripo, Rodin):** palabra de estilo (low-poly / realista / caricatura estilizada) + sujeto + rasgos clave + material principal + detalle de textura + especificación técnica. Un solo objeto, pose neutra. Si admite negativo: «no background, no base, no floating parts». Indica el uso de exportación: motor de juego (GLB/FBX), impresión 3D (STL/3MF) o web (GLB). Personajes que se van a riggear: pose A o T. De imagen a 3D, una referencia limpia rinde más que el texto. [versiones actuales: Meshy 7, Tripo 3.x, Rodin Gen-2.5, sin verificar en fuente oficial]
- **Unity:** su herramienta es Unity AI Assistant, con modo Ask (solo lectura: dudas de documentación y del proyecto) y modo Agent (actúa en el Editor y pide aprobación). No uses comandos con barra antiguos. Sé preciso sobre lo que debe pasar en el Editor; para generar sprites, texturas o animaciones, di tipo de recurso, estilo, resolución, paleta y si la animación es en bucle.
- **Blender:** las herramientas de IA generan Python que se ejecuta en Blender (también vía su servidor MCP oficial en Blender 5.1+). Especifica geometría, nombres de materiales, contexto de la escena y si aplica al objeto seleccionado o a toda la escena. Avisa en la nota: el código generado se ejecuta sin protección, conviene probarlo en una copia.

---

## Video

El audio nativo ya es habitual (Veo, Kling 3.0, LTX-2.3): si la herramienta lo genera, describe diálogo, efectos y ambiente; si no, no lo menciones.

- **Veo (Google):** Veo 3.1 genera audio siempre; clips de 4, 6 u 8 s; hasta 3 imágenes de referencia; primer y último fotograma. Diálogo entre comillas con quién habla y cómo («"This must be the key," he murmured»); efectos y sonido ambiente descritos de forma explícita. Sin prompt negativo: describe en positivo. En la API de Gemini, Google dirige a su nuevo modelo Gemini Omni Flash [detalles sin verificar].
- **Sora (OpenAI):** OpenAI anunció en marzo de 2026 que retira la app y la API de Sora [fechas sin verificar]. Si el usuario lo pide, avisa en la nota y sugiere alternativa; el estilo de prompt es el mismo: describir como si dirigieras una toma.
- **Runway:** Gen-4.5 es la versión vigente. Lenguaje cinematográfico: movimiento de cámara, una sola toma continua, iluminación y estilo.
- **Kling:** 3.0 (febrero de 2026), con audio nativo, hasta 15 s y 2K/4K. Fuerte en movimiento humano realista: describe el movimiento del cuerpo, el ángulo y el tipo de plano.
- **Luma (Dream Machine):** Ray3.2, hasta 20 s en 1080p y hasta 16 fotogramas clave. Referencias de iluminación, lentes y gradación de color.
- **LTX:** LTX-2.3, pesos abiertos, audio y video conjuntos. Descripciones concisas y visuales; resolución e intensidad de movimiento explícitas.
- **Midjourney video:** parte de una imagen; `--motion low` (por defecto) o `high`; clips de 5 s ampliables hasta 21 s.

Para cualquier video: el movimiento de cámara cambia el resultado más que cualquier adjetivo (fija, travelling, grúa, cámara en mano); añade duración y tipo de toma.

---

## Voz y música

- **ElevenLabs:** modelos Eleven v4 y v4 Turbo (2026-09-28), y v3. Usan etiquetas de audio entre corchetes antes de la frase que afectan: `[whispers]`, `[sighs]`, `[laughs]`, `[sarcastic]`, `[strong Mexican accent]`; funcionan mejor describiendo la cualidad de la voz. No admiten etiquetas SSML de pausa: usa puntos suspensivos y la estructura del texto. `<break time="1.5s" />` solo sirve en modelos anteriores. El texto a locutar va en su idioma; las etiquetas, en inglés.
- **Suno:** v5.5 (2026-03-26). Prompt de estilo en inglés (género, época, instrumentos, voz, tempo); la letra en el idioma de la canción, con secciones entre corchetes (`[Verse]`, `[Chorus]`) [sintaxis exacta sin verificar en fuente oficial].
- **Udio:** tras su acuerdo con Universal migra a una plataforma cerrada con licencia y sin descargas; avisa en la nota que puede no servir para flujos de trabajo abiertos.

---

## Automatización

- **Zapier:** «AI by Zapier» (antes Zapier Agents) es un paso de IA dentro de cualquier Zap, con instrucciones (el prompt), herramientas y aprobación por herramienta. Para Zaps clásicos: app y evento disparador → app de acción + acción + mapeo de campos, paso a paso.
- **Make:** «AI Agents (New)»: proveedor del modelo, instrucciones, conocimiento, entrada y herramientas (módulos, escenarios, MCP, otros agentes).
- **n8n:** nodo AI Agent (siempre de tipo Tools Agent), con un submodelo de chat y al menos una herramienta conectada; el prompt de sistema define cuándo usar cada herramienta.
- En todas: indica que las cuentas ya están conectadas («supone que [APP] ya está autenticada»), numera los pasos y di qué datos pasan de uno a otro.
