#############################################################
#
# A tool for compiling Hexagon semantics to Rosette IR.
#
#############################################################


from RoseHexCompiler import CompileSemantics, HexRoseContext

test1 ={
 'hexagon_V6_vaddb_128B': {
                      'hvx_intrinsic': 'Vd.b=vadd(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i]+Vv.b[i]) ;}'
                    },
}

test2 = {
 'hexagon_V6_vmaxb_128B': {'hvx_intrinsic': 'Vd.b=vmax(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i] > Vv.b[i]) ? Vu.b[i] :Vv.b[i] ;}'},
}

test3 = {
 'hexagon_V6_vabsw_128B': {'hvx_intrinsic': 'Vd.w=vabs(Vu.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(ABS(Vu.w[i])) ;}'},
}

test4 = {
 'hexagon_V6_vadduwsat_128B': {'hvx_intrinsic': 'Vd.uw=vadd(Vu.uw,Vv.uw):sat',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                  'usat32(Vu.uw[i]+Vv.uw[i]) ;}'},
}

test5 = {
 'hexagon_V6_vnavgw_128B': {'hvx_intrinsic': 'Vd.w=vnavg(Vu.w,Vv.w)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                               '(Vu.w[i]-Vv.w[i])/2 ;}'},
}

test6 = {
 'hexagon_V6_vsubwsat_128B': {'hvx_intrinsic': 'Vd.w=vsub(Vu.w,Vv.w):sat',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 'sat32(Vu.w[i]-Vv.w[i]) ;}'},
}

test7 = {
 'hexagon_V6_vmaxw_128B': {'hvx_intrinsic': 'Vd.w=vmax(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i] > Vv.w[i]) ? Vu.w[i] :Vv.w[i] ;}'},
}

test8 = {
 'hexagon_V6_vmaxh_128B': {'hvx_intrinsic': 'Vd.h=vmax(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i] > Vv.h[i]) ? Vu.h[i] :Vv.h[i] ;}'},
}  

test9 = {
 'hexagon_V6_vmaxub_128B': {'hvx_intrinsic': 'Vd.ub=vmax(Vu.ub,Vv.ub)',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               '(Vu.ub[i] > Vv.ub[i]) ? Vu.ub[i]: Vv.ub[i] ;}'},
}

test10 = {
 'hexagon_V6_vmaxuh_128B': {'hvx_intrinsic': 'Vd.uh=vmax(Vu.uh,Vv.uh)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                               '(Vu.uh[i] > Vv.uh[i]) ? Vu.uh[i]: Vv.uh[i] ;}'},
}

test11 = {
 'hexagon_V6_vminb_128B': {'hvx_intrinsic': 'Vd.b=vmin(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i] < Vv.b[i]) ? Vu.b[i] :Vv.b[i] ;}'},
}

test12 = {
 'hexagon_V6_vminh_128B': {'hvx_intrinsic': 'Vd.h=vmin(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i] < Vv.h[i]) ? Vu.h[i] :Vv.h[i] ;}'},
}

test13 = {
 'hexagon_V6_vminub_128B': {'hvx_intrinsic': 'Vd.ub=vmin(Vu.ub,Vv.ub)',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               '(Vu.ub[i] < Vv.ub[i]) ? Vu.ub[i]: Vv.ub[i] ;}'},
}

test14 = {
 'hexagon_V6_vminuh_128B': {'hvx_intrinsic': 'Vd.uh=vmin(Vu.uh,Vv.uh)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                               '(Vu.uh[i] < Vv.uh[i]) ? Vu.uh[i]: Vv.uh[i] ;}'},
}

test15 = {
 'hexagon_V6_vminw_128B': {'hvx_intrinsic': 'Vd.w=vmin(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i] < Vv.w[i]) ? Vu.w[i] :Vv.w[i] ;}'},
}

test16 = {
 'hexagon_V6_vassign_128B': {'hvx_intrinsic': 'Vd=Vu',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vd.w[i]=Vu.w[i] ;}'},
}

test17 = {
 'hexagon_V6_vavgb_128B': {'hvx_intrinsic': 'Vd.b=vavg(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i]+Vv.b[i])/2 ;}'},
}

test18 = {
 'hexagon_V6_vavgbrnd_128B': {'hvx_intrinsic': 'Vd.b=vavg(Vu.b,Vv.b):rnd',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                 '(Vu.b[i]+Vv.b[i]+1)/2 ;}'},
}

test19 = {
 'hexagon_V6_vavgh_128B': {'hvx_intrinsic': 'Vd.h=vavg(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i]+Vv.h[i])/2 ;}'},
}

test20 = {
 'hexagon_V6_vavghrnd_128B': {'hvx_intrinsic': 'Vd.h=vavg(Vu.h,Vv.h):rnd',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                 '(Vu.h[i]+Vv.h[i]+1)/2 ;}'},
}

test21 = {
 'hexagon_V6_vavgub_128B': {'hvx_intrinsic': 'Vd.ub=vavg(Vu.ub,Vv.ub)',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               '(Vu.ub[i]+Vv.ub[i])/2 ;}'},
}

test22 = {
 'hexagon_V6_vavgubrnd_128B': {'hvx_intrinsic': 'Vd.ub=vavg(Vu.ub,Vv.ub):rnd',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                  '(Vu.ub[i]+Vv.ub[i]+1)/2 ;}'},
}

test23 = {
 'hexagon_V6_vavguh_128B': {'hvx_intrinsic': 'Vd.uh=vavg(Vu.uh,Vv.uh)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                               '(Vu.uh[i]+Vv.uh[i])/2 ;}'},
}

test24 = {
 'hexagon_V6_vavguhrnd_128B': {'hvx_intrinsic': 'Vd.uh=vavg(Vu.uh,Vv.uh):rnd',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                  '(Vu.uh[i]+Vv.uh[i]+1)/2 ;}'},
}

test25 = {
 'hexagon_V6_vavguw_128B': {'hvx_intrinsic': 'Vd.uw=vavg(Vu.uw,Vv.uw)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                               '(Vu.uw[i]+Vv.uw[i])/2 ;}'},
}

test26 = {
 'hexagon_V6_vavguwrnd_128B': {'hvx_intrinsic': 'Vd.uw=vavg(Vu.uw,Vv.uw):rnd',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                  '(Vu.uw[i]+Vv.uw[i]+1)/2 ;}'},
}

test27 = {
 'hexagon_V6_vavgw_128B': {'hvx_intrinsic': 'Vd.w=vavg(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i]+Vv.w[i])/2 ;}'},
}

