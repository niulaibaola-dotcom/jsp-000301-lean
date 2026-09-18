# Bougard–Joret conjecture: finite Lean counterexample project

This branch starts an independent Lean 4 formalization of the smallest-order counterexample identified by Joyentanuj Das and Sayan Gupta (2026) to the Bougard–Joret conjecture from Bougard–Joret (2008).

## Mathematical attribution

- Original conjecture: Nicolas Bougard and Gwenaël Joret, *Turán's theorem and k-connected graphs*, Journal of Graph Theory 58 (2008), 1–13, DOI 10.1002/jgt.20289.
- Mathematical disproof: Joyentanuj Das and Sayan Gupta, *Counterexample to the Bougard-Joret Conjecture*, arXiv:2608.18828 (2026).
- This repository does **not** claim discovery of the mathematical counterexample.
- Formalization project: developed under GitHub account `niulaibaola-dotcom` with ChatGPT (GPT-5.6 Sol) assistance.

## Smallest counterexample

For admissible ((n,\alpha,k)=(7,3,4)), the conjectured minimum is

```text
ceil(n*k/2) = ceil(7*4/2) = 14.
```

Das–Gupta prove instead

```text
f(7,3,4) = 15.
```

The extremal witness is `I₃ ∨ P₄`: the join of an independent set of three vertices with a path on four vertices.

## Elementary seven-vertex proof targeted in Lean

### Lower bound

Let `G` be a 4-connected graph on seven vertices with independence number three.

Assume for contradiction that `G` has 14 edges.

1. A 4-connected graph has minimum degree at least four.
2. The degree sum is `2*14 = 28`. Seven vertices each have degree at least four, so every vertex has degree exactly four.
3. Choose an independent set `A` of three vertices.
4. Every vertex of `A` has degree four and has no neighbor inside `A`. Since there are exactly four vertices outside `A`, every vertex of `A` is adjacent to all four outside vertices.
5. Hence the cut between `A` and its four-vertex complement contributes exactly `3*4 = 12` edges. Since the whole graph has 14 edges, only two edges remain inside the four-vertex complement.
6. Deleting the three vertices of `A` from a 4-connected graph leaves a connected graph on four vertices.
7. Any connected graph on four vertices has at least three edges, contradiction.

Therefore every such graph has at least 15 edges.

### Upper bound

Take `I₃ ∨ P₄`.

- It has `3*4 + 3 = 15` edges.
- Its independence number is exactly three.
- Deleting at most three vertices leaves it connected:
  - if at least one vertex remains on each side of the join, all remaining vertices lie in one connected component via cross-edges;
  - if all three independent-side vertices are deleted, the untouched `P₄` remains connected;
  - deleting all four path-side vertices requires four deletions and therefore cannot occur.

Thus the graph is 4-connected and realizes 15 edges.

Together the two bounds prove `f(7,3,4)=15 ≠ 14`, a complete finite refutation of the conjectured formula.

## Verification plan

The Lean development will use Mathlib's `SimpleGraph`, degree-sum theorem, induced subgraphs and the theorem that a connected finite graph on `n` vertices has at least `n-1` edges. Concrete properties of the fixed seven-vertex witness may use kernel-checked finite computation (`decide +kernel`), not `native_decide`.

No `sorry`, `admit`, custom axioms or unproved mathematical assumptions are intended in the final proof.
