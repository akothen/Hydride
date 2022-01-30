#lang rosette

(require rosette/lib/destruct
         rosette/lib/angelic)

; Because we'll be using regs to index into a
; vector, it is best to make them mutable 
; so they get merged into a union rather than field-wise.
(struct reg (id)   #:transparent #:mutable)
(struct lit (val)  #:transparent)
(struct add (left right) #:transparent)


; Prog is an expression in the above AST.
; env is a vector of values; register
; identifiers must be in the range 0 ... |env| - 1.
(define (interpret prog env)
  (destruct prog
            [(reg id) (vector-ref env id)]
            [(lit val) val]
            [(add left right)
             (+ (interpret left env)
                (interpret right env))]))


(define (grammar vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (define-symbolic* val integer?)
     (lit val)]
    [(choose* #t #f)
     (apply choose* vars)]
    [else
      (add (grammar vars #:depth (- k 1))
           (grammar vars #:depth (- k 1)))]))

(define (cost expr)
  (destruct expr
            [(lit _) 3]
            [(reg _) 5]
            [(add left right)
             (+ 10 (cost left) (cost right))]))

(define-symbolic x y integer?)

(define env (vector x y))

; Get a sketch of depth 3.
(define sketch (grammar (list (reg 0) (reg 1)) #:depth 3))

; This sketch contains programs reg0 + 1 + 1 as well as reg0 + 2.
(define reg0+1+1
  (solve
    (assert
      (equal?
        sketch
        (add (reg 0) (add (lit 1) (lit 1)))))))

(evaluate sketch reg0+1+1)
; (add (reg 0) (add (lit 1) (lit 1)))
(cost (add (reg 0) (add (lit 1) (lit 1))))
; 31

(define reg0+2
  (solve
    (assert
      (equal?
        sketch
        (add (reg 0) (lit 2))))))
(evaluate sketch reg0+2)
; (add (reg 0) (lit 2))
(cost (add (reg 0) (lit 2)))
; 18

; Now, find a program of cost < 20 that adds 2 to reg0.
(define sol
  (synthesize
    #:forall env
    #:guarantee
    (begin
      (assert
        (equal?
          (interpret sketch env)
          (+ x 2)))
      (assert
        (< (cost sketch) 20)))))

(evaluate sketch sol)
;(add (lit 2) (reg 0))