test28 = {
 'hexagon_V6_vavgwrnd_128B': {'hvx_intrinsic': 'Vd.w=vavg(Vu.w,Vv.w):rnd',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 '(Vu.w[i]+Vv.w[i]+1)/2 ;}'},
}

test29 = {
 'hexagon_V6_vaddububb_sat_128B': {'hvx_intrinsic': 'Vd.ub=vadd(Vu.ub,Vv.b):sat',
                              'spec': 'for (i = 0; i < VELEM(8); i++) '
                                      '{Vd.ub[i] = usat8(Vu.ub[i] + Vv.b[i]) '
                                      ';}'},
}

test30 = {
 'hexagon_V6_vaddubsat_128B': {'hvx_intrinsic': 'Vd.ub=vadd(Vu.ub,Vv.ub):sat',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                  'usat8(Vu.ub[i]+Vv.ub[i]) ;}'},
}

test31 = {
 'hexagon_V6_vadduhsat_128B': {'hvx_intrinsic': 'Vd.uh=vadd(Vu.uh,Vv.uh):sat',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                  'usat16(Vu.uh[i]+Vv.uh[i]) ;}'},
}

test32 = {
 'hexagon_V6_vaddhsat_128B': {'hvx_intrinsic': 'Vd.h=vadd(Vu.h,Vv.h):sat',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                 'sat16(Vu.h[i]+Vv.h[i]) ;}'},
}

test33 = {
 'hexagon_V6_vaddh_128B': {'hvx_intrinsic': 'Vd.h=vadd(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i]+Vv.h[i]) ;}'},
}

test34 = {
 'hexagon_V6_vaddbq_128B': {'hvx_intrinsic': 'if (Qv4) Vx.b+=Vu.b',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i]=QvV.i '
                               '? Vx.ub[i] : Vx.ub[i]+Vu.ub[i] ;}'},
}

test35 = {
 'hexagon_V6_vaddbnq_128B': {'hvx_intrinsic': 'if (!Qv4) Vx.b+=Vu.b',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                '{Vx.ub[i]=QvV.i ? Vx.ub[i] : '
                                'Vx.ub[i]+Vu.ub[i] ;}'},
}

test36 = {
 'hexagon_V6_vaddbsat_128B': {'hvx_intrinsic': 'Vd.b=vadd(Vu.b,Vv.b):sat',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                 'sat8(Vu.b[i]+Vv.b[i]) ;}'},
}

test37 = {
 'hexagon_V6_vabsh_sat_128B': {'hvx_intrinsic': 'Vd.h=vabs(Vu.h):sat',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                  'sat16(ABS(Vu.h[i])) ;}'},
}


test38 = {
 'hexagon_V6_vabsh_128B': {
                      'hvx_intrinsic': 'Vd.h=vabs(Vu.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(ABS(Vu.h[i])) ;}'
                    },
}

test39 = {
 'hexagon_V6_vabsw_sat_128B': {'hvx_intrinsic': 'Vd.w=vabs(Vu.w):sat',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                  'sat32(ABS(Vu.w[i])) ;}'},
}

test40 = {
 'hexagon_V6_vsubububb_sat_128B': {'hvx_intrinsic': 'Vd.ub=vsub(Vu.ub,Vv.b):sat',
                              'spec': 'for (i = 0; i < VELEM(8); i++) '
                                      '{Vd.ub[i] = usat8(Vu.ub[i] - Vv.b[i]) '
                                      ';}'},
}

test41 = {
 'hexagon_V6_vsubuhsat_128B': {'hvx_intrinsic': 'Vd.uh=vsub(Vu.uh,Vv.uh):sat',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                  'usat16(Vu.uh[i]-Vv.uh[i]) ;}'},
}

test42 = {
 'hexagon_V6_vsubb_128B': {'hvx_intrinsic': 'Vd.b=vsub(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i]-Vv.b[i]) ;}'},
}

test43 = {
 'hexagon_V6_vunpackb_128B': {'hvx_intrinsic': 'Vdd.h=vunpack(Vu.b)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.h[i] = '
                                 'Vu.b[i] ;}'},
}

test44 = {
 'hexagon_V6_vunpackh_128B': {'hvx_intrinsic': 'Vdd.w=vunpack(Vu.h)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.w[i] = '
                                 'Vu.h[i] ;}'},
}

test45 = {
 'hexagon_V6_vaddw_128B': {'hvx_intrinsic': 'Vd.w=vadd(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i]+Vv.w[i]) ;}'},
}

test46 = {
 'hexagon_V6_vmux_128B': {'hvx_intrinsic': 'Vd=vmux(Qt4,Vu,Vv)',
                     'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                             'QtV[i] ? Vu.ub[i] : Vv.ub[i] ;}'},
}

test47 = {
 'hexagon_V6_vnavgb_128B': {'hvx_intrinsic': 'Vd.b=vnavg(Vu.b,Vv.b)',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                               '(Vu.b[i]-Vv.b[i])/2 ;}'},
}

test48 = {
 'hexagon_V6_vnavgh_128B': {'hvx_intrinsic': 'Vd.h=vnavg(Vu.h,Vv.h)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                               '(Vu.h[i]-Vv.h[i])/2 ;}'},
}

test49 = {
 'hexagon_V6_vnavgub_128B': {'hvx_intrinsic': 'Vd.b=vnavg(Vu.ub,Vv.ub)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                '(Vu.ub[i]-Vv.ub[i])/2 ;}'},
}

test50 = {
 'hexagon_V6_vnot_128B': {'hvx_intrinsic': 'Vd=vnot(Vu)',
                     'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                             '~Vu.uh[i] ;}'},
}

test51 = {
 'hexagon_V6_vor_128B': {'hvx_intrinsic': 'Vd=vor(Vu,Vv)',
                    'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                            'Vu.uh[i] | Vv.h[i] ;}'},
}

test52 = {
 'hexagon_V6_vsubuwsat_128B': {'hvx_intrinsic': 'Vd.uw=vsub(Vu.uw,Vv.uw):sat',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                  'usat32(Vu.uw[i]-Vv.uw[i]) ;}'},
}

test53 = {
 'hexagon_V6_vsubw_128B': {'hvx_intrinsic': 'Vd.w=vsub(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i]-Vv.w[i]) ;}'},
}

test54 = {
 'hexagon_V6_vsubh_128B': {'hvx_intrinsic': 'Vd.h=vsub(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i]-Vv.h[i]) ;}'},
}

