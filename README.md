# FormalPNT — Ingham's theorem and the prime-number consequence of OpenAI's quasi-RH

Sibling of [`../Formal`](../Formal/README.md). Same pins as OpenAI (Lean v4.34.1, Mathlib
`d13f23b`), plus PrimeNumberTheoremAnd at OpenAI's pinned commit `c39a751`, plus `../Formal` as a
path dependency (for the easy direction).

```bash
lake build && lake env lean Audit.lean     # 11 theorems, all [propext, Classical.choice, Quot.sound]
```

## How AI was used

The ideas in this work are Richard Morley-Smith's: the questions, the links between areas of
mathematics, and the choices of what to pursue. AI was used as a tool, in two phases.

- **May–June 2026, the original exploration.** The exploration was carried out in conversation
  with AI coding assistants, chiefly Anthropic's Claude through Claude Code (the design document
  also quotes Google's Gemini). The assistants wrote most of the code, Lean files and documents
  from the author's ideas and direction, quickly and without later editing. Those files are kept
  unchanged in [hsln-archive](https://github.com/rmorleysmith/hsln-archive).
- **October 2026 onwards.** Claude, through Claude Code, helps the author formalise the ideas in
  Lean 4, audit and tidy the earlier files, and write out the working: the steps between an
  intuition and a precise statement.

Checking the results does not rely on trusting the AI. Every Lean theorem is verified by the
Lean kernel against Mathlib, and `#print axioms` shows only Lean's three standard axioms. Every
script asserts the numbers it reports and can be rerun. Every grade in the audit cites the
evidence it rests on.

## Main results (all sorry-free)

| Lean | Statement |
|---|---|
| `Ingham.psiError_of_zeroFreeRight` | `1/2 ≤ θ < 1`, `ζ(s) ≠ 0` for `Re s > θ` ⇒ `ψ(x) = x + O(x^{θ+δ})` ∀ δ > 0 |
| `Ingham.zeroFreeRight_iff_psiError` | **Ingham's theorem as an equivalence** (with `../Formal`'s easy direction) |
| `Ingham.riemannHypothesis_iff_psiError` | RH ⟺ `ψ(x) = x + O(x^{1/2+δ})` ∀ δ > 0 (von Koch, ε-form) |
| `Ingham.openAIStatement_iff_psiError` | OpenAI's statement (verbatim) ⟺ `ψ(x) = x + O(x^{7/8+δ})` ∀ δ > 0 |
| `Ingham.psiError_seven_eighths_of_openAI` | OpenAI ⇒ `ψ(x) = x + O(x^{7/8+δ})` |

## Files

| File | Content |
|---|---|
| `Ingham/Basic.lean` | interfaces (`ZeroFreeRight`, `PsiError`, bound Props) |
| `Ingham/LogDerivBound.lean` | `|ζ′/ζ(σ+it)| ≤ K log|t|` for `σ ≥ σ₁ > θ` (Borel–Carathéodory on a holomorphic `log ζ`; some complex-analysis lemmas adapted from PNT+'s `StrongPNT.lean`, credited) |
| `Ingham/ContourBounds.lean` | bounds for the shifted-contour pieces `I₃₇`, `I₂`, `I₈` |
| `Ingham/Assembly.lean` | smoothing + contour shift (PNT+ `MediumPNT`) + choice `ε = X^{σ₁−1}`, `T = X` |
| `Ingham/Main.lean`, `Ingham/Equivalence.lean` | headline theorems |

The three proof pieces were written by subagents against interfaces fixed in `Basic.lean`; every
piece was re-checked here with `#print axioms`.

A Palomar-ready port (Lean ≥ v4.35.0-rc2, all files in the module system, PNT+ vendored) is in
[`../PalomarIngham`](../PalomarIngham).
