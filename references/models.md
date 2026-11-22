# Perfiles de modelos de lenguaje

*Lee este archivo cuando el destino sea un LLM. Aplica antes la Puerta de recencia de SKILL.md.*

> **Última revisión: 2026-11-22.** Verificado contra la documentación oficial de cada proveedor en esa fecha. Lo marcado [sin verificar] no se pudo confirmar en una fuente oficial. Los nombres y versiones cambian cada pocos meses: si esta fecha tiene más de 60 días, confirma el modelo antes de citar un identificador.

## Reglas comunes a todos los modelos actuales

- **Tono:** instrucciones directas en positivo («escribe en párrafos») y con su razón. Anthropic advierte de forma explícita que el lenguaje agresivo («CRITICAL», «MUST») hace que los modelos actuales sobreactúen; el énfasis fuerte, solo para límites duros.
- **Razonamiento:** los modelos actuales razonan por dentro y su profundidad se controla con un ajuste de esfuerzo o de nivel de pensamiento en la API o la interfaz, no con «piensa paso a paso». Nunca pidas la cadena de pensamiento; pide conclusión, evidencia y comprobaciones.
- **Parámetros de muestreo:** GPT-6.2 y Gemini 4 ya no aceptan o ignoran `temperature`/`top_p`. No los recomiendes salvo que el perfil del modelo diga que sí.
- **Ajustes fuera del prompt:** el modelo elegido, el esfuerzo y los parámetros de API van en la nota de preparación, nunca dentro del bloque copiable: el texto del prompt no cambia esos ajustes.

---

## Claude (claude.ai, API, Claude Code)

**Modelos vigentes** (API, todos con 1M de contexto, 128K de salida y pensamiento adaptativo):
- `claude-fable-5-2` — el más capaz, para trabajo agéntico largo y difícil. Esfuerzo por defecto: alto.
- `claude-opus-5-5` — punto de partida recomendado para código agéntico complejo y trabajo empresarial. Esfuerzo por defecto: medio.
- `claude-sonnet-5-5` — velocidad con inteligencia de frontera. Esfuerzo por defecto: alto.
- `claude-haiku-5-5` — rápido y económico. Esfuerzo por defecto: medio.

Pregunta qué modelo usa solo si la diferencia cambia el prompt.

**Cómo escribirle:**
- Claro y directo: resultado deseado, restricciones y alcance explícitos; explica el porqué cuando guía su criterio.
- Etiquetas XML descriptivas y consistentes (`<contexto>`, `<tarea>`, `<restricciones>`, `<formato_salida>`, `<ejemplos>`) en prompts complejos o con material mezclado.
- Documentos largos arriba, envueltos en etiquetas con sus metadatos, y la pregunta al final: mejora notablemente la calidad.
- Instrucciones generales mejor que pasos prescritos: estos modelos planifican bien solos.
- Esfuerzo: es la palanca principal de coste y latencia; en Fable baja el esfuerzo en vez de pedirle que no piense. En Opus el esfuerzo no controla la longitud: pide concisión explícitamente si la quieres.
- API: pensamiento `adaptive` con `output_config.effort`. `budget_tokens` devuelve error en Claude 4.7 y posteriores; no lo recomiendes.
- Para tareas complejas o agénticas, plantilla K.

**Por modelo:**
- *Fable 5.2:* especificación completa orientada al resultado, límites de acción explícitos y verificación por intervalos en trabajos largos. Cada afirmación de progreso, respaldada por resultados reales de herramientas.
- *Opus 5.5:* alcance estrecho («entrega lo pedido, sin funciones, refactorizaciones ni abstracciones extra»). Ya se autoverifica bien: evita «revisa todo dos veces» y subagentes verificadores en trabajo rutinario.
- *Sonnet 5.5:* sigue las instrucciones al pie de la letra, sobre todo con esfuerzo bajo; di cuándo una regla aplica a cada elemento o sección.
- *Haiku 5.5:* tareas acotadas y repetibles con contrato de salida explícito.

**Modos de investigación:** «Research» en claude.ai hace búsquedas en varios pasos y entrega un informe con citas; el prompt debe decir la pregunta, el alcance, las fuentes preferidas o excluidas y el formato del informe.

---

## OpenAI (ChatGPT, Codex, API)

Identifica la superficie (ChatGPT, Codex o API) y respeta el modelo que el usuario eligió.

**Modelos vigentes** (1,05M de contexto, hasta 128K de salida):
- `gpt-6.2-astra` — el más capaz: razonamiento exigente, investigación, código y documentos (desde 2026-11-17).
- `gpt-6.2-sol` — insignia para código, uso de computadora y trabajo profesional; el predeterminado en Codex.
- `gpt-6.1-terra` — equilibrado para el día a día.
- `gpt-6-luna` — rápido y económico para tareas acotadas y de alto volumen.
- La familia GPT-5.6 y GPT-6.1 Sol siguen disponibles pero ya no son las actuales; o3, o4-mini y o3-mini están retirados o en retiro (o3 se apaga el 2026-12-11). Si el usuario nombra uno de ellos, avisa en la nota y sugiere su reemplazo.

**Cómo escribirle (guía oficial de GPT-6.2):**
- Resultado primero: di la meta y qué decisiones necesitan al usuario. Que asuma supuestos razonables y reversibles y siga; que pregunte solo ante cambios de alcance, bloqueos reales o acciones irreversibles.
- Estos modelos ya son concisos: revisa si hace falta pedir brevedad.
- Pide verificación antes de terminar y una respuesta final autosuficiente.
- En código, describe las convenciones del proyecto (reutilizar lógica, cuándo añadir pruebas); en frontend, especifica imágenes y tipografía.
- Plantilla L para tareas complejas; omite secciones irrelevantes.