test55 = {
 'hexagon_V6_vsububsat_128B': {'hvx_intrinsic': 'Vd.ub=vsub(Vu.ub,Vv.ub):sat',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                  'usat8(Vu.ub[i]-Vv.ub[i]) ;}'},
}

test56 = {
 'hexagon_V6_vunpackub_128B': {'hvx_intrinsic': 'Vdd.uh=vunpack(Vu.ub)',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.uh[i] = '
                                  'Vu.ub[i] ;}'},
}

test57 = {
 'hexagon_V6_vxor_128B': {'hvx_intrinsic': 'Vd=vxor(Vu,Vv)',
                     'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                             'Vu.uh[i] ^ Vv.h[i] ;}'},
}

test58 = {
 'hexagon_V6_vabsdiffh_128B': {
                          'hvx_intrinsic': 'Vd.uh=vabsdiff(Vu.h,Vv.h)',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                  '(Vu.h[i] > Vv.h[i]) ? (Vu.h[i] -Vv.h[i]) : '
                                  '(Vv.h[i] - Vu.h[i]) ;}'
                          },
}

test59 = {
 'hexagon_V6_vabsdiffub_128B': {
                           'hvx_intrinsic': 'Vd.ub=vabsdiff(Vu.ub,Vv.ub)',
                           'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                   '(Vu.ub[i] > Vv.ub[i]) ? (Vu.ub[i]- '
                                   'Vv.ub[i]) : (Vv.ub[i] - Vu.ub[i]) ;}'
                          },
}

test60 = {
 'hexagon_V6_vabsdiffuh_128B': {
                           'hvx_intrinsic': 'Vd.uh=vabsdiff(Vu.uh,Vv.uh)',
                           'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] '
                                   '= (Vu.uh[i] > Vv.uh[i]) ? (Vu.uh[i]- '
                                   'Vv.uh[i]) : (Vv.uh[i] - Vu.uh[i]) ;}'
                          },
}

test61 = {
 'hexagon_V6_vabsb_sat_128B': {
                          'hvx_intrinsic': 'Vd.b=vabs(Vu.b):sat',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                  'sat8(ABS(Vu.b[i])) ;}'
                        },
}

test62 = {
 'hexagon_V6_vabsb_128B': {
                      'hvx_intrinsic': 'Vd.b=vabs(Vu.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(ABS(Vu.b[i])) ;}'
                    },
}

test63 = {
 'hexagon_V6_vabsdiffuh_128B': {
                           'hvx_intrinsic': 'Vd.uh=vabsdiff(Vu.uh,Vv.uh)',
                           'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] '
                                   '= (Vu.uh[i] > Vv.uh[i]) ? (Vu.uh[i]- '
                                   'Vv.uh[i]) : (Vv.uh[i] - Vu.uh[i]) ;}'
                          },
}

test64 = {
 'hexagon_V6_vsubbsat_128B': {'hvx_intrinsic': 'Vd.b=vsub(Vu.b,Vv.b):sat',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                 'sat8(Vu.b[i]-Vv.b[i]) ;}'},
}

test65 = {
 'hexagon_V6_vsubhsat_128B': {'hvx_intrinsic': 'Vd.h=vsub(Vu.h,Vv.h):sat',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                 'sat16(Vu.h[i]-Vv.h[i]) ;}'},
}

test66 = {
 'hexagon_V6_vunpackuh_128B': {'hvx_intrinsic': 'Vdd.uw=vunpack(Vu.uh)',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.uw[i] '
                                  '= Vu.uh[i] ;}'},
}

test67 = {
 'hexagon_V6_vabsdiffw_128B': {'hvx_intrinsic': 'Vd.uw=vabsdiff(Vu.w,Vv.w)',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                  '(Vu.w[i] > Vv.w[i]) ? (Vu.w[i] -Vv.w[i]) : '
                                  '(Vv.w[i] - Vu.w[i]) ;}'},
}

test68 = {
 'hexagon_V6_vmpyiewuh_128B': {'hvx_intrinsic': 'Vd.w=vmpyie(Vu.w,Vv.uh)',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                  '(Vu.w[i] * Vv.w[i].uh[0]) ;}'},
}

test69 = {
 'hexagon_V6_vmpyiewuh_acc_128B': {'hvx_intrinsic': 'Vx.w+=vmpyie(Vu.w,Vv.uh)',
                              'spec': 'for (i = 0; i < VELEM(32); i++) '
                                      '{Vx.w[i] = Vx.w[i] + (Vu.w[i] '
                                      '*Vv.w[i].uh[0]) ;}'},
}

test70 = {
 'hexagon_V6_vmpyiewh_acc_128B': {'hvx_intrinsic': 'Vx.w+=vmpyie(Vu.w,Vv.h)',
                             'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                     '= Vx.w[i] + (Vu.w[i] * Vv.w[i].h[0]);}'},
}

test71 = {
 'hexagon_V6_vmpyiowh_128B': {'hvx_intrinsic': 'Vd.w=vmpyio(Vu.w,Vv.h)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 '(Vu.w[i] * Vv.w[i].h[1]) ;}'},
}

test72 = {
 'hexagon_V6_vaddhnq': {'hvx_intrinsic': 'if (!Qv4) Vx.h+=Vu.h',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]+Vu.h[i]) '
                                ';}'},
}

test73 = {
 'hexagon_V6_vaddhq_128B': {'hvx_intrinsic': 'if (Qv4) Vx.h+=Vu.h',
                       'spec': 'for (i = 0; i < VELEM(16); i++) '
                               '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]+Vu.h[i]) '
                               ';}'},
}

test74 = {
 'hexagon_V6_vaddwq_128B': {'hvx_intrinsic': 'if (Qv4) Vx.w+=Vu.w',
                       'spec': 'for (i = 0; i < VELEM(32); i++) '
                               '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]+Vu.w[i]) '
                               ';}'},
}

test75 = {
 'hexagon_V6_vaddwsat_128B': {'hvx_intrinsic': 'Vd.w=vadd(Vu.w,Vv.w):sat',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 'sat32(Vu.w[i]+Vv.w[i]) ;}'},
}

test76 = {
 'hexagon_V6_vaddwnq_128B': {'hvx_intrinsic': 'if (!Qv4) Vx.w+=Vu.w',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]+Vu.w[i]) '
                                ';}'},
}

test77 = {
 'hexagon_V6_vand_128B': {'hvx_intrinsic': 'Vd=vand(Vu,Vv)',
                     'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                             'Vu.uh[i] & Vv.h[i] ;}'},
}

