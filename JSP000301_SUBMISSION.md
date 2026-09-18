# JSP-000301 submission package

## Problem

JSP-000301 / Erdős Problem 365 asks whether two consecutive positive powerful integers must include a perfect square.

This repository formalizes the classical negative answer using the witness:

- `12167 = 23^3`
- `12168 = 2^3 * 3^2 * 13^2`

## Lean source

- File: `jsp-lean/JSP000301.lean`
- Main theorem: `JSP000301.jsp_000301_counterexample`
- Lean: `leanprover/lean4:v4.33.0`
- Mathlib: `v4.33.0`

## Reproduction

```bash
cd jsp-lean
lake update
lake exe cache get
lake env lean JSP000301.lean
```

GitHub Actions also compiles the proof and rejects source placeholders.

## Verification record

A final pinned commit SHA and successful public GitHub Actions run should be recorded here after the repository is public.

## Statement correctness

See `STATEMENT_MAPPING.md` for the mapping between the official problem statement and the Lean theorem.

## Attribution

See `AUTHORS.md`. The mathematical counterexample is classical and attributed to Solomon W. Golomb. The Lean project was developed under the direction of GitHub account `niulaibaola-dotcom` with ChatGPT (GPT-5.6 Sol) assistance.

## Award-process note

The official problem bank currently records JSP-000301 as solved but with no selected Lean proof, so it is not currently marked eligible to claim. Under the official catalog convention, a solved problem becomes eligible only after a qualifying complete Lean proof is recorded. Any correction, attribution review, eligibility update, award claim, or payment decision remains subject to maintainer review.

JSP-000301 also has substantial overlapping public Lean submissions and claims. This repository should therefore be treated as an independent formalization, not as evidence of priority over earlier submissions.
