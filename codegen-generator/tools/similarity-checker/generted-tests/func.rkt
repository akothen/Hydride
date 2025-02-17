#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)

(custodian-limit-memory (current-custodian) (* 10000 1024 1024))
(current-bitwidth 32)

(define-grammar (grammar-func x y)
  [expr ((choose + - *) (choose x y 0 1 2 (expr)) (choose x y 0 1 2 (expr)))]
)

(define-symbolic %a integer?)
(define-symbolic %b integer?)

(define (generate-constraints tests expr-grammar)
  (define (helper i)
    (define test-i (list-ref tests i))
    (define arg0 (list-ref test-i 0))
    (define arg1 (list-ref test-i 1))
    (define output (list-ref test-i 2))
    (assert 
      (if (and (equal? %a arg0) (equal? %b arg1))
        (equal? (expr-grammar %a %b #:depth 2) output)
        #f
      )
    )
  )
  (define num-cex (length tests))
  (define assertions (build-list num-cex helper))
  (print assertions)
  assertions
)

(define (synthesize-param-expression tests)
  (define sol
    ;;(optimize 
    ;;  #:minimize (list (param_abstract:cost expr-grammar))
    ;;  #:guarantee (generate-constraints tests expr-grammar)
    ;;)
    (synthesize
      #:forall (list %a %b)
      #:guarantee (generate-constraints tests grammar-func)
    )
  )
  (print-forms sol)
)

;; Test cases is a list of TEST
(define tests (list(list 2 3 7)  (list 3 4 9)))

(synthesize-param-expression tests)


