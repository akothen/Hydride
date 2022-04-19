#############################################################
#
# A tool for compiling Hexagon semantics to Rosette IR.
#
#############################################################


from RoseHexCompiler import CompileSemantics, HexRoseContext

test1 ={
 'Vd.b=vadd(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                         '(Vu.b[i]+Vv.b[i]) ;}',
}

test2 = {
   'Vd.b=vmax(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (Vu.b[i] > '
                         'Vv.b[i]) ? Vu.b[i] :Vv.b[i] ;}',
}

test3 = {
   'Vd.b=vnavg(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                          '(Vu.b[i]-Vv.b[i])/2 ;}',
}

test4 = {
   'Vd.uw=vadd(Vu.uw,Vv.uw):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                'usat32(Vu.uw[i]+Vv.uw[i]) ;}',
}

test5 = {
   'Qd4=or(Qs4,Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] || QtV[i] '
                    ';}',
}

test6 = {
   'Vd.uw=vabsdiff(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                              '(Vu.w[i] > Vv.w[i]) ? (Vu.w[i] -Vv.w[i]) : '
                              '(Vv.w[i] - Vu.w[i]) ;}',
}

test7 = {
   'Vd.h=vsub(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                         '(Vu.h[i]-Vv.h[i]) ;}',
}

test8 = {
 'Vd.b=vmin(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (Vu.b[i] < '
                         'Vv.b[i]) ? Vu.b[i] :Vv.b[i] ;}',
}

test9 = {
 'Vd.b=vnavg(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                            '(Vu.ub[i]-Vv.ub[i])/2 ;}',
}

test10 = {
 'Vd.b=vavg(Vu.b,Vv.b):rnd': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                             '(Vu.b[i]+Vv.b[i]+1)/2 ;}',
}

test11 = {
 'Vd.b=vadd(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                         '(Vu.b[i]+Vv.b[i]) ;}',
}

test12 = {
 'Vd.b=vabs(Vu.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (ABS(Vu.b[i])) '
                    ';}',
}

test13 = {
 'Vxx.w|=vunpacko(Vu.h)': 'for (i = 0; i < VELEM(16); i++) {Vxx.uw[i] |= '
                          'Vu.uh[i]<<16 ;}',
}

test14 = {
 'Vxx.h|=vunpacko(Vu.b)': 'for (i = 0; i < VELEM(8); i++) {Vxx.uh[i] |= '
                          'Vu.ub[i]<<8 ;}',
}

test15 = {
   'Vx.w+=vmpyi(Vu.w,Rt.ub)': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += '
                            '(Vu.w[i] * Rt.ub[i % 4]) ;}',
}

test16 = {
 'Vd.ub=vmin(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                            '(Vu.ub[i] < Vv.ub[i]) ? Vu.ub[i]: Vv.ub[i] ;}',
}

test17 = {
 'Vd.ub=vmax(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                            '(Vu.ub[i] > Vv.ub[i]) ? Vu.ub[i]: Vv.ub[i] ;}',
}

test18 = {
 'Vd.uh=vabsdiff(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                              '(Vu.h[i] > Vv.h[i]) ? (Vu.h[i] -Vv.h[i]) : '
                              '(Vv.h[i] - Vu.h[i]) ;}',
}

test19 = {
 'Vd.ub=vavg(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                            '(Vu.ub[i]+Vv.ub[i])/2 ;}',
}

test20 = {
 'Qd4=xor(Qs4,Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] ^ QtV[i] '
                     ';}',
}

test21 = {
 'Vd.h=vnavg(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                          '(Vu.h[i]-Vv.h[i])/2 ;}',
}

test22 = {
 'Vd.b=vavg(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                         '(Vu.b[i]+Vv.b[i])/2 ;}',
}

test23 = {
 'Vd.b=vabs(Vu.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                        'sat8(ABS(Vu.b[i])) ;}',
}

test24 = {
 'Vd.b=vadd(Vu.b,Vv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                             'sat8(Vu.b[i]+Vv.b[i]) ;}',
}

test25 = {
 'Vd.ub=vpack(Vu.h,Vv.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
                               'usat8(Vv.h[i]);Vd.ub[i+VBITS/16] = '
                               'usat8(Vu.h[i]) ;}',
}

test26 = {
 'Vd.ub=vavg(Vu.ub,Vv.ub):rnd': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                '(Vu.ub[i]+Vv.ub[i]+1)/2 ;}',
}

test27 = {
 'Vd.ub=vsub(Vu.ub,Vv.ub):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                'usat8(Vu.ub[i]-Vv.ub[i]) ;}',
}

test28 = {
 'Vd.ub=vsub(Vu.ub,Vv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               'usat8(Vu.ub[i] - Vv.b[i]) ;}',
}

test29 = {
 'Vd.ub=vadd(Vu.ub,Vv.ub):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                'usat8(Vu.ub[i]+Vv.ub[i]) ;}',
}

test30 = {
 'Vd.ub=vadd(Vu.ub,Vv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               'usat8(Vu.ub[i] + Vv.b[i]) ;}',
}

test31 = {
 'Vd.w=vabs(Vu.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (ABS(Vu.w[i])) '
                    ';}',
}

test32 = {
 'Vd.uw=vsub(Vu.uw,Vv.uw):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                'usat32(Vu.uw[i]-Vv.uw[i]) ;}',
}

test33 = {
 'Vd.uw=vavg(Vu.uw,Vv.uw):rnd': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                '(Vu.uw[i]+Vv.uw[i]+1)/2 ;}',
}

test34 = {
 'Vd.uw=vavg(Vu.uw,Vv.uw)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                            '(Vu.uw[i]+Vv.uw[i])/2 ;}',
}

test35 = {
 'Vd.uw=vadd(Vu.uw,Vv.uw):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                'usat32(Vu.uw[i]+Vv.uw[i]) ;}',
}

