import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Ring

/-!
# Pythagorean Identity Lemma

This module formalizes an algebraic identity underlying the geometric
proof of the Pythagorean theorem via expansion of $(a + b)^2$.

## Main Declarations

* `pythagoras_algebra`: An equational proof using `calc` and `ring`.

## Tags

algebra, pythagoras, real

## References

[Making a “Hello World” in Lean](https://levelup.gitconnected.com/making-a-hello-world-in-lean-10871f2b93c3

-/

theorem pythagoras_algebra (a b c : Real)
    (h : c ^ 2 = (a + b) ^ 2 - 4 * (a * b / 2)) : c ^ 2 = a ^ 2 + b ^ 2 := by
  calc
    c ^ 2 = (a + b) ^ 2 - 4 * (a * b / 2)       := h
    _     = a ^ 2 + 2 * a * b + b ^ 2 - 2 * a * b := by ring
    _     = a ^ 2 + b ^ 2                         := by ring
