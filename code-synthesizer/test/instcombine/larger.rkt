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


; hydride.node.conv_nn_hvx_depth5.51
; (reg 0) <32 x i32>
; (reg 1) <1 x i32>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 5) <32 x i32>
; (reg 6) <1 x i32>
; (reg 7) <32 x i32>
; (reg 8) <1 x i32>
; (reg 9) <128 x i16>
; (reg 10) <128 x i8>
; (reg 11) <128 x i8>

;; Input expression to simplify
(define hydride-expr
(hexagon_V6_vmaxw_128B_dsl 
(reg 11)  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl 
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 9)  
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 3)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 4)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 3)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 4)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 3)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 4)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 3)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 4)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 6)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 7)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 8)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 6)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 7)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 8)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 6)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 7)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 8)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 6)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 7)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 8)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  2048  2048  0  2048  16  1  0  );<128 x i16>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  
(hexagon_V6_vmaxw_128B_dsl 
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 9)  
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 3)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 4)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 3)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 4)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 3)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 4)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 3)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 4)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 6)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 7)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 8)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 6)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 7)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 8)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 6)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 7)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 8)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 6)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 7)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 8)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  2048  2048  0  2048  16  1  0  );<128 x i16>
  1024  1024  0  1024  8  0  );<128 x i8>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl 
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 9)  
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 3)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 4)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 3)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 4)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 3)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 4)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 3)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 4)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 6)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 7)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 8)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 6)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 7)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 8)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 6)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 7)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 8)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 6)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 7)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 8)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  2048  2048  0  2048  16  1  0  );<128 x i16>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  
(hexagon_V6_vmaxw_128B_dsl 
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 9)  
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 3)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 4)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 3)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 4)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 3)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 4)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 3)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 4)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 6)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 7)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 8)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 6)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 7)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 8)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 6)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 7)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 8)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 6)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vasrhv_128B_dsl 
(hexagon_V6_lvsplatw_128B_dsl 
(reg 2)  1024  1024  0  1024  32  0  );<32 x i32>
  (lit (bv #x00000000 32)) ; <1 x i32>
  
(hexagon_V6_vaddhsat_128B_dsl 
(reg 7)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 8)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  2048  2048  0  2048  16  1  0  );<128 x i16>
  1024  1024  0  1024  8  0  );<128 x i8>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  512  8  0  512  8  2  64  2  8  0  );<128 x i8>
  
(reg 10)  1024  1024  0  1024  8  0  0  );<128 x i8>
  1024  1024  0  1024  8  0  0  )
  )

;; number of bits for each register
(define input-sizes (list 1024 32 32 1024 32 1024 32 1024 32 2048 1024 1024))


;; number of element-bitwidth for each register
(define input-precs (list 32 32 32 32 32 32 32 32 32 16 8 8))

(println (length input-sizes))
(println (length input-precs))


(define (helper-function i)
  (vector (list-ref input-precs i) (list-ref input-sizes i))
  )

;(define type-info (vector  (vector 16 1024) (vector 16 1024)))
(define type-info (build-vector (length input-sizes) helper-function  ))

(set! hydride-expr (sanatize-reg-types hydride-expr 'hvx))


;; Depending on target being compiled for, the last argument would be "hvx" or "x86"
(define output-expr (inst-combine-hydride-expr hydride-expr 2 "hvx" type-info))

(displayln "Simplified expression")
(pretty-print output-expr)

(displayln "Input Cost")
(hvx:cost hydride-expr)


(displayln "Output Cost")
(hvx:cost output-expr)
