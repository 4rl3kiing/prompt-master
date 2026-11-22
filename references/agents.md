# Perfiles de agentes, IDEs, generadores y orquestadores

*Lee este archivo cuando el destino ejecute acciones o edite archivos. Para el modelo que usa cada agente, aplica también el perfil de `references/models.md` si su comportamiento importa.*

> **Última revisión: 2026-11-22.** Verificado contra la documentación oficial en esa fecha; lo marcado [sin verificar] no se confirmó en una fuente oficial. Para archivos de instrucciones permanentes (CLAUDE.md, AGENTS.md, reglas) usa la plantilla M.

## Reglas comunes

Todo agente con acceso real necesita: estado inicial, estado final, acciones permitidas y prohibidas, condiciones de parada y evidencia de verificación. Las condiciones de parada evitan bucles que queman créditos; la verificación evita que «termine» sin comprobar. Deja que el agente ejecute pruebas y el servidor local: prohibirlo lo obliga a entregar sin verificar.

---

**Claude Code**
- Usa la plantilla K. Pon primero la intención, las rutas relevantes, las restricciones, los criterios de aceptación y los comandos de verificación; pide uso de herramientas explícitamente cuando haga falta inspeccionar.
- No supongas el modelo: aplica la ruta de Claude vigente en `models.md`; pregunta cuál usa solo si importa.
- Fable y Opus pueden ampliar el alcance y delegar con facilidad: añade «Haz solo los cambios pedidos» y reserva los subagentes para líneas de trabajo independientes y grandes.
- No fuerces un verificador separado en Opus 5.5 para trabajo rutinario; pide pruebas concretas y evidencia de herramientas. En ejecuciones largas de Fable, exige que cada progreso cite resultados reales.
- Ancla siempre a archivos y carpetas concretos.
- Revisión humana: «Detente y pregunta antes de borrar archivos, añadir dependencias o cambiar el esquema de la base de datos».
- Lee `CLAUDE.md` (y `.claude/rules/*.md` con `paths:`), no `AGENTS.md`: si el proyecto tiene AGENTS.md, CLAUDE.md debe importarlo con `@AGENTS.md`.

**Codex (CLI, app, nube)**
- Aplica la ruta de OpenAI de `models.md`; el predeterminado actual es GPT-6.2 Sol. No deduzcas el modelo por el nombre del producto. Plantilla L para tareas complejas.
- Estructura: Objetivo, Contexto, Alcance, Restricciones, Límites de aprobación y Hecho cuando, con comandos de verificación si se conocen.
- Empieza con el esfuerzo por defecto y ajústalo según resultados. Verifica los controles disponibles antes de recomendar etiquetas de la interfaz.
- Un agente principal responsable de la síntesis; cada subagente con un entregable acotado y concurrencia limitada.
- Lee `AGENTS.md`.

**Cursor**
- Archivo + función + comportamiento actual + cambio deseado + lista de «no tocar» + lenguaje y versión (plantilla E). Nunca una instrucción global sin ancla de archivo.
- «Hecho cuando:» es obligatorio: define cuándo deja de editar.
- Tareas complejas: prompts secuenciales en vez de uno grande.
- Reglas del proyecto en `.cursor/rules/*.mdc` con metadatos (`description`, `globs`, `alwaysApply`); también lee `AGENTS.md`.

**Devin Desktop (antes Windsurf) y Devin**
- Windsurf se llama Devin Desktop desde 2026-06-02 y su agente es Devin Local. Si el usuario dice «Windsurf», es esto.
- Mismo enfoque que Cursor para ediciones acotadas (plantilla E); para tareas autónomas en Devin (web, CLI, API), plantilla F con criterios de terminado explícitos y tareas verificables.
- Reglas en `.devin/rules/*.md` (todavía lee `.windsurf/rules/`) y `AGENTS.md`.

**Cline**
- Extensión agéntica de VS Code: edita, ejecuta terminal y usa navegador; el estilo de prompt sigue al modelo de debajo.
- Estado inicial + estado final + archivos permitidos y prohibidos + condiciones de parada + puertas de aprobación («Pregunta antes de ejecutar comandos o instalar dependencias»).
- Reglas en `.clinerules/` (también detecta `.cursorrules`, `.windsurfrules` y AGENTS.md).

**GitHub Copilot**
- *Autocompletado:* escribe la firma exacta, el docstring o el comentario justo antes; tipos de entrada y salida, casos límite y lo que no debe hacer.
- *Modo agente en el IDE:* como Cursor (plantilla E).
- *Agente en la nube* (se le asignan issues y trabaja en un entorno efímero): plantilla F, con el issue como objetivo y criterios de aceptación verificables.
- Instrucciones del repo en `.github/copilot-instructions.md`; por ruta en `.github/instructions/*.instructions.md` con `applyTo`; también lee AGENTS.md.

**Google Antigravity**
- IDE con agentes, multimodelo: por defecto Gemini 4 Neon, y también otros Gemini 4, Claude y GPT-OSS. Aplica el perfil del modelo elegido.
- Describe resultados, no pasos. Pide primero un artefacto (lista de tareas o plan) para revisarlo antes de ejecutar.
- Tiene navegador integrado: incluye verificación («Comprueba la interfaz a 375 px y 1440 px con el agente de navegador»).
- Fija la autonomía: «Pregunta antes de comandos destructivos». Un entregable por sesión.

**Generadores de apps: Bolt, v0, Lovable, Figma Make, Google Stitch**
- Tienden a generar código de más: acota el alcance.
- Especifica stack, versión, qué no generar y límites entre componentes; di qué debe quedar igual en cada iteración.
- Lovable: empieza en modo plan, da la dirección de diseño pronto, construye componente a componente con textos reales, y guarda palabras clave de estilo en las instrucciones del proyecto.
- Bolt: arquitectura y frameworks primero, luego una función por prompt; usa su «Knowledge» para lo permanente.
- v0 es nativo de Vercel/Next.js: dilo si necesitas otra salida. [modelos actuales sin verificar]
- Figma Make: referencia los nombres de componentes de Figma. Google Stitch: describe el objetivo de la interfaz, no la implementación.
- Añade «No agregues autenticación, modo oscuro ni funciones que no estén en la lista».

**Investigación y orquestación: Perplexity, Manus**
- Perplexity: especifica buscar, analizar o comparar; exige citas; reformula preguntas propensas a inventar como consultas con fuentes. [estado actual de su investigación profunda sin verificar]
- Manus (ahora de Meta) y otros orquestadores: describe el entregable final, no los pasos; ellos descomponen. Especifica el tipo de artefacto (informe, hoja de cálculo, código) y «Marca cualquier dato del que no estés seguro».
- En tareas largas, añade puntos de verificación: cada paso encadenado acumula riesgo de invención.

**Agentes de navegador y uso de computadora** (Perplexity Comet, ChatGPT agent, Claude in Chrome y similares)
- Controlan un navegador real: hacen clic, rellenan formularios y pueden completar transacciones.
- Describe el resultado, no la navegación: «Encuentra el vuelo más barato de X a Y en Emirates o KLM, máximo una escala».
- Límites de permiso: «No compres nada. Solo investiga».
- Parada antes de lo irreversible: «Pregúntame antes de enviar un formulario, completar una compra o mandar un mensaje».
- Plantilla F para tareas de varios pasos.
