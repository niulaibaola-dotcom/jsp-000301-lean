# Statement mapping — JSP-000554

Official catalog question:

> Between consecutive primes, is there an integer whose least prime factor is at least their gap?

This project formalizes the universal yes/no reading as:

`∀ p q, ConsecutivePrimes p q → GapHasRoughInteger p q`.

The theorem `jsp_000554_not_universal` proves its negation using the explicit consecutive prime gap `(13,17)`.

* The gap length is `17 - 13 = 4`.
* The only interior integers are `14, 15, 16`.
* Their least prime factors are respectively `2, 3, 2`, all strictly smaller than `4`.

Therefore this gap contains no integer whose least prime factor is at least the gap length, so the universal assertion is false.

Scope boundary: this project does **not** formalize the stronger asymptotic theorem of Gafni–Tao about almost all prime gaps. It formalizes only the complete finite counterexample needed to refute the universal reading of the catalog question.