test36 = {
 'Vd.uw=vabsdiff(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                              '(Vu.w[i] > Vv.w[i]) ? (Vu.w[i] -Vv.w[i]) : '
                              '(Vv.w[i] - Vu.w[i]) ;}',
}

test37 = {
 'Vd.h=vsub(Vu.h,Vv.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                             'sat16(Vu.h[i]-Vv.h[i]) ;}',
}


test38 = {
 'Vd.b=vpack(Vu.h,Vv.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.b[i] = '
                              'sat8(Vv.h[i]);Vd.b[i+VBITS/16] = sat8(Vu.h[i]) '
                              ';}',
}

test39 = {
 'Vx.uw+=vmpye(Vu.uh,Rt.uh)': 'for (i = 0; i < VELEM(32); i++) {Vx.uw[i] += '
                              '(Vu.uw[i].uh[0] * Rt.uh[0]) ;}',
}

test40 = {
 'Vd.b=vshuffe(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(16); i++) '
                            '{Vd.uh[i].b[0]=Vv.uh[i].ub[0];'
                            'Vd.uh[i].b[1]=Vu.uh[i].ub[0];}',
}

test41 = {
 'Vd.w=vnavg(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                          '(Vu.w[i]-Vv.w[i])/2 ;}',
}

test42 = {
 'Vd.b=vsub(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                         '(Vu.b[i]-Vv.b[i]) ;}',
}

test43 = {
 'Vdd.w=vunpack(Vu.h)': 'for (i = 0; i < VELEM(16); i++) {Vdd.w[i] = Vu.h[i] '
                        ';}',
}

test44 = {
   'Vd.w=vabs(Vu.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                        'sat32(ABS(Vu.w[i])) ;}',
}

test45 = {
 'Vd.w=vadd(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                         '(Vu.w[i]+Vv.w[i]) ;}',
}

test46 = {
   'Vd.w=vadd(Vu.w,Vv.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                             'sat32(Vu.w[i]+Vv.w[i]) ;}',
}

test47 = {
 'Vd.w=vavg(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                         '(Vu.w[i]+Vv.w[i])/2 ;}',
}

test48 = {
 'Vd.w=vavg(Vu.w,Vv.w):rnd': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                             '(Vu.w[i]+Vv.w[i]+1)/2 ;}',
}

test49 = {
 'Vd.w=vmax(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] '
                         '> Vv.w[i]) ? Vu.w[i] :Vv.w[i] ;}',
}

test50 = {
 'Vd.w=vmin(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] '
                         '< Vv.w[i]) ? Vu.w[i] :Vv.w[i] ;}',
}

# Fails
test51 = {
 'Vd.w=vsatdw(Vu.w, Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                            'usat32(Vu.w[i]:Vv.w[i]) ;}',
}

test52 = {
 'Vd.w=vsub(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                         '(Vu.w[i]-Vv.w[i]) ;}',
}

test53 = {
 'Vd.w=vsub(Vu.w,Vv.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                             'sat32(Vu.w[i]-Vv.w[i]) ;}',
}

test54 = {
 'if (!Qv4) Vx.b+=Vu.b': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i]=QvV.i ? '
                         'Vx.ub[i] : Vx.ub[i]+Vu.ub[i] ;}',
}

test55 = {
 'Vdd.h=vunpack(Vu.b)': 'for (i = 0; i < VELEM(8); i++) {Vdd.h[i] = Vu.b[i] ;}',
}

test56 = {
   'Vdd.uh=vunpack(Vu.ub)': 'for (i = 0; i < VELEM(8); i++) {Vdd.uh[i] = '
                          'Vu.ub[i] ;}',
}

test57 = {
 'Vdd.uw=vunpack(Vu.uh)': 'for (i = 0; i < VELEM(16); i++) {Vdd.uw[i] = '
                          'Vu.uh[i] ;}',
}

test58 = {
 'Vd.h=vmax(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i] '
                         '> Vv.h[i]) ? Vu.h[i] :Vv.h[i] ;}',
}

test59 = {
 'Vd.h=vmin(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i] '
                         '< Vv.h[i]) ? Vu.h[i] :Vv.h[i] ;}',
}

test60 = {
 'Vd.h=vsat(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) '
                         '{Vd.w[i].h[0]=sat16(Vv.w[i]);Vd.w[i].h[1]=sat16(Vu.w[i]) '
                         ';}',
}

test61 = {
 'Vd.w=vmpyi(Vu.w,Rt.ub)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                           '(Vu.w[i] * Rt.ub[i % 4]) ;}',
}

test62 = {
 'Vd.uh=vsub(Vu.uh,Vv.uh):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                'usat16(Vu.uh[i]-Vv.uh[i]) ;}',
}

test63 = {
 'Vd.uh=vpack(Vu.w,Vv.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
                               'usat16(Vv.w[i]);Vd.uh[i+VBITS/32] = '
                               'usat16(Vu.w[i]) ;}',
}

test64 = {
 'Vd.uh=vmin(Vu.uh,Vv.uh)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                            '(Vu.uh[i] < Vv.uh[i]) ? Vu.uh[i]: Vv.uh[i] ;}',
}

test65 = {
 'Vd.uh=vmax(Vu.uh,Vv.uh)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                            '(Vu.uh[i] > Vv.uh[i]) ? Vu.uh[i]: Vv.uh[i] ;}',
}

test66 = {
 'Vd.uh=vavg(Vu.uh,Vv.uh):rnd': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                '(Vu.uh[i]+Vv.uh[i]+1)/2 ;}',
}

test67 = {
 'Vd.uh=vavg(Vu.uh,Vv.uh)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                            '(Vu.uh[i]+Vv.uh[i])/2 ;}',
}

