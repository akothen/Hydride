#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)

;; Function to extract a bitvector
;; depending on the given type size
(define (ext-bv x i type-size)
  (define var (extract (+ (* i type-size) (- type-size 1)) (* i type-size) x))
  var)

(define (sign-ext-bv x i type-size target-size)
  (define var (sign-extend (ext-bv x i type-size) (bitvector target-size)))
  var)

(define (zero-ext-bv x i type-size target-size)
  (define var (zero-extend (ext-bv x i type-size) (bitvector target-size)))
  var)



(define a128 (bv #xf001f001f001f001f001f001f001f001 128))
(define b128 (bv #x10021003100210031002100310021003 128))
(define c128 (bv #x00030004000300040003000400030004 128))
(define d128 (bv #x00040004000400040004000400040004 128))
(define e128 (bv #x7fffffff7fffffff7fffffff7fffffff 128))

;;; TODO	Neon	int8x16_t	vaddq_s8	(int8x16_t a, int8x16_t b)	Vector arithmetic / Add / Addition
;;; Description
;;; Add (vector). This instruction adds corresponding elements in the two source SIMD&FP registers, places the results into a vector, and writes the vector to the destination SIMD&FP register.
;;; Results
;;; Vd.16B  result
;;; This intrinsic compiles to the following instructions:
;;; ADD Vd.16B,Vn.16B,Vm.16B

;;; Argument Preparation
;;; a  register: Vn.16B
;;; b  register: Vm.16B
;;; Architectures
;;; v7, A32, A64
;;; Operation

;;; CheckFPAdvSIMDEnabled64();
;;; bits(datasize) operand1 = V[n];
;;; bits(datasize) operand2 = V[m];
;;; bits(datasize) result;
;;; bits(esize) element1;
;;; bits(esize) element2;

;;; for e = 0 to elements-1
;;;     element1 = Elem[operand1, e, esize];
;;;     element2 = Elem[operand2, e, esize];
;;;     if sub_op then
;;;         Elem[result, e, esize] = element1 - element2;
;;;     else
;;;         Elem[result, e, esize] = element1 + element2;

;;; V[d] = result;
(define (ADD operand1 operand2 datasize esize elements sub_op)
  (assume ((bitvector datasize) operand1))
  (assume ((bitvector datasize) operand2))
  (define result
    (apply
     concat (for/list ([e (reverse (range elements))])
              (define element1 (ext-bv operand1 e esize))
              (define element2 (ext-bv operand2 e esize))
              (define res (if sub_op
                              (bvsub element1 element2)
                              (bvadd element1 element2)))
              res)))
  (assert ((bitvector datasize)result))
  result)
(define (vaddq_s8 a b) (ADD a b 128 8 16 #f))
(define (vaddq_u32 a b) (ADD a b 128 32 4 #f))
;;; (vaddq_s8 a128 b128)
(assert (eq? (vaddq_s8 a128 b128) c128))
(assert (eq? (vaddq_u32 a128 b128) d128))

;;; TODO Neon	uint32x4_t	vsqaddq_u32	(uint32x4_t a, int32x4_t b)	Vector arithmetic / Add / Saturating addition
;;; Description
;;; Unsigned saturating Accumulate of Signed value. This instruction adds the signed integer values of the vector elements in the source SIMD&FP register to corresponding unsigned integer values of the vector elements in the destination SIMD&FP register, and accumulates the resulting unsigned integer values with the vector elements of the destination SIMD&FP register.
;;; Results
;;; Vd.4S  result
;;; This intrinsic compiles to the following instructions:
;;; USQADD Vd.4S,Vn.4S

;;; Argument Preparation
;;; a  register: Vd.4S
;;; b  register: Vn.4S
;;; Architectures
;;; A64
;;; Operation

;;; CheckFPAdvSIMDEnabled64();
;;; bits(datasize) operand = V[n];
;;; bits(datasize) result;

;;; bits(datasize) operand2 = V[d];
;;; integer op1;
;;; integer op2;
;;; boolean sat;

;;; for e = 0 to elements-1
;;;     op1 = Int(Elem[operand, e, esize], !unsigned);
;;;     op2 = Int(Elem[operand2, e, esize], unsigned);
;;;     (Elem[result, e, esize], sat) = SatQ(op1 + op2, esize, unsigned);
;;;     if sat then FPSR.QC = '1';
;;; V[d] = result;
(define (UnsignedSatQ i N)
  (define p(cond [(> i (- (arithmetic-shift 1 N) 1))
                  (cons (- (arithmetic-shift 1 N) 1) #t)]
                 [(< i 0) (cons 0 #t)]
                 [else (cons i #f)]))
  (define result (car p))
  (define sat (cdr p))
  (cons (integer->bitvector result (bitvector N)) sat)
  )
(define (SignedSatQ i N)
  (define p (cond [(> i (- (arithmetic-shift 1 (- N 1)) 1))
                   (cons (- (arithmetic-shift 1 (- N 1)) 1) #t)]
                  [(< i (- (arithmetic-shift 1 (- N 1))))
                   (cons - (arithmetic-shift 1 (- N 1)) #t)]
                  [else (cons i #f)]))
  (define result (car p))
  (define sat (cdr p))
  (cons (integer->bitvector result (bitvector N)) sat)
  )
(define (SatQ i N unsigned)
  (if (equal? unsigned 1)
      (UnsignedSatQ i N)
      (SignedSatQ i N)
      ))
(define (Int i unsigned)
  (if unsigned (bitvector->natural i) (bitvector->integer i)))

(define (USQADD operand1 operand2 datasize esize elements unsigned)
  (assume ((bitvector datasize) operand1))
  (assume ((bitvector datasize) operand2))
  (define result
    (apply
     concat (for/list ([e (reverse (range elements))])
              (define op1 (Int (ext-bv operand1 e esize) (not unsigned)))
              (define op2 (Int (ext-bv operand2 e esize) unsigned))
              ;;; (display (list op1 op2))
              (define p (SatQ (+ op1 op2) esize unsigned))
              (car p))))
  (assert ((bitvector datasize) result))
  result)
(define (SUQADD operand1 operand2 datasize esize elements unsigned)
  (assume ((bitvector datasize) operand1))
  (assume ((bitvector datasize) operand2))
  (define result
    (apply
     concat (for/list ([e (reverse (range elements))])
              (define op1 (Int (ext-bv operand1 e esize) (not unsigned)))
              (define op2 (Int (ext-bv operand2 e esize) unsigned))
              (define p (SatQ (+ op1 op2) esize unsigned))
              (car p))))
  (assert ((bitvector datasize) result))
  result)
(define (vsqaddq_u32 a b) (USQADD a b 128 32 4 #t))
(define (vuqaddq_s32 a b) (SUQADD a b 128 32 4 #f))

(assert (eq? (vsqaddq_u32 a128 b128) d128))
(assert (eq? (vuqaddq_s32 a128 b128) e128))

;;; TODO	Neon	float16x4_t	vmulx_laneq_f16	(float16x4_t a, float16x8_t v, const int lane)	Vector arithmetic / Multiply / Multiply extended
;;; Description
;;; Floating-point Multiply extended. This instruction multiplies corresponding floating-point values in the vectors of the two source SIMD&FP registers, places the resulting floating-point values in a vector, and writes the vector to the destination SIMD&FP register.
;;; Results
;;; Vd.4H  result
;;; This intrinsic compiles to the following instructions:
;;; FMULX Vd.4H,Vn.4H,Vm.H[lane]

;;; Argument Preparation
;;; a  register: Vn.4H
;;; v  register: Vm.8H
;;; lane  minimum: 0; maximum: 7
;;; Architectures
;;; A64
;;; Operation

;;; CheckFPAdvSIMDEnabled64();
;;; bits(datasize) operand1 = V[n];
;;; bits(datasize) operand2 = V[m];

;;; bits(esize) element1;
;;; bits(esize) element2;
;;; FPCRType fpcr    = FPCR[];
;;; boolean merge    = elements == 1 && IsMerging(fpcr);
;;; bits(128) result = if merge then V[n] else Zeros();

;;; for e = 0 to elements-1
;;;     element1 = Elem[operand1, e, esize];
;;;     element2 = Elem[operand2, e, esize];
;;;     Elem[result, e, esize] = FPMulX(element1, element2, fpcr);
;;; V[d] = result;

;;; TODO  Neon	int32x4_t	vqrdmlshq_laneq_s32	(int32x4_t a, int32x4_t b, int32x4_t v, const int lane)	Vector arithmetic / Multiply / Saturating multiply-accumulate by element
;;; Description
;;; Signed Saturating Rounding Doubling Multiply Subtract returning High Half (vector). This instruction multiplies the vector elements of the first source SIMD&FP register with the corresponding vector elements of the second source SIMD&FP register without saturating the multiply results, doubles the results, and subtracts the most significant half of the final results from the vector elements of the destination SIMD&FP register. The results are rounded.
;;; Results
;;; Vd.4S  result
;;; This intrinsic compiles to the following instructions:
;;; SQRDMLSH Vd.4S,Vn.4S,Vm.S[lane]

;;; Argument Preparation
;;; a  register: Vd.2S
;;; b  register: Vn.2S
;;; v  register: Vm.4S
;;; lane  minimum: 0; maximum: 3
;;; Architectures
;;; A64
;;; Operation

;;; CheckFPAdvSIMDEnabled64();
;;; bits(datasize) operand1 = V[n];
;;; bits(datasize) operand2 = V[m];
;;; bits(datasize) operand3 = V[d];
;;; bits(datasize) result;
;;; integer rounding_const = if rounding then 1 << (esize - 1) else 0;
;;; integer element1;
;;; integer element2;
;;; integer element3;
;;; integer product;
;;; boolean sat;

;;; for e = 0 to elements-1
;;;     element1 = SInt(Elem[operand1, e, esize]);
;;;     element2 = SInt(Elem[operand2, e, esize]);
;;;     element3 = SInt(Elem[operand3, e, esize]);
;;;     if sub_op then
;;;         accum = ((element3 << esize) - 2 * (element1 * element2) + rounding_const);
;;;     else
;;;         accum = ((element3 << esize) + 2 * (element1 * element2) + rounding_const);
;;;     (Elem[result, e, esize], sat) = SignedSatQ(accum >> esize, esize);
;;;     if sat then FPSR.QC = '1';

;;; V[d] = result;


;;; TODO	Neon	int8x8_t	vld1_lane_s8	(int8_t const * ptr, int8x8_t src, const int lane)	Load / Stride
;;; Description
;;; Load multiple single-element structures to one, two, three, or four registers. This instruction loads multiple single-element structures from memory and writes the result to one, two, three, or four SIMD&FP registers.
;;; Results
;;; Vt.8B  result
;;; This intrinsic compiles to the following instructions:
;;; LD1 {Vt.b}[lane],[Xn]

;;; Argument Preparation
;;; ptr  register: Xn
;;; src  register: Vt.8B
;;; lane  minimum: 0; maximum: 7
;;; Architectures
;;; v7, A32, A64
;;; Operation

;;; CheckFPAdvSIMDEnabled64();

;;; bits(64) address;
;;; bits(64) offs;
;;; bits(datasize) rval;
;;; integer tt;
;;; constant integer ebytes = esize DIV 8;

;;; if HaveMTE2Ext() then
;;;     SetTagCheckedInstruction(tag_checked);

;;; if n == 31 then
;;;     CheckSPAlignment();
;;;     address = SP[];
;;; else
;;;     address = X[n];

;;; offs = Zeros();
;;; for r = 0 to rpt-1
;;;     for e = 0 to elements-1
;;;         tt = (t + r) MOD 32;
;;;         for s = 0 to selem-1
;;;             rval = V[tt];
;;;             if memop == MemOp_LOAD then
;;;                 Elem[rval, e, esize] = Mem[address + offs, ebytes, AccType_VEC];
;;;                 V[tt] = rval;
;;;             else // memop == MemOp_STORE
;;;                 Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, e, esize];
;;;             offs = offs + ebytes;
;;;             tt = (tt + 1) MOD 32;

;;; if wback then
;;;     if m != 31 then
;;;         offs = X[m];
;;;     if n == 31 then
;;;         SP[] = address + offs;
;;;     else
;;;         X[n] = address + offs;

;;; 	Neon	void	vst1_s8	(int8_t * ptr, int8x8_t val)	Store / Stride
;;; Description
;;; Store multiple single-element structures from one, two, three, or four registers. This instruction stores elements to memory from one, two, three, or four SIMD&FP registers, without interleaving. Every element of each register is stored.
;;; Results
;;; void  result
;;; This intrinsic compiles to the following instructions:
;;; ST1 {Vt.8B},[Xn]

;;; Argument Preparation
;;; ptr  register: Xn
;;; val  register: Vt.8B
;;; Architectures
;;; v7, A32, A64
;;; Operation

;;; CheckFPAdvSIMDEnabled64();

;;; bits(64) address;
;;; bits(64) offs;
;;; bits(datasize) rval;
;;; integer tt;
;;; constant integer ebytes = esize DIV 8;

;;; if HaveMTE2Ext() then
;;;     SetTagCheckedInstruction(tag_checked);

;;; if n == 31 then
;;;     CheckSPAlignment();
;;;     address = SP[];
;;; else
;;;     address = X[n];

;;; offs = Zeros();
;;; for r = 0 to rpt-1
;;;     for e = 0 to elements-1
;;;         tt = (t + r) MOD 32;
;;;         for s = 0 to selem-1
;;;             rval = V[tt];
;;;             if memop == MemOp_LOAD then
;;;                 Elem[rval, e, esize] = Mem[address + offs, ebytes, AccType_VEC];
;;;                 V[tt] = rval;
;;;             else // memop == MemOp_STORE
;;;                 Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, e, esize];
;;;             offs = offs + ebytes;
;;;             tt = (tt + 1) MOD 32;

;;; if wback then
;;;     if m != 31 then
;;;         offs = X[m];
;;;     if n == 31 then
;;;         SP[] = address + offs;
;;;     else
;;;         X[n] = address + offs;