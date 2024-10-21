HexInsts = {'Qd4.b=vshuffe(Qs4.h,Qt4.h)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=(i & 1) '
                               '? QsV[i-1] : QtV[i] ;}',
 'Qd4.h=vshuffe(Qs4.w,Qt4.w)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=(i & 2) '
                               '? QsV[i-2] : QtV[i] ;}',
 'Qd4=and(Qs4,!Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] && '
                      '!QtV[i] ;}',
 'Qd4=and(Qs4,Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] && QtV[i] '
                     ';}',
 'Qd4=not(Qs4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=!QsV[i] ;}',
 'Qd4=or(Qs4,!Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] || !QtV[i] '
                     ';}',
 'Qd4=or(Qs4,Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] || QtV[i] '
                    ';}',
 'Qd4=vand(Vu,Rt)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=((Vu.ub[i] & '
                    'Rt.ub[i % 4]) != 0) ? 1 : 0 ;}',
 'Qd4=vcmp.eq(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                           '((Vu.b[i/1] == Vv.b[i/1]) ?0x1 : 0);}',
 'Qd4=vcmp.eq(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                           '((Vu.h[i/2] == Vv.h[i/2]) ?0x3 : 0);}',
 'Qd4=vcmp.eq(Vu.ub,Vv.ub)': 'Assembler mapped to: "Qd4=vcmp.eq(Vu." "b"",Vv." '
                             '"b" ")"',
 'Qd4=vcmp.eq(Vu.uh,Vv.uh)': 'Assembler mapped to: "Qd4=vcmp.eq(Vu." "h"",Vv." '
                             '"h" ")"',
 'Qd4=vcmp.eq(Vu.uw,Vv.uw)': 'Assembler mapped to: "Qd4=vcmp.eq(Vu." "w"",Vv." '
                             '"w" ")"',
 'Qd4=vcmp.eq(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                           '((Vu.w[i/4] == Vv.w[i/4]) ?0xF : 0);}',
 'Qd4=vcmp.gt(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                           '((Vu.b[i/1] > Vv.b[i/1]) ?0x1 : 0);}',
 'Qd4=vcmp.gt(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                           '((Vu.h[i/2] > Vv.h[i/2]) ?0x3 : 0);}',
 'Qd4=vcmp.gt(Vu.ub,Vv.ub)': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                             '((Vu.ub[i/1] > Vv.ub[i/1]) ?0x1 : 0);}',
 'Qd4=vcmp.gt(Vu.uh,Vv.uh)': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                             '((Vu.uh[i/2] > Vv.uh[i/2]) ?0x3 : 0);}',
 'Qd4=vcmp.gt(Vu.uw,Vv.uw)': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                             '((Vu.uw[i/4] > Vv.uw[i/4]) ?0xF : 0);}',
 'Qd4=vcmp.gt(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                           '((Vu.w[i/4] > Vv.w[i/4]) ?0xF : 0);}',
 'Qd4=vsetq(Rt)': 'for(i = 0; i < VWIDTH; i++) QdV[i]=(i < (Rt &(VWIDTH-1))) ? '
                  '1 : 0;',
 'Qd4=vsetq2(Rt)': 'for(i = 0; i < VWIDTH; i++) QdV[i]=(i <= ((Rt-1)& '
                   '(VWIDTH-1))) ? 1 : 0;',
 'Qd4=xor(Qs4,Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] ^ QtV[i] '
                     ';}',
 'Qx4&=vcmp.eq(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                            'QxV[i+1-1:i] & ((Vu.b[i/1]== Vv.b[i/1]) ? 0x1 : '
                            '0);}',
 'Qx4&=vcmp.eq(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                            'QxV[i+2-1:i] & ((Vu.h[i/2]== Vv.h[i/2]) ? 0x3 : '
                            '0);}',
 'Qx4&=vcmp.eq(Vu.ub,Vv.ub)': 'Assembler mapped to: "Qx4&=vcmp.eq(Vu." '
                              '"b"",Vv." "b" ")"',
 'Qx4&=vcmp.eq(Vu.uh,Vv.uh)': 'Assembler mapped to: "Qx4&=vcmp.eq(Vu." '
                              '"h"",Vv." "h" ")"',
 'Qx4&=vcmp.eq(Vu.uw,Vv.uw)': 'Assembler mapped to: "Qx4&=vcmp.eq(Vu." '
                              '"w"",Vv." "w" ")"',
 'Qx4&=vcmp.eq(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                            'QxV[i+4-1:i] & ((Vu.w[i/4]== Vv.w[i/4]) ? 0xF : '
                            '0);}',
 'Qx4&=vcmp.gt(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                            'QxV[i+1-1:i] & ((Vu.b[i/1]> Vv.b[i/1]) ? 0x1 : '
                            '0);}',
 'Qx4&=vcmp.gt(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                            'QxV[i+2-1:i] & ((Vu.h[i/2]> Vv.h[i/2]) ? 0x3 : '
                            '0);}',
 'Qx4&=vcmp.gt(Vu.ub,Vv.ub)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                              'QxV[i+1-1:i] &((Vu.ub[i/1] > Vv.ub[i/1]) ? 0x1 '
                              ': 0);}',
 'Qx4&=vcmp.gt(Vu.uh,Vv.uh)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                              'QxV[i+2-1:i] &((Vu.uh[i/2] > Vv.uh[i/2]) ? 0x3 '
                              ': 0);}',
 'Qx4&=vcmp.gt(Vu.uw,Vv.uw)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                              'QxV[i+4-1:i] &((Vu.uw[i/4] > Vv.uw[i/4]) ? 0xF '
                              ': 0);}',
 'Qx4&=vcmp.gt(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                            'QxV[i+4-1:i] & ((Vu.w[i/4]> Vv.w[i/4]) ? 0xF : '
                            '0);}',
 'Qx4^=vcmp.eq(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                            'QxV[i+1-1:i] ^ ((Vu.b[i/1] ==Vv.b[i/1]) ? 0x1 : '
                            '0);}',
 'Qx4^=vcmp.eq(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                            'QxV[i+2-1:i] ^ ((Vu.h[i/2] ==Vv.h[i/2]) ? 0x3 : '
                            '0);}',
 'Qx4^=vcmp.eq(Vu.ub,Vv.ub)': 'Assembler mapped to: "Qx4^=vcmp.eq(Vu." '
                              '"b"",Vv." "b" ")"',
 'Qx4^=vcmp.eq(Vu.uh,Vv.uh)': 'Assembler mapped to: "Qx4^=vcmp.eq(Vu." '
                              '"h"",Vv." "h" ")"',
 'Qx4^=vcmp.eq(Vu.uw,Vv.uw)': 'Assembler mapped to: "Qx4^=vcmp.eq(Vu." '
                              '"w"",Vv." "w" ")"',
 'Qx4^=vcmp.eq(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                            'QxV[i+4-1:i] ^ ((Vu.w[i/4] ==Vv.w[i/4]) ? 0xF : '
                            '0);}',
 'Qx4^=vcmp.gt(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                            'QxV[i+1-1:i] ^ ((Vu.b[i/1] >Vv.b[i/1]) ? 0x1 : '
                            '0);}',
 'Qx4^=vcmp.gt(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                            'QxV[i+2-1:i] ^ ((Vu.h[i/2] >Vv.h[i/2]) ? 0x3 : '
                            '0);}',
 'Qx4^=vcmp.gt(Vu.ub,Vv.ub)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                              'QxV[i+1-1:i] ^ ((Vu.ub[i/1] >Vv.ub[i/1]) ? 0x1 '
                              ': 0);}',
 'Qx4^=vcmp.gt(Vu.uh,Vv.uh)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                              'QxV[i+2-1:i] ^ ((Vu.uh[i/2] >Vv.uh[i/2]) ? 0x3 '
                              ': 0);}',
 'Qx4^=vcmp.gt(Vu.uw,Vv.uw)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                              'QxV[i+4-1:i] ^ ((Vu.uw[i/4] >Vv.uw[i/4]) ? 0xF '
                              ': 0);}',
 'Qx4^=vcmp.gt(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                            'QxV[i+4-1:i] ^ ((Vu.w[i/4] >Vv.w[i/4]) ? 0xF : '
                            '0);}',
 'Qx4|=vand(Vu,Rt)': 'for (i = 0; i < VELEM(8); i++) '
                     '{QxV[i]=QxV[i]|(((Vu.ub[i] & Rt.ub[i % 4]) != 0) ? 1: 0) '
                     ';}',
 'Qx4|=vcmp.eq(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                            'QxV[i+1-1:i] | ((Vu.b[i/1]== Vv.b[i/1]) ? 0x1 : '
                            '0);}',
 'Qx4|=vcmp.eq(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                            'QxV[i+2-1:i] | ((Vu.h[i/2]== Vv.h[i/2]) ? 0x3 : '
                            '0);}',
 'Qx4|=vcmp.eq(Vu.ub,Vv.ub)': 'Assembler mapped to: "Qx4|=vcmp.eq(Vu." '
                              '"b"",Vv." "b" ")"',
 'Qx4|=vcmp.eq(Vu.uh,Vv.uh)': 'Assembler mapped to: "Qx4|=vcmp.eq(Vu." '
                              '"h"",Vv." "h" ")"',
 'Qx4|=vcmp.eq(Vu.uw,Vv.uw)': 'Assembler mapped to: "Qx4|=vcmp.eq(Vu." '
                              '"w"",Vv." "w" ")"',
 'Qx4|=vcmp.eq(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                            'QxV[i+4-1:i] | ((Vu.w[i/4]== Vv.w[i/4]) ? 0xF : '
                            '0);}',
 'Qx4|=vcmp.gt(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                            'QxV[i+1-1:i] | ((Vu.b[i/1]> Vv.b[i/1]) ? 0x1 : '
                            '0);}',
 'Qx4|=vcmp.gt(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                            'QxV[i+2-1:i] | ((Vu.h[i/2]> Vv.h[i/2]) ? 0x3 : '
                            '0);}',
 'Qx4|=vcmp.gt(Vu.ub,Vv.ub)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                              'QxV[i+1-1:i] |((Vu.ub[i/1] > Vv.ub[i/1]) ? 0x1 '
                              ': 0);}',
 'Qx4|=vcmp.gt(Vu.uh,Vv.uh)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                              'QxV[i+2-1:i] |((Vu.uh[i/2] > Vv.uh[i/2]) ? 0x3 '
                              ': 0);}',
 'Qx4|=vcmp.gt(Vu.uw,Vv.uw)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                              'QxV[i+4-1:i] |((Vu.uw[i/4] > Vv.uw[i/4]) ? 0xF '
                              ': 0);}',
 'Qx4|=vcmp.gt(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                            'QxV[i+4-1:i] | ((Vu.w[i/4]> Vv.w[i/4]) ? 0xF : '
                            '0);}',
 'Vd.b=vabs(Vu.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (ABS(Vu.b[i])) '
                    ';}',
 'Vd.b=vabs(Vu.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                        'sat8(ABS(Vu.b[i])) ;}',
 'Vd.b=vadd(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                         '(Vu.b[i]+Vv.b[i]) ;}',
 'Vd.b=vadd(Vu.b,Vv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                             'sat8(Vu.b[i]+Vv.b[i]) ;}',
 'Vd.b=vavg(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                         '(Vu.b[i]+Vv.b[i])/2 ;}',
 'Vd.b=vavg(Vu.b,Vv.b):rnd': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                             '(Vu.b[i]+Vv.b[i]+1)/2 ;}',
 'Vd.b=vdeal(Vu.b)': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i ] = '
                     'Vu.uh[i].ub[0];Vd.ub[i+VBITS/16] = Vu.uh[i].ub[1] ;}',
 'Vd.b=vdeale(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.ub[0+i ] = '
                           'Vv.uw[i].ub[0];Vd.ub[VBITS/32+i ] = '
                           'Vv.uw[i].ub[2];Vd.ub[2*VBITS/32+i] = '
                           'Vu.uw[i].ub[0];Vd.ub[3*VBITS/32+i] = '
                           'Vu.uw[i].ub[2] ;}',
 'Vd.b=vlut32(Vu.b,Vv.b,#u3)': 'for (i = 0; i < VELEM(8); i++) {matchval = #u '
                               '& 0x7;oddhalf = (#u >> (log2(VECTOR_SIZE)-6)) '
                               '&0x1;idx = Vu.ub[i];Vd.b[i] = ((idx & 0xE0) == '
                               '(matchval << 5))? Vv.h[idx % '
                               'VBITS/16].b[oddhalf] : 0 ;}',
 'Vd.b=vlut32(Vu.b,Vv.b,Rt)': 'for (i = 0; i < VELEM(8); i++) {matchval = Rt & '
                              '0x7;oddhalf = (Rt >> (log2(VECTOR_SIZE)-6)) '
                              '&0x1;idx = Vu.ub[i];Vd.b[i] = ((idx & 0xE0) == '
                              '(matchval << 5))? Vv.h[idx % '
                              'VBITS/16].b[oddhalf] : 0 ;}',
 'Vd.b=vlut32(Vu.b,Vv.b,Rt):nomatch': 'for (i = 0; i < VELEM(8); i++) '
                                      '{matchval = Rt & 0x7;oddhalf = (Rt >> '
                                      '(log2(VECTOR_SIZE)-6)) &0x1;idx = '
                                      'Vu.ub[i];idx = (idx&0x1F) | '
                                      '(matchval<<5);Vd.b[i] = Vv.h[idx % '
                                      'VBITS/16].b[oddhalf] ;}',
 'Vd.b=vmax(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (Vu.b[i] > '
                         'Vv.b[i]) ? Vu.b[i] :Vv.b[i] ;}',
 'Vd.b=vmin(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (Vu.b[i] < '
                         'Vv.b[i]) ? Vu.b[i] :Vv.b[i] ;}',
 'Vd.b=vnavg(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                          '(Vu.b[i]-Vv.b[i])/2 ;}',
 'Vd.b=vnavg(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                            '(Vu.ub[i]-Vv.ub[i])/2 ;}',
 'Vd.b=vpack(Vu.h,Vv.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.b[i] = '
                              'sat8(Vv.h[i]);Vd.b[i+VBITS/16] = sat8(Vu.h[i]) '
                              ';}',
 'Vd.b=vpacke(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
                           'Vv.uh[i].ub[0];Vd.ub[i+VBITS/16] = Vu.uh[i].ub[0] '
                           ';}',
 'Vd.b=vpacko(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
                           'Vv.uh[i].ub[1];Vd.ub[i+VBITS/16] = Vu.uh[i].ub[1] '
                           ';}',
 'Vd.b=vshuff(Vu.b)': 'for (i = 0; i < VELEM(16); i++) '
                      '{Vd.uh[i].b[0]=Vu.ub[i];Vd.uh[i].b[1]=Vu.ub[i+VBITS/16] '
                      ';}',
 'Vd.b=vshuffe(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(16); i++) '
                            '{Vd.uh[i].b[0]=Vv.uh[i].ub[0];Vd.uh[i].b[1]=Vu.uh[i].ub[0] '
                            ';}',
 'Vd.b=vshuffo(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(16); i++) '
                            '{Vd.uh[i].b[0]=Vv.uh[i].ub[1];Vd.uh[i].b[1]=Vu.uh[i].ub[1] '
                            ';}',
 'Vd.b=vsplat(Rt)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = Rt ;}',
 'Vd.b=vsub(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                         '(Vu.b[i]-Vv.b[i]) ;}',
 'Vd.b=vsub(Vu.b,Vv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                             'sat8(Vu.b[i]-Vv.b[i]) ;}',
 'Vd.h=vabs(Vu.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (ABS(Vu.h[i])) '
                    ';}',
 'Vd.h=vabs(Vu.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                        'sat16(ABS(Vu.h[i])) ;}',
 'Vd.h=vadd(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                         '(Vu.h[i]+Vv.h[i]) ;}',
 'Vd.h=vadd(Vu.h,Vv.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                             'sat16(Vu.h[i]+Vv.h[i]) ;}',
 'Vd.h=vavg(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                         '(Vu.h[i]+Vv.h[i])/2 ;}',
 'Vd.h=vavg(Vu.h,Vv.h):rnd': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                             '(Vu.h[i]+Vv.h[i]+1)/2 ;}',
 'Vd.h=vdeal(Vu.h)': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i ] = '
                     'Vu.uw[i].uh[0];Vd.uh[i+VBITS/32] = Vu.uw[i].uh[1] ;}',
 'Vd.h=vdmpy(Vu.ub,Rt.b)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                           '(Vu.uh[i].ub[0] * Rt.b[(2*i) %4]);Vd.h[i] += '
                           '(Vu.uh[i].ub[1] *Rt.b[(2*i+1)%4]) ;}',
 'Vd.h=vmax(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i] '
                         '> Vv.h[i]) ? Vu.h[i] :Vv.h[i] ;}',
 'Vd.h=vmin(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i] '
                         '< Vv.h[i]) ? Vu.h[i] :Vv.h[i] ;}',
 'Vd.h=vmpyi(Vu.h,Rt.b)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i] '
                          '* Rt.b[i % 4]) ;}',
 'Vd.h=vnavg(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                          '(Vu.h[i]-Vv.h[i])/2 ;}',
 'Vd.h=vpack(Vu.w,Vv.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.h[i] = '
                              'sat16(Vv.w[i]);Vd.h[i+VBITS/32] = '
                              'sat16(Vu.w[i]) ;}',
 'Vd.h=vpacke(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
                           'Vv.uw[i].uh[0];Vd.uh[i+VBITS/32] = Vu.uw[i].uh[0] '
                           ';}',
 'Vd.h=vpacko(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
                           'Vv.uw[i].uh[1];Vd.uh[i+VBITS/32] = Vu.uw[i].uh[1] '
                           ';}',
 'Vd.h=vsat(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) '
                         '{Vd.w[i].h[0]=sat16(Vv.w[i]);Vd.w[i].h[1]=sat16(Vu.w[i]) '
                         ';}',
 'Vd.h=vshuff(Vu.h)': 'for (i = 0; i < VELEM(32); i++) '
                      '{Vd.uw[i].h[0]=Vu.uh[i];Vd.uw[i].h[1]=Vu.uh[i+VBITS/32] '
                      ';}',
 'Vd.h=vshuffe(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(32); i++) '
                            '{Vd.uw[i].h[0]=Vv.uw[i].uh[0];Vd.uw[i].h[1]=Vu.uw[i].uh[0] '
                            ';}',
 'Vd.h=vshuffo(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(32); i++) '
                            '{Vd.uw[i].h[0]=Vv.uw[i].uh[1];Vd.uw[i].h[1]=Vu.uw[i].uh[1] '
                            ';}',
 'Vd.h=vsplat(Rt)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Rt ;}',
 'Vd.h=vsub(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                         '(Vu.h[i]-Vv.h[i]) ;}',
 'Vd.h=vsub(Vu.h,Vv.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                             'sat16(Vu.h[i]-Vv.h[i]) ;}',
 'Vd.ub=vabs(Vu.b)': 'Assembler mapped to: "Vd.b=vabs(Vu.b)"',
 'Vd.ub=vabsdiff(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                '(Vu.ub[i] > Vv.ub[i]) ? (Vu.ub[i]- Vv.ub[i]) '
                                ': (Vv.ub[i] - Vu.ub[i]) ;}',
 'Vd.ub=vadd(Vu.ub,Vv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               'usat8(Vu.ub[i] + Vv.b[i]) ;}',
 'Vd.ub=vadd(Vu.ub,Vv.ub):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                'usat8(Vu.ub[i]+Vv.ub[i]) ;}',
 'Vd.ub=vavg(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                            '(Vu.ub[i]+Vv.ub[i])/2 ;}',
 'Vd.ub=vavg(Vu.ub,Vv.ub):rnd': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                '(Vu.ub[i]+Vv.ub[i]+1)/2 ;}',
 'Vd.ub=vmax(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                            '(Vu.ub[i] > Vv.ub[i]) ? Vu.ub[i]: Vv.ub[i] ;}',
 'Vd.ub=vmin(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                            '(Vu.ub[i] < Vv.ub[i]) ? Vu.ub[i]: Vv.ub[i] ;}',
 'Vd.ub=vpack(Vu.h,Vv.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
                               'usat8(Vv.h[i]);Vd.ub[i+VBITS/16] = '
                               'usat8(Vu.h[i]) ;}',
 'Vd.ub=vsat(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) '
                          '{Vd.uh[i].b[0]=usat8(Vv.h[i]);Vd.uh[i].b[1]=usat8(Vu.h[i]) '
                          ';}',
 'Vd.ub=vsub(Vu.ub,Vv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               'usat8(Vu.ub[i] - Vv.b[i]) ;}',
 'Vd.ub=vsub(Vu.ub,Vv.ub):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                'usat8(Vu.ub[i]-Vv.ub[i]) ;}',
 'Vd.uh=vabs(Vu.h)': 'Assembler mapped to: "Vd.h=vabs(Vu.h)"',
 'Vd.uh=vabsdiff(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                              '(Vu.h[i] > Vv.h[i]) ? (Vu.h[i] -Vv.h[i]) : '
                              '(Vv.h[i] - Vu.h[i]) ;}',
 'Vd.uh=vabsdiff(Vu.uh,Vv.uh)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                '(Vu.uh[i] > Vv.uh[i]) ? (Vu.uh[i]- Vv.uh[i]) '
                                ': (Vv.uh[i] - Vu.uh[i]) ;}',
 'Vd.uh=vadd(Vu.uh,Vv.uh):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                'usat16(Vu.uh[i]+Vv.uh[i]) ;}',
 'Vd.uh=vavg(Vu.uh,Vv.uh)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                            '(Vu.uh[i]+Vv.uh[i])/2 ;}',
 'Vd.uh=vavg(Vu.uh,Vv.uh):rnd': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                '(Vu.uh[i]+Vv.uh[i]+1)/2 ;}',
 'Vd.uh=vmax(Vu.uh,Vv.uh)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                            '(Vu.uh[i] > Vv.uh[i]) ? Vu.uh[i]: Vv.uh[i] ;}',
 'Vd.uh=vmin(Vu.uh,Vv.uh)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                            '(Vu.uh[i] < Vv.uh[i]) ? Vu.uh[i]: Vv.uh[i] ;}',
 'Vd.uh=vpack(Vu.w,Vv.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
                               'usat16(Vv.w[i]);Vd.uh[i+VBITS/32] = '
                               'usat16(Vu.w[i]) ;}',
 'Vd.uh=vsat(Vu.uw,Vv.uw)': 'for (i = 0; i < VELEM(32); i++) '
                            '{Vd.w[i].h[0]=usat16(Vv.uw[i]);Vd.w[i].h[1]=usat16(Vu.uw[i]) '
                            ';}',
 'Vd.uh=vsub(Vu.uh,Vv.uh):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                'usat16(Vu.uh[i]-Vv.uh[i]) ;}',
 'Vd.uw=vabs(Vu.w)': 'Assembler mapped to: "Vd.w=vabs(Vu.w)"',
 'Vd.uw=vabsdiff(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                              '(Vu.w[i] > Vv.w[i]) ? (Vu.w[i] -Vv.w[i]) : '
                              '(Vv.w[i] - Vu.w[i]) ;}',
 'Vd.uw=vadd(Vu.uw,Vv.uw):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                'usat32(Vu.uw[i]+Vv.uw[i]) ;}',
 'Vd.uw=vavg(Vu.uw,Vv.uw)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                            '(Vu.uw[i]+Vv.uw[i])/2 ;}',
 'Vd.uw=vavg(Vu.uw,Vv.uw):rnd': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                '(Vu.uw[i]+Vv.uw[i]+1)/2 ;}',
 'Vd.uw=vmpye(Vu.uh,Rt.uh)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                             '(Vu.uw[i].uh[0] * Rt.uh[0]) ;}',
 'Vd.uw=vrmpy(Vu.ub,Rt.ub)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                             '(Vu.uw[i].ub[0] * Rt.ub[0]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[1] * Rt.ub[1]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[2] * Rt.ub[2]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[3] * Rt.ub[3]) ;}',
 'Vd.uw=vrmpy(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                             '(Vu.uw[i].ub[0] *Vv.uw[i].ub[0]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[1] *Vv.uw[i].ub[1]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[2] *Vv.uw[i].ub[2]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[3] *Vv.uw[i].ub[3]) ;}',
 'Vd.uw=vsub(Vu.uw,Vv.uw):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                'usat32(Vu.uw[i]-Vv.uw[i]) ;}',
 'Vd.w,Qe4=vadd(Vu.w,Vv.w):carry': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                   'Vu.w[i]+Vv.w[i];QeV[4*i+4-1:4*i] = '
                                   '-carry_from(Vu.w[i],Vv.w[i],0) ;}',
 'Vd.w,Qe4=vsub(Vu.w,Vv.w):carry': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                   'Vu.w[i]+~Vv.w[i]+1;QeV[4*i+4-1:4*i] = '
                                   '-carry_from(Vu.w[i],~Vv.w[i],1) ;}',
 'Vd.w=vabs(Vu.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (ABS(Vu.w[i])) '
                    ';}',
 'Vd.w=vabs(Vu.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                        'sat32(ABS(Vu.w[i])) ;}',
 'Vd.w=vadd(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                         '(Vu.w[i]+Vv.w[i]) ;}',
 'Vd.w=vadd(Vu.w,Vv.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                             'sat32(Vu.w[i]+Vv.w[i]) ;}',
 'Vd.w=vadd(Vu.w,Vv.w,Qs4):carry:sat': 'for (i = 0; i < VELEM(32); i++) '
                                       '{Vd.w[i] = '
                                       'sat32(Vu.w[i]+Vv.w[i]+QsV[i*4]) ;}',
 'Vd.w=vadd(Vu.w,Vv.w,Qx4):carry': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                   'Vu.w[i]+Vv.w[i]+QxV[i*4];QxV[4*i+4-1:4*i] '
                                   '= -carry_from(Vu.w[i],Vv.w[i],QxV[i*4]) ;}',
 'Vd.w=vavg(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                         '(Vu.w[i]+Vv.w[i])/2 ;}',
 'Vd.w=vavg(Vu.w,Vv.w):rnd': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                             '(Vu.w[i]+Vv.w[i]+1)/2 ;}',
 'Vd.w=vdmpy(Vu.h,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                          '(Vu.w[i].h[0] * Rt.b[(2*i+0)%4]);Vd.w[i] += '
                          '(Vu.w[i].h[1] * Rt.b[(2*i+1)%4]);}',
 'Vd.w=vmax(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] '
                         '> Vv.w[i]) ? Vu.w[i] :Vv.w[i] ;}',
 'Vd.w=vmin(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] '
                         '< Vv.w[i]) ? Vu.w[i] :Vv.w[i] ;}',
 'Vd.w=vmpyi(Vu.w,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] '
                          '* Rt.b[i % 4]) ;}',
 'Vd.w=vmpyi(Vu.w,Rt.ub)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                           '(Vu.w[i] * Rt.ub[i % 4]) ;}',
 'Vd.w=vmpyieo(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                            '(Vu.w[i].h[0]*Vv.w[i].h[1]) << 16;}',
 'Vd.w=vnavg(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                          '(Vu.w[i]-Vv.w[i])/2 ;}',
 'Vd.w=vrmpy(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                          '(Vu.w[i].b[0] * Vv.w[i].b[0]);Vd.w[i] += '
                          '(Vu.w[i].b[1] * Vv.w[i].b[1]);Vd.w[i] += '
                          '(Vu.w[i].b[2] * Vv.w[i].b[2]);Vd.w[i] += '
                          '(Vu.w[i].b[3] * Vv.w[i].b[3]) ;}',
 'Vd.w=vrmpy(Vu.ub,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                           '(Vu.uw[i].ub[0] * Rt.b[0]);Vd.w[i] += '
                           '(Vu.uw[i].ub[1] * Rt.b[1]);Vd.w[i] += '
                           '(Vu.uw[i].ub[2] * Rt.b[2]);Vd.w[i] += '
                           '(Vu.uw[i].ub[3] * Rt.b[3]) ;}',
 'Vd.w=vrmpy(Vu.ub,Vv.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                           '(Vu.uw[i].ub[0] * Vv.w[i].b[0]);Vd.w[i] += '
                           '(Vu.uw[i].ub[1] * Vv.w[i].b[1]);Vd.w[i] += '
                           '(Vu.uw[i].ub[2] * Vv.w[i].b[2]);Vd.w[i] += '
                           '(Vu.uw[i].ub[3] * Vv.w[i].b[3]) ;}',
 'Vd.w=vsatdw(Vu.w, Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                            'usat32(Vu.w[i]:Vv.w[i]) ;}',
 'Vd.w=vsub(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                         '(Vu.w[i]-Vv.w[i]) ;}',
 'Vd.w=vsub(Vu.w,Vv.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                             'sat32(Vu.w[i]-Vv.w[i]) ;}',
 'Vd.w=vsub(Vu.w,Vv.w,Qx4):carry': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                   'Vu.w[i]+~Vv.w[i]+QxV[i*4];QxV[4*i+4-1:4*i] '
                                   '= -carry_from(Vu.w[i],~Vv.w[i],QxV[i*4]) '
                                   ';}',
 'Vd=Vu': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i]=Vu.w[i] ;}',
 'Vd=valign(Vu,Vv,#u3)': 'for(i = 0; i < VWIDTH; i++) {Vd.ub[i] = '
                         '(i+#u>=VWIDTH) ? Vu.ub[i+#u-VWIDTH] : Vv.ub[i+#u];}',
 'Vd=valign(Vu,Vv,Rt)': 'unsigned shift = Rt & (VWIDTH-1);for(i = 0; i < '
                        'VWIDTH; i++) {Vd.ub[i] = (i+shift>=VWIDTH) '
                        '?Vu.ub[i+shift-VWIDTH] : Vv.ub[i+shift];}',
 'Vd=vand(!Qu4,Rt)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = !QuV[i] ? '
                     'Rt.ub[i % 4] : 0 ;}',
 'Vd=vand(!Qv4,Vu)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = !QvV[i] ? '
                     'Vu.b[i] : 0 ;}',
 'Vd=vand(Qu4,Rt)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = QuV[i] ? '
                    'Rt.ub[i % 4] : 0 ;}',
 'Vd=vand(Qv4,Vu)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = QvV[i] ? '
                    'Vu.b[i] : 0 ;}',
 'Vd=vand(Vu,Vv)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Vu.uh[i] & '
                   'Vv.h[i] ;}',
 'Vd=vdelta(Vu,Vv)': 'for (offset=VWIDTH; (offset>>=1)>0; ) {for (k = 0; '
                     'k<VWIDTH; k++) {Vd.ub[k] = (Vv.ub[k]&offset) '
                     '?Vu.ub[k^offset] : Vu.ub[k];}for (k = 0; k<VWIDTH; k++) '
                     '{Vu.ub[k] = Vd.ub[k];}}',
 'Vd=vlalign(Vu,Vv,#u3)': 'unsigned shift = VWIDTH - #u;for(i = 0; i < VWIDTH; '
                          'i++) {Vd.ub[i] = (i+shift>=VWIDTH) '
                          '?Vu.ub[i+shift-VWIDTH] : Vv.ub[i+shift];}',
 'Vd=vlalign(Vu,Vv,Rt)': 'unsigned shift = VWIDTH - (Rt & (VWIDTH-1));for(i = '
                         '0; i < VWIDTH; i++) {Vd.ub[i] = (i+shift>=VWIDTH) '
                         '?Vu.ub[i+shift-VWIDTH] : Vv.ub[i+shift];}',
 'Vd=vmux(Qt4,Vu,Vv)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = QtV[i] ? '
                       'Vu.ub[i] : Vv.ub[i] ;}',
 'Vd=vnot(Vu)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = ~Vu.uh[i] ;}',
 'Vd=vor(Vu,Vv)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Vu.uh[i] | '
                  'Vv.h[i] ;}',
 'Vd=vrdelta(Vu,Vv)': 'for (offset=1; offset<VWIDTH; offset<<=1){for (k = 0; '
                      'k<VWIDTH; k++) {Vd.ub[k] = (Vv.ub[k]&offset) '
                      '?Vu.ub[k^offset] : Vu.ub[k];}for (k = 0; k<VWIDTH; k++) '
                      '{Vu.ub[k] = Vd.ub[k];}}',
 'Vd=vror(Vu,Rt)': 'for (k=0;k<VWIDTH;k++) {Vd.ub[k] = '
                   'Vu.ub[(k+Rt)&(VWIDTH-1)];}',
 'Vd=vsathub(Vu,Vv)': 'Assembler mapped to: "Vd.ub=vsat(Vu.h,Vv.h)"',
 'Vd=vsatuwuh(Vu,Vv)': 'Assembler mapped to: "Vd.uh=vsat(Vu.uw,Vv.uw)"',
 'Vd=vsatwh(Vu,Vv)': 'Assembler mapped to: "Vd.h=vsat(Vu.w,Vv.w)"',
 'Vd=vsplat(Rt)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = Rt ;}',
 'Vd=vxor(Vu,Vv)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Vu.uh[i] ^ '
                   'Vv.h[i] ;}',
 'Vdd.b=vadd(Vuu.b,Vvv.b)': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].b[i] '
                            '=(Vuu.v[0].b[i]+Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                            '=(Vuu.v[1].b[i]+Vvv.v[1].b[i]) ;}',
 'Vdd.b=vadd(Vuu.b,Vvv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].b[i] '
                                '=sat8(Vuu.v[0].b[i]+Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                '=sat8(Vuu.v[1].b[i]+Vvv.v[1].b[i]) ;}',
 'Vdd.b=vshuffoe(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(16); i++) '
                              '{Vdd.v[0].uh[i].b[0]=Vv.uh[i].ub[0];Vdd.v[0].uh[i].b[1]=Vu.uh[i].ub[0];Vdd.v[1].uh[i].b[0]=Vv.uh[i].ub[1];Vdd.v[1].uh[i].b[1]=Vu.uh[i].ub[1] '
                              ';}',
 'Vdd.b=vsub(Vuu.b,Vvv.b)': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].b[i] = '
                            '(Vuu.v[0].b[i]-Vvv.v[0].b[i]);Vdd.v[1].b[i] = '
                            '(Vuu.v[1].b[i]-Vvv.v[1].b[i]) ;}',
 'Vdd.b=vsub(Vuu.b,Vvv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].b[i] '
                                '= '
                                'sat8(Vuu.v[0].b[i]-Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                '= sat8(Vuu.v[1].b[i]-Vvv.v[1].b[i]) ;}',
 'Vdd.h=vadd(Vuu.h,Vvv.h)': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] '
                            '=(Vuu.v[0].h[i]+Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                            '=(Vuu.v[1].h[i]+Vvv.v[1].h[i]) ;}',
 'Vdd.h=vadd(Vuu.h,Vvv.h):sat': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].h[i] '
                                '=sat16(Vuu.v[0].h[i]+Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                '=sat16(Vuu.v[1].h[i]+Vvv.v[1].h[i]) ;}',
 'Vdd.h=vlut16(Vu.b,Vv.h,#u3)': 'for (i = 0; i < VELEM(16); i++) {matchval = '
                                '#u & 0xF;oddhalf = (#u >> '
                                '(log2(VECTOR_SIZE)-6)) &0x1;idx = '
                                'Vu.uh[i].ub[0];Vdd.v[0].h[i] = ((idx & 0xF0) '
                                '==(matchval << 4)) ? Vv.w[idx '
                                '%VBITS/32].h[oddhalf] : 0;idx = '
                                'Vu.uh[i].ub[1];Vdd.v[1].h[i] = ((idx & 0xF0) '
                                '==(matchval << 4)) ? Vv.w[idx '
                                '%VBITS/32].h[oddhalf] : 0 ;}',
 'Vdd.h=vlut16(Vu.b,Vv.h,Rt)': 'for (i = 0; i < VELEM(16); i++) {matchval = Rt '
                               '& 0xF;oddhalf = (Rt >> (log2(VECTOR_SIZE)-6)) '
                               '&0x1;idx = Vu.uh[i].ub[0];Vdd.v[0].h[i] = '
                               '((idx & 0xF0) ==(matchval << 4)) ? Vv.w[idx '
                               '%VBITS/32].h[oddhalf] : 0;idx = '
                               'Vu.uh[i].ub[1];Vdd.v[1].h[i] = ((idx & 0xF0) '
                               '==(matchval << 4)) ? Vv.w[idx '
                               '%VBITS/32].h[oddhalf] : 0 ;}',
 'Vdd.h=vlut16(Vu.b,Vv.h,Rt):nomatch': 'for (i = 0; i < VELEM(16); i++) '
                                       '{matchval = Rt & 0xF;oddhalf = (Rt >> '
                                       '(log2(VECTOR_SIZE)-6)) &0x1;idx = '
                                       'Vu.uh[i].ub[0];idx = (idx&0x0F) | '
                                       '(matchval<<4);Vdd.v[0].h[i] = Vv.w[idx '
                                       '%VBITS/32].h[oddhalf];idx = '
                                       'Vu.uh[i].ub[1];idx = (idx&0x0F) | '
                                       '(matchval<<4);Vdd.v[1].h[i] = Vv.w[idx '
                                       '%VBITS/32].h[oddhalf] ;}',
 'Vdd.h=vshuffoe(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(32); i++) '
                              '{Vdd.v[0].uw[i].h[0]=Vv.uw[i].uh[0];Vdd.v[0].uw[i].h[1]=Vu.uw[i].uh[0];Vdd.v[1].uw[i].h[0]=Vv.uw[i].uh[1];Vdd.v[1].uw[i].h[1]=Vu.uw[i].uh[1] '
                              ';}',
 'Vdd.h=vsub(Vuu.h,Vvv.h)': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
                            '(Vuu.v[0].h[i]-Vvv.v[0].h[i]);Vdd.v[1].h[i] = '
                            '(Vuu.v[1].h[i]-Vvv.v[1].h[i]) ;}',
 'Vdd.h=vsub(Vuu.h,Vvv.h):sat': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].h[i] = '
                                'sat16(Vuu.v[0].h[i]-Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                '= sat16(Vuu.v[1].h[i]-Vvv.v[1].h[i]) ;}',
 'Vdd.h=vsxt(Vu.b)': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
                     'Vu.h[i].b[0];Vdd.v[1].h[i] = Vu.h[i].b[1] ;}',
 'Vdd.h=vunpack(Vu.b)': 'for (i = 0; i < VELEM(8); i++) {Vdd.h[i] = Vu.b[i] ;}',
 'Vdd.ub=vadd(Vuu.ub,Vvv.ub):sat': 'for (i = 0; i < VELEM(8); i++) '
                                   '{Vdd.v[0].ub[i] '
                                   '=usat8(Vuu.v[0].ub[i]+Vvv.v[0].ub[i]);Vdd.v[1].ub[i] '
                                   '=usat8(Vuu.v[1].ub[i]+Vvv.v[1].ub[i]) ;}',
 'Vdd.ub=vsub(Vuu.ub,Vvv.ub):sat': 'for (i = 0; i < VELEM(8); i++) '
                                   '{Vdd.v[0].ub[i] = '
                                   'usat8(Vuu.v[0].ub[i]-Vvv.v[0].ub[i]);Vdd.v[1].ub[i] '
                                   '= usat8(Vuu.v[1].ub[i]-Vvv.v[1].ub[i]) ;}',
 'Vdd.uh=vadd(Vuu.uh,Vvv.uh):sat': 'for (i = 0; i < VELEM(16); i++) '
                                   '{Vdd.v[0].uh[i] '
                                   '=usat16(Vuu.v[0].uh[i]+Vvv.v[0].uh[i]);Vdd.v[1].uh[i] '
                                   '=usat16(Vuu.v[1].uh[i]+Vvv.v[1].uh[i]) ;}',
 'Vdd.uh=vsub(Vuu.uh,Vvv.uh):sat': 'for (i = 0; i < VELEM(16); i++) '
                                   '{Vdd.v[0].uh[i] = '
                                   'usat16(Vuu.v[0].uh[i]-Vvv.v[0].uh[i]);Vdd.v[1].uh[i] '
                                   '= usat16(Vuu.v[1].uh[i]-Vvv.v[1].uh[i]) ;}',
 'Vdd.uh=vunpack(Vu.ub)': 'for (i = 0; i < VELEM(8); i++) {Vdd.uh[i] = '
                          'Vu.ub[i] ;}',
 'Vdd.uh=vzxt(Vu.ub)': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].uh[i] = '
                       'Vu.uh[i].ub[0];Vdd.v[1].uh[i] = Vu.uh[i].ub[1] ;}',
 'Vdd.uw=vadd(Vuu.uw,Vvv.uw):sat': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vdd.v[0].uw[i] '
                                   '=usat32(Vuu.v[0].uw[i]+Vvv.v[0].uw[i]);Vdd.v[1].uw[i] '
                                   '=usat32(Vuu.v[1].uw[i]+Vvv.v[1].uw[i]) ;}',
 'Vdd.uw=vsub(Vuu.uw,Vvv.uw):sat': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vdd.v[0].uw[i] = '
                                   'usat32(Vuu.v[0].uw[i]-Vvv.v[0].uw[i]);Vdd.v[1].uw[i] '
                                   '= usat32(Vuu.v[1].uw[i]-Vvv.v[1].uw[i]) ;}',
 'Vdd.uw=vunpack(Vu.uh)': 'for (i = 0; i < VELEM(16); i++) {Vdd.uw[i] = '
                          'Vu.uh[i] ;}',
 'Vdd.uw=vzxt(Vu.uh)': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].uw[i] = '
                       'Vu.uw[i].uh[0];Vdd.v[1].uw[i] = Vu.uw[i].uh[1] ;}',
 'Vdd.w=vadd(Vuu.w,Vvv.w)': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                            '=(Vuu.v[0].w[i]+Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                            '=(Vuu.v[1].w[i]+Vvv.v[1].w[i]) ;}',
 'Vdd.w=vadd(Vuu.w,Vvv.w):sat': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] '
                                '=sat32(Vuu.v[0].w[i]+Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                '=sat32(Vuu.v[1].w[i]+Vvv.v[1].w[i]) ;}',
 'Vdd.w=vsub(Vuu.w,Vvv.w)': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = '
                            '(Vuu.v[0].w[i]-Vvv.v[0].w[i]);Vdd.v[1].w[i] = '
                            '(Vuu.v[1].w[i]-Vvv.v[1].w[i]) ;}',
 'Vdd.w=vsub(Vuu.w,Vvv.w):sat': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] = '
                                'sat32(Vuu.v[0].w[i]-Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                '= sat32(Vuu.v[1].w[i]-Vvv.v[1].w[i]) ;}',
 'Vdd.w=vsxt(Vu.h)': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = '
                     'Vu.w[i].h[0];Vdd.v[1].w[i] = Vu.w[i].h[1] ;}',
 'Vdd.w=vunpack(Vu.h)': 'for (i = 0; i < VELEM(16); i++) {Vdd.w[i] = Vu.h[i] '
                        ';}',
 'Vdd=vcombine(Vu,Vv)': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].ub[i] = '
                        'Vv.ub[i];Vdd.v[1].ub[i] = Vu.ub[i] ;}',
 'Vdd=vdeal(Vu,Vv,Rt)': 'Vdd.v[0] = Vv;Vdd.v[1] = Vu;for (offset=VWIDTH>>1; '
                        'offset>0; offset>>=1) {if ( Rt & offset) {for (k = 0; '
                        'k < VELEM(8); k++) {if (!( k & offset)) '
                        '{SWAP(Vdd.v[1].ub[k],Vdd.v[0].ub[k+offset]);}}}}',
 'Vdd=vshuff(Vu,Vv,Rt)': 'Vdd.v[0] = Vv;Vdd.v[1] = Vu;for (offset=1; '
                         'offset<VWIDTH; offset<<=1) {if ( Rt & offset) {for '
                         '(k = 0; k < VELEM(8); k++) {if (!( k & offset)) '
                         '{SWAP(Vdd.v[1].ub[k],Vdd.v[0].ub[k+offset]);}}}}',
 'Vdd=vswap(Qt4,Vu,Vv)': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].ub[i] = '
                         'QtV[i] ? Vu.ub[i] :Vv.ub[i];Vdd.v[1].ub[i] = !QtV[i] '
                         '? Vu.ub[i] :Vv.ub[i] ;}',
 'Vdd=vsxtb(Vu)': 'Assembler mapped to: "Vdd.h=vsxt(Vu.b)"',
 'Vdd=vsxth(Vu)': 'Assembler mapped to: "Vdd.w=vsxt(Vu.h)"',
 'Vdd=vzxtb(Vu)': 'Assembler mapped to: "Vdd.uh=vzxt(Vu.ub)"',
 'Vdd=vzxth(Vu)': 'Assembler mapped to: "Vdd.uw=vzxt(Vu.uh)"',
 'Vx.b|=vlut32(Vu.b,Vv.b,#u3)': 'for (i = 0; i < VELEM(8); i++) {matchval = #u '
                                '& 0x7;oddhalf = (#u >> (log2(VECTOR_SIZE)-6)) '
                                '&0x1;idx = Vu.ub[i];Vx.b[i] |= ((idx & 0xE0) '
                                '== (matchval <<5)) ? Vv.h[idx % '
                                'VBITS/16].b[oddhalf] : 0 ;}',
 'Vx.b|=vlut32(Vu.b,Vv.b,Rt)': 'for (i = 0; i < VELEM(8); i++) {matchval = Rt '
                               '& 0x7;oddhalf = (Rt >> (log2(VECTOR_SIZE)-6)) '
                               '&0x1;idx = Vu.ub[i];Vx.b[i] |= ((idx & 0xE0) '
                               '== (matchval <<5)) ? Vv.h[idx % '
                               'VBITS/16].b[oddhalf] : 0 ;}',
 'Vx.h+=vdmpy(Vu.ub,Rt.b)': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i] += '
                            '(Vu.uh[i].ub[0] * Rt.b[(2*i) %4]);Vx.h[i] += '
                            '(Vu.uh[i].ub[1] *Rt.b[(2*i+1)%4]) ;}',
 'Vx.h+=vmpyi(Vu.h,Rt.b)': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i] += '
                           '(Vu.h[i] * Rt.b[i % 4]) ;}',
 'Vx.uw+=vmpye(Vu.uh,Rt.uh)': 'for (i = 0; i < VELEM(32); i++) {Vx.uw[i] += '
                              '(Vu.uw[i].uh[0] * Rt.uh[0]) ;}',
 'Vx.uw+=vrmpy(Vu.ub,Rt.ub)': 'for (i = 0; i < VELEM(32); i++) {Vx.uw[i] += '
                              '(Vu.uw[i].ub[0] * Rt.ub[0]);Vx.uw[i] += '
                              '(Vu.uw[i].ub[1] * Rt.ub[1]);Vx.uw[i] += '
                              '(Vu.uw[i].ub[2] * Rt.ub[2]);Vx.uw[i] += '
                              '(Vu.uw[i].ub[3] * Rt.ub[3]) ;}',
 'Vx.w+=vdmpy(Vu.h,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += '
                           '(Vu.w[i].h[0] * Rt.b[(2*i+0)%4]);Vx.w[i] += '
                           '(Vu.w[i].h[1] * Rt.b[(2*i+1)%4]);}',
 'Vx.w+=vmpyi(Vu.w,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += '
                           '(Vu.w[i] * Rt.b[i % 4]) ;}',
 'Vx.w+=vmpyi(Vu.w,Rt.ub)': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += '
                            '(Vu.w[i] * Rt.ub[i % 4]) ;}',
 'Vx.w+=vrmpy(Vu.ub,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += '
                            '(Vu.uw[i].ub[0] * Rt.b[0]);Vx.w[i] += '
                            '(Vu.uw[i].ub[1] * Rt.b[1]);Vx.w[i] += '
                            '(Vu.uw[i].ub[2] * Rt.b[2]);Vx.w[i] += '
                            '(Vu.uw[i].ub[3] * Rt.b[3]) ;}',
 'Vx.w=vinsert(Rt)': 'Vx.uw[0] = Rt;',
 'Vxx.h|=vlut16(Vu.b,Vv.h,#u3)': 'for (i = 0; i < VELEM(16); i++) {matchval = '
                                 '#u & 0xF;oddhalf = (#u >> '
                                 '(log2(VECTOR_SIZE)-6)) &0x1;idx = '
                                 'Vu.uh[i].ub[0];Vxx.v[0].h[i] |= ((idx & '
                                 '0xF0) ==(matchval << 4)) ? Vv.w[idx '
                                 '%VBITS/32].h[oddhalf] : 0;idx = '
                                 'Vu.uh[i].ub[1];Vxx.v[1].h[i] |= ((idx & '
                                 '0xF0) ==(matchval << 4)) ? Vv.w[idx '
                                 '%VBITS/32].h[oddhalf] : 0 ;}',
 'Vxx.h|=vlut16(Vu.b,Vv.h,Rt)': 'for (i = 0; i < VELEM(16); i++) {matchval = '
                                'Rt.ub[0] & 0xF;oddhalf = (Rt >> '
                                '(log2(VECTOR_SIZE)-6)) &0x1;idx = '
                                'Vu.uh[i].ub[0];Vxx.v[0].h[i] |= ((idx & 0xF0) '
                                '==(matchval << 4)) ? Vv.w[idx '
                                '%VBITS/32].h[oddhalf] : 0;idx = '
                                'Vu.uh[i].ub[1];Vxx.v[1].h[i] |= ((idx & 0xF0) '
                                '==(matchval << 4)) ? Vv.w[idx '
                                '%VBITS/32].h[oddhalf] : 0 ;}',
 'Vxx.h|=vunpacko(Vu.b)': 'for (i = 0; i < VELEM(8); i++) {Vxx.uh[i] |= '
                          'Vu.ub[i]<<8 ;}',
 'Vxx.w=vasrinto(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {shift = '
                              '(Vu.w[i] << 32);mask = (((Vxx.v[0].w[i]) << 32) '
                              '|Vxx.v[0].w[i]);lomask = (((1) << 32) - '
                              '1);count = -(0x40 & Vv.w[i]) + (Vv.w[i] & '
                              '0x3f);result = (count == -0x40) ? 0 : (((count '
                              '< 0)? ((shift << -(count)) | (mask & (lomask << '
                              '-(count)))) : ((shift >> count) | (mask & '
                              '(lomask>> count)))));Vxx.v[1].w[i] = ((result '
                              '>> 32) &0xffffffff);Vxx.v[0].w[i] = (result & '
                              '0xffffffff) ;}',
 'Vxx.w|=vunpacko(Vu.h)': 'for (i = 0; i < VELEM(16); i++) {Vxx.uw[i] |= '
                          'Vu.uh[i]<<16 ;}',
 'Vxx=vasrinto(Vu,Vv)': 'Assembler mapped to: "Vxx.w=vasrinto(Vu.w,Vv.w)"',
 'Vx|=vand(!Qu4,Rt)': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i] |= !(QuV[i]) ? '
                      'Rt.ub[i % 4] : 0 ;}',
 'Vx|=vand(Qu4,Rt)': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i] |= (QuV[i]) ? '
                     'Rt.ub[i % 4] : 0 ;}',
 'if (!Ps) Vd=Vu': 'if (!Ps[0]) {for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                   'Vu.ub[i];}} else {NOP;}',
 'if (!Ps) Vdd=vcombine(Vu,Vv)': 'if (!Ps[0]) {for (i = 0; i < VELEM(8); i++) '
                                 '{Vdd.v[0].ub[i] = Vv.ub[i];Vdd.v[1].ub[i] = '
                                 'Vu.ub[i];}} else {NOP;}',
 'if (!Qv4) Vx.b+=Vu.b': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i]=QvV.i ? '
                         'Vx.ub[i] : Vx.ub[i]+Vu.ub[i] ;}',
 'if (!Qv4) Vx.b-=Vu.b': 'for (i = 0; i < VELEM(8); i--) {Vx.ub[i]=QvV.i ? '
                         'Vx.ub[i] : Vx.ub[i]-Vu.ub[i] ;}',
 'if (!Qv4) Vx.h+=Vu.h': 'for (i = 0; i < VELEM(16); i++) '
                         '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]+Vu.h[i]) '
                         ';}',
 'if (!Qv4) Vx.h-=Vu.h': 'for (i = 0; i < VELEM(16); i--) '
                         '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]-Vu.h[i]) '
                         ';}',
 'if (!Qv4) Vx.w+=Vu.w': 'for (i = 0; i < VELEM(32); i++) '
                         '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]+Vu.w[i]) '
                         ';}',
 'if (!Qv4) Vx.w-=Vu.w': 'for (i = 0; i < VELEM(32); i--) '
                         '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]-Vu.w[i]) '
                         ';}',
 'if (Ps) Vd=Vu': 'if (Ps[0]) {for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                  'Vu.ub[i];}} else {NOP;}',
 'if (Ps) Vdd=vcombine(Vu,Vv)': 'if (Ps[0]) {for (i = 0; i < VELEM(8); i++) '
                                '{Vdd.v[0].ub[i] = Vv.ub[i];Vdd.v[1].ub[i] = '
                                'Vu.ub[i];}} else {NOP;}',
 'if (Qv4) Vx.b+=Vu.b': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i]=QvV.i ? '
                        'Vx.ub[i] : Vx.ub[i]+Vu.ub[i] ;}',
 'if (Qv4) Vx.b-=Vu.b': 'for (i = 0; i < VELEM(8); i--) {Vx.ub[i]=QvV.i ? '
                        'Vx.ub[i] : Vx.ub[i]-Vu.ub[i] ;}',
 'if (Qv4) Vx.h+=Vu.h': 'for (i = 0; i < VELEM(16); i++) '
                        '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]+Vu.h[i]) '
                        ';}',
 'if (Qv4) Vx.h-=Vu.h': 'for (i = 0; i < VELEM(16); i--) '
                        '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]-Vu.h[i]) '
                        ';}',
 'if (Qv4) Vx.w+=Vu.w': 'for (i = 0; i < VELEM(32); i++) '
                        '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]+Vu.w[i]) '
                        ';}',
 'if (Qv4) Vx.w-=Vu.w': 'for (i = 0; i < VELEM(32); i--) '
                        '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]-Vu.w[i]) '
                        ';}',
 'vdeal(Vy,Vx,Rt)': 'for (offset=VWIDTH>>1; offset>0; offset>>=1) {if ( Rt & '
                    'offset) {for (k = 0; k < VELEM(8); k++) {if (!( k & '
                    'offset)) {SWAP(Vy.ub[k],Vx.ub[k+offset]);}}}}',
 'vshuff(Vy,Vx,Rt)': 'for (offset=1; offset<VWIDTH; offset<<=1) {if ( Rt & '
                     'offset) {for (k = 0; k < VELEM(8); k++) {if (!( k & '
                     'offset)) {SWAP(Vy.ub[k],Vx.ub[k+offset]);}}}}',
 'vtrans2x2(Vy,Vx,Rt)': 'Assembler mapped to: "vshuff(Vy,Vx,Rt)"'}