test68 = {
 'Vd.uh=vadd(Vu.uh,Vv.uh):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                'usat16(Vu.uh[i]+Vv.uh[i]) ;}',
}

test69 = {
 'Vd.uh=vabsdiff(Vu.uh,Vv.uh)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                '(Vu.uh[i] > Vv.uh[i]) ? (Vu.uh[i]- Vv.uh[i]) '
                                ': (Vv.uh[i] - Vu.uh[i]) ;}',
}

test70 = {
 'Vd.ub=vsat(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) '
                          '{Vd.uh[i].b[0]=usat8(Vv.h[i]);Vd.uh[i].b[1]=usat8(Vu.h[i]) '
                          ';}',
}

test71 = {
 'Vd.b=vsub(Vu.b,Vv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                             'sat8(Vu.b[i]-Vv.b[i]) ;}',
}

test72 = {
 'Vd.h=vabs(Vu.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (ABS(Vu.h[i])) '
                    ';}',
}

test73 = {
 'Vd.h=vabs(Vu.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                        'sat16(ABS(Vu.h[i])) ;}',
}

test74 = {
 'Vd.h=vadd(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                         '(Vu.h[i]+Vv.h[i]) ;}',
}

test75 = {
 'Vd.h=vadd(Vu.h,Vv.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                             'sat16(Vu.h[i]+Vv.h[i]) ;}',
}

test76 = {
 'Vd.h=vavg(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                         '(Vu.h[i]+Vv.h[i])/2 ;}',
}

test77 = {
 'Vd.h=vavg(Vu.h,Vv.h):rnd': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                             '(Vu.h[i]+Vv.h[i]+1)/2 ;}',
}

test78 = {
 'Vd.h=vpack(Vu.w,Vv.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.h[i] = '
                              'sat16(Vv.w[i]);Vd.h[i+VBITS/32] = '
                              'sat16(Vu.w[i]) ;}',
}

test79 = {
 'Vd.h=vpacko(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
                           'Vv.uw[i].uh[1];Vd.uh[i+VBITS/32] = Vu.uw[i].uh[1] '
                           ';}',
}

test80 = {
 'Vd=vxor(Vu,Vv)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Vu.uh[i] ^ '
                   'Vv.h[i] ;}',
}

test81 = {
 'if (!Qv4) Vx.b-=Vu.b': 'for (i = 0; i < VELEM(8); i--) {Vx.ub[i]=QvV.i ? '
                         'Vx.ub[i] : Vx.ub[i]-Vu.ub[i] ;}',
}

test82 = {
 'Vx|=vand(!Qu4,Rt)': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i] |= !(QuV[i]) ? '
                      'Rt.ub[i % 4] : 0 ;}', 
}

test83 = {
 'Vd.h=vpacke(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
                           'Vv.uw[i].uh[0];Vd.uh[i+VBITS/32] = Vu.uw[i].uh[0] '
                           ';}',
}

test84 = {
 'Vd.uh=vsat(Vu.uw,Vv.uw)': 'for (i = 0; i < VELEM(32); i++) '
                            '{Vd.w[i].h[0]=usat16(Vv.uw[i]);Vd.w[i].h[1]=usat16(Vu.uw[i]) '
                            ';}',
}

test85 = {
 'Vd.uw=vmpye(Vu.uh,Rt.uh)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                             '(Vu.uw[i].uh[0] * Rt.uh[0]) ;}',
}

# Yay! It compiles!
test86 = {
   'Vd.uw=vrmpy(Vu.ub,Rt.ub)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                             '(Vu.uw[i].ub[0] * Rt.ub[0]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[1] * Rt.ub[1]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[2] * Rt.ub[2]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[3] * Rt.ub[3]) ;}',
}

test87 = {
   'Vd.uw=vrmpy(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                             '(Vu.uw[i].ub[0] *Vv.uw[i].ub[0]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[1] *Vv.uw[i].ub[1]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[2] *Vv.uw[i].ub[2]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[3] *Vv.uw[i].ub[3]) ;}',
}

test88 = {
 'Vd.b=vdeal(Vu.b)': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i ] = '
                     'Vu.uh[i].ub[0];Vd.ub[i+VBITS/16] = Vu.uh[i].ub[1] ;}',
}

test89 = {
 'Vd.b=vdeale(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.ub[0+i ] = '
                           'Vv.uw[i].ub[0];Vd.ub[VBITS/32+i ] = '
                           'Vv.uw[i].ub[2];Vd.ub[2*VBITS/32+i] = '
                           'Vu.uw[i].ub[0];Vd.ub[3*VBITS/32+i] = '
                           'Vu.uw[i].ub[2] ;}',
}

test90 = {
 'Vd.w=vrmpy(Vu.ub,Vv.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                           '(Vu.uw[i].ub[0] * Vv.w[i].b[0]);Vd.w[i] += '
                           '(Vu.uw[i].ub[1] * Vv.w[i].b[1]);Vd.w[i] += '
                           '(Vu.uw[i].ub[2] * Vv.w[i].b[2]);Vd.w[i] += '
                           '(Vu.uw[i].ub[3] * Vv.w[i].b[3]) ;}',
}

test91 = {
   'Vd.w=vrmpy(Vu.ub,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                           '(Vu.uw[i].ub[0] * Rt.b[0]);Vd.w[i] += '
                           '(Vu.uw[i].ub[1] * Rt.b[1]);Vd.w[i] += '
                           '(Vu.uw[i].ub[2] * Rt.b[2]);Vd.w[i] += '
                           '(Vu.uw[i].ub[3] * Rt.b[3]) ;}',
}

test92 = {
 'Vd.w=vmpyieo(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                            '(Vu.w[i].h[0]*Vv.w[i].h[1]) << 16;}',
}