test78 = {
 'hexagon_V6_vsubhnq_128B': {'hvx_intrinsic': 'if (!Qv4) Vx.h-=Vu.h',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]-Vu.h[i]) '
                                ';}'},
}

test79 = {
 'hexagon_V6_vsubhq_128B': {'hvx_intrinsic': 'if (Qv4) Vx.h-=Vu.h',
                       'spec': 'for (i = 0; i < VELEM(16); i++) '
                               '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]-Vu.h[i]) '
                               ';}'},
}

test80 = {
 'hexagon_V6_vsubwnq_128B': {'hvx_intrinsic': 'if (!Qv4) Vx.w-=Vu.w',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]-Vu.w[i]) '
                                ';}'},
}

test81 = {
 'hexagon_V6_vsubwq_128B': {'hvx_intrinsic': 'if (Qv4) Vx.w-=Vu.w',
                       'spec': 'for (i = 0; i < VELEM(32); i++) '
                               '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]-Vu.w[i]) '
                               ';}'},
}

test82 = {
 'hexagon_V6_vsubbq_128B': {'hvx_intrinsic': 'if (Qv4) Vx.b-=Vu.b',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i]=QvV.i '
                               '? Vx.ub[i] : Vx.ub[i]-Vu.ub[i] ;}'},
}

test83 = {
 'hexagon_V6_vsubbnq_128B': {'hvx_intrinsic': 'if (!Qv4) Vx.b-=Vu.b',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                '{Vx.ub[i]=QvV.i ? Vx.ub[i] : '
                                'Vx.ub[i]-Vu.ub[i] ;}'},
}

test84 = {
 'hexagon_V6_vshufoeb_128B': {'hvx_intrinsic': 'Vdd.b=vshuffoe(Vu.b,Vv.b)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].uh[i].b[0]=Vv.uh[i].ub[0];Vdd.v[0].uh[i].b[1]=Vu.uh[i].ub[0];Vdd.v[1].uh[i].b[0]=Vv.uh[i].ub[1];Vdd.v[1].uh[i].b[1]=Vu.uh[i].ub[1] '
                                 ';}'},
}

test85 = {
 'hexagon_V6_vshufoeh_128B': {'hvx_intrinsic': 'Vdd.h=vshuffoe(Vu.h,Vv.h)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) '
                                 '{Vdd.v[0].uw[i].h[0]=Vv.uw[i].uh[0];Vdd.v[0].uw[i].h[1]=Vu.uw[i].uh[0];Vdd.v[1].uw[i].h[0]=Vv.uw[i].uh[1];Vdd.v[1].uw[i].h[1]=Vu.uw[i].uh[1] '
                                 ';}'},
}

test86 = {
 'hexagon_V6_vshufoh_128B': {'hvx_intrinsic': 'Vd.h=vshuffo(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vd.uw[i].h[0]=Vv.uw[i].uh[1];Vd.uw[i].h[1]=Vu.uw[i].uh[1] '
                                ';}'},
}

test87 = {
 'hexagon_V6_vshuffob_128B': {'hvx_intrinsic': 'Vd.b=vshuffo(Vu.b,Vv.b)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vd.uh[i].b[0]=Vv.uh[i].ub[1];Vd.uh[i].b[1]=Vu.uh[i].ub[1] '
                                 ';}'},
}

test88 = {
 'hexagon_V6_vshuffeb_128B': {'hvx_intrinsic': 'Vd.b=vshuffe(Vu.b,Vv.b)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vd.uh[i].b[0]=Vv.uh[i].ub[0];Vd.uh[i].b[1]=Vu.uh[i].ub[0] '
                                 ';}'},
}

test89 = {
 'hexagon_V6_vshufeh_128B': {'hvx_intrinsic': 'Vd.h=vshuffe(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vd.uw[i].h[0]=Vv.uw[i].uh[0];Vd.uw[i].h[1]=Vu.uw[i].uh[0] '
                                ';}'},
}

test90 = {
 'hexagon_V6_vsh_128B': {'hvx_intrinsic': 'Vdd.w=vsxt(Vu.h)',
                    'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = '
                            'Vu.w[i].h[0];Vdd.v[1].w[i] = Vu.w[i].h[1] ;}'},
}

test91 = {
 'hexagon_V6_vsb_128B': {'hvx_intrinsic': 'Vdd.h=vsxt(Vu.b)',
                    'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
                            'Vu.h[i].b[0];Vdd.v[1].h[i] = Vu.h[i].b[1] ;}'},
}

test92 = {
 'hexagon_V6_vzh_128B': {'hvx_intrinsic': 'Vdd.uw=vzxt(Vu.uh)',
                    'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].uw[i] = '
                            'Vu.uw[i].uh[0];Vdd.v[1].uw[i] = Vu.uw[i].uh[1] '
                            ';}'}
}

test93 = {
 'hexagon_V6_vzb_128B': {'hvx_intrinsic': 'Vdd.uh=vzxt(Vu.ub)',
                    'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].uh[i] = '
                            'Vu.uh[i].ub[0];Vdd.v[1].uh[i] = Vu.uh[i].ub[1] '
                            ';}'},
}

test94 = {
 'hexagon_V6_vunpackob_128B': {'hvx_intrinsic': 'Vxx.h|=vunpacko(Vu.b)',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vxx.uh[i] '
                                  '|= Vu.ub[i]<<8 ;}'},
}

test95 = {
 'hexagon_V6_vunpackoh_128B': {'hvx_intrinsic': 'Vxx.w|=vunpacko(Vu.h)',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vxx.uw[i] '
                                  '|= Vu.uh[i]<<16 ;}'},
}

test96 = {
 'hexagon_V6_vmpyuhv_128B': {'hvx_intrinsic': 'Vdd.uw=vmpy(Vu.uh,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].uw[i] = (Vu.uw[i].uh[0] '
                                '*Vv.uw[i].uh[0]);Vdd.v[1].uw[i] = '
                                '(Vu.uw[i].uh[1] *Vv.uw[i].uh[1]) ;}'},
}

test97 = {
 'hexagon_V6_vmpyubv_128B': {'hvx_intrinsic': 'Vdd.uh=vmpy(Vu.ub,Vv.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].uh[i] = (Vu.uh[i].ub[0] '
                                '*Vv.uh[i].ub[0]);Vdd.v[1].uh[i] = '
                                '(Vu.uh[i].ub[1] *Vv.uh[i].ub[1]) ;}'},
}

test98 = {
 'hexagon_V6_vcombine_128B': {'hvx_intrinsic': 'Vdd=vcombine(Vu,Vv)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{Vdd.v[0].ub[i] = Vv.ub[i];Vdd.v[1].ub[i] = '
                                 'Vu.ub[i] ;}'},
}

