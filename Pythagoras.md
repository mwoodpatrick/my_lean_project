---
# OKF / AI-XF Frontmatter Metadata
id: math.analysis.pythagoras_algebra
type: mathematical_claim
title: "Pythagorean Identity Expansion"
version: "0.2.0"
status: "verified"
provenance:
  agent: "human-curated"
  checker: "lean4-kernel"
  theory: "Mathlib.Data.Real.Basic"
links:
  - rel: relies_on
    target: math.ring_theory.ring_tactic
    text: "Mathlib Ring Tactic"
  - rel: defines
    target: concept.algebraic_identities
    text: "Algebraic Identities"
---

# Pythagorean Identity Expansion

This node defines and mechanically checks the algebraic expansion needed for the Pythagorean theorem.

See related concepts: [Mathlib Ring Tactic](math.ring_theory.ring_tactic) and [Algebraic Identities](concept.algebraic_identities).

```lean
import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Ring

theorem pythagoras_algebra (a b c : Real) 
    (h : c^2 = (a + b)^2 - 4 * (a * b / 2)) : 
    c^2 = a^2 + b^2 := by
  calc
    c^2 = (a + b)^2 - 4 * (a * b / 2)       := h
    _   = a^2 + 2 * a * b + b^2 - 2 * a * b := by ring
    _   = a^2 + b^2                         := by ring