test93 = {
 'Vd.w=vrmpy(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                          '(Vu.w[i].b[0] * Vv.w[i].b[0]);Vd.w[i] += '
                          '(Vu.w[i].b[1] * Vv.w[i].b[1]);Vd.w[i] += '
                          '(Vu.w[i].b[2] * Vv.w[i].b[2]);Vd.w[i] += '
                          '(Vu.w[i].b[3] * Vv.w[i].b[3]) ;}',
}

test94 = {
   'Vd.h=vdeal(Vu.h)': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i ] = '
                     'Vu.uw[i].uh[0];Vd.uh[i+VBITS/32] = Vu.uw[i].uh[1] ;}',
}

test95 = {
 'Vd.b=vpacke(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
                           'Vv.uh[i].ub[0];Vd.ub[i+VBITS/16] = Vu.uh[i].ub[0] '
                           ';}',
}

test96 = {
 'Vd.b=vpacko(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
                           'Vv.uh[i].ub[1];Vd.ub[i+VBITS/16] = Vu.uh[i].ub[1] '
                           ';}',
}

test97 = {
 'Vd.b=vshuff(Vu.b)': 'for (i = 0; i < VELEM(16); i++) '
                      '{Vd.uh[i].b[0]=Vu.ub[i];Vd.uh[i].b[1]=Vu.ub[i+VBITS/16] '
                      ';}',
}

test98 = {
 'Vd.b=vshuffo(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(16); i++) '
                            '{Vd.uh[i].b[0]=Vv.uh[i].ub[1];Vd.uh[i].b[1]=Vu.uh[i].ub[1] '
                            ';}',
}

test99 = {
 'Vd.h=vshuff(Vu.h)': 'for (i = 0; i < VELEM(32); i++) '
                      '{Vd.uw[i].h[0]=Vu.uh[i];Vd.uw[i].h[1]=Vu.uh[i+VBITS/32] '
                      ';}',
}

test100 = {
 'Vd.h=vshuffe(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(32); i++) '
                            '{Vd.uw[i].h[0]=Vv.uw[i].uh[0];Vd.uw[i].h[1]=Vu.uw[i].uh[0] '
                            ';}',
}

test101 = {
 'Vd.h=vshuffo(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(32); i++) '
                            '{Vd.uw[i].h[0]=Vv.uw[i].uh[1];Vd.uw[i].h[1]=Vu.uw[i].uh[1] '
                            ';}',
}

test102 = {
 'Qx4&=vcmp.gt(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                            'QxV[i+2-1:i] & ((Vu.h[i/2]> Vv.h[i/2]) ? 0x3 : '
                            '0);}',
}

test103 = {
 'Vd=vnot(Vu)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = ~Vu.uh[i] ;}',
}

# Parser fails
test104 = {
 'Vdd.h=vshuffoe(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(32); i++) '
                              '{Vdd.v[0].uw[i].h[0]=Vv.uw[i].uh[0];Vdd.v[0].uw[i].h[1]=Vu.uw[i].uh[0];Vdd.v[1].uw[i].h[0]=Vv.uw[i].uh[1];Vdd.v[1].uw[i].h[1]=Vu.uw[i].uh[1] '
                              ';}',
}

test105 = {
 'Vdd.h=vsub(Vuu.h,Vvv.h)': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
                            '(Vuu.v[0].h[i]-Vvv.v[0].h[i]);Vdd.v[1].h[i] = '
                            '(Vuu.v[1].h[i]-Vvv.v[1].h[i]) ;}',
}

test106 = {
 'Vx.uw+=vrmpy(Vu.ub,Rt.ub)': 'for (i = 0; i < VELEM(32); i++) {Vx.uw[i] += '
                              '(Vu.uw[i].ub[0] * Rt.ub[0]);Vx.uw[i] += '
                              '(Vu.uw[i].ub[1] * Rt.ub[1]);Vx.uw[i] += '
                              '(Vu.uw[i].ub[2] * Rt.ub[2]);Vx.uw[i] += '
                              '(Vu.uw[i].ub[3] * Rt.ub[3]) ;}',
}

test107 = {
'Vx.w+=vrmpy(Vu.ub,Vv.b)' : 'for (i = 0; i < VELEM(32); i++) {'
                            'Vx.w[i] += (Vu.uw[i].ub[0] * Vv.w[i].b[0]);'
                            'Vx.w[i] += (Vu.uw[i].ub[1] * Vv.w[i].b[1]);'
                            'Vx.w[i] += (Vu.uw[i].ub[2] * Vv.w[i].b[2]);'
                            'Vx.w[i] += (Vu.uw[i].ub[3] * Vv.w[i].b[3]) ;'
                            '}',
}

# Parser fails
test108 = {
 'Vx.w+=vdmpy(Vu.h,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += '
                           '(Vu.w[i].h[0] * Rt.b[(2*i+0)%4]);Vx.w[i] += '
                           '(Vu.w[i].h[1] * Rt.b[(2*i+1)%4]);}',
}

# Fails
test109 = {
 'Qd4=vcmp.eq(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                           '((Vu.h[i/2] == Vv.h[i/2]) ?0x3 : 0);}',
}


test110 = {
 'Qx4&=vcmp.gt(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                            'QxV[i+1-1:i] & ((Vu.b[i/1]> Vv.b[i/1]) ? 0x1 : '
                            '0);}',
}


test111 = {
 'Vd.h=vmpyi(Vu.h,Rt.b)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i] '
                          '* Rt.b[i % 4]) ;}',
}

test112 = {
 'Vd.h=vdmpy(Vu.ub,Rt.b)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                           '(Vu.uh[i].ub[0] * Rt.b[(2*i) %4]);Vd.h[i] += '
                           '(Vu.uh[i].ub[1] *Rt.b[(2*i+1)%4]) ;}',
}

test113 = {
 'Vd.w=vmpyi(Vu.w,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] '
                          '* Rt.b[i % 4]) ;}',
}

test114 = {
    'Qd4=vcmp.eq(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                           '((Vu.h[i/2] == Vv.h[i/2]) ?0x3 : 0);}',
}

