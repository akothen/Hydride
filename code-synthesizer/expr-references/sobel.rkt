; (reg 7) <32 x i16>
; (reg 3) <32 x i16>
; (reg 6) <32 x i16>
; (reg 0) <32 x i16>
; (reg 9) <32 x i16>
; (reg 4) <32 x i16>
; (reg 5) <32 x i16>
; (reg 2) <32 x i16>
; (reg 8) <32 x i16>
; (reg 1) <32 x i16>
(_mm512_min_epu64_dsl (_m_paddw_dsl (_mm512_sub_epi8_dsl (_m_pmaxub_dsl (_m_paddw_dsl (_m_paddw_dsl (reg 9)
 (reg 8)
 512 512 512 16 0 );<32 x i16>
 (reg 7)
 512 512 512 16 0 );<32 x i16>
 (_m_paddw_dsl (reg 5)
 (_m_paddw_dsl (reg 2)
 (reg 6)
 512 512 512 16 0 );<32 x i16>
 512 512 512 16 0 );<32 x i16>
 512 512 512 16 0 );<32 x i16>
 (_mm512_min_epu64_dsl (_m_paddw_dsl (_m_paddw_dsl (reg 9)
 (reg 8)
 512 512 512 16 0 );<32 x i16>
 (reg 7)
 512 512 512 16 0 );<32 x i16>
 (_m_paddw_dsl (reg 5)
 (_m_paddw_dsl (reg 2)
 (reg 6)
 512 512 512 16 0 );<32 x i16>
 512 512 512 16 0 );<32 x i16>
 512 512 512 16 0 );<32 x i16>
 512 512 512 16 0 );<32 x i16>
 (_mm512_sub_epi8_dsl (_m_pmaxub_dsl (_m_paddw_dsl (_m_paddw_dsl (reg 0)
 (reg 1)
 512 512 512 16 0 );<32 x i16>
 (reg 2)
 512 512 512 16 0 );<32 x i16>
 (_m_paddw_dsl (_m_paddw_dsl (reg 3)
 (reg 4)
 512 512 512 16 0 );<32 x i16>
 (reg 5)
 512 512 512 16 0 );<32 x i16>
 512 512 512 16 0 );<32 x i16>
 (_mm512_min_epu64_dsl (_m_paddw_dsl (_m_paddw_dsl (reg 3)
 (reg 4)
 512 512 512 16 0 );<32 x i16>
 (reg 5)
 512 512 512 16 0 );<32 x i16>
 (_m_paddw_dsl (_m_paddw_dsl (reg 0)
 (reg 1)
 512 512 512 16 0 );<32 x i16>
 (reg 2)
 512 512 512 16 0 );<32 x i16>
 512 512 512 16 0 );<32 x i16>
 512 512 512 16 0 );<32 x i16>
 512 512 512 16 0 );<32 x i16>
 (lit (bv #x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff 512))
 512 512 512 16 0 );<32 x i16>
