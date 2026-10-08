# my_lean_project

## Lean

Lean is an open-source programming language and proof assistant that enables correct, maintainable, and formally verified code

### Architecture and Self-Hosting

- Lean 3: Written almost entirely in C++. If you wanted to extend the core system, change the parser, or add major compiler features, you had to write C++ code and recompile the binary. Metaprogramming (writing tactics) was done through an internal API layer.
- Lean 4: Self-hosted. The compiler, elaborator, parser, and tactic framework are written in Lean 4 itself. It compiles down to efficient C code, making it both a formal proof assistant and a practical, general-purpose systems programming language.

### Metaprogramming & Macros

- Lean 3: Tactics were written using a specialized monadic interface that was relatively slow and separated from the underlying engine.
- Lean 4: Features a hygienic, syntax-extendable macro system and extensible parser (similar to Racket or Scheme). Users can define custom DSLs (domain-specific languages), notation, and tactics directly in user code with native compiler performance.

### Performance & Memory Model

- Lean 3: Relied heavily on garbage collection within C++ runtime structures, which could struggle with memory limits on large mathematics projects.
- Lean 4: Implements RCU (Reference Counting with reuse) and mutation optimizations (borrow checking/functional in-place updates). Lean 4 runs significantly faster, uses less memory, and allows verified pure functional algorithms to run with mutable in-place speeds.

### Tooling & Ecosystem
- Lean 3: Used leanpkg (which had limited dependency management) and relied on an older community fork (leanprover-community/lean) after core development moved on.
- Lean 4: Uses Lake (Lean Make), a modern, built-in build system and package manager. The IDE support (Language Server Protocol) is fully integrated and much more responsive.

### Mathematics Library (Mathlib)
- In Lean 3, the mathematics library was known as mathlib.
- The entire library (millions of lines of code) was ported to Lean 4 as Mathlib4 (now simply Mathlib). Lean 3 is officially deprecated, and all active research and new mathematical development happen exclusively on Lean 4.

### Extending Lean

The creator of Lean, Leonardo de Moura, and the development team have explicitly stated the following:

1. Lean 4 was the intended destination:
- Lean 1, 2, and 3 were essentially research prototypes where the team experimented with different logical foundations (e.g., Lean 2 had both HoTT and standard CIC options) and metaprogramming approaches.
- Lean 4 was designed to be the "forever architecture"—an extensible, self-hosting platform flexible enough to evolve without requiring another ground-up rewrite.
2. Extensibility prevents the need for a total rewrite:
- Because Lean 4 is self-hosting and features an extensible parser and elaborator, new syntax, tactics, and compiler features can be added via libraries or modular updates without breaking the entire foundation.
3. Stability and the Lean Focused Research Organization (FRO):
- The establishment of the Lean FRO is dedicated to long-term stability, industry use, software engineering scalability, and backwards compatibility. A disruptive "Lean 5" that breaks Mathlib again is the opposite of the community's current goals.
4. Semantic Versioning:
- Updates are delivered through regular releases within the Lean 4.x lifecycle (e.g., v4.8, v4.9, etc.), focusing on compiler optimizations, proof automation, and language stability.

## References

- [Lean: The Programming Language Rewriting Mathematics](https://vplevris.medium.com/lean-the-programming-language-rewriting-mathematics-eca90a4aa167)
- [Lean Website](https://lean-lang.org/)
- [lean4](https://github.com/leanprover/lean4)
- [Lake](https://github.com/leanprover/lean4/blob/master/src/lake/README.md) (Lean make) the new build system and package manager for Lean 4 
[Making a “Hello World” in Lean](https://levelup.gitconnected.com/making-a-hello-world-in-lean-10871f2b93c3)
- [lean.nvim](https://github.com/Julian/lean.nvim)
- [Theorem Proving in Lean 4](https://leanprover.github.io/theorem_proving_in_lean4/)
- [The lean.nvim Manual](https://github.com/Julian/lean.nvim/wiki/The-lean.nvim-Manual)
- [Mathematics in Lean](https://leanprover-community.github.io/mathematics_in_lean/index.html)
- [Functional Programming in Lean](https://lean-lang.org/functional_programming_in_lean/)
- [leanprover-community](https://github.com/leanprover-community)
- [What Is Math’s Mysterious Langlands Program Really About?](https://www.quantamagazine.org/what-is-maths-mysterious-langlands-program-really-about-20260909/?fbclid=IwdGRjcAUUiMdjbGNrBRSIvXBkb2YFZXh0bgNhZW0CMTEAc3J0YwZhcHBfaWQMMzUwNjg1NTMxNzI4AAEeWLamFpKEu_CJw5MOcVECw83D-0cuWWbfapx8KQkMcIpDKCyPkurC_u-L9es_aem_dPpvV0UMSPfARp7n50Ddcw)
- [Lawrence Paulson: AI and Isabelle: experiences and perspectives](https://www.youtube.com/watch?v=nI9hTbLsN4M&t=1832s)
- [exlean](https://exlean.org/)
- [exlean - youtube](https://www.youtube.com/@exlean7708)

## GitHub configuration

To set up your new GitHub repository, follow these steps:

* Under your repository name, click **Settings**.
* In the **Actions** section of the sidebar, click "General".
* Check the box **Allow GitHub Actions to create and approve pull requests**.
* Click the **Pages** section of the settings sidebar.
* In the **Source** dropdown menu, select "GitHub Actions".

After following the steps above, you can remove this section from the README file.