test115 = {
 'Qd4=vcmp.eq(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                           '((Vu.b[i/1] == Vv.b[i/1]) ?0x1 : 0);}',
}

test116 = {
 'Vd.w=vdmpy(Vu.h,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                          '(Vu.w[i].h[0] * Rt.b[(2*i+0)%4]);Vd.w[i] += '
                          '(Vu.w[i].h[1] * Rt.b[(2*i+1)%4]);}',
}

test117 = {
    'Qd4=vcmp.gt(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                           '((Vu.b[i/1] > Vv.b[i/1]) ?0x1 : 0);}',
}

test118 = {
 'Vdd.uw=vzxt(Vu.uh)': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].uw[i] = '
                       'Vu.uw[i].uh[0];Vdd.v[1].uw[i] = Vu.uw[i].uh[1] ;}',
}

test119 = {
 'Vdd.w=vadd(Vuu.w,Vvv.w)': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                            '=(Vuu.v[0].w[i]+Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                            '=(Vuu.v[1].w[i]+Vvv.v[1].w[i]) ;}',
}

test120 = {
 'Vdd.w=vadd(Vuu.w,Vvv.w):sat': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] '
                                '=sat32(Vuu.v[0].w[i]+Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                '=sat32(Vuu.v[1].w[i]+Vvv.v[1].w[i]) ;}',
}

test121 = {
 'Vdd.w=vsub(Vuu.w,Vvv.w)': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = '
                            '(Vuu.v[0].w[i]-Vvv.v[0].w[i]);Vdd.v[1].w[i] = '
                            '(Vuu.v[1].w[i]-Vvv.v[1].w[i]) ;}',
}


test122 = {
 'Vdd.w=vsub(Vuu.w,Vvv.w):sat': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] = '
                                'sat32(Vuu.v[0].w[i]-Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                '= sat32(Vuu.v[1].w[i]-Vvv.v[1].w[i]) ;}',
}

test123 = {
 'Vdd.w=vsxt(Vu.h)': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = '
                     'Vu.w[i].h[0];Vdd.v[1].w[i] = Vu.w[i].h[1] ;}',
}


test124 = {
 'Vdd=vcombine(Vu,Vv)': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].ub[i] = '
                        'Vv.ub[i];Vdd.v[1].ub[i] = Vu.ub[i] ;}',
}

test125 = {
 'Vdd.uw=vsub(Vuu.uw,Vvv.uw):sat': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vdd.v[0].uw[i] = '
                                   'usat32(Vuu.v[0].uw[i]-Vvv.v[0].uw[i]);Vdd.v[1].uw[i] '
                                   '= usat32(Vuu.v[1].uw[i]-Vvv.v[1].uw[i]) ;}',
}

test126 = {
 'Vdd.uw=vadd(Vuu.uw,Vvv.uw):sat': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vdd.v[0].uw[i] '
                                   '=usat32(Vuu.v[0].uw[i]+Vvv.v[0].uw[i]);Vdd.v[1].uw[i] '
                                   '=usat32(Vuu.v[1].uw[i]+Vvv.v[1].uw[i]) ;}',
}

test127 = {
 'Vdd.uh=vzxt(Vu.ub)': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].uh[i] = '
                       'Vu.uh[i].ub[0];Vdd.v[1].uh[i] = Vu.uh[i].ub[1] ;}',
}

test128 = {
 'Vdd.uh=vsub(Vuu.uh,Vvv.uh):sat': 'for (i = 0; i < VELEM(16); i++) '
                                   '{Vdd.v[0].uh[i] = '
                                   'usat16(Vuu.v[0].uh[i]-Vvv.v[0].uh[i]);Vdd.v[1].uh[i] '
                                   '= usat16(Vuu.v[1].uh[i]-Vvv.v[1].uh[i]) ;}',
}

test129 = {
 'Vdd.uh=vadd(Vuu.uh,Vvv.uh):sat': 'for (i = 0; i < VELEM(16); i++) '
                                   '{Vdd.v[0].uh[i] '
                                   '=usat16(Vuu.v[0].uh[i]+Vvv.v[0].uh[i]);Vdd.v[1].uh[i] '
                                   '=usat16(Vuu.v[1].uh[i]+Vvv.v[1].uh[i]) ;}',
}

test130 = {
 'Vdd.ub=vsub(Vuu.ub,Vvv.ub):sat': 'for (i = 0; i < VELEM(8); i++) '
                                   '{Vdd.v[0].ub[i] = '
                                   'usat8(Vuu.v[0].ub[i]-Vvv.v[0].ub[i]);Vdd.v[1].ub[i] '
                                   '= usat8(Vuu.v[1].ub[i]-Vvv.v[1].ub[i]) ;}',
}

test131 = {
 'Vdd.ub=vadd(Vuu.ub,Vvv.ub):sat': 'for (i = 0; i < VELEM(8); i++) '
                                   '{Vdd.v[0].ub[i] '
                                   '=usat8(Vuu.v[0].ub[i]+Vvv.v[0].ub[i]);Vdd.v[1].ub[i] '
                                   '=usat8(Vuu.v[1].ub[i]+Vvv.v[1].ub[i]) ;}',
}

test132 = {
 'Vdd.h=vsxt(Vu.b)': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
                     'Vu.h[i].b[0];Vdd.v[1].h[i] = Vu.h[i].b[1] ;}',
}

test133 = {
 'Vdd.h=vsub(Vuu.h,Vvv.h):sat': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].h[i] = '
                                'sat16(Vuu.v[0].h[i]-Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                '= sat16(Vuu.v[1].h[i]-Vvv.v[1].h[i]) ;}',
}

