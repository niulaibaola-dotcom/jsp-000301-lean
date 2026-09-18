import Mathlib

namespace JSP000554Independent

/-- Two primes are consecutive when there is no prime strictly between them. -/
def ConsecutivePrimes (p q : ℕ) : Prop :=
  p.Prime ∧ q.Prime ∧ p < q ∧
    ∀ r : ℕ, p < r → r < q → ¬ r.Prime

/-- The open prime gap (p,q) contains an integer whose least prime factor
is at least the gap length. -/
def GapHasRoughInteger (p q : ℕ) : Prop :=
  ∃ n : ℕ, p < n ∧ n < q ∧ q - p ≤ n.minFac

/-- 13 and 17 are consecutive primes. -/
theorem consecutive_13_17 : ConsecutivePrimes 13 17 := by
  refine ⟨by norm_num, by norm_num, by norm_num, ?_⟩
  intro r h13 h17
  interval_cases r <;> norm_num

/-- The gap (13,17) contains no integer whose least prime factor is at
least the gap length 4. The only candidates are 14,15,16. -/
theorem no_rough_integer_13_17 : ¬ GapHasRoughInteger 13 17 := by
  rintro ⟨n, h13, h17, hrough⟩
  interval_cases n <;> norm_num at hrough

/-- Explicit counterexample to the universal reading of JSP-000554. -/
theorem jsp_000554_counterexample :
    ∃ p q : ℕ, ConsecutivePrimes p q ∧ ¬ GapHasRoughInteger p q :=
  ⟨13, 17, consecutive_13_17, no_rough_integer_13_17⟩

/-- The original universal assertion is false. -/
theorem jsp_000554_not_universal :
    ¬ ∀ p q : ℕ, ConsecutivePrimes p q → GapHasRoughInteger p q := by
  intro h
  exact no_rough_integer_13_17 (h 13 17 consecutive_13_17)

#print axioms consecutive_13_17
#print axioms no_rough_integer_13_17
#print axioms jsp_000554_counterexample
#print axioms jsp_000554_not_universal

end JSP000554Independent
