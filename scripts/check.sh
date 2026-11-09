#!/usr/bin/env bash
# Comprueba consistencia del repo. Uso: bash scripts/check.sh
set -u
cd "$(dirname "$0")/.." || exit 1
fail=0
ok()  { echo "OK   $1"; }
bad() { echo "FAIL $1"; fail=1; }

# 1. Archivos requeridos
for f in SKILL.md README.md CHANGELOG.md LICENSE \
         references/models.md references/agents.md references/media.md \
         references/templates.md references/patterns.md \
         references/templates/writing.md references/templates/code-agents.md \
         references/templates/visual.md references/templates/decompiler.md references/templates/task-briefs.md \
         evals/cases.md evals/cases.json scripts/run_evals.py .github/workflows/check.yml; do
  [ -f "$f" ] && ok "existe $f" || bad "falta $f"
done

# 2. Enlaces locales de Markdown resuelven (relativos al archivo que los contiene)
broken=0
while IFS= read -r md; do
  dir=$(dirname "$md")
  while IFS= read -r p; do
    [ -z "$p" ] && continue
    [ -e "$dir/$p" ] || { echo "FAIL enlace roto en $md -> $p"; broken=1; }
  done < <(grep -o ']([^)#:]*\(\.md\|/\)\?)' "$md" | sed 's/^](//; s/)$//' | grep -vE '^(https?|mailto)' | sort -u)
done < <(find . -name '*.md' -not -path './.git/*')
[ $broken -eq 0 ] && ok "enlaces locales válidos" || fail=1

# 3. Versión del frontmatter aparece en CHANGELOG y README
ver=$(sed -n 's/^version: *//p' SKILL.md | head -1)
grep -q "\*\*$ver\*\*" CHANGELOG.md && ok "versión $ver en CHANGELOG" || bad "versión $ver ausente en CHANGELOG.md"
grep -q "$ver" README.md && ok "versión $ver en README" || bad "versión $ver ausente en README"

# 4. Conteos declarados
t=$(cat references/templates/*.md | grep -c '^## Template ')
it=$(grep -cE '^\| [A-N] — ' references/templates.md)
grep -q "14 Prompt Templates" README.md && [ "$t" -eq 14 ] && [ "$it" -eq 14 ] && ok "14 plantillas (contenido e índice)" || bad "plantillas: $t en archivos, $it en índice (README declara 14)"
p=$(grep -cE '^\| [0-9]+ \|' references/patterns.md)
grep -q "37 Credit-Killing" README.md && [ "$p" -eq 37 ] && ok "37 patrones" || bad "patrones: $p (README declara 37)"

# 5. El README no debe mostrar lo que el skill prohíbe
grep -nE 'Framework:\*\*|Tokens:\*\*' README.md && bad "README muestra framework o tokens" || ok "ejemplos sin framework ni tokens"

# 6. Marcadores sin resolver y referencias obsoletas
grep -rn '@@' SKILL.md references && bad "marcador @@ sin resolver" || ok "sin marcadores @@"
grep -rnE '(route|profile)s? above|covered below' SKILL.md references && bad "referencia relativa obsoleta" || ok "sin referencias above/below obsoletas"
grep -rn 'references/templates.md Template' SKILL.md references && bad "referencia a plantilla con ruta antigua" || ok "rutas de plantillas actualizadas"

# 7. Tamaño del núcleo
n=$(wc -l < SKILL.md); [ "$n" -le 260 ] && ok "SKILL.md $n líneas (<=260)" || bad "SKILL.md creció a $n líneas"

# 8. Evals válidos
python3 -I scripts/run_evals.py --validate || fail=1

# 9. Regla de idioma presente
grep -q '^\*\*Language\*\*' SKILL.md && ok "regla de idioma presente" || bad "falta la regla de idioma en SKILL.md"

exit $fail
