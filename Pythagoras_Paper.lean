import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Ring
/-!
# The Pythagorean Theorem: History, Intuition, and Formal Verification
This module provides a self-contained, human-readable exposition and formalization
of the Pythagorean Theorem in Lean 4.
---
## 1. Historical Context
The invariant relation $a^2 + b^2 = c^2$ between the legs and hypotenuse of a right
triangle is named after **Pythagoras of Samos** (c. 570–495 BCE), yet understanding
of this relationship was developed independently across ancient civilizations:

* **Old Babylonia (c. 1800–1600 BCE):** The clay tablet *Plimpton 322* tabulates
  Pythagorean triples, indicating algorithmic knowledge of right-triangle relations.
* **Ancient India (c. 800–500 BCE):** The *Śulba Sūtras* (notably Baudhāyana)
  state that the area produced by the diagonal of a rectangle equals the sum of the
  areas produced by its sides.
* **Ancient China (c. 1000 BCE–200 CE):** The *Zhoubi Suanjing* contains the
  *Gougu theorem*, proving the relation through geometric square dissection.
* **Classical Greece (c. 300 BCE):** Euclid's *Elements* (Book I, Proposition 47)
  presents a synthetic proof using area-preserving shears of squares erected on each side.

---
## 2. Informal Proof: Geometric Dissection
Consider a large bounding square of side length $(a + b)$ containing four congruent
right triangles with legs $a$ and $b$, and hypotenuse $c$:
+-----------------------------+
| \ a / |
| \ / |
| b \ c / |
| \ / |
| \ / |
| c \ / c |
| \ / |
| / \ |
| / \ |
| / c \ |
| / \ b |
| / \ |
| / a \ |
+-----------------------------+

1. **Total Area of Outer Square:**
   $$\text{Area}_{\text{outer}} = (a + b)^2$$
2. **Sum of Internal Components:**
   The square is partitioned into:
   * 4 right triangles, each with area $\frac{1}{2}ab$
   * 1 inner quadrilateral with four sides of length $c$
Because the acute angles of each triangle sum to $90^\circ$, each interior angle
   of the inner quadrilateral is $180^\circ - 90^\circ = 90^\circ$, making it a true
   square of area $c^2$.
3. **Area Decomposition Equation:**
   $$(a + b)^2 = c^2 + 4 \cdot \left(\frac{a \cdot b}{2}\right)$$
4. **Isolating $c^2$:**
   $$c^2 = (a + b)^2 - 2ab = a^2 + 2ab + b^2 - 2ab = a^2 + b^2$$
-/
/-!
## 3. Formal Proof I: Algebraic Equational Reasoning
We formally prove that the geometric difference identity algebraically reduces
to $a^2 + b^2$ using explicit step-by-step `calc` reasoning.
-/
/-- The algebraic identity underlying the geometric square dissection proof. -/
theorem pythagoras_algebraic_dissection (a b c : ℝ)
    (h_area : c ^ 2 = (a + b) ^ 2 - 4 * ((a * b) / 2)) :
    c ^ 2 = a ^ 2 + b ^ 2 := by
  calc
    c ^ 2 = (a + b) ^ 2 - 4 * ((a * b) / 2)         := h_area
    _     = (a ^ 2 + 2 * a * b + b ^ 2) - 2 * a * b := by ring
    _     = a ^ 2 + b ^ 2                           := by ring

/-!
## 4. Formal Proof II: Analytic Geometry in ℝ²

We place a right triangle on the Euclidean plane $\mathbb{R}^2$ with its right angle
at the origin $(0, 0)$ and legs along the coordinate axes:
* Origin $O = (0, 0)$
* Leg vertex $A = (a, 0)$
* Leg vertex $B = (0, b)$
-/
/-- The squared Euclidean distance between two points in ℝ × ℝ. -/
def distSq (p q : ℝ × ℝ) : ℝ :=
  (p.1 - q.1) ^ 2 + (p.2 - q.2) ^ 2

/-- The Pythagorean Theorem in analytic plane geometry:
    The squared distance between vertices A and B equals the sum of the squared legs. -/
theorem pythagoras_euclidean (a b : ℝ) :
    let O : ℝ × ℝ := (0, 0)
    let A : ℝ × ℝ := (a, 0)
    let B : ℝ × ℝ := (0, b)
    distSq O A = a ^ 2 ∧
    distSq O B = b ^ 2 ∧
    distSq A B = a ^ 2 + b ^ 2 := by
  intro O A B
  refine ⟨?_, ?_, ?_⟩
  · -- Leg 1: distSq O A = a^2
    dsimp [distSq, O, A]
    ring
  · -- Leg 2: distSq O B = b^2
    dsimp [distSq, O, B]
    ring
  · -- Hypotenuse: distSq A B = a^2 + b^2
    dsimp [distSq, A, B]
    calc
      (a - 0) ^ 2 + (0 - b) ^ 2 = a ^ 2 + (-b) ^ 2 := by ring
      _                         = a ^ 2 + b ^ 2     := by ring


