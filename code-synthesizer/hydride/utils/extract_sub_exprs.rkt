#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require hydride/halide)
(require hydride/utils/misc)
(require hydride/synthesis/python)

;; This file provides utilities to extract and
;; hash expressions at a given window depth
;; and write it to file. This can be used
;; to study how many sub-expressions are common across benchmarks


(provide (all-defined-out))




(define (write-expression-hashes expr input-file-name input-list-name output-file-name output-list-name depth)
  
  (define input-list 
    (cond 
      [(equal? input-file-name "")
       (list)
       ]
      [else
        (import-synth-map input-file-name input-list-name)
        ]
      )
    )

  (define new-exprs (halide:extract-sub-expressions expr depth))

  (define merge (append input-list new-exprs))
  
  (define header "#lang rosette")
  (define imports "(require hydride)")
  (define exports "(provide (all-defined-out))")

  (define file-header-contents (string-append header "\n" imports "\n" exports "\n"))

  (define list-str (string-append "(define " output-list-name "\n" (~v merge) "\n" ")"))

  (define file-contents (string-append file-header-contents list-str))
  (write-str-to-file file-contents output-file-name)
  
  )


