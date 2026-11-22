# Catálogo de patrones que desperdician créditos

40 patrones que gastan tokens y obligan a repetir el prompt. Lee este archivo cuando el usuario pegue un prompt malo para arreglarlo o cuando diagnostiques por qué un prompt rinde mal.

---

## Tarea

| # | Patrón | Ejemplo malo | Corrección |
|---|--------|--------------|------------|
| 1 | **Verbo vago** | «ayúdame con mi código» | «Refactoriza `getUserData()` para usar async/await y manejar retornos nulos» |
| 2 | **Tareas sin relación juntas** | «arregla el login y escribe un correo de ventas» | Separa resultados sin relación; une trabajo relacionado con criterios de aceptación comunes |
| 3 | **Sin criterio de éxito** | «mejóralo» | «Hecho cuando la función pasa las pruebas existentes y acepta entrada nula sin lanzar error» |
| 4 | **Agente sin límites** | «haz lo que haga falta» | Lista explícita de acciones permitidas y prohibidas |
| 5 | **Descripción emocional** | «está todo roto, arréglalo todo» | «Lanza TypeError no capturado en la línea 43 cuando `user` es null» |
| 6 | **Construir todo de golpe** | «hazme la app entera» | Prompt 1 (estructura), Prompt 2 (función principal), Prompt 3 (pulido) |
| 7 | **Referencia implícita** | «ahora añade lo otro que hablamos» | Reescribe la tarea completa; nunca «lo que hablamos» |

---

## Contexto

| # | Patrón | Ejemplo malo | Corrección |
|---|--------|--------------|------------|
| 8 | **Conocimiento previo supuesto** | «sigue donde lo dejamos» | Bloque de memoria con todas las decisiones previas |
| 9 | **Sin contexto del proyecto** | «escribe una carta de presentación» | «Puesto de PM en fintech B2B, 2 años como ingeniero en transición a producto, lideré 3 funciones» |
| 10 | **Stack olvidado** | El prompt nuevo contradice una elección técnica anterior | Bloque de memoria con el stack establecido |
| 11 | **Invitación a inventar** | «¿qué dicen los expertos sobre X?» | «Cita solo fuentes de las que estés seguro; si dudas, dilo en vez de suponer» |
| 12 | **Público indefinido** | «escribe algo para los usuarios» | «Compradores B2B no técnicos, sin conocimientos de programación, con poder de decisión» |
| 13 | **Sin intentos previos** | (vacío) | «Ya probé X y no funcionó porque Y. No sugieras X» |

---

## Formato

| # | Patrón | Ejemplo malo | Corrección |
|---|--------|--------------|------------|
| 14 | **Sin formato de salida** | «explica este concepto» | «3 viñetas de menos de 20 palabras, con un resumen de una frase arriba» |
| 15 | **Extensión implícita** | «haz un resumen» | «Resumen de exactamente 3 frases» |
| 16 | **Sin perspectiva experta** | Tarea especializada sin contexto de dominio | Rol experto solo si cambia el resultado |
| 17 | **Adjetivos estéticos vagos** | «que se vea profesional» | «Paleta monocroma, fuente base de 16 px, interlineado de 24 px, sin decoración» |
| 18 | **Sin exclusiones en imagen** | «retrato de una mujer» | Exclusiones según la herramienta: `--no` en Midjourney, bloque negativo en SD/SDXL; en Flux y GPT Image, descríbelo en positivo |
| 19 | **Prosa para Midjourney** | Frase descriptiva larga | «sujeto, estilo, ambiente, iluminación, composición» + parámetros al final según el perfil vigente |

---

## Alcance

