import Mathlib.Basic.Real.Basic
import ProofWidgets.Component.HtmlDisplay

-- Correctly bring the JSX scope into context:
open scoped ProofWidgets.Jsx

namespace SvgTest

open ProofWidgets

/-- A vector graphic widget tested via the Infoview. -/
def sampleSvgWidget : Html :=
  <svg viewBox="0 0 200 200" width="150" height="150">
    <circle cx="100" cy="100" r="80" fill="#2b303c" stroke="#61afef" strokeWidth="6" />
    <rect x="60" y="60" width="80" height="80" fill="none" stroke="#98c379" strokeWidth="4"
          transform="rotate(45 100 100)" />
    <circle cx="100" cy="100" r="8" fill="#e06c75" />
    <text x="100" y="105" fontFamily="sans-serif" fontSize="14" fill="#abb2bf"
          textAnchor="middle">
      Lean 4
    </text>
  </svg>

#html sampleSvgWidget

#eval 2 + 2

theorem vector_graphics_test : 2 + 2 = 4 := by
  rfl

end SvgTest
