# Lean build

This directory contains the machine-checkable Lean 4 proof for JSP-000301.

```bash
lake update
lake exe cache get
lake env lean JSP000301.lean
```

Main theorem: `JSP000301.jsp_000301_counterexample`.
