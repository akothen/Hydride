; hydride.node.conv_nn_hvx_depth5.0
; (reg 0) <128 x i8>
; (reg 2) <32 x i32>
; (reg 1) <128 x i8>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(reg 0)  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.1
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>
; (reg 2) <32 x i32>


(hexagon_V6_vaddhsat_128B_dsl 
(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(reg 2)  1024  1024  0  1024  32  -1  0  );<32 x i32>
  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.2
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.3
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.4
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.5
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.6
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.7
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.8
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.9
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.10
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.11
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.12
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.13
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.14
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.15
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.16
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.17
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.18
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.19
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.20
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.21
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.22
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.23
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.24
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.25
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.26
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>
; (reg 1) <128 x i8>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.27
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>
; (reg 1) <128 x i8>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.28
; (reg 0) <4 x i8>
; (reg 1) <128 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.29
; (reg 0) <4 x i8>
; (reg 1) <128 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.30
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>
; (reg 1) <128 x i8>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.31
; (reg 0) <4 x i8>
; (reg 1) <128 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.32
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>
; (reg 1) <128 x i8>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.33
; (reg 0) <4 x i8>
; (reg 1) <128 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.34
; (reg 0) <4 x i8>
; (reg 1) <128 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.35
; (reg 0) <4 x i8>
; (reg 1) <128 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.36
; (reg 0) <4 x i8>
; (reg 1) <128 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.37
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>
; (reg 1) <128 x i8>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.38
; (reg 0) <4 x i8>
; (reg 1) <128 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.39
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>
; (reg 1) <128 x i8>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.40
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>
; (reg 1) <128 x i8>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.41
; (reg 0) <4 x i8>
; (reg 1) <128 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.42
; (reg 0) <4 x i8>
; (reg 1) <128 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.43
; (reg 0) <4 x i8>
; (reg 1) <128 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.44
; (reg 0) <4 x i8>
; (reg 1) <128 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.45
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.46
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.47
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.48
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.49
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.50
; (reg 5) <32 x i32>
; (reg 4) <1 x i32>
; (reg 2) <1 x i32>
; (reg 0) <32 x i32>
; (reg 3) <32 x i32>
; (reg 7) <32 x i32>
; (reg 9) <128 x i16>
; (reg 10) <128 x i8>
; (reg 8) <1 x i32>
; (reg 6) <1 x i32>
; (reg 11) <128 x i8>
; (reg 1) <1 x i32>


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
  1024  1024  0  1024  8  0  0  );<128 x i8>

; hydride.node.conv_nn_hvx_depth5.51
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>
; (reg 8) <1 x i32>
; (reg 3) <32 x i32>
; (reg 10) <128 x i8>
; (reg 6) <1 x i32>
; (reg 2) <1 x i32>
; (reg 9) <128 x i16>
; (reg 5) <32 x i32>
; (reg 11) <128 x i8>
; (reg 7) <32 x i32>
; (reg 4) <1 x i32>


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
  1024  1024  0  1024  8  0  0  );<128 x i8>

; hydride.node.conv_nn_hvx_depth5.52
; (reg 8) <1 x i32>
; (reg 3) <32 x i32>
; (reg 0) <32 x i32>
; (reg 2) <1 x i32>
; (reg 4) <1 x i32>
; (reg 11) <128 x i8>
; (reg 5) <32 x i32>
; (reg 9) <128 x i16>
; (reg 7) <32 x i32>
; (reg 6) <1 x i32>
; (reg 10) <128 x i8>
; (reg 1) <1 x i32>


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
  1024  1024  0  1024  8  0  0  );<128 x i8>

; hydride.node.conv_nn_hvx_depth5.53
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>
; (reg 7) <32 x i32>
; (reg 9) <128 x i16>
; (reg 4) <1 x i32>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 11) <128 x i8>
; (reg 5) <32 x i32>
; (reg 10) <128 x i8>
; (reg 8) <1 x i32>
; (reg 6) <1 x i32>


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
  1024  1024  0  1024  8  0  0  );<128 x i8>

; hydride.node.conv_nn_hvx_depth5.54
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>
; (reg 7) <32 x i32>
; (reg 9) <128 x i16>
; (reg 4) <1 x i32>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 11) <128 x i8>
; (reg 5) <32 x i32>
; (reg 10) <128 x i8>
; (reg 8) <1 x i32>
; (reg 6) <1 x i32>


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
  1024  1024  0  1024  8  0  0  );<128 x i8>

; hydride.node.conv_nn_hvx_depth5.55
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>
; (reg 7) <32 x i32>
; (reg 9) <128 x i16>
; (reg 4) <1 x i32>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 11) <128 x i8>
; (reg 5) <32 x i32>
; (reg 10) <128 x i8>
; (reg 8) <1 x i32>
; (reg 6) <1 x i32>


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
  1024  1024  0  1024  8  0  0  );<128 x i8>

; hydride.node.conv_nn_hvx_depth5.56
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.57
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.58
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.59
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.60
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.61
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.62
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.63
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.64
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.65
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.66
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.67
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.68
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.69
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.70
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.71
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.72
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.73
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.74
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.75
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.76
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.77
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.78
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.79
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.80
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.81
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.82
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.83
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.84
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.85
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.86
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.87
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.88
; (reg 5) <64 x i16>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>

