import JSP000301

/-!
# JSP-000301 proof audit

This file is intentionally tiny: it imports the submitted proof, checks that the
main theorem is available with the expected name, and asks Lean to print the
axioms on which the theorem depends. GitHub Actions compiles this file on every
relevant push.
-/

#check JSP000301.jsp_000301_counterexample
#print axioms JSP000301.jsp_000301_counterexample
