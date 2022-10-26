; hydride.node.0
; (reg 1) <32 x i8>
; (reg 0) <32 x i8>


(_mm512_max_epu64_dsl 
(reg 1)  
(reg 0)  256  8  );<32 x i8>

; hydride.node.1
; (reg 0) <32 x i8>
; (reg 1) <1 x i8>


(_m_pminub_dsl 
(_mm_set1_pi8_dsl 
(reg 1)  256  8  );<32 x i8>
  
(reg 0)  256  8  );<32 x i8>

; hydride.node.2
; (reg 0) <32 x i8>
; (reg 1) <1 x i8>


(_m_pminub_dsl 
(_mm_set1_pi8_dsl 
(reg 1)  256  8  );<32 x i8>
  
(reg 0)  256  8  );<32 x i8>

