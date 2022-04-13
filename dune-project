(lang dune 2.9)
(using menhir 2.1)

(generate_opam_files true)

(package
 (name trivia-lexer)
 (depends
   menhir
   ppx_deriving
   ppx_import
  (ppx_expect :with-test)))
