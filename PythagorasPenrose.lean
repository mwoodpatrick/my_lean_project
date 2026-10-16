import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Ring
import ProofWidgets.Component.PenroseDisplay
import ProofWidgets.Component.HtmlDisplay

open scoped ProofWidgets.Jsx
open ProofWidgets

-- Disables the hash-command linter for interactive #html inspection
set_option linter.hashCommand false

/-!
# Pythagorean Theorem with ProofWidgets4 & Penrose

This module defines a Penrose diagram (Domain, Substance, Style)
illustrating the geometric interpretation of Pythagoras's theorem
(Euclid I.47: squares constructed on the legs and hypotenuse)
and renders it directly inside the Lean Infoview panel.
-/

/-- Penrose Domain: Declares abstract mathematical entities. -/
def pythagorasDsl : String := "
type Triangle
type Square

constructor RightTriangle() -> Triangle
constructor SquareA(Triangle t) -> Square
constructor SquareB(Triangle t) -> Square
constructor SquareC(Triangle t) -> Square
"

/-- Penrose Substance: Specific objects representing the theorem configuration. -/
def pythagorasSub : String := "
Triangle T
Square A
Square B
Square C

A := SquareA(T)
B := SquareB(T)
C := SquareC(T)
"

/-- Penrose Style: Geometry, coordinate mappings, colors, and equation labels. -/
def pythagorasSty : String := "
canvas {
  width = 460
  height = 460
}

Triangle `T` {
  -- Right triangle with vertices O(-30,-30), A(90,-30), B(-30,60)
  -- Leg a = 120, leg b = 90, hypotenuse c = 150
  shape shape = Polygon {
    points: [(-30.0, -30.0), (90.0, -30.0), (-30.0, 60.0)]
    fillColor: rgba(0.93, 0.95, 0.98, 1.0)
    strokeColor: rgba(0.12, 0.15, 0.2, 1.0)
    strokeWidth: 3.0
  }
}

Square `A` {
  -- Square erected outwards on horizontal leg a (side length 120)
  shape shape = Polygon {
    points: [(-30.0, -30.0), (90.0, -30.0), (90.0, -150.0), (-30.0, -150.0)]
    fillColor: rgba(0.58, 0.77, 0.99, 0.75)
    strokeColor: rgba(0.11, 0.31, 0.85, 1.0)
    strokeWidth: 2.5
  }
  shape label = Equation {
    string: \"a^2\"
    center: (30.0, -90.0)
    fontSize: \"18px\"
  }
}

Square `B` {
  -- Square erected outwards on vertical leg b (side length 90)
  shape shape = Polygon {
    points: [(-30.0, -30.0), (-120.0, -30.0), (-120.0, 60.0), (-30.0, 60.0)]
    fillColor: rgba(0.38, 0.65, 0.98, 0.75)
    strokeColor: rgba(0.11, 0.31, 0.85, 1.0)
    strokeWidth: 2.5
  }
  shape label = Equation {
    string: \"b^2\"
    center: (-75.0, 15.0)
    fontSize: \"18px\"
  }
}

Square `C` {
  -- Square erected outwards on hypotenuse c (side length 150)
  shape shape = Polygon {
    points: [(90.0, -30.0), (180.0, 90.0), (60.0, 180.0), (-30.0, 60.0)]
    fillColor: rgba(0.99, 0.94, 0.54, 0.8)
    strokeColor: rgba(0.79, 0.54, 0.02, 1.0)
    strokeWidth: 2.5
  }
  shape label = Equation {
    string: \"c^2 = a^2 + b^2\"
    center: (75.0, 75.0)
    fontSize: \"18px\"
  }
}
"

/-- ProofWidgets Penrose display component. -/
def pythagorasPenroseWidget : Html :=
  <PenroseDisplay
    embedDsl={pythagorasDsl}
    embedSub={pythagorasSub}
    embedSty={pythagorasSty} />

-- Place cursor on this line in VS Code or Neovim Infoview to render the diagram:
#html pythagorasPenroseWidget

/-!
### Theorem Formulation Matching the Diagram
-/

/-- Equational formulation of the area relation Area(C) = Area(A) + Area(B). -/
theorem pythagoras_areas (a b c : ℝ) (area_A area_B area_C : ℝ)
    (hA : area_A = a ^ 2)
    (hB : area_B = b ^ 2)
    (hC : area_C = c ^ 2)
    (h_sum : area_C = area_A + area_B) :
    a ^ 2 + b ^ 2 = c ^ 2 := by
  calc
    a ^ 2 + b ^ 2 = area_A + area_B := by rw [hA, hB]
    _             = area_C          := by rw [h_sum]
    _             = c ^ 2           := by rw [hC]
