#!/usr/bin/env bash
# Comprueba consistencia del repo. Uso: bash scripts/check.sh
set -u
cd "$(dirname "$0")/.." || exit 1
fail=0
ok()  { echo "OK   $1"; }
bad() { echo "FAIL $1"; fail=1; }

# 1. Archivos requeridos
for f in SKILL.md README.md LICENSE references/models.md references/agents.md references/media.md references/templates.md references/patterns.md evals/cases.md; do
  [ -f "$f" ] && ok "existe $f" || bad "falta $f"
done

# 2. Enlaces locales de Markdown (ruta relativa) resuelven
for md in SKILL.md README.md references/*.md; do
  grep -o '\](references/[^)#]*\|\](LICENSE' "$md" | sed 's/^](//' | sort -u | while read -r p; do
    [ -e "$p" ] || { echo "FAIL enlace roto en $md -> $p"; exit 9; }
  done || fail=1
done
[ $fail -eq 0 ] && ok "enlaces locales válidos"

# 3. Versión del frontmatter aparece en el historial del README
ver=$(sed -n 's/^version: *//p' SKILL.md | head -1)
grep -q "\*\*$ver\*\*" README.md && ok "versión $ver en README" || bad "versión $ver ausente en el historial del README"

# 4. Conteos declarados
t=$(grep -c '^## Template ' references/templates.md)
grep -q "14 Prompt Templates" README.md && [ "$t" -eq 14 ] && ok "14 plantillas" || bad "plantillas: $t (README declara 14)"
p=$(grep -cE '^\| [0-9]+ \|' references/patterns.md)
grep -q "37 Credit-Killing" README.md && [ "$p" -eq 37 ] && ok "37 patrones" || bad "patrones: $p (README declara 37)"

# 5. El README no debe mostrar lo que el skill prohíbe
grep -nE 'Framework:\*\*|Tokens:\*\*' README.md && bad "README muestra framework o tokens" || ok "ejemplos sin framework ni tokens"

# 6. Marcadores sin resolver y referencias colgantes
grep -rn '@@' SKILL.md references && bad "marcador @@ sin resolver" || ok "sin marcadores @@"
grep -rnE '(route|profile)s? above|covered below' SKILL.md references && bad "referencia relativa obsoleta (above/below)" || ok "sin referencias above/below obsoletas"

# 7. Tamaño del núcleo
n=$(wc -l < SKILL.md); [ "$n" -le 260 ] && ok "SKILL.md $n líneas (<=260)" || bad "SKILL.md creció a $n líneas"

exit $fail
