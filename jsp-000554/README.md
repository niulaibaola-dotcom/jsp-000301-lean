# JSP-000554 independent Lean formalization

This subproject gives an independently written Lean 4 formalization of a finite counterexample to the universal reading of JSP-000554.

## Counterexample

Take the consecutive primes 13 and 17. Their gap is 4. The interior integers are 14, 15 and 16, whose least prime factors are 2, 3 and 2. Hence none has least prime factor at least 4.

Main theorem:

`JSP000554Independent.jsp_000554_not_universal`

## Build

```bash
cd jsp-000554
lake update
lake exe cache get
lake build
lake env lean Audit.lean
```

Lean: v4.34.0  
Mathlib: v4.34.0

## Integrity

The proof contains no `sorry`, `admit`, custom `axiom`, or `native_decide`.

See `AUTHORS.md` and `STATEMENT_MAPPING.md` for attribution and scope.

Existing public Lean submissions for JSP-000554 predate this work. This project does not claim first formalization priority and does not copy their source code.
