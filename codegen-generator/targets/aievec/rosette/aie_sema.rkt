#lang rosette
(require "bvops.rkt")

    (define (add_v16acc64 v16acc64_acc1 v16acc64_acc2)
    (define dst
    (apply concat
      (for/list ([%i (range 0 16 1)])
        (define %low1 (* 64 %i))
        (define %high1 (+ %low1 (- 64 1)))
        (define %ext_xbuff (extract %high1 %low1 v16acc64_acc1))
        (define %low2 (* 64 %i))
        (define %high2 (+ %low2 (- 64 1)))
        (define %ext_ybuff (extract %high2 %low2 v16acc64_acc2))
        (define %o (bvadd %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (add_v16int32 v16int32_a v16int32_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 16 1)])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 v16int32_a))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 v16int32_b))
        (define %o (bvadd %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (add_v16uint32 v16uint32_a v16uint32_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 16 1)])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 v16uint32_a))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 v16uint32_b))
        (define %o (bvadd %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (add_v32acc32 v32acc32_acc1 v32acc32_acc2)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 v32acc32_acc1))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 v32acc32_acc2))
        (define %o (bvadd %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (add_v32int16 v32int16_a v32int16_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 v32int16_a))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_ybuff (extract %high2 %low2 v32int16_b))
        (define %o (bvadd %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (add_v32uint16 v32uint16_a v32uint16_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 v32uint16_a))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_ybuff (extract %high2 %low2 v32uint16_b))
        (define %o (bvadd %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (add_v64int8 v64int8_a v64int8_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 64 1)])
        (define %low1 (* 8 %i))
        (define %high1 (+ %low1 (- 8 1)))
        (define %ext_xbuff (extract %high1 %low1 v64int8_a))
        (define %low2 (* 8 %i))
        (define %high2 (+ %low2 (- 8 1)))
        (define %ext_ybuff (extract %high2 %low2 v64int8_b))
        (define %o (bvadd %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (add_v64uint8 v64uint8_a v64uint8_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 64 1)])
        (define %low1 (* 8 %i))
        (define %high1 (+ %low1 (- 8 1)))
        (define %ext_xbuff (extract %high1 %low1 v64uint8_a))
        (define %low2 (* 8 %i))
        (define %high2 (+ %low2 (- 8 1)))
        (define %ext_ybuff (extract %high2 %low2 v64uint8_b))
        (define %o (bvadd %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (mul_elem_16_2_conf_v16acc64 v32uint16_a v32uint16_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 16 1)])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (sign-extend (extract %high1 %low1 v32uint16_a) (bitvector 32)))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 64 1)))
        (define %ext_ybuff (sign-extend (extract %high1 %low1 v32uint16_b) (bitvector 32)))
        (define %o (bvmul %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (mul_elem_16_2_v16acc64 v32uint16_a v32uint16_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 16 1)])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (sign-extend (extract %high1 %low1 v32uint16_a) (bitvector 32)))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 64 1)))
        (define %ext_ybuff (sign-extend (extract %high1 %low1 v32uint16_b) (bitvector 32)))
        (define %o (bvmul %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (mul_elem_32_2_conf_v32acc32 v64uint8_a v64uint8_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 8 %i))
        (define %high1 (+ %low1 (- 8 1)))
        (define %ext_xbuff (sign-extend (extract %high1 %low1 v64uint8_a) (bitvector 32)))
        (define %low2 (* 8 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (sign-extend (extract %high1 %low1 v64uint8_b) (bitvector 32)))
        (define %o (bvmul %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (mul_elem_32_2_v32acc32 v64uint8_a v64uint8_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 8 %i))
        (define %high1 (+ %low1 (- 8 1)))
        (define %ext_xbuff (sign-extend (extract %high1 %low1 v64uint8_a) (bitvector 32)))
        (define %low2 (* 8 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (sign-extend (extract %high1 %low1 v64uint8_b) (bitvector 32)))
        (define %o (bvmul %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (mul_elem_32_conf_v32acc32 v32uint16_a v32uint16_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (sign-extend (extract %high1 %low1 v32uint16_a) (bitvector 32)))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (sign-extend (extract %high1 %low1 v32uint16_b) (bitvector 32)))
        (define %o (bvmul %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (mul_elem_32_v32acc32 v32uint16_a v32uint16_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (sign-extend (extract %high1 %low1 v32uint16_a) (bitvector 32)))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (sign-extend (extract %high1 %low1 v32uint16_b) (bitvector 32)))
        (define %o (bvmul %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (neg_v16acc64 v16acc64_acc)
    (define dst
    (apply concat
      (for/list ([%i (range 0 16 1)])
        (define %low1 (* 64 %i))
        (define %high1 (+ %low1 (- 64 1)))
        (define %ext_xbuff (extract %high1 %low1 v16acc64_acc))
        (define %o (bvneg %ext_xbuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (neg_v16int32 v16int32_a)
    (define dst
    (apply concat
      (for/list ([%i (range 0 16 1)])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 v16int32_a))
        (define %o (bvneg %ext_xbuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (neg_v16uint32 v16uint32_a)
    (define dst
    (apply concat
      (for/list ([%i (range 0 16 1)])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 v16uint32_a))
        (define %o (bvneg %ext_xbuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (neg_v32acc32 v32acc32_acc)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 v32acc32_acc))
        (define %o (bvneg %ext_xbuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (neg_v32int16 v32int16_a)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 v32int16_a))
        (define %o (bvneg %ext_xbuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (neg_v32uint16 v32uint16_a)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 v32uint16_a))
        (define %o (bvneg %ext_xbuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (neg_v64int8 v64int8_a)
    (define dst
    (apply concat
      (for/list ([%i (range 0 64 1)])
        (define %low1 (* 8 %i))
        (define %high1 (+ %low1 (- 8 1)))
        (define %ext_xbuff (extract %high1 %low1 v64int8_a))
        (define %o (bvneg %ext_xbuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (neg_v64uint8 v64uint8_a)
    (define dst
    (apply concat
      (for/list ([%i (range 0 64 1)])
        (define %low1 (* 8 %i))
        (define %high1 (+ %low1 (- 8 1)))
        (define %ext_xbuff (extract %high1 %low1 v64uint8_a))
        (define %o (bvneg %ext_xbuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (negmul_elem_16_2_conf_v16acc64 v32uint16_a v32uint16_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 16 1)])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (sign-extend (extract %high1 %low1 v32uint16_a) (bitvector 32)))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 64 1)))
        (define %ext_ybuff (sign-extend (extract %high1 %low1 v32uint16_b) (bitvector 32)))
        (define %o (bvmul %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (negmul_elem_16_2_v16acc64 v32uint16_a v32uint16_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 16 1)])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (sign-extend (extract %high1 %low1 v32uint16_a) (bitvector 32)))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 64 1)))
        (define %ext_ybuff (sign-extend (extract %high1 %low1 v32uint16_b) (bitvector 32)))
        (define %o (bvmul %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (negmul_elem_32_2_conf_v32acc32 v64uint8_a v64uint8_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 8 %i))
        (define %high1 (+ %low1 (- 8 1)))
        (define %ext_xbuff (sign-extend (extract %high1 %low1 v64uint8_a) (bitvector 32)))
        (define %low2 (* 8 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (sign-extend (extract %high1 %low1 v64uint8_b) (bitvector 32)))
        (define %o (bvmul %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (negmul_elem_32_2_v32acc32 v64uint8_a v64uint8_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 8 %i))
        (define %high1 (+ %low1 (- 8 1)))
        (define %ext_xbuff (sign-extend (extract %high1 %low1 v64uint8_a) (bitvector 32)))
        (define %low2 (* 8 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (sign-extend (extract %high1 %low1 v64uint8_b) (bitvector 32)))
        (define %o (bvmul %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (negmul_elem_32_conf_v32acc32 v32uint16_a v32uint16_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (sign-extend (extract %high1 %low1 v32uint16_a) (bitvector 32)))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (sign-extend (extract %high1 %low1 v32uint16_b) (bitvector 32)))
        (define %o (bvmul %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (negmul_elem_32_v32acc32 v32uint16_a v32uint16_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (sign-extend (extract %high1 %low1 v32uint16_a) (bitvector 32)))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (sign-extend (extract %high1 %low1 v32uint16_b) (bitvector 32)))
        (define %o (bvmul %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (sub_v16acc64 v16acc64_acc1 v16acc64_acc2)
    (define dst
    (apply concat
      (for/list ([%i (range 0 16 1)])
        (define %low1 (* 64 %i))
        (define %high1 (+ %low1 (- 64 1)))
        (define %ext_xbuff (extract %high1 %low1 v16acc64_acc1))
        (define %low2 (* 64 %i))
        (define %high2 (+ %low2 (- 64 1)))
        (define %ext_ybuff (extract %high2 %low2 v16acc64_acc2))
        (define %o (bvsub %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (sub_v16int32 v16int32_a v16int32_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 16 1)])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 v16int32_a))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 v16int32_b))
        (define %o (bvsub %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (sub_v16uint32 v16uint32_a v16uint32_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 16 1)])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 v16uint32_a))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 v16uint32_b))
        (define %o (bvsub %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (sub_v32acc32 v32acc32_acc1 v32acc32_acc2)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 v32acc32_acc1))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 v32acc32_acc2))
        (define %o (bvsub %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (sub_v32int16 v32int16_a v32int16_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 v32int16_a))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_ybuff (extract %high2 %low2 v32int16_b))
        (define %o (bvsub %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (sub_v32uint16 v32uint16_a v32uint16_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 32 1)])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 v32uint16_a))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_ybuff (extract %high2 %low2 v32uint16_b))
        (define %o (bvsub %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (sub_v64int8 v64int8_a v64int8_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 64 1)])
        (define %low1 (* 8 %i))
        (define %high1 (+ %low1 (- 8 1)))
        (define %ext_xbuff (extract %high1 %low1 v64int8_a))
        (define %low2 (* 8 %i))
        (define %high2 (+ %low2 (- 8 1)))
        (define %ext_ybuff (extract %high2 %low2 v64int8_b))
        (define %o (bvsub %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    
    (define (sub_v64uint8 v64uint8_a v64uint8_b)
    (define dst
    (apply concat
      (for/list ([%i (range 0 64 1)])
        (define %low1 (* 8 %i))
        (define %high1 (+ %low1 (- 8 1)))
        (define %ext_xbuff (extract %high1 %low1 v64uint8_a))
        (define %low2 (* 8 %i))
        (define %high2 (+ %low2 (- 8 1)))
        (define %ext_ybuff (extract %high2 %low2 v64uint8_b))
        (define %o (bvsub %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    