test99 = {
 'hexagon_V6_vsubw_dv_128B': {'hvx_intrinsic': 'Vdd.w=vsub(Vuu.w,Vvv.w)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) '
                                 '{Vdd.v[0].w[i] = '
                                 '(Vuu.v[0].w[i]-Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                 '= (Vuu.v[1].w[i]-Vvv.v[1].w[i]) ;}'},
}

test100 = {
 'hexagon_V6_vsubwsat_dv_128B': {'hvx_intrinsic': 'Vdd.w=vsub(Vuu.w,Vvv.w):sat',
                            'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vdd.v[0].w[i] = '
                                    'sat32(Vuu.v[0].w[i]-Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                    '= sat32(Vuu.v[1].w[i]-Vvv.v[1].w[i]) ;}'},
}

test101 = {
 'hexagon_V6_vandvqv_128B': {'hvx_intrinsic': 'Vd=vand(Qv4,Vu)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                'QvV[i] ? Vu.b[i] : 0 ;}'},
}

test102 = {
 'hexagon_V6_vsubb_dv_128B': {'hvx_intrinsic': 'Vdd.b=vsub(Vuu.b,Vvv.b)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{Vdd.v[0].b[i] = '
                                 '(Vuu.v[0].b[i]-Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                 '= (Vuu.v[1].b[i]-Vvv.v[1].b[i]) ;}'},
}

test103 = {
 'hexagon_V6_vsubbsat_dv_128B': {'hvx_intrinsic': 'Vdd.b=vsub(Vuu.b,Vvv.b):sat',
                            'spec': 'for (i = 0; i < VELEM(8); i++) '
                                    '{Vdd.v[0].b[i] = '
                                    'sat8(Vuu.v[0].b[i]-Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                    '= sat8(Vuu.v[1].b[i]-Vvv.v[1].b[i]) ;}'},
}

test104 = {
 'hexagon_V6_vsubh_dv_128B': {'hvx_intrinsic': 'Vdd.h=vsub(Vuu.h,Vvv.h)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].h[i] = '
                                 '(Vuu.v[0].h[i]-Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                 '= (Vuu.v[1].h[i]-Vvv.v[1].h[i]) ;}'},
}

test105 = {
 'hexagon_V6_vsubhsat_dv_128B': {'hvx_intrinsic': 'Vdd.h=vsub(Vuu.h,Vvv.h):sat',
                            'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vdd.v[0].h[i] = '
                                    'sat16(Vuu.v[0].h[i]-Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                    '= sat16(Vuu.v[1].h[i]-Vvv.v[1].h[i]) ;}'},
}

test106 = {
 'hexagon_V6_vsubhw_128B': {'hvx_intrinsic': 'Vdd.w=vsub(Vu.h,Vv.h)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                               '= Vu.w[i].h[0] - Vv.w[i].h[0];Vdd.v[1].w[i] = '
                               'Vu.w[i].h[1] - Vv.w[i].h[1];}'},
}

test107 = {
 'hexagon_V6_vsububh_128B': {'hvx_intrinsic': 'Vdd.h=vsub(Vu.ub,Vv.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].h[i] = Vu.uh[i].ub[0] '
                                '-Vv.uh[i].ub[0];Vdd.v[1].h[i] = '
                                'Vu.uh[i].ub[1] -Vv.uh[i].ub[1] ;}'},
}

test108 = {
 'hexagon_V6_vsububsat_dv_128B': {'hvx_intrinsic': 'Vdd.ub=vsub(Vuu.ub,Vvv.ub):sat',
                             'spec': 'for (i = 0; i < VELEM(8); i++) '
                                     '{Vdd.v[0].ub[i] = '
                                     'usat8(Vuu.v[0].ub[i]-Vvv.v[0].ub[i]);Vdd.v[1].ub[i] '
                                     '= usat8(Vuu.v[1].ub[i]-Vvv.v[1].ub[i]) '
                                     ';}'},
}

test109 = {
 'hexagon_V6_vsubuhsat_dv_128B': {'hvx_intrinsic': 'Vdd.uh=vsub(Vuu.uh,Vvv.uh):sat',
                             'spec': 'for (i = 0; i < VELEM(16); i++) '
                                     '{Vdd.v[0].uh[i] = '
                                     'usat16(Vuu.v[0].uh[i]-Vvv.v[0].uh[i]);Vdd.v[1].uh[i] '
                                     '= usat16(Vuu.v[1].uh[i]-Vvv.v[1].uh[i]) '
                                     ';}'},
}


test110 = {
 'hexagon_V6_vsubuhw_128B': {'hvx_intrinsic': 'Vdd.w=vsub(Vu.uh,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] = Vu.uw[i].uh[0] '
                                '-Vv.uw[i].uh[0];Vdd.v[1].w[i] = '
                                'Vu.uw[i].uh[1] -Vv.uw[i].uh[1] ;}'},
}


test111 = {
 'hexagon_V6_vsubuwsat_dv_128B': {'hvx_intrinsic': 'Vdd.uw=vsub(Vuu.uw,Vvv.uw):sat',
                             'spec': 'for (i = 0; i < VELEM(32); i++) '
                                     '{Vdd.v[0].uw[i] = '
                                     'usat32(Vuu.v[0].uw[i]-Vvv.v[0].uw[i]);Vdd.v[1].uw[i] '
                                     '= usat32(Vuu.v[1].uw[i]-Vvv.v[1].uw[i]) '
                                     ';}'},
}

test112 = {
 'hexagon_V6_vmpybv_128B': {'hvx_intrinsic': 'Vdd.h=vmpy(Vu.b,Vv.b)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] '
                               '= (Vu.h[i].b[0] *Vv.h[i].b[0]);Vdd.v[1].h[i] = '
                               '(Vu.h[i].b[1] *Vv.h[i].b[1]) ;}'},
}

test113 = {
 'hexagon_V6_vmpybusv_128B': {'hvx_intrinsic': 'Vdd.h=vmpy(Vu.ub,Vv.b)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].h[i] = (Vu.uh[i].ub[0] '
                                 '*Vv.h[i].b[0]);Vdd.v[1].h[i] = '
                                 '(Vu.uh[i].ub[1] *Vv.h[i].b[1]) ;}'},
}

