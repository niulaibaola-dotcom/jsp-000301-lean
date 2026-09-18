# Statement mapping for JSP-000301

## Official problem

JSP-000301 asks:

> If two consecutive positive integers are powerful, must at least one be a perfect square?

The official catalog records the classical counterexample

- `12167 = 23^3`
- `12168 = 2^3 * 3^2 * 13^2`

and states that both are powerful and neither is a square.

## Lean definition

The repository uses:

```lean
def IsPowerful (n : ℕ) : Prop :=
  0 < n ∧ ∀ p : ℕ, p.Prime → p ∣ n → p ^ 2 ∣ n
```

This is the standard squarefull/powerful-number condition: every prime divisor occurs with exponent at least two.

## Main theorem

```lean
theorem jsp_000301_counterexample :
    ∃ n : ℕ, IsPowerful n ∧ IsPowerful (n + 1) ∧
      ¬ IsSquare n ∧ ¬ IsSquare (n + 1)
```

The witness is `n = 12167`. Therefore the theorem formalizes a direct negative answer to the exact yes/no question catalogued as JSP-000301.

## Scope

The official review note says JSP-000301 covers only this yes/no question and not the separate counting question associated with Erdős Problem 365. This repository follows that same scope.
