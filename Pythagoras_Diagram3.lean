import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Ring
import ProofWidgets.Component.HtmlDisplay

open scoped ProofWidgets.Jsx
open ProofWidgets

set_option linter.hashCommand false

/-!
# Pythagorean Theorem: Visual Dissection & Formal Connection

Outer square side length : (a + b)
Inner square side length : c
Outer area decomposition : Area(outer) = 4 * Area(triangle) + Area(inner)
                         (a + b)^2 = 4 * (ab / 2) + c^2
-/

/-- Interactive SVG diagram with explicit, clear side-length labels. -/
def pythagorasDiagram : Html :=
  <svg viewBox="0 0 520 520" width="400" height="400" xmlns="http://www.w3.org/2000/svg">
    <rect width="520" height="520" fill="#ffffff" />
    <rect x="100" y="100" width="300" height="300"
          fill="#ffffff" stroke="#111111" strokeWidth="6" strokeLinejoin="miter" />
    <polygon points="205,100 400,205 295,400 100,295"
             fill="#b08985" stroke="#111111" strokeWidth="5" strokeLinejoin="miter" />
    <text x="152" y="80" fontFamily="sans-serif" fontSize="26" fontWeight="bold"
          fill="#111111" textAnchor="middle">A</text>
    <text x="302" y="80" fontFamily="sans-serif" fontSize="26" fontWeight="bold"
          fill="#111111" textAnchor="middle">B</text>
    <text x="430" y="160" fontFamily="sans-serif" fontSize="26" fontWeight="bold"
          fill="#111111" textAnchor="start">a</text>
    <text x="430" y="310" fontFamily="sans-serif" fontSize="26" fontWeight="bold"
          fill="#111111" textAnchor="start">b</text>
    <text x="195" y="440" fontFamily="sans-serif" fontSize="26" fontWeight="bold"
          fill="#111111" textAnchor="middle">B</text>
    <text x="345" y="440" fontFamily="sans-serif" fontSize="26" fontWeight="bold"
          fill="#111111" textAnchor="middle">A</text>
    <text x="70" y="205" fontFamily="sans-serif" fontSize="26" fontWeight="bold"
          fill="#111111" textAnchor="end">B</text>
    <text x="70" y="355" fontFamily="sans-serif" fontSize="26" fontWeight="bold"
          fill="#111111" textAnchor="end">A</text>
    <text x="290" y="170" fontFamily="sans-serif" fontSize="26" fontWeight="bold"
          fill="#111111" textAnchor="middle">c</text>
    <text x="170" y="215" fontFamily="sans-serif" fontSize="26" fontWeight="bold"
          fill="#111111" textAnchor="middle">c</text>
    <text x="210" y="335" fontFamily="sans-serif" fontSize="26" fontWeight="bold"
          fill="#111111" textAnchor="middle">c</text>
    <text x="330" y="290" fontFamily="sans-serif" fontSize="26" fontWeight="bold"
          fill="#111111" textAnchor="middle">c</text>
  </svg>

#html pythagorasDiagram

/-!
### Formal Proof Connected to Diagram Elements

The labels above map directly to the geometric quantities:
* `(a + b) ^ 2` : Total area of the outer square with sides partitioned into segments `a` and `b`.
* `4 * ((a * b) / 2)` : Total area of the four white right triangles of legs `a` and `b`.
* `c ^ 2` : Area of the tilted brown inner square with side length `c`.
-/

theorem pythagoras_from_dissection (a b c : ℝ)
    (h_dissection : (a + b) ^ 2 = c ^ 2 + 4 * ((a * b) / 2)) :
    a ^ 2 + b ^ 2 = c ^ 2 := by
  have h_four_triangles : 4 * ((a * b) / 2) = 2 * a * b := by ring
  have h_outer_square : (a + b) ^ 2 = a ^ 2 + 2 * a * b + b ^ 2 := by ring
  calc
    a ^ 2 + b ^ 2 = (a ^ 2 + 2 * a * b + b ^ 2) - 2 * a * b := by ring
    _             = (a + b) ^ 2 - 2 * a * b                  := by rw [← h_outer_square]
    _             = (a + b) ^ 2 - 4 * ((a * b) / 2)          := by rw [← h_four_triangles]
    _             = (c ^ 2 + 4 * ((a * b) / 2)) - 4 * ((a * b) / 2) := by rw [h_dissection]
    _             = c ^ 2                                    := by ring
