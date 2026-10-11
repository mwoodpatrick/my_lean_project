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

Embedded OKF / AI-XF Frontmatter Metadata
---
id: math.analysis.pythagoras_algebra
type: formal_proof
title: "Pythagorean Expansion"
version: "0.2.0"
status: "verified"
provenance:
  agent: "human-curated"
  checker: "lean4-kernel"
  theory: "Mathlib.Data.Real.Basic"
links:
  - rel: verifies
    target: claim.pythagoras_lemma
  - rel: relies_on
    target: math.ring_theory.ring_tactic
    text: "Mathlib Ring Tactic"
  - rel: defines
    target: concept.algebraic_identities
    text: "Algebraic Identities"
-/

theorem pythagoras_algebra (a b c : Real)
    (h : c ^ 2 = (a + b) ^ 2 - 4 * (a * b / 2)) : c ^ 2 = a ^ 2 + b ^ 2 := by
  calc
    c ^ 2 = (a + b) ^ 2 - 4 * (a * b / 2)       := h
    _     = a ^ 2 + 2 * a * b + b ^ 2 - 2 * a * b := by ring
    _     = a ^ 2 + b ^ 2                         := by ring
