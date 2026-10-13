import Mathlib.Basic.Real.Basic

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
#eval F 3

def xx := fun (x : Nat) => x + 5

#check xx
#eval xx 3

λ
λ 
τ 
χ ρ ζ α γ δ ε ℝ 

--- ∀∃ℝ→:³¹²⁸2⁵=32℻∀ℕ