test134 = {
 'Vdd.h=vsub(Vuu.h,Vvv.h)': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
                            '(Vuu.v[0].h[i]-Vvv.v[0].h[i]);Vdd.v[1].h[i] = '
                            '(Vuu.v[1].h[i]-Vvv.v[1].h[i]) ;}',
}

test135 = {
 'Vdd.b=vsub(Vuu.b,Vvv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].b[i] '
                                '= '
                                'sat8(Vuu.v[0].b[i]-Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                '= sat8(Vuu.v[1].b[i]-Vvv.v[1].b[i]) ;}',
}

test136 = {
 'Vdd.b=vsub(Vuu.b,Vvv.b)': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].b[i] = '
                            '(Vuu.v[0].b[i]-Vvv.v[0].b[i]);Vdd.v[1].b[i] = '
                            '(Vuu.v[1].b[i]-Vvv.v[1].b[i]) ;}',
}

test137 = {
 'Vdd.h=vadd(Vuu.h,Vvv.h)': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] '
                            '=(Vuu.v[0].h[i]+Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                            '=(Vuu.v[1].h[i]+Vvv.v[1].h[i]) ;}',
}

test138 = {
 'Vdd.h=vadd(Vuu.h,Vvv.h):sat': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].h[i] '
                                '=sat16(Vuu.v[0].h[i]+Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                '=sat16(Vuu.v[1].h[i]+Vvv.v[1].h[i]) ;}',
}

test140 = {
 'Vd=vor(Vu,Vv)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Vu.uh[i] | '
                  'Vv.h[i] ;}',
}

# Fails
test141 = {
 'Vd=vror(Vu,Rt)': 'for (k=0;k<VWIDTH;k++) {Vd.ub[k] = '
                   'Vu.ub[(k+Rt)&(VWIDTH-1)];}',
}

test142 = {
    'Vx|=vand(Qu4,Rt)': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i] |= (QuV[i]) ? '
                     'Rt.ub[i % 4] : 0 ;}',
}

test143 = {
 'Vd.w=vadd(Vu.w,Vv.w,Qs4):carry:sat': 'for (i = 0; i < VELEM(32); i++) '
                                       '{Vd.w[i] = '
                                       'sat32(Vu.w[i]+Vv.w[i]+QsV[i*4]) ;}'
}

test144 = {
 'Vx.w+=vmpyi(Vu.w,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += '
                           '(Vu.w[i] * Rt.b[i % 4]) ;}',
}

test145 = {
 'Vx.w+=vdmpy(Vu.h,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += '
                           '(Vu.w[i].h[0] * Rt.b[(2*i+0)%4]);Vx.w[i] += '
                           '(Vu.w[i].h[1] * Rt.b[(2*i+1)%4]);}',
}

test146 = {
 'Vx.h+=vmpyi(Vu.h,Rt.b)': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i] += '
                           '(Vu.h[i] * Rt.b[i % 4]) ;}',
}

test147 = {
 'Vx.h+=vdmpy(Vu.ub,Rt.b)': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i] += '
                            '(Vu.uh[i].ub[0] * Rt.b[(2*i) %4]);Vx.h[i] += '
                            '(Vu.uh[i].ub[1] *Rt.b[(2*i+1)%4]) ;}',
}

test148 = {
 'Vd=vand(Vu,Vv)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Vu.uh[i] & '
                   'Vv.h[i] ;}',
}

test149 = {
 'Vd=vand(Qv4,Vu)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = QvV[i] ? '
                    'Vu.b[i] : 0 ;}',
}

test150 = {
 'Vd=vand(Qu4,Rt)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = QuV[i] ? '
                    'Rt.ub[i % 4] : 0 ;}',
}

test151 = {
 'Vd=vand(!Qv4,Vu)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = !QvV[i] ? '
                     'Vu.b[i] : 0 ;}',
}

test152 = {
 'Vd=vand(!Qu4,Rt)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = !QuV[i] ? '
                     'Rt.ub[i % 4] : 0 ;}',
}

test153 = {
 'Qd4=or(Qs4,Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] || QtV[i] '
                    ';}',
}

test154 = {
 'Qd4=or(Qs4,!Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] || !QtV[i] '
                     ';}',
}

test155 = {
 'Qd4=not(Qs4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=!QsV[i] ;}',
}

test156 = {
 'Qd4=vand(Vu,Rt)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=((Vu.ub[i] & '
                    'Rt.ub[i % 4]) != 0) ? 1 : 0 ;}',
}

test157 = {
 'Qd4=and(Qs4,Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] && QtV[i] '
                     ';}',
}

test158 = {
 'Qd4=and(Qs4,!Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] && '
                      '!QtV[i] ;}',
}

# Compilation fails
test159 = {
 'Qd4.h=vshuffe(Qs4.w,Qt4.w)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=(i & 2) '
                               '? QsV[i-2] : QtV[i] ;}',
}

test160 = {
 'Vx.w=vinsert(Rt)': 'Vx.uw[0] = Rt;',
}

test161 = {
 'Vd=Vu': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i]=Vu.w[i] ;}',
}

test162 = {
 'Qx4|=vand(Vu,Rt)': 'for (i = 0; i < VELEM(8); i++) '
                     '{QxV[i]=QxV[i]|(((Vu.ub[i] & Rt.ub[i % 4]) != 0) ? 1: 0) '
                     ';}',
}

test163 = {
    'Vd=vsplat(Rt)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = Rt ;}',
}

test164 =  {
    'if (Qv4) Vx.b+=Vu.b': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i]=QvV.i ? '
                        'Vx.ub[i] : Vx.ub[i]+Vu.ub[i] ;}',
}

test165 = {
 'Vd.h=vsplat(Rt)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Rt ;}',
}


test166 = {
 'Vd.b=vsplat(Rt)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = Rt ;}',
}


