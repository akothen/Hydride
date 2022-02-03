
from PseudoCodeParser import GetSpecFrom
from RoseHexCompiler import CompileSemantics


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

# Fails
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

# Fails
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

# Fails
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

# Fails
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

# Fails
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

# Fails
test80 = {
 'Vd=vxor(Vu,Vv)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Vu.uh[i] ^ '
                   'Vv.h[i] ;}',
}

# Fails
test81 = {
 'if (!Qv4) Vx.b-=Vu.b': 'for (i = 0; i < VELEM(8); i--) {Vx.ub[i]=QvV.i ? '
                         'Vx.ub[i] : Vx.ub[i]-Vu.ub[i] ;}',
}

# Fails
test82 = {
 'if (!Qv4) Vx.b+=Vu.b': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i]=QvV.i ? '
                         'Vx.ub[i] : Vx.ub[i]+Vu.ub[i] ;}',
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

# Parser fails
test102 = {
   'Vd=Vu': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i]=Vu.w[i] ;}',
}

# Fails
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


def Compile(Test):
  for Inst, Pseudocode in Test.items():
    Spec = GetSpecFrom(Inst, Pseudocode)
    print(Spec)
    CompiledFunction = CompileSemantics(Spec)


if __name__ == '__main__':
  Compile(test86)