**Ajustes de API (en la nota, no en el prompt):**
- `reasoning.effort`: `none`, `minimal`, `low`, `medium`, `high`, `xhigh`, `max`, según el modelo. GPT-6.2 Astra y Sol no aceptan `none`. Empieza en `medium` para integraciones nuevas. `reasoning.mode: "pro"` existe para GPT-5.6 y GPT-6, solo si la calidad medida justifica el coste.
- GPT-6.2: quita `temperature`, `top_p` y `top_logprobs`; usa la API Responses para herramientas; pon las instrucciones estables en un mensaje `developer` inicial para aprovechar la caché.
- Controles de ChatGPT o Codex (Pro, Max…) son de la interfaz; no los traduzcas a parámetros de API.

**ChatGPT:** proyectos, GPTs personalizados e investigación profunda existen, pero sus límites actuales están [sin verificar]. Para instrucciones de GPTs o proyectos usa la plantilla M.

---

## Grok (xAI)

- Vigentes: `grok-4.7` (el más reciente en la API) y `grok-4.6`, ambos con 500K de contexto. Esfuerzo `low`, `medium`, `high` (por defecto) y `xhigh`. El razonamiento no se puede desactivar.
- Tarea orientada al resultado: Meta, Contexto/Entrada, Restricciones, Herramientas/Permisos y Hecho.
- Para hechos actuales, exige Web Search o X Search y citas: sin búsqueda, el modelo no tiene conocimiento en tiempo real.
- En bucles de agente largos: condiciones de parada, límites de aprobación, límite de reintentos y puntos de compactación.
- Lo estable va primero para aprovechar la caché; en la nota, sugiere `prompt_cache_key` (Responses) o `x-grok-conv-id` (Chat Completions). Penalizaciones y `stop` dan error en modelos de razonamiento.
- En grok.com o X el usuario no controla parámetros: pon solo requisitos de conducta en el prompt.

---

## Gemini (Google)

- Familia Gemini 4: Carbon (trabajo más difícil y de largo aliento), Neon (`gemini-4-neon`, desde 2026-11-18, entre Carbon e Hydrogen), Argon (`gemini-4-argon`, estable, razonamiento) e Hydrogen (rápido). Cuál es «el insignia» hoy está [sin verificar]: si importa, pregunta qué modelo usa. Todos con ~1M de contexto. También siguen Gemini 3.x Flash y Flash-Lite.
- Nivel de pensamiento con `thinking_level`: Argon acepta `low`, `medium` (por defecto) y `high`, sin `minimal`; Neon admite también `xhigh`. No escribas pasos de razonamiento en el prompt: ajusta el nivel.
- Gemini 4 y 3.6+ ignoran `temperature`, `top_p` y `top_k`.
- Guía oficial: pocos ejemplos en casi todos los prompts para fijar el formato; delimitadores claros (XML o Markdown, uno solo); contexto primero y la pregunta al final, con un puente como «Con base en la información anterior…»; persona, restricciones y formato en la instrucción de sistema.
- Responde escueto por defecto: pide más detalle si lo necesitas.
- En agentes: planificación, manejo de errores, lecturas de bajo riesgo frente a escrituras de alto riesgo y cuándo pedir permiso.
- Para citas o hechos: «Cita solo fuentes de las que estés seguro; si dudas, escribe [incierto]» y, con contexto dado, «Básate solo en el contexto proporcionado».
- **Deep Research** (app de Gemini): permite editar el plan antes de empezar y añadir Gmail, Drive, archivos o cuadernos de NotebookLM; el prompt debe fijar pregunta, alcance y formato del informe. Los detalles actuales de NotebookLM están [sin verificar].

---

## Modelos abiertos y otros

- **DeepSeek:** vigentes `deepseek-v4-pro` (esfuerzo de pensamiento `low`, `high`, `max`) y `deepseek-flash` (V4.1-Flash). R1 ya no es actual. Instrucciones cortas con la meta y el formato; sin pedir razonamiento paso a paso. Si muestra pensamiento entre etiquetas `<think>` y no se quiere, añade «Entrega solo la respuesta final».
- **Qwen:** el más reciente es Qwen4-Max (2026-11-16), por API; los Qwen4 abiertos más pequeños están anunciados [identificador sin verificar]. Buen seguimiento de instrucciones y JSON: rol claro en el sistema y esquemas de salida explícitos. En modo con pensamiento, trátalo como modelo de razonamiento (instrucciones cortas, sin andamiaje).
- **Mistral:** vigentes Large 4 y Small 4; Codestral para código. Medium 3.5, Magistral y Devstral están en retiro.
- **Meta:** su modelo actual, Muse Spark, es cerrado; no hay Llama nuevo confirmado. Para Llama 4 u otros abiertos locales: prompts más cortos, estructura plana, más explícitos que con Claude o GPT y rol en el sistema.
- **MiniMax:** M3 (2026-06-01, 1M de contexto, multimodal) y M3.1 Flash (2026-10-19, más rápido); M2.7 es la generación anterior. API compatible con OpenAI: los prompts de GPT se transfieren. La temperatura debe estar entre 0 y 1. Puede mostrar etiquetas `<think>`: añade «Entrega solo la respuesta final, sin etiquetas de razonamiento» si no se quieren.
- **Ollama (local):** pregunta siempre qué modelo corre, porque cada uno se comporta distinto. El prompt de sistema es la palanca principal: inclúyelo para que lo ponga en su Modelfile. Prompts cortos y planos. Temperatura 0,1 para código y 0,7–0,8 para creatividad, salvo que el modelo indique otra cosa.