# fails
test167 = {
 'Qd4=vsetq2(Rt)': 'for(i = 0; i < VWIDTH; i++) QdV[i]=(i <= ((Rt-1)& '
                   '(VWIDTH-1))) ? 1 : 0;',
}

test168 = {
 'Qd4=vcmp.gt(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                           '((Vu.h[i/2] > Vv.h[i/2]) ?0x3 : 0);}',
}

test169 = {
 'Vd=vmux(Qt4,Vu,Vv)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = QtV[i] ? '
                       'Vu.ub[i] : Vv.ub[i] ;}',
}

test170 = {
    'Vdd.b=vadd(Vuu.b,Vvv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].b[i] '
                                '=sat8(Vuu.v[0].b[i]+Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                '=sat8(Vuu.v[1].b[i]+Vvv.v[1].b[i]) ;}',
}

test171 = {
 'Vdd.b=vadd(Vuu.b,Vvv.b)': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].b[i] '
                            '=(Vuu.v[0].b[i]+Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                            '=(Vuu.v[1].b[i]+Vvv.v[1].b[i]) ;}',
}

test172 = {
 'if (!Qv4) Vx.w+=Vu.w': 'for (i = 0; i < VELEM(32); i++) '
                         '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]+Vu.w[i]) '
                         ';}',
}

test173 = {
 'if (!Qv4) Vx.h-=Vu.h': 'for (i = 0; i < VELEM(16); i--) '
                         '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]-Vu.h[i]) '
                         ';}',
}

test174 = {
 'if (!Qv4) Vx.h+=Vu.h': 'for (i = 0; i < VELEM(16); i++) '
                         '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]+Vu.h[i]) '
                         ';}',
}

test175 = {
 'if (!Qv4) Vx.w-=Vu.w': 'for (i = 0; i < VELEM(32); i--) '
                         '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]-Vu.w[i]) '
                         ';}',
}

test176 = {
 'if (Qv4) Vx.w+=Vu.w': 'for (i = 0; i < VELEM(32); i++) '
                        '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]+Vu.w[i]) '
                        ';}',
}

test177 = {
 'if (Qv4) Vx.w-=Vu.w': 'for (i = 0; i < VELEM(32); i--) '
                        '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]-Vu.w[i]) '
                        ';}',
}

test178 = {
 'if (Qv4) Vx.h-=Vu.h': 'for (i = 0; i < VELEM(16); i--) '
                        '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]-Vu.h[i]) '
                        ';}',
}

test179 = {
 'if (Qv4) Vx.h+=Vu.h': 'for (i = 0; i < VELEM(16); i++) '
                        '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]+Vu.h[i]) '
                        ';}',
}

test180 = {
 'if (Qv4) Vx.b-=Vu.b': 'for (i = 0; i < VELEM(8); i--) {Vx.ub[i]=QvV.i ? '
                        'Vx.ub[i] : Vx.ub[i]-Vu.ub[i] ;}',
}

# fails
test181 = {
 'if (!Ps) Vdd=vcombine(Vu,Vv)': 'if (!Ps[0]) {for (i = 0; i < VELEM(8); i++) '
                                 '{Vdd.v[0].ub[i] = Vv.ub[i];Vdd.v[1].ub[i] = '
                                 'Vu.ub[i];}} else {NOP;}',
}

# fails
test182 = {
 'if (Ps) Vd=Vu': 'if (Ps[0]) {for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                  'Vu.ub[i];}} else {NOP;}',
}

test183 = {
 'Qd4=vcmp.gt(Vu.uw,Vv.uw)': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                             '((Vu.uw[i/4] > Vv.uw[i/4]) ?0xF : 0);}',
}

test184 = {
 'Qd4=vcmp.gt(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                           '((Vu.w[i/4] > Vv.w[i/4]) ?0xF : 0);}',
}

test185 = {
 'Qd4=vcmp.gt(Vu.uh,Vv.uh)': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                             '((Vu.uh[i/2] > Vv.uh[i/2]) ?0x3 : 0);}',
}

test186 = {
 'Qd4=vcmp.gt(Vu.ub,Vv.ub)': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                             '((Vu.ub[i/1] > Vv.ub[i/1]) ?0x1 : 0);}',
}

test187 = {
 'Qd4=vcmp.eq(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                           '((Vu.w[i/4] == Vv.w[i/4]) ?0xF : 0);}',
}

