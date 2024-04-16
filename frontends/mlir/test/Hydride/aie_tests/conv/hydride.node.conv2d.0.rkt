; hydride.node.conv2d.0
; (reg 2) <8 x i32>
; (reg 1) <8 x i32>
; (reg 0) <8 x i32>


(v8int32_add8_dsl 
(reg 0)  
(srs_8_80_to_8_32_dsl 
(v8acc80_mul32_dsl 
(reg 2)  
(reg 1)  );<8 x i80>
  );<8 x i32>
  );<8 x i32>

