![](https://i.postimg.cc/kG03s7tk/prompt-banner.png)

<br/>

Una skill de Claude que escribe prompts listos para pegar en cualquier herramienta de IA: modelos de chat, agentes de código, generadores de imagen, video, voz y música, automatizaciones y prompts permanentes (system prompts, GPTs, CLAUDE.md, AGENTS.md). El objetivo es que el prompt funcione a la primera, sin tener que corregirlo.

**Versión actual: 2.0.0** · Perfiles de herramientas revisados el 2026-11-22.

---

## 🚀 Instalación

### Recomendado — Claude.ai (navegador)

1. Descarga este repositorio como ZIP.
2. Ve a **claude.ai → barra lateral → Personalizar → Skills → Subir una skill**.

### O clonar en la carpeta de skills de Claude Code

```bash
mkdir -p ~/.claude/skills
git clone https://github.com/4rl3kiing/prompt-master.git ~/.claude/skills/prompt-master
```

---

## 🔥 El problema que resuelve

> Prompt vago → salida equivocada → corregir → algo mejor → corregir otra vez → por fin, al cuarto intento.

Cada vuelta cuesta tiempo y créditos. Prompt Master no hace los prompts más largos, sino más precisos: cada frase debe cambiar el resultado.

---

## 🎯 Uso

Pídelo con naturalidad, aunque no digas «prompt»:

```
Qué le escribo a Cursor para que refactorice mi módulo de auth
```
```
Necesito un prompt para Claude Code que agregue paginación a /api/products
```
```
Arregla este prompt que uso con ChatGPT: [pega el prompt]
```
```
Prompt de Midjourney: ciudad cyberpunk de noche
```
```
Escríbeme las instrucciones para un GPT personalizado de atención al cliente
```
```
Hazme el CLAUDE.md para mi repo de Rust
```
```
Hazlo más corto (después de una entrega)
```

O invócala directamente con `/prompt-master`.

---

## Cómo funciona

1. **Detecta la herramienta destino** y carga solo su perfil. Si la tarea es clara pero no dices herramienta, entrega un prompt universal.
2. **Extrae 9 dimensiones:** tarea, herramienta, formato de salida, restricciones, entrada, contexto, público, criterio de éxito y ejemplos.
3. **Pregunta o supone:** pregunta (máximo 3) solo cuando un supuesto equivocado arruinaría el prompt; lo demás lo deja en `[CAMPOS]` y lo declara en una línea de supuestos.
4. **Elige una de 13 plantillas** sin mostrarte su nombre.
5. **Revisa 40 patrones de fallo** y los corrige en silencio.
6. **Verifica la vigencia:** cada perfil tiene fecha de revisión; si tiene más de 60 días o pides «el último modelo», confirma en la documentación oficial.
7. **Recorta** lo que no cambia el resultado y hace una **prueba de lectura** (una sola interpretación, campos explicados, terminado comprobable).
8. **Entrega** un bloque listo para pegar y una línea `🎯 Destino · 💡 qué optimizó`. Si el prompt va a producción, ofrece 3 entradas de prueba.

Después de entregar, el **modo ajuste** cambia solo lo que pidas («más corto», «no funcionó, me dio X») y te dice qué cambió.

---

## Idioma

La respuesta y el prompt salen en tu idioma, con las etiquetas del prompt también en tu idioma. Excepción: los prompts de imagen, video, 3D y música van en inglés, porque esos modelos lo siguen mejor.

---

## Ejemplo: imagen

**Entrada**
```
Prompt de midjourney de un samurái realista bajo la lluvia de noche
```

**Prompt generado**
```
lone samurai standing in heavy rain at night, traditional armor,
neon reflections on wet cobblestone street, cinematic lighting,
dramatic shadows, fog, photorealistic, shallow depth of field
--ar 16:9 --raw --no blurry, watermark, cartoon, extra limbs
```
**🎯 Destino:** Midjourney · **💡** Descriptores separados por comas con luz y ambiente al principio, proporción fijada y exclusiones con `--no`; en inglés porque Midjourney lo sigue mejor.

---

## Ejemplo: código

**Entrada**
```
Prompt para Claude Code: agregar paginación (page, limit) al endpoint
GET /api/products en src/routes/products.ts, con Express y Prisma
```

**Prompt generado**
```
## Objetivo
Agregar paginación con los parámetros `page` y `limit` a GET /api/products.

## Contexto
API en Express con Prisma. El endpoint está en src/routes/products.ts y hoy devuelve todos los productos.

## Estado final
- GET /api/products?page=2&limit=20 devuelve los productos 21–40.
- La respuesta incluye `data`, `page`, `limit` y `total`.
- Sin parámetros, usa page=1 y limit=20; limit máximo 100.

## Alcance
- Trabaja solo en: src/routes/products.ts y sus pruebas.
- No toques: el esquema de Prisma, otros endpoints, .env ni la configuración.

## Criterios de aceptación
- [ ] Valores no numéricos o negativos devuelven 400 con un mensaje claro.
- [ ] Las pruebas existentes siguen pasando y hay pruebas nuevas para la paginación.

## Límites de acción
Adelante con ediciones y pruebas dentro del alcance. Detente y pregunta antes de cambiar el esquema de la base de datos o añadir dependencias.
```
**🎯 Destino:** Claude Code · **💡** Estado final verificable y alcance cerrado a un archivo, para que no toque el esquema ni otros endpoints.

> Este prompt es para una herramienta agéntica con acceso real al sistema. Revisa los límites de alcance, las acciones prohibidas y las condiciones de parada antes de pegarlo.

---

## 🤝 Herramientas con perfil propio

| Categoría | Herramientas |
|-----------|--------------|
| Modelos de chat | Claude (Fable, Opus, Sonnet, Haiku), OpenAI GPT-6.x, Grok, Gemini 4, DeepSeek, Qwen, Mistral, MiniMax, modelos locales con Ollama, modos de investigación profunda |
| Agentes de código | Claude Code, Codex, Cursor, Devin Desktop (antes Windsurf), Devin, Cline, GitHub Copilot, Google Antigravity |
| Generadores de apps | Bolt, v0, Lovable, Figma Make, Google Stitch |
| Investigación y navegador | Perplexity, Manus, agentes de navegador y uso de computadora |
| Imagen | Midjourney, GPT Image, Nano Banana, Flux, Stable Diffusion, Ideogram, Seedream, ComfyUI |
| Video | Veo, Runway, Kling, Luma, LTX, Sora (en retiro), video de Midjourney |
| 3D | Meshy, Tripo, Rodin, Unity AI Assistant, Blender |
| Voz y música | ElevenLabs, Suno, Udio |
| Automatización | Zapier, Make, n8n |
| Prompts permanentes | System prompts de API, GPTs, Proyectos, Gems, CLAUDE.md, AGENTS.md, reglas de Cursor, Devin y Copilot |

Para cualquier herramienta sin perfil, usa la categoría más cercana y te lo dice.

---

## 📐 13 plantillas (selección automática)

| Plantilla | Para |
|-----------|------|
| A — Directa | Tareas simples de un paso |
| B — Brief de escritura | Documentos, negocio, marketing, creatividad |
| C — Razonamiento auditable | Lógica, matemáticas, análisis, depuración |
| D — Ejemplos | Formato consistente |
| E — Alcance de archivo | Cursor, Copilot y edición de código acotada |
| F — Agente autónomo | Devin, Manus, agentes de navegador |
| G — Descriptor visual | Generación de imagen y video |
| H — Edición con referencia | Modificar una imagen existente |
| I — ComfyUI | Flujos por nodos, según la familia del modelo |
| J — Decompilador | Desglosar, adaptar, simplificar o dividir prompts |
| K — Brief para Claude | Tareas complejas o agénticas en Claude y Claude Code |
| L — Brief para OpenAI | Tareas complejas en ChatGPT, Codex o la API |
| M — Prompt permanente | System prompts, GPTs, Proyectos, CLAUDE.md, AGENTS.md, reglas |

---

## 🛡️ Técnicas seguras

Solo usa técnicas con efecto fiable: rol (cuando cambia el resultado), ejemplos, etiquetas XML, anclas contra la invención y razonamiento auditable. Excluye las que aumentan la invención de datos en un solo prompt (árbol o grafo de pensamiento, autoconsistencia simulada, cadenas largas). Nunca pide la cadena de pensamiento oculta.

---

## 🚫 40 patrones de fallo

La tabla completa está en [references/patterns.md](references/patterns.md).

| Categoría | # | Ejemplos |
|-----------|---|----------|
| Tarea | 1–7 | verbo vago, tareas sin relación, sin criterio de éxito |
| Contexto | 8–13 | conocimiento previo supuesto, invitación a inventar, público indefinido |
| Formato | 14–19 | sin formato de salida, extensión implícita, adjetivos vagos |
| Alcance | 20–25 | sin límites, IA de IDE sin ruta, todo el código pegado |
| Razonamiento | 26–30 | sin contrato de auditoría, pedir razonamiento oculto |
| Agentes | 31–37 | sin estado inicial o final, sin revisión humana, contexto podrido |
| Tono y vigencia | 38–40 | énfasis en mayúsculas, versiones obsoletas, tarea puntual en un prompt permanente |

---

## 🧠 Bloque de memoria

Si la conversación tiene historial, antepone las decisiones previas para que la otra IA no las contradiga:

```
## Contexto previo
- Stack: React 18 + TypeScript + Supabase
- La autenticación usa JWT en cookies httpOnly, no localStorage
- Componentes en PascalCase, sin exportaciones por defecto
- Solo Tailwind, sin archivos CSS propios
```

---

## 🗂️ Estructura del repositorio

```
prompt-master/
├── SKILL.md                  # Núcleo: reglas, idioma, flujo, enrutamiento, diagnóstico, verificación
├── CHANGELOG.md              # Historial de versiones
├── references/
│   ├── models.md             # Modelos de lenguaje
│   ├── agents.md             # Agentes de código, IDEs, generadores, navegador
│   ├── media.md              # Imagen, 3D, video, voz, música, automatización
│   ├── templates.md          # Índice de plantillas A–M
│   ├── templates/            # writing (A–D), code-agents (E–F), visual (G–I), decompiler (J), task-briefs (K–L), persistent (M)
│   └── patterns.md           # 40 patrones de fallo
├── evals/
│   ├── cases.md              # Casos de comportamiento legibles
│   ├── cases.json            # Comprobaciones automáticas
│   ├── benchmark.md          # Comparación v2.0.0 frente a v1.10.1
│   └── outputs/              # Salidas de referencia de la versión actual
├── scripts/
│   ├── check.sh              # Consistencia: versiones, enlaces, conteos, tono, fechas de revisión
│   └── run_evals.py          # Comprueba las salidas contra evals/cases.json
└── .github/workflows/check.yml   # Ejecuta check.sh en cada push y pull request
```

Al activarse solo se carga `SKILL.md`; los perfiles y plantillas se leen bajo demanda, uno por petición. Ejecuta `bash scripts/check.sh` después de cada cambio.

---

## ℹ️ Historial

Ver [CHANGELOG.md](CHANGELOG.md). Versión actual: **2.0.0**.

## 📄 Licencia

MIT: ver [LICENSE](LICENSE).

## 🙏 Créditos

Fork de [nidhinjs/prompt-master](https://github.com/nidhinjs/prompt-master) de Nidhin Joseph Nelson (MIT). El aviso de copyright original se conserva en [LICENSE](LICENSE).

## ⭐ Historial de estrellas del original

[![Star History Chart](https://star-history.dera.page/svg?repos=nidhinjs/prompt-master&type=Date)](https://star-history.dera.page/#nidhinjs/prompt-master&Date)