test114 = {
 'hexagon_V6_vmpyhus_128B': {'hvx_intrinsic': 'Vdd.w=vmpy(Vu.h,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] = (Vu.w[i].h[0] '
                                '*Vv.uw[i].uh[0]);Vdd.v[1].w[i] = '
                                '(Vu.w[i].h[1] *Vv.uw[i].uh[1]) ;}'},
}

test115 = {
'hexagon_V6_vmpyhv_128B': {'hvx_intrinsic': 'Vdd.w=vmpy(Vu.h,Vv.h)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                               '= (Vu.w[i].h[0] *Vv.w[i].h[0]);Vdd.v[1].w[i] = '
                               '(Vu.w[i].h[1] *Vv.w[i].h[1]) ;}'},
}

test116 = {
 'hexagon_V6_vaddb_dv_128B': {'hvx_intrinsic': 'Vdd.b=vadd(Vuu.b,Vvv.b)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{Vdd.v[0].b[i] '
                                 '=(Vuu.v[0].b[i]+Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                 '=(Vuu.v[1].b[i]+Vvv.v[1].b[i]) ;}'},
}

test117 = {
 'hexagon_V6_vaddbsat_dv_128B': {'hvx_intrinsic': 'Vdd.b=vadd(Vuu.b,Vvv.b):sat',
                            'spec': 'for (i = 0; i < VELEM(8); i++) '
                                    '{Vdd.v[0].b[i] '
                                    '=sat8(Vuu.v[0].b[i]+Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                    '=sat8(Vuu.v[1].b[i]+Vvv.v[1].b[i]) ;}'},
}

test118 = {
 'hexagon_V6_vaddh_dv_128B': {'hvx_intrinsic': 'Vdd.h=vadd(Vuu.h,Vvv.h)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].h[i] '
                                 '=(Vuu.v[0].h[i]+Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                 '=(Vuu.v[1].h[i]+Vvv.v[1].h[i]) ;}'},
}

test119 = {
 'hexagon_V6_vaddhsat_dv_128B': {'hvx_intrinsic': 'Vdd.h=vadd(Vuu.h,Vvv.h):sat',
                            'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vdd.v[0].h[i] '
                                    '=sat16(Vuu.v[0].h[i]+Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                    '=sat16(Vuu.v[1].h[i]+Vvv.v[1].h[i]) ;}'},
}

test120 = {
 'hexagon_V6_vaddhw_128B': {'hvx_intrinsic': 'Vdd.w=vadd(Vu.h,Vv.h)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                               '= Vu.w[i].h[0] + Vv.w[i].h[0];Vdd.v[1].w[i] = '
                               'Vu.w[i].h[1] + Vv.w[i].h[1];}'},
}

test121 = {
 'hexagon_V6_vaddubh_128B': {'hvx_intrinsic': 'Vdd.h=vadd(Vu.ub,Vv.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].h[i] = Vu.uh[i].ub[0] '
                                '+Vv.uh[i].ub[0];Vdd.v[1].h[i] = '
                                'Vu.uh[i].ub[1] +Vv.uh[i].ub[1] ;}'},
}


test122 = {
 'hexagon_V6_vaddubsat_dv_128B': {'hvx_intrinsic': 'Vdd.ub=vadd(Vuu.ub,Vvv.ub):sat',
                             'spec': 'for (i = 0; i < VELEM(8); i++) '
                                     '{Vdd.v[0].ub[i] '
                                     '=usat8(Vuu.v[0].ub[i]+Vvv.v[0].ub[i]);Vdd.v[1].ub[i] '
                                     '=usat8(Vuu.v[1].ub[i]+Vvv.v[1].ub[i]) '
                                     ';}'},
}

test123 = {
 'hexagon_V6_vadduhsat_dv_128B': {'hvx_intrinsic': 'Vdd.uh=vadd(Vuu.uh,Vvv.uh):sat',
                             'spec': 'for (i = 0; i < VELEM(16); i++) '
                                     '{Vdd.v[0].uh[i] '
                                     '=usat16(Vuu.v[0].uh[i]+Vvv.v[0].uh[i]);Vdd.v[1].uh[i] '
                                     '=usat16(Vuu.v[1].uh[i]+Vvv.v[1].uh[i]) '
                                     ';}'},
}


test124 = {
 'hexagon_V6_vadduhw_128B': {'hvx_intrinsic': 'Vdd.w=vadd(Vu.uh,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] = Vu.uw[i].uh[0] '
                                '+Vv.uw[i].uh[0];Vdd.v[1].w[i] = '
                                'Vu.uw[i].uh[1] +Vv.uw[i].uh[1] ;}'},
}

test125 = {
 'hexagon_V6_vadduwsat_dv_128B': {'hvx_intrinsic': 'Vdd.uw=vadd(Vuu.uw,Vvv.uw):sat',
                             'spec': 'for (i = 0; i < VELEM(32); i++) '
                                     '{Vdd.v[0].uw[i] '
                                     '=usat32(Vuu.v[0].uw[i]+Vvv.v[0].uw[i]);Vdd.v[1].uw[i] '
                                     '=usat32(Vuu.v[1].uw[i]+Vvv.v[1].uw[i]) '
                                     ';}'},
}

test126 = {
 'hexagon_V6_vaddw_dv_128B': {'hvx_intrinsic': 'Vdd.w=vadd(Vuu.w,Vvv.w)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) '
                                 '{Vdd.v[0].w[i] '
                                 '=(Vuu.v[0].w[i]+Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                 '=(Vuu.v[1].w[i]+Vvv.v[1].w[i]) ;}'},
}

test127 = {
 'hexagon_V6_vaddwsat_dv_128B': {'hvx_intrinsic': 'Vdd.w=vadd(Vuu.w,Vvv.w):sat',
                            'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vdd.v[0].w[i] '
                                    '=sat32(Vuu.v[0].w[i]+Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                    '=sat32(Vuu.v[1].w[i]+Vvv.v[1].w[i]) ;}'},
}

test128 = {
 'hexagon_V6_vadduhw_acc_128B': {'hvx_intrinsic': 'Vxx.w+=vadd(Vu.uh,Vv.uh)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vxx.v[0].w[i] += Vu.w[i].uh[0] '
                                    '+Vv.w[i].uh[0];Vxx.v[1].w[i] += '
                                    'Vu.w[i].uh[1] +Vv.w[i].uh[1] ;}'},
}

test129 = {
 'hexagon_V6_vaddubh_acc_128B': {'hvx_intrinsic': 'Vxx.h+=vadd(Vu.ub,Vv.ub)',
                            'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vxx.v[0].h[i] += Vu.h[i].ub[0] '
                                    '+Vv.h[i].ub[0];Vxx.v[1].h[i] += '
                                    'Vu.h[i].ub[1] +Vv.h[i].ub[1] ;}'},
}

