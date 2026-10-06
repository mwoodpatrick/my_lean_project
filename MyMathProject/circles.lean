import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Ring

/-!
# Circles example

This module compares the circumferance of three circles

## Tags

algebra, real

## References

[Making a “Hello World” in Lean](https://levelup.gitconnected.com/making-a-hello-world-in-lean-10871f2b93c3

-/

theorem circles (a b l1 l2 : Real)
    (h1 : l1 = π * (a + b) / 2)
    (h2 : l2 = π * a / 2 + π * b / 2) :
    l1 = l2 := by
  -- Substitute l1, goal becomes: π * (a + b) / 2 = l2
  rw [h1]
  -- Substitute l2, goal becomes: π * (a + b) / 2 = π * a / 2 + π * b / 2
  rw [h2]
  ring
