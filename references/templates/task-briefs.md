# Briefs de tareas complejas (K–L)

*Brief para Claude (K) y Brief para OpenAI (L). Cárgalos junto con el perfil de `references/models.md` o `agents.md`.*

---

## Template K — Brief para Claude

*Para tareas complejas, de varios pasos o agénticas en los modelos Claude actuales: claude.ai, API o Claude Code. Pone primero el resultado, el contexto, el alcance y los límites de acción, sin andamiaje de razonamiento manual que estos modelos ya no necesitan.*

```
## Objetivo
[Qué construir, arreglar o producir, en una frase. Añade el porqué si cambia el enfoque.]

## Contexto
[Qué existe hoy: archivos relevantes, comportamiento actual, stack, qué se probó y falló]

## Estado final
[Cómo se ve terminado: archivos cambiados, comportamiento producido, pruebas que pasan. Binario si se puede.]

## Alcance
- Trabaja solo en: [archivos y carpetas]
- No toques: [archivos prohibidos: .env, lockfiles, configuración, todo lo que esté fuera de alcance]

## Restricciones
- [Versión del stack, convenciones, sin dependencias nuevas sin preguntar]
- Haz solo los cambios pedidos: sin funciones, abstracciones ni archivos extra, porque cada añadido es algo más que el usuario tiene que revisar.

## Criterios de aceptación
- [ ] [Comprobación binaria 1]
- [ ] [Comprobación binaria 2]
- [ ] [Comprobación binaria 3]

## Límites de acción
- Adelante con inspección, ediciones y validación reversibles dentro del alcance.
- Detente y pregunta antes de acciones destructivas o irreversibles, escrituras externas, compras, ampliaciones de alcance o decisiones que solo el usuario puede tomar.

## Evidencia de progreso
En trabajos largos, informa solo cuando algo cambie o se alcance un hito. Respalda cada afirmación de «terminado» con una salida de herramienta, un archivo cambiado o un resultado de verificación.
```

**Esfuerzo:** se configura en la API o en el entorno, no pidiendo razonamiento en el prompt. Empieza con el valor por defecto, bájalo en trabajo rutinario y acotado, y súbelo solo si la dificultad lo justifica.

**Solo Claude Code — añade un bloque de sesión cuando importe:**
```
## Estrategia de sesión
[Elige una:]
- Sesión nueva: no depende del contexto anterior
- Continuar: el contexto anterior sigue siendo necesario
- Subagente: delega solo [línea de trabajo independiente y grande], con un entregable acotado
- Compactar primero: compacta alrededor de [decisiones, restricciones y estado actual] y luego empieza
```

**Cuándo usarla:** modelos Claude actuales en cualquier superficie cuando la tarea es compleja, multiarchivo, ambigua o agéntica. No hace falta para tareas simples de una vez.

---

## Template L — Brief para OpenAI

*Para tareas complejas en modelos de OpenAI en ChatGPT, Codex o la API. Las peticiones simples se quedan cortas; omite las secciones que no cambian el resultado.*

```text
Objetivo:
[El resultado concreto que hay que entregar.]

Contexto:
[Entradas relevantes, estado actual, decisiones previas e intentos fallidos.]

Restricciones:
[Alcance, requisitos, compatibilidad y límites.]

Acciones:
[Solo en tareas con herramientas: herramientas disponibles, acciones ya autorizadas
y acciones que requieren aprobación.]

Hecho cuando:
[Criterios de aceptación observables y verificación adecuada.]

Salida:
[Entregable, formato, nivel de detalle y evidencia requerida.]
```

**Ajustes, según el perfil vigente de `models.md`:**
- Modelos rápidos o pequeños: acota la tarea y haz explícito el contrato de salida.
- Modelos insignia para código o trabajo profesional: contexto de implementación y criterios de aceptación.
- Modelos de razonamiento profundo: criterios de decisión y requisitos de evidencia; sin andamiaje paso a paso.
- Une tareas relacionadas si comparten un resultado; sepáralas si las dependencias, las revisiones o el contexto lo justifican.
- Pide conclusiones, supuestos, justificación breve, evidencia y comprobaciones, nunca cadena de pensamiento oculta.
- Para hechos actuales, pide búsqueda y citas si el entorno las ofrece; si no hay acceso, que lo diga en vez de inventar fuentes.
- Define acceso a herramientas y autorización solo en tareas agénticas. En trabajos largos, pide hitos y bloqueos, no un mensaje tras cada acción.
- Los ajustes de API y del entorno van en la nota, fuera del prompt; verifica los controles admitidos para el modelo, endpoint y superficie exactos.

Este brief y sus ajustes son recomendaciones de Prompt Master, no una plantilla oficial de OpenAI.