test130 = {
 'hexagon_V6_vaddhw_acc_128B': {'hvx_intrinsic': 'Vxx.w+=vadd(Vu.h,Vv.h)',
                           'spec': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vxx.v[0].w[i] += Vu.w[i].h[0] '
                                   '+Vv.w[i].h[0];Vxx.v[1].w[i] += '
                                   'Vu.w[i].h[1] + Vv.w[i].h[1];}'},
}

test131 = {
 'hexagon_V6_vshuffh_128B': {'hvx_intrinsic': 'Vd.h=vshuff(Vu.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vd.uw[i].h[0]=Vu.uh[i];Vd.uw[i].h[1]=Vu.uh[i+VBITS/32] '
                                ';}'},
}

test132 = {
 'hexagon_V6_vshuffb_128B': {'hvx_intrinsic': 'Vd.b=vshuff(Vu.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vd.uh[i].b[0]=Vu.ub[i];Vd.uh[i].b[1]=Vu.ub[i+VBITS/16] '
                                ';}'},
}

test133 = {
 'hexagon_V6_vrmpybus_acc_128B': {'hvx_intrinsic': 'Vx.w+=vrmpy(Vu.ub,Rt.b)',
                             'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                     '+= (Vu.uw[i].ub[0] * Rt.b[0]);Vx.w[i] += '
                                     '(Vu.uw[i].ub[1] * Rt.b[1]);Vx.w[i] += '
                                     '(Vu.uw[i].ub[2] * Rt.b[2]);Vx.w[i] += '
                                     '(Vu.uw[i].ub[3] * Rt.b[3]) ;}'},
}

test134 = {
 'hexagon_V6_vrmpybusv_acc_128B': {'hvx_intrinsic': 'Vx.w+=vrmpy(Vu.ub,Vv.b)',
                              'spec': 'for (i = 0; i < VELEM(32); i++) '
                                      '{Vx.w[i] += (Vu.uw[i].ub[0] * '
                                      'Vv.w[i].b[0]);Vx.w[i] += '
                                      '(Vu.uw[i].ub[1] * Vv.w[i].b[1]);Vx.w[i] '
                                      '+= (Vu.uw[i].ub[2] * '
                                      'Vv.w[i].b[2]);Vx.w[i] += '
                                      '(Vu.uw[i].ub[3] * Vv.w[i].b[3]) ;}'},
}

test135 = {
 'hexagon_V6_vrmpybv_acc_128B': {'hvx_intrinsic': 'Vx.w+=vrmpy(Vu.b,Vv.b)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                    '+= (Vu.w[i].b[0] * Vv.w[i].b[0]);Vx.w[i] '
                                    '+= (Vu.w[i].b[1] * Vv.w[i].b[1]);Vx.w[i] '
                                    '+= (Vu.w[i].b[2] * Vv.w[i].b[2]);Vx.w[i] '
                                    '+= (Vu.w[i].b[3] * Vv.w[i].b[3]) ;}'},
}

test136 = {
 'hexagon_V6_vrmpyub_acc_128B': {'hvx_intrinsic': 'Vx.uw+=vrmpy(Vu.ub,Rt.ub)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.uw[i] '
                                    '+= (Vu.uw[i].ub[0] * Rt.ub[0]);Vx.uw[i] '
                                    '+= (Vu.uw[i].ub[1] * Rt.ub[1]);Vx.uw[i] '
                                    '+= (Vu.uw[i].ub[2] * Rt.ub[2]);Vx.uw[i] '
                                    '+= (Vu.uw[i].ub[3] * Rt.ub[3]) ;}'},
}

test137 = {
 'hexagon_V6_vrmpyubv_acc_128B': {'hvx_intrinsic': 'Vx.uw+=vrmpy(Vu.ub,Vv.ub)',
                             'spec': 'for (i = 0; i < VELEM(32); i++) '
                                     '{Vx.uw[i] += (Vu.uw[i].ub[0] '
                                     '*Vv.uw[i].ub[0]);Vx.uw[i] += '
                                     '(Vu.uw[i].ub[1] '
                                     '*Vv.uw[i].ub[1]);Vx.uw[i] += '
                                     '(Vu.uw[i].ub[2] '
                                     '*Vv.uw[i].ub[2]);Vx.uw[i] += '
                                     '(Vu.uw[i].ub[3] *Vv.uw[i].ub[3]) ;}'},
}

