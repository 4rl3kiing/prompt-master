# Comparación v2.0.0 frente a v1.10.1 (2026-11-22)

## Cómo se midió

- **19 casos** (`cases.json`), cada uno corrido con la versión nueva y con la 1.10.1. Las salidas se generaron con agentes (modelo Sonnet) que leen `SKILL.md` y solo las referencias que este indica. Es una simulación, no la skill activada en Claude real: sirve para comparar versiones, no para medir calidad absoluta.
- **Comprobaciones automáticas:** las expresiones regulares de `cases.json` (`scripts/run_evals.py`).
- **Juicio a ciegas:** un agente independiente comparó cada par A/B sin saber cuál era cada versión. El orden fue aleatorio.
- **Activación:** 20 consultas (10 deben activar la skill y 10 no), juzgadas por un agente con la lista de skills disponibles, una pasada por descripción.

## Resultados

| Métrica | v2.0.0 | v1.10.1 |
|---------|--------|---------|
| Comprobaciones automáticas | 113/113 (100 %) | 101/113 (89 %) |
| Juicio a ciegas: casos ganados | 16 (más 2 empates) | 1 |
| Calificación media del juez (1–10) | 8,0 | 6,3 |
| Activación correcta (20 consultas) | 20/20 | 19/20 |
| Tokens por caso (simulación) | ~24 000 | ~21 900 |
| Tiempo por caso (simulación) | ~11,9 s | ~8,9 s |

## Dónde mejora

- **Sintaxis vigente:**
  - Flux sin prompt negativo (caso 16: 9 frente a 3).
  - Midjourney sin `--v 6` ni `--cref` (casos 3 y 17).
  - Aviso del retiro de o3 (caso 4).
- **Idioma:** etiquetas en español en los prompts para modelos de chat y agentes (casos 1, 2, 5–9, 13, 19). La 1.10.1 mezclaba «Goal:/Context:» con texto en español.
- **Menos preguntas innecesarias:**
  - Prompt universal cuando no hay herramienta (caso 18: 8 frente a 4).
  - Prompt de ComfyUI entregado con variante para cada familia, en vez de solo preguntar (caso 11).
- **Funciones nuevas:** prompts permanentes (caso 14) y modo ajuste (caso 15).
- **Activación:** la descripción anterior no se activaba con «escríbeme el CLAUDE.md».

## Correcciones hechas durante la prueba

- **Caso 12:** la primera versión de la regla «preguntar o suponer» dividía «toda la app» sin preguntar. Se restauró la decisión del operador del 2026-11-08 (preguntar primero, máximo 3) y se volvió a correr.
- **Caso 15:** el modo ajuste afirmaba conservar el resto «palabra por palabra» cuando quitaba elementos. Se corrigió la instrucción y ahora describe con exactitud lo que cambió.
- **Caso 7:** una salida mencionaba «mi perfil» al usuario. Se añadió la regla de no mencionar archivos internos de la skill.

## Coste

La versión nueva usa ~10 % más tokens y tiempo por caso en la simulación, porque sus referencias son más completas (fechas, versiones y reglas de idioma). A cambio entrega un prompt que funciona en más casos sin otra vuelta, que es lo que más gasta.

## Limitaciones

- Una sola pasada por configuración: sin varianza medida.
- La optimización automática de la descripción (`run_loop` de skill-creator) no se pudo correr porque la CLI de Claude no tenía sesión en el entorno. La activación se juzgó con un agente.
- Parte de la diferencia en las comprobaciones automáticas viene de reglas de idioma que la 1.10.1 no tenía.
