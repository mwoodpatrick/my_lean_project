def test_triangle (a b c : Int) : IO Unit := do
  -- The '==' checks for boolean equality at runtime
  if a^2 + b^2 == c^2 then
    IO.println s!"Success: {a}^2 + {b}^2 = {c}^2 is TRUE"
  else
    IO.println s!"Wrong: {a}^2 + {b}^2 = {c}^2 is FALSE"

