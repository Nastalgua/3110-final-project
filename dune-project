(lang dune 3.10)

(name final_project)

(generate_opam_files true)

(source
 (github Nastalgua/3110-final-project))

(authors "I forgot the group name lmao")

(maintainers "Maintainer Name")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name final_project)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends
  ocaml
  dune
  (raylib
   (and
    (>= 0.3.2)
    (< 1.0.0))))
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
