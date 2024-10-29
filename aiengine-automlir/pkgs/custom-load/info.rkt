#lang info

;; pkg info
(define collection "custom-load")
(define deps '("base"))
(define build-deps '("racket-doc"
                     "scribble-lib"))

;; collection info
(define name "custom-load")
(define scribblings '(["custom-load.scrbl" ()]))
(define compile-omit-paths '("test"))
