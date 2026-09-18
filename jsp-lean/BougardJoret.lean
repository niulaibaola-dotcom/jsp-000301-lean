import Mathlib

/-!
# Smallest Bougard–Joret counterexample

This file formalizes the fixed seven-vertex graph underlying the smallest-order
counterexample in Das--Gupta (2026): the join of an independent set on three
vertices and a four-vertex path.

Mathematical discovery is due to Joyentanuj Das and Sayan Gupta.  This file is
only an independent Lean certificate project.
-/

namespace BougardJoret

abbrev V := Fin 7

/--
Vertices 0,1,2 form the independent side.
Vertices 3,4,5,6 form a path 3--4--5--6.
Every vertex on the first side is joined to every vertex on the path side.
-/
def witness : SimpleGraph V :=
  SimpleGraph.fromRel fun u v =>
    (u.1 < 3 ∧ 3 ≤ v.1) ∨
    (3 ≤ u.1 ∧ 3 ≤ v.1 ∧ v.1 = u.1 + 1)

instance : DecidableRel witness.Adj := by
  dsimp [witness]
  infer_instance

/-- Finite-set version of independence, convenient for kernel computation. -/
def IndepFinset (G : SimpleGraph V) [DecidableRel G.Adj] (S : Finset V) : Prop :=
  ∀ u ∈ S, ∀ v ∈ S, u ≠ v → ¬ G.Adj u v

instance (G : SimpleGraph V) [DecidableRel G.Adj] (S : Finset V) :
    Decidable (IndepFinset G S) := by
  unfold IndepFinset
  infer_instance

/-- The graph has an independent 3-set and no independent 4-set. -/
def IndependenceExactlyThree (G : SimpleGraph V) [DecidableRel G.Adj] : Prop :=
  (∃ S : Finset V, S.card = 3 ∧ IndepFinset G S) ∧
  ∀ S : Finset V, IndepFinset G S → S.card ≤ 3

instance (G : SimpleGraph V) [DecidableRel G.Adj] :
    Decidable (IndependenceExactlyThree G) := by
  unfold IndependenceExactlyThree
  infer_instance

theorem witness_edge_count : witness.edgeFinset.card = 15 := by
  decide +kernel

theorem witness_independence_exactly_three : IndependenceExactlyThree witness := by
  decide +kernel

/-- The conjectured value at (n, alpha, k) = (7,3,4). -/
theorem conjectured_value : (7 * 4 + 1) / 2 = 14 := by
  norm_num

/-- The witness already has one more edge than the conjectured value. -/
theorem witness_exceeds_conjectured_value : witness.edgeFinset.card = 14 + 1 := by
  simpa using witness_edge_count

end BougardJoret