| # | Patrón | Ejemplo malo | Corrección |
|---|--------|--------------|------------|
| 20 | **Sin límite de alcance** | «arregla mi app» | «Arregla solo la validación del formulario de login en `src/auth.js`. No toques nada más» |
| 21 | **Sin stack** | «haz un componente de React» | «React 18, TypeScript estricto, sin librerías externas, solo Tailwind» |
| 22 | **Agente sin parada** | «construye toda la función» | Condiciones de parada + hitos con evidencia de verificación |
| 23 | **IA de IDE sin ruta** | «actualiza la función de login» | «Actualiza solo `handleLogin()` en `src/pages/Login.tsx`» |
| 24 | **Plantilla equivocada** | Prompt en prosa estilo chat usado en Cursor | Adaptar a la plantilla E (alcance de archivo) |
| 25 | **Todo el código pegado** | El repo entero en cada prompt | Limitar al archivo y la función relevantes |

---

## Razonamiento

| # | Patrón | Ejemplo malo | Corrección |
|---|--------|--------------|------------|
| 26 | **Lógica sin contrato de auditoría** | «¿qué enfoque es mejor?» | Recomendación, supuestos, criterios, evidencia y comprobaciones (plantilla C) |
| 27 | **Pedir razonamiento oculto** | «muéstrame tu cadena de pensamiento» | Quitarlo; pedir justificación breve, evidencia y comprobaciones |
| 28 | **Esperar memoria entre sesiones** | «ya conoces mi proyecto» | Volver a dar el bloque de memoria en cada sesión nueva, o un prompt permanente (plantilla M) |
| 29 | **Contradecir trabajo previo** | El prompt nuevo ignora la arquitectura anterior | Bloque de memoria con las decisiones establecidas |
| 30 | **Hechos sin ancla** | «resume lo que dicen los expertos sobre X» | «Usa solo información de la que estés muy seguro. Escribe [incierto] si no» |

---

## Agentes

| # | Patrón | Ejemplo malo | Corrección |
|---|--------|--------------|------------|
| 31 | **Sin estado inicial** | «hazme una API REST» | «Proyecto Node.js vacío, Express instalado, existe `src/app.js`» |
| 32 | **Sin estado final** | «añade autenticación» | «`/src/middleware/auth.js` con verificación JWT; `POST /login` y `POST /register` en `/src/routes/auth.js`» |
| 33 | **Agente silencioso** | Sin informes de progreso | «Informa hitos, bloqueos y resultados de verificación final» |
| 34 | **Sistema de archivos abierto** | Sin restricciones de archivos | «Edita solo dentro de `src/`. No toques `package.json`, `.env` ni configuración» |
| 35 | **Sin revisión humana** | El agente lo decide todo | «Detente y pregunta antes de borrar archivos, añadir dependencias o cambiar el esquema de la base de datos» |
| 36 | **Primer turno vago para un agente** | «arregla el bug de auth» sin alcance, archivos ni criterios | Plantilla K (Claude) o L (OpenAI): resultado, contexto, alcance, restricciones, límites de acción y criterios de aceptación al principio |
| 37 | **Contexto podrido en sesiones largas** | Se repiten correcciones mientras siguen supuestos viejos | Sesión nueva para trabajo no relacionado; si no, compactar alrededor de decisiones, restricciones, fallos y estado final |

---

## Tono, vigencia y persistencia

| # | Patrón | Ejemplo malo | Corrección |
|---|--------|--------------|------------|
| 38 | **Énfasis por todas partes** | «SIEMPRE haz X. NUNCA hagas Y. ES CRÍTICO…» | Instrucción directa con su razón; énfasis fuerte solo para límites de seguridad. Los modelos actuales siguen de más las mayúsculas y se vuelven rígidos |
| 39 | **Versión o parámetro obsoleto** | `--v 6`, `--cref` o un identificador de modelo retirado | Usar el perfil vigente; si su fecha de revisión tiene más de 60 días, verificar en la documentación oficial |
| 40 | **Tarea puntual en un prompt permanente** | «Eres mi asistente. Hoy arregla el bug de pagos» en las instrucciones de un GPT o en CLAUDE.md | Lo estable al prompt permanente (plantilla M); la tarea de hoy, en el mensaje |
