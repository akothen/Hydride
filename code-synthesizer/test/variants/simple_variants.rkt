#lang rosette 
(require rosette/lib/synthax) 
(require rosette/lib/angelic) 
(require racket/pretty) 
(require data/bit-vector) 
(require rosette/lib/destruct) 
(require rosette/solver/smt/boolector) 
(require hydride) 

;; Uncomment the line below to enable verbose logging 
(enable-debug) 

(current-bitwidth 16) 
(custodian-limit-memory (current-custodian) (* 20000 1024 1024)) 


(define input-sizes (list 1024 1024))
(define input-precs (list 16 16))

(define variants-str (get-variants-with-typeinfo hexagon_V6_vaddhsat_128B_dsl input-sizes input-precs))

(define output-file-name "/tmp/variants_expr.rkt")

(write-str-to-file variants-str output-file-name)
