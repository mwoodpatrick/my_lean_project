import Triangle

def main : IO Unit := do
  IO.println "Testing numbers..."

  -- This will print Success
  test_triangle 3 4 5

  -- This will print Wrong
  test_triangle 4 5 6
