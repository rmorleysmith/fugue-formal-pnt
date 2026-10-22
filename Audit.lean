import Ingham
open Ingham
-- Every headline theorem rests only on Lean's three standard axioms.
#print axioms Ingham.logDerivLogBound_of_zeroFreeRight
#print axioms Ingham.i37Bound
#print axioms Ingham.i2Bound
#print axioms Ingham.i8Bound
#print axioms Ingham.psiError_of_bounds
#print axioms Ingham.psiError_of_zeroFreeRight
#print axioms Ingham.psiError_seven_eighths_of_openAI
#print axioms Ingham.psiError_of_RH

-- Non-vacuity 1: `OpenAIStatement` is the literal statement of OpenAI's comparator challenge
-- `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re` (compare text); it is a hypothesis here.
example : OpenAIStatement = ∀ {s : ℂ}, (7 / 8 : ℝ) < s.re → riemannZeta s ≠ 0 := rfl

#print axioms Ingham.zeroFreeRight_iff_psiError
#print axioms Ingham.riemannHypothesis_iff_psiError
#print axioms Ingham.openAIStatement_iff_psiError

-- Non-vacuity 2: `PsiError` is a real constraint — it is false at θ = -3 (it would kill the
-- trivial zero ζ(-2) = 0) — and true at θ = 1 (Chebyshev).
example : ¬ PsiError (-3) := fun h =>
  QuasiRH.zeroFreeRight_of_psiError h (-2) (by norm_num)
    (by simpa using riemannZeta_neg_two_mul_nat_add_one 0)
example : PsiError 1 := QuasiRH.psiError_one
-- Non-vacuity 3: the hard direction is applied at a θ where the hypothesis is *known*
-- (θ just below 1 is not known; but the equivalence is consistent at θ = 1/2 with RH and at
-- θ = 7/8 with OpenAI). The ZeroFreeRight and PsiError of the two projects are the same Prop:
example (θ : ℝ) : Ingham.ZeroFreeRight θ = QuasiRH.ZeroFreeRight θ := rfl
example (θ : ℝ) : Ingham.PsiError θ = QuasiRH.PsiError θ := rfl