; hydride.node.conv_nn_hvx_depth5.89
; (reg 5) <64 x i16>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>

; hydride.node.conv_nn_hvx_depth5.90
; (reg 5) <64 x i16>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>

; hydride.node.conv_nn_hvx_depth5.91
; (reg 5) <64 x i16>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>

; hydride.node.conv_nn_hvx_depth5.92
; (reg 5) <64 x i16>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>

; hydride.node.conv_nn_hvx_depth5.93
; (reg 5) <64 x i16>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>

; hydride.node.conv_nn_hvx_depth5.94
; (reg 5) <64 x i16>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>

; hydride.node.conv_nn_hvx_depth5.95
; (reg 5) <64 x i16>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>

; hydride.node.conv_nn_hvx_depth5.96
; (reg 5) <64 x i16>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>

; hydride.node.conv_nn_hvx_depth5.97
; (reg 5) <64 x i16>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>

; hydride.node.conv_nn_hvx_depth5.98
; (reg 5) <64 x i16>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>

; hydride.node.conv_nn_hvx_depth5.99
; (reg 5) <64 x i16>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>

; hydride.node.conv_nn_hvx_depth5.100
; (reg 5) <64 x i16>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>

; hydride.node.conv_nn_hvx_depth5.101
; (reg 5) <64 x i16>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>

; hydride.node.conv_nn_hvx_depth5.102
; (reg 5) <64 x i16>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>

; hydride.node.conv_nn_hvx_depth5.103
; (reg 5) <64 x i16>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 4) <1 x i32>
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1024)) ; <64 x i16>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_vaddhsat_128B_dsl 
(reg 5)  
(hexagon_V6_vpackeh_128B_dsl 
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl 
(hexagon_V6_lo_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  1024  0  );<128 x i8>
  (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  
(hexagon_V6_vmaxw_128B_dsl (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  
(hexagon_V6_vminuh_128B_dsl (lit (bv #x00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff00007fff 1024)) ; <32 x i32>
  
(hexagon_V6_vassign_128B_dsl 
(hexagon_V6_vcombine_128B_dsl 
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
  1024  1024  0  1024  8  0  1024  8  1024  0  );<256 x i8>
  1024  1024  0  1024  8  0  );<128 x i8>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>
  1024  1024  0  512  16  0  512  16  2  32  2  16  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 1024)) ; <64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>
  1024  1024  0  1024  16  1  0  );<64 x i16>

; hydride.node.conv_nn_hvx_depth5.104
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.105
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.106
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.107
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.108
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.109
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.110
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.111
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.112
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.113
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.114
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.115
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.116
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.117
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.118
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.119
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.120
; (reg 1) <1 x i32>
; (reg 2) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl 
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
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.121
; (reg 1) <1 x i32>
; (reg 2) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl 
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
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.122
; (reg 1) <1 x i32>
; (reg 2) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl 
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
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.123
; (reg 1) <1 x i32>
; (reg 2) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl 
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
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.124
; (reg 1) <1 x i32>
; (reg 2) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl 
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
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.125
; (reg 1) <1 x i32>
; (reg 2) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl 
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
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.126
; (reg 1) <1 x i32>
; (reg 2) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl 
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
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.127
; (reg 1) <1 x i32>
; (reg 2) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl 
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
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.128
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.129
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.130
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.131
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.132
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.133
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.134
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.135
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.136
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>
; (reg 7) <32 x i32>
; (reg 9) <128 x i16>
; (reg 4) <1 x i32>
; (reg 2) <1 x i32>
; (reg 3) <32 x i32>
; (reg 11) <128 x i8>
; (reg 5) <32 x i32>
; (reg 10) <128 x i8>
; (reg 8) <1 x i32>
; (reg 6) <1 x i32>


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
  1024  1024  0  1024  8  0  0  );<128 x i8>

; hydride.node.conv_nn_hvx_depth5.137
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.138
; (reg 1) <128 x i8>
; (reg 0) <4 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.139
; (reg 1) <1 x i32>
; (reg 2) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl 
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
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.140
; (reg 1) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vsubh_128B_dsl 
(reg 0)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 1)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  1024  0  1024  32  -1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.141
; (reg 0) <4 x i8>
; (reg 1) <128 x i8>
; (reg 2) <32 x i32>


(hexagon_V6_vrmpybv_128B_dsl 
(reg 2)  
(reg 1)  
(hexagon_V6_lvsplatw_128B_dsl 
(reg 0)  1024  1024  0  1024  32  0  );<32 x i32>
  1024  32  0  32  8  -1  0  0  16  0  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.142
; (reg 1) <1 x i32>
; (reg 2) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl 
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
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>

; hydride.node.conv_nn_hvx_depth5.143
; (reg 1) <1 x i32>
; (reg 2) <1 x i32>
; (reg 0) <32 x i32>


(hexagon_V6_vmaxw_128B_dsl 
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
  (lit (bv #xffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000ffff8000 1024)) ; <32 x i32>
  1024  1024  0  1024  32  1  0  );<32 x i32>

