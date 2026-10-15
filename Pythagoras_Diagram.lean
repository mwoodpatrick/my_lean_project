import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Ring
import ProofWidgets.Component.HtmlDisplay

open scoped ProofWidgets.Jsx
open ProofWidgets

set_option linter.hashCommand false

/-- Interactive SVG diagram for the Pythagorean Theorem -/
def pythagorasDiagram : Html :=
  <svg viewBox="0 0 340 340" width="320" height="320" xmlns="http://www.w3.org/2000/svg">
    <rect x="25" y="25" width="280" height="280"
          fill="#f8fafc" stroke="#334155" strokeWidth="2.5" rx="4" />
    <polygon points="25,25 215,25 25,115"
             fill="#93c5fd" stroke="#1d4ed8" strokeWidth="1.5" />
    <polygon points="215,25 305,25 305,215"
             fill="#60a5fa" stroke="#1d4ed8" strokeWidth="1.5" />
    <polygon points="305,215 305,305 115,305"
             fill="#93c5fd" stroke="#1d4ed8" strokeWidth="1.5" />
    <polygon points="115,305 25,305 25,115"
             fill="#60a5fa" stroke="#1d4ed8" strokeWidth="1.5" />
    <polygon points="215,25 305,215 115,305 25,115"
             fill="#fef08a" stroke="#ca8a04" strokeWidth="2.5" />
    <text x="120" y="18" fontFamily="sans-serif" fontSize="14" fontWeight="bold"
          fill="#0f172a" textAnchor="middle">a</text>
    <text x="260" y="18" fontFamily="sans-serif" fontSize="14" fontWeight="bold"
          fill="#0f172a" textAnchor="middle">b</text>
    <text x="14" y="70" fontFamily="sans-serif" fontSize="14" fontWeight="bold"
          fill="#0f172a" textAnchor="middle">b</text>
    <text x="14" y="210" fontFamily="sans-serif" fontSize="14" fontWeight="bold"
          fill="#0f172a" textAnchor="middle">a</text>
    <text x="165" y="165" fontFamily="sans-serif" fontSize="22" fontWeight="bold"
          fill="#854d0e" textAnchor="middle">c²</text>
    <text x="165" y="188" fontFamily="sans-serif" fontSize="12"
          fill="#a16207" textAnchor="middle">Area = c²</text>
    <text x="88" y="58" fontFamily="sans-serif" fontSize="11"
          fill="#1e3a8a" textAnchor="middle">ab / 2</text>
  </svg>

#html pythagorasDiagram
