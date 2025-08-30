import Lake
open Lake DSL

package «theory» where
  -- add package configuration options here

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

@[default_target]
lean_lib «Theory» where
  -- This library's root module is `Theory`
  -- So it corresponds to a file `theory/Theory.lean`
  -- or `theory/Theory/Basic.lean`, etc.
