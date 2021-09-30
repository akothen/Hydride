(define (ext-bv x i type-size)
  (define var (extract (+ (* i type-size) (- type-size 1)) (* i type-size) x))
  var)

(define (sign-ext-bv x i type-size target-size)
  (define var (sign-extend (ext-bv x i type-size) (bitvector target-size)))
  var)

(define (zero-ext-bv x i type-size target-size)
  (define var (zero-extend (ext-bv x i type-size) (bitvector target-size)))
  var)

(define (low-ext-bv x i low-size type-size)
  ;;(pretty-print "index")
  ;;(pretty-print i)
  (define var (extract (+ (* i type-size) (- type-size 1)) (* i type-size) x))
  (define low-var (extract low-size 0 var))
  low-var)

(define (sign-low-ext-bv x i low-size type-size target-size)
  (define var (sign-extend (low-ext-bv x i low-size type-size) (bitvector target-size)))
  var)

(define (zero-low-ext-bv x i low-size type-size target-size)
  (define var (zero-extend (low-ext-bv x i low-size type-size) (bitvector target-size)))
  var)
