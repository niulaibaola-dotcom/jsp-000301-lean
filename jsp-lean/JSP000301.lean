import Mathlib

/-!
# JSP-000301 / Erdős Problem 365 — counterexample to the first question

This file independently formalizes the classical counterexample
`12167 = 23^3`, `12168 = 2^3 * 3^2 * 13^2`.

A positive natural number is called powerful when every prime divisor `p`
also has `p^2` dividing the number.  The two consecutive numbers above are
powerful, while neither is a square.

The proof is self-contained apart from standard Mathlib results and uses no problem-specific axioms.
-/

namespace JSP000301

/-- A positive natural number is powerful (squarefull) if every prime divisor
occurs with exponent at least two. -/
def IsPowerful (n : ℕ) : Prop :=
  0 < n ∧ ∀ p : ℕ, p.Prime → p ∣ n → p ^ 2 ∣ n

lemma powerful_12167 : IsPowerful 12167 := by
  refine ⟨by norm_num, ?_⟩
  intro p hp hpd
  have hfac : (12167 : ℕ) = 23 ^ 3 := by norm_num
  rw [hfac] at hpd
  have hp23 : p ∣ 23 := hp.dvd_of_dvd_pow hpd
  have hpeq : p = 23 :=
    (Nat.prime_dvd_prime_iff_eq hp (by norm_num : Nat.Prime 23)).mp hp23
  subst p
  norm_num

lemma powerful_12168 : IsPowerful 12168 := by
  refine ⟨by norm_num, ?_⟩
  intro p hp hpd
  have hfac : (12168 : ℕ) = 2 ^ 3 * (3 ^ 2 * 13 ^ 2) := by norm_num
  rw [hfac] at hpd
  rcases hp.dvd_mul.mp hpd with h2 | hrest
  · have hp2 : p ∣ 2 := hp.dvd_of_dvd_pow h2
    have hpeq : p = 2 :=
      (Nat.prime_dvd_prime_iff_eq hp Nat.prime_two).mp hp2
    subst p
    norm_num
  · rcases hp.dvd_mul.mp hrest with h3 | h13
    · have hp3 : p ∣ 3 := hp.dvd_of_dvd_pow h3
      have hpeq : p = 3 :=
        (Nat.prime_dvd_prime_iff_eq hp Nat.prime_three).mp hp3
      subst p
      norm_num
    · have hp13 : p ∣ 13 := hp.dvd_of_dvd_pow h13
      have hpeq : p = 13 :=
        (Nat.prime_dvd_prime_iff_eq hp (by norm_num : Nat.Prime 13)).mp hp13
      subst p
      norm_num

/--
Independent Lean certificate for the negative answer to JSP-000301's first
question: there are consecutive positive powerful integers for which neither
integer is a perfect square.
-/
theorem jsp_000301_counterexample :
    ∃ n : ℕ, IsPowerful n ∧ IsPowerful (n + 1) ∧
      ¬ IsSquare n ∧ ¬ IsSquare (n + 1) := by
  refine ⟨12167, powerful_12167, ?_, ?_, ?_⟩
  · simpa using powerful_12168
  · norm_num
  · norm_num

end JSP000301