test188 = {
 'Qx4&=vcmp.eq(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                            'QxV[i+1-1:i] & ((Vu.b[i/1]== Vv.b[i/1]) ? 0x1 : '
                            '0);}',
}

test189 = {
 'Qx4&=vcmp.eq(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                            'QxV[i+2-1:i] & ((Vu.h[i/2]== Vv.h[i/2]) ? 0x3 : '
                            '0);}',
}

test190 = {
 'Qx4&=vcmp.eq(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                            'QxV[i+4-1:i] & ((Vu.w[i/4]== Vv.w[i/4]) ? 0xF : '
                            '0);}',
}

test191 = {
 'Qx4&=vcmp.gt(Vu.ub,Vv.ub)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                              'QxV[i+1-1:i] &((Vu.ub[i/1] > Vv.ub[i/1]) ? 0x1 '
                              ': 0);}',
}

test192 = {
 'Qx4&=vcmp.gt(Vu.uh,Vv.uh)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                              'QxV[i+2-1:i] &((Vu.uh[i/2] > Vv.uh[i/2]) ? 0x3 '
                              ': 0);}',
}

test193 = {
 'Qx4&=vcmp.gt(Vu.uw,Vv.uw)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                              'QxV[i+4-1:i] &((Vu.uw[i/4] > Vv.uw[i/4]) ? 0xF '
                              ': 0);}',
}

test194 = {
 'Qx4&=vcmp.gt(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                            'QxV[i+4-1:i] & ((Vu.w[i/4]> Vv.w[i/4]) ? 0xF : '
                            '0);}',
}

test195 = {
 'Qx4^=vcmp.eq(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                            'QxV[i+1-1:i] ^ ((Vu.b[i/1] ==Vv.b[i/1]) ? 0x1 : '
                            '0);}',
}

test196 = {
 'Qx4^=vcmp.eq(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                            'QxV[i+2-1:i] ^ ((Vu.h[i/2] ==Vv.h[i/2]) ? 0x3 : '
                            '0);}',
}

test197 = {
 'Qx4^=vcmp.eq(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                            'QxV[i+4-1:i] ^ ((Vu.w[i/4] ==Vv.w[i/4]) ? 0xF : '
                            '0);}',
}

test198 = {
 'Qx4^=vcmp.gt(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                            'QxV[i+1-1:i] ^ ((Vu.b[i/1] >Vv.b[i/1]) ? 0x1 : '
                            '0);}',
}

test199 = {
'Qx4^=vcmp.gt(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                            'QxV[i+2-1:i] ^ ((Vu.h[i/2] >Vv.h[i/2]) ? 0x3 : '
                            '0);}',
}

test200 = {
'Qx4^=vcmp.gt(Vu.ub,Vv.ub)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                              'QxV[i+1-1:i] ^ ((Vu.ub[i/1] >Vv.ub[i/1]) ? 0x1 '
                              ': 0);}',
}

test201 = {
 'Qx4^=vcmp.gt(Vu.uh,Vv.uh)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                              'QxV[i+2-1:i] ^ ((Vu.uh[i/2] >Vv.uh[i/2]) ? 0x3 '
                              ': 0);}',
}

test202 = {
 'Qx4^=vcmp.gt(Vu.uw,Vv.uw)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                              'QxV[i+4-1:i] ^ ((Vu.uw[i/4] >Vv.uw[i/4]) ? 0xF '
                              ': 0);}',
}

test203 = {
 'Qx4^=vcmp.gt(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                            'QxV[i+4-1:i] ^ ((Vu.w[i/4] >Vv.w[i/4]) ? 0xF : '
                            '0);}',
}

test204 = {
 'Qx4|=vcmp.eq(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                            'QxV[i+1-1:i] | ((Vu.b[i/1]== Vv.b[i/1]) ? 0x1 : '
                            '0);}',
}

test205 = {
 'Qx4|=vcmp.eq(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                            'QxV[i+2-1:i] | ((Vu.h[i/2]== Vv.h[i/2]) ? 0x3 : '
                            '0);}',
}

test206 = {
 'Qx4|=vcmp.eq(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                            'QxV[i+4-1:i] | ((Vu.w[i/4]== Vv.w[i/4]) ? 0xF : '
                            '0);}',
}

test207 = {
 'Qx4|=vcmp.gt(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                            'QxV[i+1-1:i] | ((Vu.b[i/1]> Vv.b[i/1]) ? 0x1 : '
                            '0);}',
}

test208 = {
 'Qx4|=vcmp.gt(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                            'QxV[i+2-1:i] | ((Vu.h[i/2]> Vv.h[i/2]) ? 0x3 : '
                            '0);}',
}

test209 = {
 'Qx4|=vcmp.gt(Vu.ub,Vv.ub)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                              'QxV[i+1-1:i] |((Vu.ub[i/1] > Vv.ub[i/1]) ? 0x1 '
                              ': 0);}',
}

test210 = {
 'Qx4|=vcmp.gt(Vu.uh,Vv.uh)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                              'QxV[i+2-1:i] |((Vu.uh[i/2] > Vv.uh[i/2]) ? 0x3 '
                              ': 0);}',
}

test211 = {
 'Qx4|=vcmp.gt(Vu.uw,Vv.uw)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                              'QxV[i+4-1:i] |((Vu.uw[i/4] > Vv.uw[i/4]) ? 0xF '
                              ': 0);}',
}

test212 = {
 'Qx4|=vcmp.gt(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = '
                            'QxV[i+4-1:i] | ((Vu.w[i/4]> Vv.w[i/4]) ? 0xF : '
                            '0);}',
}

test213 = {
 'Vdd=vswap(Qt4,Vu,Vv)': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].ub[i] = '
                         'QtV[i] ? Vu.ub[i] :Vv.ub[i];Vdd.v[1].ub[i] = !QtV[i] '
                         '? Vu.ub[i] :Vv.ub[i] ;}',
}


def Compile2():
  Test = test213#test168#test142#test80#test108#test107#test106  
  for Inst, Pseudocode in Test.items():
    Spec = GetSpecFrom(Inst, Pseudocode)
    print(Spec)
    CompiledFunction = CompileSemantics(Spec)
    return CompiledFunction


from RoseHexPseudoCodeParser import *

def Compile():
   Test = test213
   SemaList = list()
   for Inst, Pseudocode in Test.items():
      Spec = GetSpecFrom(Inst, Pseudocode)
      SemaList.append(Spec)
   print("SemaList lngth:")
   print(len(SemaList))
   from RoseFunctionInfo import RoseFunctionInfo
   FunctionInfoList = list()
   for Index, Spec in enumerate(SemaList):
      RootContext = HexRoseContext()
      print("RootContext---:")
      print(RootContext)
      print("Spec:")
      print(Spec)
      FunctionInfo = RoseFunctionInfo()
      CompiledFunction = CompileSemantics(Spec, RootContext)
      FunctionInfo.addContext(RootContext)
      FunctionInfo.addRawSemantics(Spec)
      FunctionInfo.addFunctionAtNewStage(CompiledFunction)
      print("Index*****")
      print(Index)
      print("CompiledFunction:")
      CompiledFunction.print()
      FunctionInfoList.append(FunctionInfo)
   return FunctionInfoList


if __name__ == '__main__':
  Compile()



