# Plantillas para edición de código y agentes (E–F)

*Alcance de archivo (Cursor, Windsurf, Copilot) y Agente autónomo (Devin, SWE-agent, Manus, agentes de navegador). Para Claude Code y Codex en tareas complejas usa K o L en `task-briefs.md`.*

---

## Template E — Alcance de archivo

*Para Cursor, Windsurf, GitHub Copilot y cualquier IA que edita código dentro de un proyecto. Sus fallos típicos son editar el archivo equivocado y romper lógica existente; esta plantilla previene ambos.*

```
Archivo: [ruta/exacta/al/archivo.ext]
Función o componente: [nombre exacto]

Comportamiento actual:
[Qué hace hoy el código, concreto]

Cambio deseado:
[Qué debe hacer después del cambio, concreto]

Alcance:
Modifica solo [función / componente / sección].
No toques: [todo lo que debe quedar igual]

Restricciones:
- Lenguaje y versión: [p. ej. TypeScript 5, Node 20]
- Sin dependencias nuevas fuera de [package.json / requirements.txt]
- Conserva [firmas de tipos / contratos de API / nombres exportados]

Hecho cuando:
[Condición exacta que confirma el cambio; idealmente un comando de prueba que pasa]
```

---

## Template F — Agente autónomo

*Para Devin, SWE-agent, Manus, agentes de navegador y cualquier agente sin plantilla propia. Los bucles sin fin y la expansión de alcance son los mayores gastos en flujos agénticos, así que las condiciones de parada no son opcionales. A la vez, el agente necesita poder comprobar su trabajo: prohibir ejecutar pruebas o el servidor local lo obliga a entregar sin verificar.*

```
Objetivo:
[Una meta, en una frase sin ambigüedad]

Estado inicial:
[Estructura de archivos, estado del código o del entorno; en navegador: sitio y sesión]

Estado final:
[Qué debe existir o haber ocurrido al terminar]

Acciones permitidas:
- [Acciones concretas: leer, editar dentro de [RUTA], ejecutar pruebas y el servidor local para verificar]
- Instalar solo paquetes ya listados en [requirements.txt / package.json]

Acciones prohibidas:
- Modificar archivos fuera de [RUTA O ALCANCE]
- Desplegar, publicar o hacer push sin aprobación
- Borrar archivos sin mostrar antes el diff
- En navegador: comprar, enviar formularios o mensajes, o cambiar datos de cuenta

Condiciones de parada — detente y pregunta cuando:
- Un archivo se borraría de forma permanente
- Haga falta integrar un servicio o API externa nueva
- Haya dos caminos válidos y la elección afecte a la arquitectura
- Un error siga sin resolverse tras 2 intentos
- La tarea exija cambios fuera del alcance declarado

Verificación y progreso:
- Tras cada hito, informa: ✅ [qué se completó] + [evidencia: salida de prueba o comando]
- Al final: resumen de cada archivo cambiado y resultado de las pruebas
```
