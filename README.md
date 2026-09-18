# JSP-000301 Lean formalization

Independent Lean 4 formalization of the classical counterexample to **JSP-000301 / Erdős Problem 365**:

- `12167 = 23^3`
- `12168 = 2^3 * 3^2 * 13^2`

The main theorem verifies that these are consecutive powerful integers and that neither is a square.

## Main theorem

`JSP000301.jsp_000301_counterexample`

Source: `jsp-lean/JSP000301.lean`

## Reproduce

```bash
cd jsp-lean
lake update
lake exe cache get
lake env lean JSP000301.lean
```

Lean: `v4.33.0`  
Mathlib: `v4.33.0`

GitHub Actions also compiles the proof and rejects proof placeholders.

## Mathematical provenance

The numerical counterexample is classical and is attributed to Solomon W. Golomb. This repository does **not** claim discovery of the mathematical counterexample.

## Formalization provenance

The Lean formalization was developed under the direction of GitHub account owner `niulaibaola-dotcom`, with assistance from ChatGPT (GPT-5.6 Sol). This provenance is stated explicitly for award attribution review.

Award eligibility, attribution, and payment are determined by The Justin Sun Prize maintainers.
