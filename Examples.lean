import Mathlib.Basic.Real.Basic
import Mathlib.Data.Nat.Prime.Basic

-- a String is backed by a contiguous, UTF-8 encoded byte buffer (ByteArray).
#check "Hello"
def greeting : String := "Hello"
#eval greeting.length   -- Character count
#eval greeting ++ "!"  -- "Hello!"

def numbers : Array ℕ := #[1, 2, 3, 4]
#check numbers

/-
The FBIP Model (Functional But In-Place)
A defining feature of both String and Array in Lean 4 is how they 
combine pure functional semantics with destructive in-place mutations:

Purely Functional Interface: Logically, operations like Array.push or 
Array.set return a brand-new array.

In-Place Mutation via RC (Reference Counting): At runtime, the Lean 4 
compiler uses reference counting. If an Array or String has a reference
count of 1 (meaning it is used linearly and has no other owners), 
modifying operations mutate the underlying memory block in-place with 
no allocation or copying overhead.
-/

  /- Define some constants. -/

def y : ℚ := 1.25
def x1 : Real := 7
def x : ℝ := 7.0

def m : ℕ := 1       -- m is a natural number
def n : Nat := 0
def b1 : Bool := true  -- b1 is a Boolean
def b2 : Bool := false

/- Check their types. -/

-- Float32 represents a 32-bit single-precision float (equivalent to float in C or f32 in Rust).

#check Float32

-- Float is a 64-Bit Double
#check Float

def f : Float := 3.141592653589793

#eval f * 2.0

abbrev Double := Float

#check Double

#check m
#check n
#check n + 0
#check m * (n + 0)
#check b1-- "&&" is the Boolean and
#check b1 && b2-- Boolean or
#check b1 || b2-- Boolean "true"
#check true/- Evaluate -/

-- Check a function
#check fun x : Nat => x + 1

def xx := fun (x : Nat) => x + 5

#check xx
#eval xx 3

def double (n : Nat) : Nat := n + n
#check double
#eval double 5

#check fun (x : Nat) => x + 1

#check fun x => x + 1

-- In Mathlib and mathematical code, the mapsto arrow ↦ can be used 
-- interchangeably with =>

#check fun (x : Nat) ↦ x + 1

-- For simple single-argument expressions, you can use the compact 
-- bullet notation (typed via \.

#check (· + 1)

-- a function definition for applying another function twice 
-- (higher-order function composition):

def twice (f : Nat → Nat) (n : Nat) : Nat := f (f n)

-- A mathematical propositions—statements (in Lean a Prop) that have a
-- definite truth value (either true or false)—contrasting a trivially
-- verifiable statement with a famous open conjecture.

#check 2 + 2 = 4

-- A number n is even if there exists some k such that n = 2 * k
def IsEven (n : Nat) : Prop :=
  ∃ k : Nat, n = 2 * k

-- A number n is odd if there exists some k such that n = 2 * k + 1
def IsOdd (n : Nat) : Prop :=
  ∃ k : Nat, n = 2 * k + 1

-- 6 is even because 6 = 2 * 3
-- Using anonymous constructor notation
theorem six_is_even : IsEven 6 :=
  ⟨3, rfl⟩

  /-
  Equiavlent to:
  theorem six_is_even : IsEven 6 := by
  use 3   -- Supplies the first element: 3
  rfl     -- Supplies the second element: rfl
  -/

-- 7 is odd because 7 = 2 * 3 + 1
theorem seven_is_odd : IsOdd 7 :=
  ⟨3, rfl⟩

def GoldbachConjecture : Prop :=
  ∀ n : Nat, n > 2 → Even n → ∃ p q : Nat, Nat.Prime p ∧ Nat.Prime q ∧ n = p + q

-- Goldbach's conjecture represents an assertion whose truth value 
-- remains one of mathematics' most famous open questions.
#check GoldbachConjecture

-- Modus Ponens (implication elimination) written in Lean 4 as a 
-- direct proof term:
example (P Q : Prop) (f : P → Q) (hp : P) : Q := f hp

#eval 5 * 4
#eval m + 2
#eval b1 && b2

#check Nat × Nat → Nat

#eval Nat.succ 2

#eval (5, 9).2

#check Nat.add 5 2
#eval Nat.add 5 2

-- α β γ 
#check Type
#check Bool
#check Bool × Bool -> Nat 

#check List
#check List Nat

universe u

def F (α : Type u) : Type u := Prod α α

#check F
-- #eval F 3


/-
λ τ χ ρ ζ α γ δ ε ℝ 
σ 
Σ Β 
-/

example (a b : ℝ) (h : a = b) : a^2 = b^2 := by
  rw [h]

  -- ⊢ ⊨ 

/-
#check uses Lean's Elaborator / Type-checker to verifiy whether 
the expression is syntactically well-formed 
and determines which type universe it lives in.
-/

#check 3 = 5

/-
#eval uses the Interpreter / Lean runtime VM to evaluates a term 
to compute its value. #eval can execute commands in the IO monad, 
allowing you to run side effects (e.g., printing messages, 
reading files) directly in your editor
#eval only works on computable terms. If a definition depends on 
non-constructive axioms (like the Axiom of Choice, classical logic, 
or the mathematical real numbers $\mathbb{R}$), #eval will fail 
because there is no executable code to run.
#eval is meant for development and debugging; top-level # commands 
are interactive and will trigger linter warnings if committed 
inside library files (lean_lib).
#eval uses the [GMP](https://gmplib.org/) library for arbitrary 
precision arithmetic, to operate on signed integers, 
rational numbers, and floating-point numbers. 
-/

#eval 3 = 5
#eval decide (2 + 2 = 4) -- true

/-
#reduce evaluates an expression using Lean's symbolic reduction engine
(the elaborator's reduction framework and the kernel's definitional equality checker).
Unlike #eval—which compiles down to bytecode or native machine code 
via Lean’s compiler/runtime VM and erases proofs—#reduce:Operates 
directly on the typed Abstract Syntax Tree ($\lambda$-calculus terms).
Applies the foundational reduction rules of the Calculus of Inductive 
Constructions (CIC):$\beta$-reduction: Function application 
($(\lambda x. t) u \to t[u/x]$).$\delta$-reduction: Transparent 
definition unfolding.$\iota$-reduction: Inductive type recursor 
elimination.$\zeta$-reduction: Inlining let bindings.Normalizes open 
terms, propositions, types, and proof terms, which the native #eval 
runtime cannot inspect.
#reduce can Be very slow evaluating #reduce 1000 + 1000 forces 
the kernel/elaborator to construct and normalize an expression 
with 2,000 nested Nat.succ constructor calls
-/

#reduce decide (True ∨ False)
#reduce decide (True ∧ False)

-- Proving arithmetic inequalities and equations:
theorem small_arith : 123 + 456 = 579 := by
  decide

-- Proving negations / disequalities:
theorem three_ne_five : 3 ≠ 5 := by
  decide

-- Proving bounded or finite properties:
theorem prime_seventeen : Nat.Prime 17 := by
  decide

#eval decide (Nat.Prime 17)

#eval decide (Nat.Prime 1025)

def bignum : ℕ := 10257757
#eval decide (Nat.Prime bignum)
#eval Nat.minFac bignum 
def factor : ℕ := Nat.minFac bignum 
#eval bignum / factor