test138 = {
 'hexagon_V6_vmpyuh_acc_128B': {'hvx_intrinsic': 'Vxx.uw+=vmpy(Vu.uh,Rt.uh)',
                           'spec': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vxx.v[0].uw[i] += (Vu.uw[i].uh[0] '
                                   '*Rt.uh[0]);Vxx.v[1].uw[i] += '
                                   '(Vu.uw[i].uh[1] *Rt.uh[1]) ;}'},
}

test139 = {
 'hexagon_V6_vmpyubv_acc_128B': {'hvx_intrinsic': 'Vxx.uh+=vmpy(Vu.ub,Vv.ub)',
                            'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vxx.v[0].uh[i] += (Vu.uh[i].ub[0] '
                                    '*Vv.uh[i].ub[0]);Vxx.v[1].uh[i] += '
                                    '(Vu.uh[i].ub[1] *Vv.uh[i].ub[1]) ;}'},
}

test140 = {
 'hexagon_V6_vmpyuhv_acc_128B': {'hvx_intrinsic': 'Vxx.uw+=vmpy(Vu.uh,Vv.uh)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vxx.v[0].uw[i] += (Vu.uw[i].uh[0] '
                                    '*Vv.uw[i].uh[0]);Vxx.v[1].uw[i] += '
                                    '(Vu.uw[i].uh[1] *Vv.uw[i].uh[1]) ;}'},
}

test141 = {
 'hexagon_V6_vandvnqv_128B': {'hvx_intrinsic': 'Vd=vand(!Qv4,Vu)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                 '!QvV[i] ? Vu.b[i] : 0 ;}'},
}

test142 = {
 'hexagon_V6_vandvrt_128B': {'hvx_intrinsic': 'Qd4=vand(Vu,Rt)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                '{QdV[i]=((Vu.ub[i] & Rt.ub[i % 4]) != 0) ? 1 '
                                ': 0 ;}'},
}

test143 = {
 'hexagon_V6_vandqrt_128B': {'hvx_intrinsic': 'Vd=vand(Qu4,Rt)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                'QuV[i] ? Rt.ub[i % 4] : 0 ;}'},
}

test144 = {
 'hexagon_V6_vandnqrt_128B': {'hvx_intrinsic': 'Vd=vand(!Qu4,Rt)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                 '!QuV[i] ? Rt.ub[i % 4] : 0 ;}'},
}

test145 = {
 'hexagon_V6_pred_not_128B': {
                         'hvx_intrinsic': 'Qd4=not(Qs4)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{QdV[i]=!QsV[i] ;}'
                        },
}

test146 = {
 'hexagon_V6_vmpyh_128B': {'hvx_intrinsic': 'Vdd.w=vmpy(Vu.h,Rt.h)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                              '= (Vu.w[i].h[0] * Rt.h[0]);Vdd.v[1].w[i] = '
                              '(Vu.w[i].h[1] * Rt.h[1]) ;}'},
}

test147 = {
 'hexagon_V6_vmpyih_128B': {'hvx_intrinsic': 'Vd.h=vmpyi(Vu.h,Vv.h)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                               '(Vu.h[i] * Vv.h[i]) ;}'},
}

test148 = {
 'hexagon_V6_vmpyih_acc_128B': {'hvx_intrinsic': 'Vx.h+=vmpyi(Vu.h,Vv.h)',
                           'spec': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i] '
                                   '+= (Vu.h[i] * Vv.h[i]) ;}'},
}

test149 = {
 'hexagon_V6_vmpyuh_128B': {'hvx_intrinsic': 'Vdd.uw=vmpy(Vu.uh,Rt.uh)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) '
                               '{Vdd.v[0].uw[i] = (Vu.uw[i].uh[0] '
                               '*Rt.uh[0]);Vdd.v[1].uw[i] = (Vu.uw[i].uh[1] * '
                               'Rt.uh[1]);}'},
}

test150 = {
 'hexagon_V6_veqb_128B': {'hvx_intrinsic': 'Qd4=vcmp.eq(Vu.b,Vv.b)',
                     'spec': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                             '((Vu.b[i/1] == Vv.b[i/1]) ?0x1 : 0);}'},
}

test151 = {
 'hexagon_V6_veqh_128B': {'hvx_intrinsic': 'Qd4=vcmp.eq(Vu.h,Vv.h)',
                     'spec': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                             '((Vu.h[i/2] == Vv.h[i/2]) ?0x3 : 0);}'},
}

test152 = {
 'hexagon_V6_veqb_128B': {'hvx_intrinsic': 'Qd4=vcmp.eq(Vu.b,Vv.b)',
                     'spec': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                             '((Vu.b[i/1] == Vv.b[i/1]) ?0x1 : 0);}'},
}

test153 = {
 'hexagon_V6_veqw_128B': {'hvx_intrinsic': 'Qd4=vcmp.eq(Vu.w,Vv.w)',
                     'spec': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                             '((Vu.w[i/4] == Vv.w[i/4]) ?0xF : 0);}'},
}

test154 = {
 'hexagon_V6_vgtb_128B': {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.b,Vv.b)',
                     'spec': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                             '((Vu.b[i/1] > Vv.b[i/1]) ?0x1 : 0);}'},
}

test155 = {
 'hexagon_V6_vgth_128B': {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.h,Vv.h)',
                     'spec': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                             '((Vu.h[i/2] > Vv.h[i/2]) ?0x3 : 0);}'},
}

test156 = {
 'hexagon_V6_vgtub_128B': {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.ub,Vv.ub)',
                      'spec': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                              '((Vu.ub[i/1] > Vv.ub[i/1]) ?0x1 : 0);}'},
}

test157 = {
 'hexagon_V6_vgtuh_128B': {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.uh,Vv.uh)',
                      'spec': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                              '((Vu.uh[i/2] > Vv.uh[i/2]) ?0x3 : 0);}'},
}

test158 = {
 'hexagon_V6_vgtuw_128B': {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.uw,Vv.uw)',
                      'spec': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                              '((Vu.uw[i/4] > Vv.uw[i/4]) ?0xF : 0);}'},
}

test159 = {
 'hexagon_V6_vgtw_128B': {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.w,Vv.w)',
                     'spec': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                             '((Vu.w[i/4] > Vv.w[i/4]) ?0xF : 0);}'},
}

test160 = {
 'hexagon_V6_vinsertwr_128B': {'hvx_intrinsic': 'Vx.w=vinsert(Rt)',
                          'spec': 'Vx.uw[0] = Rt;'},
}

test161 = {
 'hexagon_V6_vdealb_128B': {'hvx_intrinsic': 'Vd.b=vdeal(Vu.b)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i ] = '
                               'Vu.uh[i].ub[0];Vd.ub[i+VBITS/16] = '
                               'Vu.uh[i].ub[1] ;}'},
}

test162 = {
 'hexagon_V6_vdealh_128B': {'hvx_intrinsic': 'Vd.h=vdeal(Vu.h)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i ] = '
                               'Vu.uw[i].uh[0];Vd.uh[i+VBITS/32] = '
                               'Vu.uw[i].uh[1] ;}'},
}

test163 = {
 'hexagon_V6_vmpyuhe_128B': {'hvx_intrinsic': 'Vd.uw=vmpye(Vu.uh,Rt.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                '(Vu.uw[i].uh[0] * Rt.uh[0]) ;}'},
}

test164 =  {
 'hexagon_V6_vmpyuhe_acc_128B': {'hvx_intrinsic': 'Vx.uw+=vmpye(Vu.uh,Rt.uh)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.uw[i] '
                                    '+= (Vu.uw[i].uh[0] * Rt.uh[0]) ;}'},
}

test165 = {
 'hexagon_V6_vrmpyub_128B': {'hvx_intrinsic': 'Vd.uw=vrmpy(Vu.ub,Rt.ub)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                '(Vu.uw[i].ub[0] * Rt.ub[0]);Vd.uw[i] += '
                                '(Vu.uw[i].ub[1] * Rt.ub[1]);Vd.uw[i] += '
                                '(Vu.uw[i].ub[2] * Rt.ub[2]);Vd.uw[i] += '
                                '(Vu.uw[i].ub[3] * Rt.ub[3]) ;}'},
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


from RoseHexPseudoCodeParser import *

def Compile():
   Test = test165
   SemaList = list()
   for Name, Dictionary in Test.items():
      Pseudocode = Dictionary['spec']
      Inst = Dictionary['hvx_intrinsic']
      Spec = GetSpecFrom(Name, Inst, Pseudocode)
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
      CompiledFunction = CompileSemantics(Spec)
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



