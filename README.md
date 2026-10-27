# Ingham's theorem in Lean: zero-free regions of ζ and the error term in ψ(x)

[![build](https://github.com/rmorleysmith/fugue-formal-pnt/actions/workflows/build.yml/badge.svg)](https://github.com/rmorleysmith/fugue-formal-pnt/actions/workflows/build.yml)
[![licence: Apache-2.0](https://img.shields.io/badge/licence-Apache--2.0-blue.svg)](LICENSE)
[![DOI](https://zenodo.org/badge/1435655367.svg)](https://doi.org/10.5281/zenodo.23695021)

A machine-checked proof of **Ingham's theorem** in both directions: for `½ ≤ θ < 1`, the Riemann
zeta function has no zeros with real part greater than `θ` exactly when the Chebyshev function
satisfies `ψ(x) = x + O(x^{θ+δ})` for every `δ > 0`. In particular the Riemann hypothesis is
equivalent to a square-root error term in the prime number theorem, and OpenAI's October 2026
zero-free region `Re s > 7/8` (taken as a hypothesis, copied verbatim) is equivalent to
`ψ(x) = x + O(x^{7/8+δ})`.

The easy direction comes from [fugue-formal](https://github.com/rmorleysmith/fugue-formal); the
hard direction is here, built on
[PrimeNumberTheoremAnd](https://github.com/AlexKontorovich/PrimeNumberTheoremAnd). The pictures
behind it are in fugue-formal's README (figure 35, the zeros rebuilding the primes).

```bash
git clone https://github.com/rmorleysmith/fugue-formal-pnt.git
cd fugue-formal-pnt
lake exe cache get
lake build
lake env lean Audit.lean     # 11 theorems, all [propext, Classical.choice, Quot.sound]
```

Versions are pinned to those of OpenAI's published proof (Lean `v4.34.1`, Mathlib `d13f23b`,
PrimeNumberTheoremAnd `c39a751`), so the hypothesis can later be discharged by that proof without
a version mismatch. Cite the release and the Lean name of the result: v1.0.0 is
[10.5281/zenodo.23695022](https://doi.org/10.5281/zenodo.23695022), every version
[10.5281/zenodo.23695021](https://doi.org/10.5281/zenodo.23695021); GitHub's *Cite this repository*
button gives the full reference ([`CITATION.cff`](CITATION.cff)).

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
| `Ingham.zeroFreeRight_iff_psiError` | **Ingham's theorem as an equivalence** (with the easy direction from fugue-formal) |
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

The three proof pieces were written separately against interfaces fixed in `Basic.lean`, and each
was re-checked with `#print axioms`.

A port ready for the Palomar registry (Lean ≥ v4.35.0-rc2, all files in the module system, PNT+
vendored) is in [palomar-ingham](https://github.com/rmorleysmith/palomar-ingham).

## Licence

Apache-2.0. See [`LICENSE`](LICENSE). Some complex-analysis lemmas are adapted from
PrimeNumberTheoremAnd (Apache-2.0) and credited in the files.
