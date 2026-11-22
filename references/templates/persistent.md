# Prompts permanentes (M)

*System prompts de apps y API, instrucciones de GPTs personalizados, de Proyectos de Claude o ChatGPT, de Gems de Gemini, CLAUDE.md, AGENTS.md, reglas de Cursor, instrucciones de Copilot. Última revisión: 2026-11-22.*

---

## En qué se diferencian de un prompt de una vez

- **Se leen en cada mensaje.** Cada línea se paga en todas las conversaciones y compite por atención con la petición real. Sé breve: lo que no aplica a casi todas las peticiones no va aquí.
- **No conocen la tarea de hoy.** Fuera detalles de una tarea puntual («arregla el login»); dentro, lo estable: quién es el asistente, para quién trabaja, cómo debe comportarse y qué no debe hacer.
- **Chocan consigo mismos.** Con muchas reglas, dos acabarán en conflicto. Declara qué gana (p. ej. «la seguridad del usuario va antes que la brevedad»).
- **Reciben peticiones inesperadas.** Di qué hacer fuera de alcance: rechazar con amabilidad, derivar o pedir aclaración.
- **Se mantienen.** Agrupa por secciones con títulos claros para que el dueño pueda editarlas sin romper nada.

---

## Template M — Prompt permanente

```
# [Nombre del asistente o del proyecto]

## Propósito
[Para quién trabaja y qué resultado le da, en 1–2 frases]

## Contexto estable
[Producto, dominio, stack, público, glosario mínimo: solo lo que aplica a casi todas las peticiones]

## Cómo trabajar
- [Conducta por defecto 1, con su razón si la razón guía el criterio]
- [Conducta por defecto 2]

## Formato de respuesta
[Extensión, estructura, idioma y tono por defecto]

## Límites
- [Qué no hacer nunca, con la razón]
- Fuera de alcance: [cómo responder a peticiones que no le corresponden]

## Prioridades si dos reglas chocan
1. [la que gana]
2. [la siguiente]
```

---

## Notas por destino

- **System prompt de API o app:** va en el campo de sistema, no en el mensaje del usuario. Separa con etiquetas XML (`<contexto>`, `<reglas>`) los bloques largos o variables. Si la app inserta datos dinámicos, marca con `{{variable}}` dónde entran y di qué hacer si llegan vacíos.
- **GPTs personalizados (ChatGPT):** las instrucciones van en «Configure → Instructions»; los documentos largos, como archivos de conocimiento, y las instrucciones dicen cuándo consultarlos. Añade cómo responder si alguien pide ver las instrucciones.
- **Proyectos de Claude o ChatGPT y Gems de Gemini:** las instrucciones del proyecto aplican a todos sus chats; los documentos van como archivos del proyecto. Úsalas para tono, formato y contexto del proyecto, no para tareas.
- **CLAUDE.md (Claude Code):** en la raíz del repo (o `.claude/CLAUDE.md`); reglas por ruta en `.claude/rules/*.md` con `paths:`. Comandos exactos de build, test y lint; convenciones del código; rutas que no se tocan; cómo verificar un cambio. Menos de ~200 líneas: Claude Code lo carga en cada sesión.
- **AGENTS.md:** formato abierto que leen muchos agentes de código (Codex, Cursor, Copilot, Devin Desktop, Cline, entre otros); gana el archivo más cercano a la carpeta de trabajo. Claude Code no lo lee por sí solo: si el proyecto usa varios agentes, propón un AGENTS.md y un CLAUDE.md que lo importe con la línea `@AGENTS.md`.
- **Reglas de Cursor:** archivos `.cursor/rules/*.mdc` (un `.md` simple se ignora) con metadatos `description`, `globs` y `alwaysApply`, que definen si aplican siempre, por patrón de archivos, cuando el agente lo juzgue o a mano. Una regla por tema y menos de 500 líneas.
- **Devin Desktop (antes Windsurf):** `.devin/rules/*.md` con su disparador (siempre, por patrón, a juicio del modelo o manual); todavía lee `.windsurf/rules/`.
- **Copilot:** `.github/copilot-instructions.md` para todo el repo; instrucciones por ruta en `.github/instructions/*.instructions.md` con su patrón `applyTo`.

Entrega un bloque por archivo, con la ruta como título, y en la nota di dónde va cada uno. Si no estás seguro del formato exacto que acepta la versión actual de la herramienta, dilo en la nota en lugar de inventarlo.
