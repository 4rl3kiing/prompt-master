# Plantillas de escritura y razonamiento (A–D)

*Directa, Brief de escritura, Razonamiento auditable y Ejemplos. Lee solo la plantilla que encaja con la tarea.*

---

## Template A — Directa

*Para tareas simples de un paso, cuando la petición ya es clara. Tres líneas bastan; añadir secciones solo diluye la instrucción.*

```
Rol: [una frase: quién es la IA, solo si la especialidad cambia el resultado]
Tarea: [verbo preciso + qué producir]
Formato: [forma exacta y extensión de la salida]
```

**Ejemplo:**
```
Rol: Eres redactor técnico sénior.
Tarea: Explica en un párrafo qué es una API REST.
Formato: Prosa, máximo 3 frases, sin jerga, para un lector no técnico.
```

---

## Template B — Brief de escritura

*Une lo útil de CO-STAR, RISEN y CRISPE en un solo esquema. Para documentos, textos de negocio, marketing, creatividad y voz de marca. Usa solo las secciones que el caso necesita: un correo frío necesita Contexto, Objetivo, Tono, Público y Respuesta; un documento largo con fases necesita además Pasos; una pieza creativa, Variantes.*

```
Contexto: [situación que la IA necesita entender]
Objetivo: [qué debe lograr el texto; cómo se ve el éxito]
Público: [quién lo lee, qué sabe, qué espera, qué objeciones tiene]
Tono y estilo: [registro y estilo concretos; p. ej. «directo, sin adjetivos, sin signos de exclamación»]
Pasos: [solo si el orden importa: 1…, 2…, 3…]
Límites: [qué excluir, extensión máxima, temas prohibidos]
Variantes: [solo si conviene explorar: «3 versiones, de sobria a atrevida»]
Respuesta: [formato, extensión y estructura de la salida]
```

**Ejemplo (correo frío):**
```
Contexto: Soy fundador de un SaaS B2B que automatiza los reportes de gastos en empresas medianas.
Objetivo: Un correo frío que consiga una respuesta del director financiero.
Público: Director financiero de una empresa de 200 personas; ocupado y escéptico ante correos de proveedores.
Tono y estilo: Directo y conversacional, seguro sin presionar; nada de lenguaje de ventas.
Respuesta: Asunto + cuerpo de máximo 5 frases, sin viñetas.
```

**Ejemplo (pieza creativa con variantes):**
```
Contexto: Herramienta de productividad para desarrolladores; detestan el lenguaje de marketing y responden a la honestidad y la concreción.
Objetivo: Titular y subtítulo de la página de inicio.
Tono y estilo: Seco, seguro, sin adjetivos ni exclamaciones.
Variantes: 3 versiones, de la más sobria a la más atrevida.
Respuesta: Cada variante en dos líneas (titular / subtítulo), etiquetada por su estilo.
```

---

## Template C — Razonamiento auditable

*Para lógica, matemáticas, depuración y análisis de varios factores donde el resultado debe poder revisarse sin pedir razonamiento privado.*

```
[Enunciado de la tarea]

Devuelve:
1. Conclusión
2. Supuestos
3. Evidencia o resultados intermedios necesarios para auditar la conclusión
4. Comprobaciones realizadas
5. Incertidumbre restante, si la hay

Mantén la justificación breve y centrada en lo que decide el resultado.
```

**Cuándo usarla:** depuración con causa no evidente, comparar enfoques técnicos, cálculos que deben verificarse, análisis donde supuestos y evidencia tienen que ser revisables.

**Cuándo no:** tareas simples con respuesta clara, o creativas donde el rastro de auditoría solo añade ruido.

---

## Template D — Ejemplos (few-shot)

*Cuando el formato es más fácil de mostrar que de describir. Los ejemplos fijan el formato mejor que cualquier descripción.*

```
[Instrucción de la tarea]

Ejemplos del formato exacto:

<ejemplos>
  <ejemplo>
    <entrada>[entrada 1]</entrada>
    <salida>[salida 1]</salida>
  </ejemplo>
  <ejemplo>
    <entrada>[entrada 2, preferiblemente un caso límite]</entrada>
    <salida>[salida 2]</salida>
  </ejemplo>
</ejemplos>

Aplica el mismo patrón a: [entrada real]
```

**Pautas:**
- De 2 a 5 ejemplos; más rara vez ayuda y gasta tokens.
- Incluye al menos un caso límite, no solo casos fáciles: el modelo copia la variedad que ve.
- Varía lo que debe variar (tema, longitud) y mantén fijo lo que debe ser fijo (formato), o el modelo copiará detalles que no querías.
- Envuelve los ejemplos en etiquetas XML; Claude y GPT las separan bien del resto.
- Si el usuario ya corrigió dos veces el mismo formato, cambia a ejemplos en vez de reescribir la instrucción.
