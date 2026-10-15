import Mathlib.Data.Real.Basic
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

/-- Interactive SVG diagram matching the geometric dissection layout.
    No comments inside JSX to avoid elaborator token errors. -/
def pythagorasDiagram : Html :=
  <svg viewBox="0 0 460 460" width="380" height="380" xmlns="http://www.w3.org/2000/svg">
    <rect width="460" height="460" fill="#ffffff" />

    <rect x="70" y="70" width="300" height="300"
          fill="#ffffff" stroke="#111111" strokeWidth="8" strokeLinejoin="miter" />

    <polygon points="175,70 370,175 265,370 70,265"
             fill="#b08985" stroke="#111111" strokeWidth="7" strokeLinejoin="miter" />

    <text x="122" y="52" fontFamily="sans-serif" fontSize="24" fontWeight="bold"
          fill="#111111" textAnchor="middle">A</text>
    <text x="272" y="52" fontFamily="sans-serif" fontSize="24" fontWeight="bold"
          fill="#111111" textAnchor="middle">B</text>

    <text x="390" y="130" fontFamily="sans-serif" fontSize="24" fontWeight="bold"
          fill="#111111" textAnchor="start">a</text>
    <text x="390" y="280" fontFamily="sans-serif" fontSize="24" fontWeight="bold"
          fill="#111111" textAnchor="start">b</text>

    <text x="230" y="405" fontFamily="sans-serif" fontSize="24" fontWeight="bold"
          fill="#111111" textAnchor="middle">B</text>
    <text x="330" y="405" fontFamily="sans-serif" fontSize="24" fontWeight="bold"
          fill="#111111" textAnchor="middle">A</text>

    <text x="50" y="180" fontFamily="sans-serif" fontSize="24" fontWeight="bold"
          fill="#111111" textAnchor="end">B</text>
    <text x="50" y="325" fontFamily="sans-serif" fontSize="24" fontWeight="bold"
          fill="#111111" textAnchor="end">A</text>

    <text x="245" y="145" fontFamily="sans-serif" fontSize="24" fontWeight="bold"
          fill="#111111" textAnchor="middle">c</text>
    <text x="135" y="195" fontFamily="sans-serif" fontSize="24" fontWeight="bold"
          fill="#111111" textAnchor="middle">c</text>
    <text x="195" y="315" fontFamily="sans-serif" fontSize="24" fontWeight="bold"
          fill="#111111" textAnchor="middle">c</text>
    <text x="305" y="260" fontFamily="sans-serif" fontSize="24" fontWeight="bold"
          fill="#111111" textAnchor="middle">c</text>
  </svg>

#html pythagorasDiagram

/-!
### Connecting Diagram Geometry to the Formal Verification

The diagram establishes:
1. `area_outer = (a + b) ^ 2` (the bounding square with sides A + B)
2. `area_triangles = 4 * ((a * b) / 2)` (the four white right triangles)
3. `area_inner = c ^ 2` (the brown square formed by hypotenuse c)
-/

/-- Equational proof mapping each geometric region directly to the theorem statement. -/
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
