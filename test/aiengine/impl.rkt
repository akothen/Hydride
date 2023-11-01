#lang rosette

(require racket/pretty)

(define (llvm-vect-add-ra a b start offset num_elems)
  (define dst
    (apply concat
           (for/list ([%it ( reverse (range 0 num_elems 1))])
             (define %id (+ start (bitvector->integer (bit %it offset))))
             (define %exta (bit %id a))
             (define %extb (bit %id b))
             (bvadd %exta %extb))))
  dst)

(define a64 (bv #xaaaaaaaaaaaaaaaa 64))
(define b64 (bv #x5555555555555555 64))
(define offset (bv #x0000000000000000 64))
(define offset_2 (bv #x1000000000000000 64))

(pretty-print "llvm-vect-add-ra:")
(pretty-print (llvm-vect-add-ra a64 b64 0 offset 64)) 

(pretty-print "llvm-vect-add-ra w/ offset:")
(pretty-print (llvm-vect-add-ra a64 b64 0 offset_2 64)) 