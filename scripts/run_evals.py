#!/usr/bin/env python3
"""Valida evals/cases.json y comprueba salidas guardadas.

Uso:
  python3 -I scripts/run_evals.py --validate   # solo valida el archivo de casos
  python3 -I scripts/run_evals.py              # además comprueba evals/outputs/<id>.txt (los ausentes se omiten)

Las comprobaciones son heurísticas de formato; no sustituyen la lectura de la salida.
"""
import json, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CASES = os.path.join(ROOT, "evals", "cases.json")
OUTDIR = os.path.join(ROOT, "evals", "outputs")


def validate(data):
    errors, seen = [], set()
    for rx in data["global"]["must_match"] + data["global"]["must_not_match"]:
        try: re.compile(rx)
        except re.error as e: errors.append(f"global regex inválida {rx!r}: {e}")
    for c in data["cases"]:
        cid = c.get("id")
        if cid in seen: errors.append(f"id duplicado {cid}")
        seen.add(cid)
        for k in ("input", "loads", "must_match", "must_not_match"):
            if k not in c: errors.append(f"caso {cid}: falta '{k}'")
        for rx in c.get("must_match", []) + c.get("must_not_match", []):
            try: re.compile(rx)
            except re.error as e: errors.append(f"caso {cid}: regex inválida {rx!r}: {e}")
        for ref in c.get("loads", []):
            if not os.path.exists(os.path.join(ROOT, ref)): errors.append(f"caso {cid}: no existe {ref}")
    return errors


def check_output(case, glob, text):
    fails = []
    for rx in glob["must_match"] + case["must_match"]:
        if not re.search(rx, text, re.M): fails.append(f"debe coincidir: {rx}")
    for rx in glob["must_not_match"] + case["must_not_match"]:
        if re.search(rx, text, re.M): fails.append(f"no debe coincidir: {rx}")
    return fails


def main():
    data = json.load(open(CASES, encoding="utf-8"))
    errors = validate(data)
    for e in errors: print("FAIL", e)
    if errors: return 1
    print(f"OK   evals/cases.json válido ({len(data['cases'])} casos)")
    if "--validate" in sys.argv: return 0
    bad = 0
    for c in data["cases"]:
        path = os.path.join(OUTDIR, f"{c['id']}.txt")
        if not os.path.exists(path):
            print(f"SKIP caso {c['id']}: sin salida guardada"); continue
        fails = check_output(c, data["global"], open(path, encoding="utf-8").read())
        if fails:
            bad += 1; print(f"FAIL caso {c['id']}: " + "; ".join(fails))
        else:
            print(f"OK   caso {c['id']}")
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
