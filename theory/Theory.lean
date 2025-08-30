/-
Ragnarök Cycle: Theory.lean
A machine-checked lemma sketching the concavity property of the
Discovery-Efficacy Tradeoff.
-/

import Mathlib.Analysis.Convex.Function
import Mathlib.Analysis.Normed.Module.Basic
import Mathlib.Algebra.Module.Basic

-- Noncomputable section for convenience
noncomputable section
open Classical
end noncomputable section

-- Policy space: a normed vector space over ℝ
variable {Policy : Type} [NormedAddCommGroup Policy] [NormedSpace ℝ Policy]

-- Efficacy function
variable (E : Policy → ℝ)

-- Core concavity theorem: single-parameter t version
theorem discovery_efficacy_tradeoff_formal_statement
  (s : Set Policy)
  (h_convex : Convex ℝ s)
  (h_concave : ConcaveOn ℝ s E) :
  ∀ (x y : Policy), x ∈ s → y ∈ s →
  ∀ (t : ℝ), 0 ≤ t ∧ t ≤ 1 →
  t • E x + (1 - t) • E y ≤ E (t • x + (1 - t) • y) := by
  intros x y hx hy t ht
  -- Define weights
  let a := t
  let b := 1 - t
  -- Proofs that weights are nonnegative
  have ha : 0 ≤ a := ht.1
  have hb : 0 ≤ b := by linarith
  -- Proof that weights sum to 1
  have hsum : a + b = 1 := by linarith
  -- Apply ConcaveOn property
  exact h_concave.right hx hy ha hb hsum

end
