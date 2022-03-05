Insts = {'hexagon_V6_lvsplatb': {'hvx_intrinsic': 'Vd.b=vsplat(Rt)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                 'Rt ;}'},
 'hexagon_V6_lvsplath': {'hvx_intrinsic': 'Vd.h=vsplat(Rt)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                 'Rt ;}'},
 'hexagon_V6_lvsplatw': {'hvx_intrinsic': 'Vd=vsplat(Rt)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                 'Rt ;}'},
 'hexagon_V6_pred_and': {'hvx_intrinsic': 'Qd4=and(Qs4,Qt4)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{QdV[i]=QsV[i] && QtV[i] ;}'},
 'hexagon_V6_pred_and_n': {'hvx_intrinsic': 'Qd4=and(Qs4,!Qt4)',
                           'spec': 'for (i = 0; i < VELEM(8); i++) '
                                   '{QdV[i]=QsV[i] && !QtV[i] ;}'},
 'hexagon_V6_pred_not': {'hvx_intrinsic': 'Qd4=not(Qs4)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{QdV[i]=!QsV[i] ;}'},
 'hexagon_V6_pred_or': {'hvx_intrinsic': 'Qd4=or(Qs4,Qt4)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] '
                                '|| QtV[i] ;}'},
 'hexagon_V6_pred_or_n': {'hvx_intrinsic': 'Qd4=or(Qs4,!Qt4)',
                          'spec': 'for (i = 0; i < VELEM(8); i++) '
                                  '{QdV[i]=QsV[i] || !QtV[i] ;}'},
 'hexagon_V6_pred_scalar2': {'hvx_intrinsic': 'Qd4=vsetq(Rt)',
                             'spec': 'for(i = 0; i < VWIDTH; i++) QdV[i]=(i < '
                                     '(Rt &(VWIDTH-1))) ? 1 : 0;'},
 'hexagon_V6_pred_scalar2v2': {'hvx_intrinsic': 'Qd4=vsetq2(Rt)',
                               'spec': 'for(i = 0; i < VWIDTH; i++) QdV[i]=(i '
                                       '<= ((Rt-1)& (VWIDTH-1))) ? 1 : 0;'},
 'hexagon_V6_pred_xor': {'hvx_intrinsic': 'Qd4=xor(Qs4,Qt4)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{QdV[i]=QsV[i] ^ QtV[i] ;}'},
 'hexagon_V6_shuffeqh_128B': {'hvx_intrinsic': 'Qd4.b=vshuffe(Qs4.h,Qt4.h)',
                              'spec': 'for (i = 0; i < VELEM(8); i++) '
                                      '{QdV[i]=(i & 1) ? QsV[i-1] : QtV[i] ;}'},
 'hexagon_V6_shuffeqw': {'hvx_intrinsic': 'Qd4.h=vshuffe(Qs4.w,Qt4.w)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=(i & '
                                 '2) ? QsV[i-2] : QtV[i] ;}'},
 'hexagon_V6_vabsb': {'hvx_intrinsic': 'Vd.b=vabs(Vu.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(ABS(Vu.b[i])) ;}'},
 'hexagon_V6_vabsb_sat': {'hvx_intrinsic': 'Vd.b=vabs(Vu.b):sat',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                  'sat8(ABS(Vu.b[i])) ;}'},
 'hexagon_V6_vabsdiffh': {'hvx_intrinsic': 'Vd.uh=vabsdiff(Vu.h,Vv.h)',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                  '(Vu.h[i] > Vv.h[i]) ? (Vu.h[i] -Vv.h[i]) : '
                                  '(Vv.h[i] - Vu.h[i]) ;}'},
 'hexagon_V6_vabsdiffub': {'hvx_intrinsic': 'Vd.ub=vabsdiff(Vu.ub,Vv.ub)',
                           'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                   '(Vu.ub[i] > Vv.ub[i]) ? (Vu.ub[i]- '
                                   'Vv.ub[i]) : (Vv.ub[i] - Vu.ub[i]) ;}'},
 'hexagon_V6_vabsdiffuh': {'hvx_intrinsic': 'Vd.uh=vabsdiff(Vu.uh,Vv.uh)',
                           'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] '
                                   '= (Vu.uh[i] > Vv.uh[i]) ? (Vu.uh[i]- '
                                   'Vv.uh[i]) : (Vv.uh[i] - Vu.uh[i]) ;}'},
 'hexagon_V6_vabsdiffw': {'hvx_intrinsic': 'Vd.uw=vabsdiff(Vu.w,Vv.w)',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                  '(Vu.w[i] > Vv.w[i]) ? (Vu.w[i] -Vv.w[i]) : '
                                  '(Vv.w[i] - Vu.w[i]) ;}'},
 'hexagon_V6_vabsh': {'hvx_intrinsic': 'Vd.h=vabs(Vu.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(ABS(Vu.h[i])) ;}'},
 'hexagon_V6_vabsh_sat': {'hvx_intrinsic': 'Vd.h=vabs(Vu.h):sat',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                  'sat16(ABS(Vu.h[i])) ;}'},
 'hexagon_V6_vabsw': {'hvx_intrinsic': 'Vd.w=vabs(Vu.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(ABS(Vu.w[i])) ;}'},
 'hexagon_V6_vabsw_sat': {'hvx_intrinsic': 'Vd.w=vabs(Vu.w):sat',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                  'sat32(ABS(Vu.w[i])) ;}'},
 'hexagon_V6_vaddb': {'hvx_intrinsic': 'Vd.b=vadd(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i]+Vv.b[i]) ;}'},
 'hexagon_V6_vaddb_dv': {'hvx_intrinsic': 'Vdd.b=vadd(Vuu.b,Vvv.b)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{Vdd.v[0].b[i] '
                                 '=(Vuu.v[0].b[i]+Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                 '=(Vuu.v[1].b[i]+Vvv.v[1].b[i]) ;}'},
 'hexagon_V6_vaddbnq': {'hvx_intrinsic': 'if (!Qv4) Vx.b+=Vu.b',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                '{Vx.ub[i]=QvV.i ? Vx.ub[i] : '
                                'Vx.ub[i]+Vu.ub[i] ;}'},
 'hexagon_V6_vaddbq': {'hvx_intrinsic': 'if (Qv4) Vx.b+=Vu.b',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i]=QvV.i '
                               '? Vx.ub[i] : Vx.ub[i]+Vu.ub[i] ;}'},
 'hexagon_V6_vaddbsat': {'hvx_intrinsic': 'Vd.b=vadd(Vu.b,Vv.b):sat',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                 'sat8(Vu.b[i]+Vv.b[i]) ;}'},
 'hexagon_V6_vaddbsat_dv': {'hvx_intrinsic': 'Vdd.b=vadd(Vuu.b,Vvv.b):sat',
                            'spec': 'for (i = 0; i < VELEM(8); i++) '
                                    '{Vdd.v[0].b[i] '
                                    '=sat8(Vuu.v[0].b[i]+Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                    '=sat8(Vuu.v[1].b[i]+Vvv.v[1].b[i]) ;}'},
 'hexagon_V6_vaddcarry': {'hvx_intrinsic': 'Vd.w,Qe4=vadd(Vu.w,Vv.w):carry',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                  'Vu.w[i]+Vv.w[i];QeV[4*i+4-1:4*i] = '
                                  '-carry_from(Vu.w[i],Vv.w[i],0) ;}'},
 'hexagon_V6_vaddcarrysat': {'hvx_intrinsic': 'Vd.w=vadd(Vu.w,Vv.w,Qs4):carry:sat',
                             'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] '
                                     '= sat32(Vu.w[i]+Vv.w[i]+QsV[i*4]) ;}'},
 'hexagon_V6_vaddh': {'hvx_intrinsic': 'Vd.h=vadd(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i]+Vv.h[i]) ;}'},
 'hexagon_V6_vaddh_dv': {'hvx_intrinsic': 'Vdd.h=vadd(Vuu.h,Vvv.h)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].h[i] '
                                 '=(Vuu.v[0].h[i]+Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                 '=(Vuu.v[1].h[i]+Vvv.v[1].h[i]) ;}'},
 'hexagon_V6_vaddhnq': {'hvx_intrinsic': 'if (!Qv4) Vx.h+=Vu.h',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]+Vu.h[i]) '
                                ';}'},
 'hexagon_V6_vaddhq': {'hvx_intrinsic': 'if (Qv4) Vx.h+=Vu.h',
                       'spec': 'for (i = 0; i < VELEM(16); i++) '
                               '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]+Vu.h[i]) '
                               ';}'},
 'hexagon_V6_vaddhsat': {'hvx_intrinsic': 'Vd.h=vadd(Vu.h,Vv.h):sat',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                 'sat16(Vu.h[i]+Vv.h[i]) ;}'},
 'hexagon_V6_vaddhsat_dv': {'hvx_intrinsic': 'Vdd.h=vadd(Vuu.h,Vvv.h):sat',
                            'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vdd.v[0].h[i] '
                                    '=sat16(Vuu.v[0].h[i]+Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                    '=sat16(Vuu.v[1].h[i]+Vvv.v[1].h[i]) ;}'},
 'hexagon_V6_vaddhw': {'hvx_intrinsic': 'Vdd.w=vadd(Vu.h,Vv.h)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                               '= Vu.w[i].h[0] + Vv.w[i].h[0];Vdd.v[1].w[i] = '
                               'Vu.w[i].h[1] + Vv.w[i].h[1];}'},
 'hexagon_V6_vaddhw_acc': {'hvx_intrinsic': 'Vxx.w+=vadd(Vu.h,Vv.h)',
                           'spec': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vxx.v[0].w[i] += Vu.w[i].h[0] '
                                   '+Vv.w[i].h[0];Vxx.v[1].w[i] += '
                                   'Vu.w[i].h[1] + Vv.w[i].h[1];}'},
 'hexagon_V6_vaddubh': {'hvx_intrinsic': 'Vdd.h=vadd(Vu.ub,Vv.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].h[i] = Vu.uh[i].ub[0] '
                                '+Vv.uh[i].ub[0];Vdd.v[1].h[i] = '
                                'Vu.uh[i].ub[1] +Vv.uh[i].ub[1] ;}'},
 'hexagon_V6_vaddubh_acc': {'hvx_intrinsic': 'Vxx.h+=vadd(Vu.ub,Vv.ub)',
                            'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vxx.v[0].h[i] += Vu.h[i].ub[0] '
                                    '+Vv.h[i].ub[0];Vxx.v[1].h[i] += '
                                    'Vu.h[i].ub[1] +Vv.h[i].ub[1] ;}'},
 'hexagon_V6_vaddubsat': {'hvx_intrinsic': 'Vd.ub=vadd(Vu.ub,Vv.ub):sat',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                  'usat8(Vu.ub[i]+Vv.ub[i]) ;}'},
 'hexagon_V6_vaddubsat_dv': {'hvx_intrinsic': 'Vdd.ub=vadd(Vuu.ub,Vvv.ub):sat',
                             'spec': 'for (i = 0; i < VELEM(8); i++) '
                                     '{Vdd.v[0].ub[i] '
                                     '=usat8(Vuu.v[0].ub[i]+Vvv.v[0].ub[i]);Vdd.v[1].ub[i] '
                                     '=usat8(Vuu.v[1].ub[i]+Vvv.v[1].ub[i]) '
                                     ';}'},
 'hexagon_V6_vaddububb_sat': {'hvx_intrinsic': 'Vd.ub=vadd(Vu.ub,Vv.b):sat',
                              'spec': 'for (i = 0; i < VELEM(8); i++) '
                                      '{Vd.ub[i] = usat8(Vu.ub[i] + Vv.b[i]) '
                                      ';}'},
 'hexagon_V6_vadduhsat': {'hvx_intrinsic': 'Vd.uh=vadd(Vu.uh,Vv.uh):sat',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                  'usat16(Vu.uh[i]+Vv.uh[i]) ;}'},
 'hexagon_V6_vadduhsat_dv': {'hvx_intrinsic': 'Vdd.uh=vadd(Vuu.uh,Vvv.uh):sat',
                             'spec': 'for (i = 0; i < VELEM(16); i++) '
                                     '{Vdd.v[0].uh[i] '
                                     '=usat16(Vuu.v[0].uh[i]+Vvv.v[0].uh[i]);Vdd.v[1].uh[i] '
                                     '=usat16(Vuu.v[1].uh[i]+Vvv.v[1].uh[i]) '
                                     ';}'},
 'hexagon_V6_vadduhw': {'hvx_intrinsic': 'Vdd.w=vadd(Vu.uh,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] = Vu.uw[i].uh[0] '
                                '+Vv.uw[i].uh[0];Vdd.v[1].w[i] = '
                                'Vu.uw[i].uh[1] +Vv.uw[i].uh[1] ;}'},
 'hexagon_V6_vadduhw_acc': {'hvx_intrinsic': 'Vxx.w+=vadd(Vu.uh,Vv.uh)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vxx.v[0].w[i] += Vu.w[i].uh[0] '
                                    '+Vv.w[i].uh[0];Vxx.v[1].w[i] += '
                                    'Vu.w[i].uh[1] +Vv.w[i].uh[1] ;}'},
 'hexagon_V6_vadduwsat': {'hvx_intrinsic': 'Vd.uw=vadd(Vu.uw,Vv.uw):sat',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                  'usat32(Vu.uw[i]+Vv.uw[i]) ;}'},
 'hexagon_V6_vadduwsat_dv': {'hvx_intrinsic': 'Vdd.uw=vadd(Vuu.uw,Vvv.uw):sat',
                             'spec': 'for (i = 0; i < VELEM(32); i++) '
                                     '{Vdd.v[0].uw[i] '
                                     '=usat32(Vuu.v[0].uw[i]+Vvv.v[0].uw[i]);Vdd.v[1].uw[i] '
                                     '=usat32(Vuu.v[1].uw[i]+Vvv.v[1].uw[i]) '
                                     ';}'},
 'hexagon_V6_vaddw': {'hvx_intrinsic': 'Vd.w=vadd(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i]+Vv.w[i]) ;}'},
 'hexagon_V6_vaddw_dv': {'hvx_intrinsic': 'Vdd.w=vadd(Vuu.w,Vvv.w)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) '
                                 '{Vdd.v[0].w[i] '
                                 '=(Vuu.v[0].w[i]+Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                 '=(Vuu.v[1].w[i]+Vvv.v[1].w[i]) ;}'},
 'hexagon_V6_vaddwnq': {'hvx_intrinsic': 'if (!Qv4) Vx.w+=Vu.w',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]+Vu.w[i]) '
                                ';}'},
 'hexagon_V6_vaddwq': {'hvx_intrinsic': 'if (Qv4) Vx.w+=Vu.w',
                       'spec': 'for (i = 0; i < VELEM(32); i++) '
                               '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]+Vu.w[i]) '
                               ';}'},
 'hexagon_V6_vaddwsat': {'hvx_intrinsic': 'Vd.w=vadd(Vu.w,Vv.w):sat',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 'sat32(Vu.w[i]+Vv.w[i]) ;}'},
 'hexagon_V6_vaddwsat_dv': {'hvx_intrinsic': 'Vdd.w=vadd(Vuu.w,Vvv.w):sat',
                            'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vdd.v[0].w[i] '
                                    '=sat32(Vuu.v[0].w[i]+Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                    '=sat32(Vuu.v[1].w[i]+Vvv.v[1].w[i]) ;}'},
 'hexagon_V6_valignb': {'hvx_intrinsic': 'Vd=valign(Vu,Vv,Rt)',
                        'spec': 'unsigned shift = Rt & (VWIDTH-1);for(i = 0; i '
                                '< VWIDTH; i++) {Vd.ub[i] = (i+shift>=VWIDTH) '
                                '?Vu.ub[i+shift-VWIDTH] : Vv.ub[i+shift];}'},
 'hexagon_V6_valignbi': {'hvx_intrinsic': 'Vd=valign(Vu,Vv,#u3)',
                         'spec': 'for(i = 0; i < VWIDTH; i++) {Vd.ub[i] = '
                                 '(i+#u>=VWIDTH) ? Vu.ub[i+#u-VWIDTH] : '
                                 'Vv.ub[i+#u];}'},
 'hexagon_V6_vand': {'hvx_intrinsic': 'Vd=vand(Vu,Vv)',
                     'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                             'Vu.uh[i] & Vv.h[i] ;}'},
 'hexagon_V6_vandnqrt': {'hvx_intrinsic': 'Vd=vand(!Qu4,Rt)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                 '!QuV[i] ? Rt.ub[i % 4] : 0 ;}'},
 'hexagon_V6_vandnqrt_acc': {'hvx_intrinsic': 'Vx|=vand(!Qu4,Rt)',
                             'spec': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i] '
                                     '|= !(QuV[i]) ? Rt.ub[i % 4] : 0 ;}'},
 'hexagon_V6_vandqrt': {'hvx_intrinsic': 'Vd=vand(Qu4,Rt)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                'QuV[i] ? Rt.ub[i % 4] : 0 ;}'},
 'hexagon_V6_vandqrt_acc': {'hvx_intrinsic': 'Vx|=vand(Qu4,Rt)',
                            'spec': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i] '
                                    '|= (QuV[i]) ? Rt.ub[i % 4] : 0 ;}'},
 'hexagon_V6_vandvnqv': {'hvx_intrinsic': 'Vd=vand(!Qv4,Vu)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                 '!QvV[i] ? Vu.b[i] : 0 ;}'},
 'hexagon_V6_vandvqv': {'hvx_intrinsic': 'Vd=vand(Qv4,Vu)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                'QvV[i] ? Vu.b[i] : 0 ;}'},
 'hexagon_V6_vandvrt': {'hvx_intrinsic': 'Qd4=vand(Vu,Rt)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                '{QdV[i]=((Vu.ub[i] & Rt.ub[i % 4]) != 0) ? 1 '
                                ': 0 ;}'},
 'hexagon_V6_vandvrt_acc': {'hvx_intrinsic': 'Qx4|=vand(Vu,Rt)',
                            'spec': 'for (i = 0; i < VELEM(8); i++) '
                                    '{QxV[i]=QxV[i]|(((Vu.ub[i] & Rt.ub[i % '
                                    '4]) != 0) ? 1: 0) ;}'},
 'hexagon_V6_vasr_into': {'hvx_intrinsic': 'Vxx.w=vasrinto(Vu.w,Vv.w)',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {shift = '
                                  '(Vu.w[i] << 32);mask = (((Vxx.v[0].w[i]) << '
                                  '32) |Vxx.v[0].w[i]);lomask = (((1) << 32) - '
                                  '1);count = -(0x40 & Vv.w[i]) + (Vv.w[i] & '
                                  '0x3f);result = (count == -0x40) ? 0 : '
                                  '(((count < 0)? ((shift << -(count)) | (mask '
                                  '& (lomask << -(count)))) : ((shift >> '
                                  'count) | (mask & (lomask>> '
                                  'count)))));Vxx.v[1].w[i] = ((result >> 32) '
                                  '&0xffffffff);Vxx.v[0].w[i] = (result & '
                                  '0xffffffff) ;}'},
 'hexagon_V6_vassign': {'hvx_intrinsic': 'Vd=Vu',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vd.w[i]=Vu.w[i] ;}'},
 'hexagon_V6_vavgb': {'hvx_intrinsic': 'Vd.b=vavg(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i]+Vv.b[i])/2 ;}'},
 'hexagon_V6_vavgbrnd': {'hvx_intrinsic': 'Vd.b=vavg(Vu.b,Vv.b):rnd',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                 '(Vu.b[i]+Vv.b[i]+1)/2 ;}'},
 'hexagon_V6_vavgh': {'hvx_intrinsic': 'Vd.h=vavg(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i]+Vv.h[i])/2 ;}'},
 'hexagon_V6_vavghrnd': {'hvx_intrinsic': 'Vd.h=vavg(Vu.h,Vv.h):rnd',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                 '(Vu.h[i]+Vv.h[i]+1)/2 ;}'},
 'hexagon_V6_vavgub': {'hvx_intrinsic': 'Vd.ub=vavg(Vu.ub,Vv.ub)',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               '(Vu.ub[i]+Vv.ub[i])/2 ;}'},
 'hexagon_V6_vavgubrnd': {'hvx_intrinsic': 'Vd.ub=vavg(Vu.ub,Vv.ub):rnd',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                  '(Vu.ub[i]+Vv.ub[i]+1)/2 ;}'},
 'hexagon_V6_vavguh': {'hvx_intrinsic': 'Vd.uh=vavg(Vu.uh,Vv.uh)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                               '(Vu.uh[i]+Vv.uh[i])/2 ;}'},
 'hexagon_V6_vavguhrnd': {'hvx_intrinsic': 'Vd.uh=vavg(Vu.uh,Vv.uh):rnd',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                  '(Vu.uh[i]+Vv.uh[i]+1)/2 ;}'},
 'hexagon_V6_vavguw': {'hvx_intrinsic': 'Vd.uw=vavg(Vu.uw,Vv.uw)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                               '(Vu.uw[i]+Vv.uw[i])/2 ;}'},
 'hexagon_V6_vavguwrnd': {'hvx_intrinsic': 'Vd.uw=vavg(Vu.uw,Vv.uw):rnd',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                  '(Vu.uw[i]+Vv.uw[i]+1)/2 ;}'},
 'hexagon_V6_vavgw': {'hvx_intrinsic': 'Vd.w=vavg(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i]+Vv.w[i])/2 ;}'},
 'hexagon_V6_vavgwrnd': {'hvx_intrinsic': 'Vd.w=vavg(Vu.w,Vv.w):rnd',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 '(Vu.w[i]+Vv.w[i]+1)/2 ;}'},
 'hexagon_V6_vcombine': {'hvx_intrinsic': 'Vdd=vcombine(Vu,Vv)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{Vdd.v[0].ub[i] = Vv.ub[i];Vdd.v[1].ub[i] = '
                                 'Vu.ub[i] ;}'},
 'hexagon_V6_vdealb': {'hvx_intrinsic': 'Vd.b=vdeal(Vu.b)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i ] = '
                               'Vu.uh[i].ub[0];Vd.ub[i+VBITS/16] = '
                               'Vu.uh[i].ub[1] ;}'},
 'hexagon_V6_vdealb4w': {'hvx_intrinsic': 'Vd.b=vdeale(Vu.b,Vv.b)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.ub[0+i ] '
                                 '= Vv.uw[i].ub[0];Vd.ub[VBITS/32+i ] = '
                                 'Vv.uw[i].ub[2];Vd.ub[2*VBITS/32+i] = '
                                 'Vu.uw[i].ub[0];Vd.ub[3*VBITS/32+i] = '
                                 'Vu.uw[i].ub[2] ;}'},
 'hexagon_V6_vdealh': {'hvx_intrinsic': 'Vd.h=vdeal(Vu.h)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i ] = '
                               'Vu.uw[i].uh[0];Vd.uh[i+VBITS/32] = '
                               'Vu.uw[i].uh[1] ;}'},
 'hexagon_V6_vdealvdd': {'hvx_intrinsic': 'Vdd=vdeal(Vu,Vv,Rt)',
                         'spec': 'Vdd.v[0] = Vv;Vdd.v[1] = Vu;for '
                                 '(offset=VWIDTH>>1; offset>0; offset>>=1) {if '
                                 '( Rt & offset) {for (k = 0; k < VELEM(8); '
                                 'k++) {if (!( k & offset)) '
                                 '{SWAP(Vdd.v[1].ub[k],Vdd.v[0].ub[k+offset]);}}}}'},
 'hexagon_V6_vdelta': {'hvx_intrinsic': 'Vd=vdelta(Vu,Vv)',
                       'spec': 'for (offset=VWIDTH; (offset>>=1)>0; ) {for (k '
                               '= 0; k<VWIDTH; k++) {Vd.ub[k] = '
                               '(Vv.ub[k]&offset) ?Vu.ub[k^offset] : '
                               'Vu.ub[k];}for (k = 0; k<VWIDTH; k++) {Vu.ub[k] '
                               '= Vd.ub[k];}}'},
 'hexagon_V6_vdmpybus': {'hvx_intrinsic': 'Vd.h=vdmpy(Vu.ub,Rt.b)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                 '(Vu.uh[i].ub[0] * Rt.b[(2*i) %4]);Vd.h[i] += '
                                 '(Vu.uh[i].ub[1] *Rt.b[(2*i+1)%4]) ;}'},
 'hexagon_V6_vdmpybus_acc': {'hvx_intrinsic': 'Vx.h+=vdmpy(Vu.ub,Rt.b)',
                             'spec': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i] '
                                     '+= (Vu.uh[i].ub[0] * Rt.b[(2*i) '
                                     '%4]);Vx.h[i] += (Vu.uh[i].ub[1] '
                                     '*Rt.b[(2*i+1)%4]) ;}'},
 'hexagon_V6_vdmpybus_dv': {'hvx_intrinsic': 'Vdd.h=vdmpy(Vuu.ub,Rt.b)',
                            'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vdd.v[0].h[i] = (Vuu.v[0].uh[i].ub[0] '
                                    '*Rt.b[(2*i) % 4]);Vdd.v[0].h[i] += '
                                    '(Vuu.v[0].uh[i].ub[1] '
                                    '*Rt.b[(2*i+1)%4]);Vdd.v[1].h[i] = '
                                    '(Vuu.v[0].uh[i].ub[1] *Rt.b[(2*i) % '
                                    '4]);Vdd.v[1].h[i] += '
                                    '(Vuu.v[1].uh[i].ub[0] *Rt.b[(2*i+1)%4]) '
                                    ';}'},
 'hexagon_V6_vdmpybus_dv_acc': {'hvx_intrinsic': 'Vxx.h+=vdmpy(Vuu.ub,Rt.b)',
                                'spec': 'for (i = 0; i < VELEM(16); i++) '
                                        '{Vxx.v[0].h[i] += '
                                        '(Vuu.v[0].uh[i].ub[0] *Rt.b[(2*i) % '
                                        '4]);Vxx.v[0].h[i] += '
                                        '(Vuu.v[0].uh[i].ub[1] '
                                        '*Rt.b[(2*i+1)%4]);Vxx.v[1].h[i] += '
                                        '(Vuu.v[0].uh[i].ub[1] *Rt.b[(2*i) % '
                                        '4]);Vxx.v[1].h[i] += '
                                        '(Vuu.v[1].uh[i].ub[0] '
                                        '*Rt.b[(2*i+1)%4]) ;}'},
 'hexagon_V6_vdmpyhb': {'hvx_intrinsic': 'Vd.w=vdmpy(Vu.h,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                '(Vu.w[i].h[0] * Rt.b[(2*i+0)%4]);Vd.w[i] += '
                                '(Vu.w[i].h[1] * Rt.b[(2*i+1)%4]);}'},
 'hexagon_V6_vdmpyhb_acc': {'hvx_intrinsic': 'Vx.w+=vdmpy(Vu.h,Rt.b)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                    '+= (Vu.w[i].h[0] * '
                                    'Rt.b[(2*i+0)%4]);Vx.w[i] += (Vu.w[i].h[1] '
                                    '* Rt.b[(2*i+1)%4]);}'},
 'hexagon_V6_vdmpyhb_dv': {'hvx_intrinsic': 'Vdd.w=vdmpy(Vuu.h,Rt.b)',
                           'spec': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vdd.v[0].w[i] = (Vuu.v[0].w[i].h[0] '
                                   '*Rt.b[(2*i+0)%4]);Vdd.v[0].w[i] += '
                                   '(Vuu.v[0].w[i].h[1] '
                                   '*Rt.b[(2*i+1)%4]);Vdd.v[1].w[i] = '
                                   '(Vuu.v[0].w[i].h[1] '
                                   '*Rt.b[(2*i+0)%4]);Vdd.v[1].w[i] += '
                                   '(Vuu.v[1].w[i].h[0] *Rt.b[(2*i+1)%4]) ;}'},
 'hexagon_V6_vdmpyhb_dv_acc': {'hvx_intrinsic': 'Vxx.w+=vdmpy(Vuu.h,Rt.b)',
                               'spec': 'for (i = 0; i < VELEM(32); i++) '
                                       '{Vxx.v[0].w[i] += (Vuu.v[0].w[i].h[0] '
                                       '*Rt.b[(2*i+0)%4]);Vxx.v[0].w[i] += '
                                       '(Vuu.v[0].w[i].h[1] '
                                       '*Rt.b[(2*i+1)%4]);Vxx.v[1].w[i] += '
                                       '(Vuu.v[0].w[i].h[1] '
                                       '*Rt.b[(2*i+0)%4]);Vxx.v[1].w[i] += '
                                       '(Vuu.v[1].w[i].h[0] *Rt.b[(2*i+1)%4]) '
                                       ';}'},
 'hexagon_V6_vdmpyhisat': {'hvx_intrinsic': 'Vd.w=vdmpy(Vuu.h,Rt.h):sat',
                           'spec': 'for (i = 0; i < VELEM(32); i++) {accum = '
                                   '(Vuu.v[0].w[i].h[1] * Rt.h[0]);accum += '
                                   '(Vuu.v[1].w[i].h[0] * Rt.h[1]);Vd.w[i] = '
                                   'sat32(accum) ;}'},
 'hexagon_V6_vdmpyhisat_acc': {'hvx_intrinsic': 'Vx.w+=vdmpy(Vuu.h,Rt.h):sat',
                               'spec': 'for (i = 0; i < VELEM(32); i++) {accum '
                                       '= Vx.w[i];accum += (Vuu.v[0].w[i].h[1] '
                                       '* Rt.h[0]);accum += '
                                       '(Vuu.v[1].w[i].h[0] * Rt.h[1]);Vx.w[i] '
                                       '= sat32(accum) ;}'},
 'hexagon_V6_vdmpyhsat': {'hvx_intrinsic': 'Vd.w=vdmpy(Vu.h,Rt.h):sat',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {accum = '
                                  '(Vu.w[i].h[0] * Rt.h[0]);accum += '
                                  '(Vu.w[i].h[1] * Rt.h[1]);Vd.w[i] = '
                                  'sat32(accum) ;}'},
 'hexagon_V6_vdmpyhsat_acc': {'hvx_intrinsic': 'Vx.w+=vdmpy(Vu.h,Rt.h):sat',
                              'spec': 'for (i = 0; i < VELEM(32); i++) {accum '
                                      '= Vx.w[i];accum += (Vu.w[i].h[0] * '
                                      'Rt.h[0]);accum += (Vu.w[i].h[1] * '
                                      'Rt.h[1]);Vx.w[i] = sat32(accum) ;}'},
 'hexagon_V6_vdmpyhsuisat': {'hvx_intrinsic': 'Vd.w=vdmpy(Vuu.h,Rt.uh,#1):sat',
                             'spec': 'for (i = 0; i < VELEM(32); i++) {accum = '
                                     '(Vuu.v[0].w[i].h[1] * Rt.uh[0]);accum += '
                                     '(Vuu.v[1].w[i].h[0] * Rt.uh[1]);Vd.w[i] '
                                     '= sat32(accum) ;}'},
 'hexagon_V6_vdmpyhsuisat_acc': {'hvx_intrinsic': 'Vx.w+=vdmpy(Vuu.h,Rt.uh,#1):sat',
                                 'spec': 'for (i = 0; i < VELEM(32); i++) '
                                         '{accum=Vx.w[i];accum += '
                                         '(Vuu.v[0].w[i].h[1] * '
                                         'Rt.uh[0]);accum += '
                                         '(Vuu.v[1].w[i].h[0] * '
                                         'Rt.uh[1]);Vx.w[i] = sat32(accum) ;}'},
 'hexagon_V6_vdmpyhsusat': {'hvx_intrinsic': 'Vd.w=vdmpy(Vu.h,Rt.uh):sat',
                            'spec': 'for (i = 0; i < VELEM(32); i++) {accum = '
                                    '(Vu.w[i].h[0] * Rt.uh[0]);accum += '
                                    '(Vu.w[i].h[1] * Rt.uh[1]);Vd.w[i] = '
                                    'sat32(accum) ;}'},
 'hexagon_V6_vdmpyhsusat_acc': {'hvx_intrinsic': 'Vx.w+=vdmpy(Vu.h,Rt.uh):sat',
                                'spec': 'for (i = 0; i < VELEM(32); i++) '
                                        '{accum=Vx.w[i];accum += (Vu.w[i].h[0] '
                                        '* Rt.uh[0]);accum += (Vu.w[i].h[1] * '
                                        'Rt.uh[1]);Vx.w[i] = sat32(accum) ;}'},
 'hexagon_V6_vdmpyhvsat': {'hvx_intrinsic': 'Vd.w=vdmpy(Vu.h,Vv.h):sat',
                           'spec': 'for (i = 0; i < VELEM(32); i++) {accum = '
                                   '(Vu.w[i].h[0] * Vv.w[i].h[0]);accum += '
                                   '(Vu.w[i].h[1] * Vv.w[i].h[1]);Vd.w[i] = '
                                   'sat32(accum) ;}'},
 'hexagon_V6_vdmpyhvsat_acc': {'hvx_intrinsic': 'Vx.w+=vdmpy(Vu.h,Vv.h):sat',
                               'spec': 'for (i = 0; i < VELEM(32); i++) {accum '
                                       '= (Vu.w[i].h[0] * Vv.w[i].h[0]);accum '
                                       '+= (Vu.w[i].h[1] * '
                                       'Vv.w[i].h[1]);Vx.w[i] = '
                                       'sat32(Vx.w[i]+accum) ;}'},
 'hexagon_V6_vdsaduh': {'hvx_intrinsic': 'Vdd.uw=vdsad(Vuu.uh,Rt.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].uw[i] = ABS(Vuu.v[0].uw[i].uh[0] '
                                '-Rt.uh[0]);Vdd.v[0].uw[i] += '
                                'ABS(Vuu.v[0].uw[i].uh[1] '
                                '-Rt.uh[1]);Vdd.v[1].uw[i] = '
                                'ABS(Vuu.v[0].uw[i].uh[1] '
                                '-Rt.uh[0]);Vdd.v[1].uw[i] += '
                                'ABS(Vuu.v[1].uw[i].uh[0] -Rt.uh[1]) ;}'},
 'hexagon_V6_vdsaduh_acc': {'hvx_intrinsic': 'Vxx.uw+=vdsad(Vuu.uh,Rt.uh)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vxx.v[0].uw[i] += '
                                    'ABS(Vuu.v[0].uw[i].uh[0] '
                                    '-Rt.uh[0]);Vxx.v[0].uw[i] += '
                                    'ABS(Vuu.v[0].uw[i].uh[1] '
                                    '-Rt.uh[1]);Vxx.v[1].uw[i] += '
                                    'ABS(Vuu.v[0].uw[i].uh[1] '
                                    '-Rt.uh[0]);Vxx.v[1].uw[i] += '
                                    'ABS(Vuu.v[1].uw[i].uh[0] -Rt.uh[1]) ;}'},
 'hexagon_V6_veqb': {'hvx_intrinsic': 'Qd4=vcmp.eq(Vu.b,Vv.b)',
                     'spec': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                             '((Vu.b[i/1] == Vv.b[i/1]) ?0x1 : 0);}'},
 'hexagon_V6_veqb_and': {'hvx_intrinsic': 'Qx4&=vcmp.eq(Vu.b,Vv.b)',
                         'spec': 'for( i = 0; i < VWIDTH; i += 1) '
                                 '{QxV[i+1-1:i] = QxV[i+1-1:i] & ((Vu.b[i/1]== '
                                 'Vv.b[i/1]) ? 0x1 : 0);}'},
 'hexagon_V6_veqb_or': {'hvx_intrinsic': 'Qx4|=vcmp.eq(Vu.b,Vv.b)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] '
                                '= QxV[i+1-1:i] | ((Vu.b[i/1]== Vv.b[i/1]) ? '
                                '0x1 : 0);}'},
 'hexagon_V6_veqb_xor': {'hvx_intrinsic': 'Qx4^=vcmp.eq(Vu.b,Vv.b)',
                         'spec': 'for( i = 0; i < VWIDTH; i += 1) '
                                 '{QxV[i+1-1:i] = QxV[i+1-1:i] ^ ((Vu.b[i/1] '
                                 '==Vv.b[i/1]) ? 0x1 : 0);}'},
 'hexagon_V6_veqh': {'hvx_intrinsic': 'Qd4=vcmp.eq(Vu.h,Vv.h)',
                     'spec': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                             '((Vu.h[i/2] == Vv.h[i/2]) ?0x3 : 0);}'},
 'hexagon_V6_veqh_and': {'hvx_intrinsic': 'Qx4&=vcmp.eq(Vu.h,Vv.h)',
                         'spec': 'for( i = 0; i < VWIDTH; i += 2) '
                                 '{QxV[i+2-1:i] = QxV[i+2-1:i] & ((Vu.h[i/2]== '
                                 'Vv.h[i/2]) ? 0x3 : 0);}'},
 'hexagon_V6_veqh_or': {'hvx_intrinsic': 'Qx4|=vcmp.eq(Vu.h,Vv.h)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] '
                                '= QxV[i+2-1:i] | ((Vu.h[i/2]== Vv.h[i/2]) ? '
                                '0x3 : 0);}'},
 'hexagon_V6_veqh_xor': {'hvx_intrinsic': 'Qx4^=vcmp.eq(Vu.h,Vv.h)',
                         'spec': 'for( i = 0; i < VWIDTH; i += 2) '
                                 '{QxV[i+2-1:i] = QxV[i+2-1:i] ^ ((Vu.h[i/2] '
                                 '==Vv.h[i/2]) ? 0x3 : 0);}'},
 'hexagon_V6_veqw': {'hvx_intrinsic': 'Qd4=vcmp.eq(Vu.w,Vv.w)',
                     'spec': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                             '((Vu.w[i/4] == Vv.w[i/4]) ?0xF : 0);}'},
 'hexagon_V6_veqw_and': {'hvx_intrinsic': 'Qx4&=vcmp.eq(Vu.w,Vv.w)',
                         'spec': 'for( i = 0; i < VWIDTH; i += 4) '
                                 '{QxV[i+4-1:i] = QxV[i+4-1:i] & ((Vu.w[i/4]== '
                                 'Vv.w[i/4]) ? 0xF : 0);}'},
 'hexagon_V6_veqw_or': {'hvx_intrinsic': 'Qx4|=vcmp.eq(Vu.w,Vv.w)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] '
                                '= QxV[i+4-1:i] | ((Vu.w[i/4]== Vv.w[i/4]) ? '
                                '0xF : 0);}'},
 'hexagon_V6_veqw_xor': {'hvx_intrinsic': 'Qx4^=vcmp.eq(Vu.w,Vv.w)',
                         'spec': 'for( i = 0; i < VWIDTH; i += 4) '
                                 '{QxV[i+4-1:i] = QxV[i+4-1:i] ^ ((Vu.w[i/4] '
                                 '==Vv.w[i/4]) ? 0xF : 0);}'},
 'hexagon_V6_vgtb': {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.b,Vv.b)',
                     'spec': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                             '((Vu.b[i/1] > Vv.b[i/1]) ?0x1 : 0);}'},
 'hexagon_V6_vgtb_and': {'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.b,Vv.b)',
                         'spec': 'for( i = 0; i < VWIDTH; i += 1) '
                                 '{QxV[i+1-1:i] = QxV[i+1-1:i] & ((Vu.b[i/1]> '
                                 'Vv.b[i/1]) ? 0x1 : 0);}'},
 'hexagon_V6_vgtb_or': {'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.b,Vv.b)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] '
                                '= QxV[i+1-1:i] | ((Vu.b[i/1]> Vv.b[i/1]) ? '
                                '0x1 : 0);}'},
 'hexagon_V6_vgtb_xor': {'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.b,Vv.b)',
                         'spec': 'for( i = 0; i < VWIDTH; i += 1) '
                                 '{QxV[i+1-1:i] = QxV[i+1-1:i] ^ ((Vu.b[i/1] '
                                 '>Vv.b[i/1]) ? 0x1 : 0);}'},
 'hexagon_V6_vgth': {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.h,Vv.h)',
                     'spec': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                             '((Vu.h[i/2] > Vv.h[i/2]) ?0x3 : 0);}'},
 'hexagon_V6_vgth_and': {'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.h,Vv.h)',
                         'spec': 'for( i = 0; i < VWIDTH; i += 2) '
                                 '{QxV[i+2-1:i] = QxV[i+2-1:i] & ((Vu.h[i/2]> '
                                 'Vv.h[i/2]) ? 0x3 : 0);}'},
 'hexagon_V6_vgth_or': {'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.h,Vv.h)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] '
                                '= QxV[i+2-1:i] | ((Vu.h[i/2]> Vv.h[i/2]) ? '
                                '0x3 : 0);}'},
 'hexagon_V6_vgth_xor': {'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.h,Vv.h)',
                         'spec': 'for( i = 0; i < VWIDTH; i += 2) '
                                 '{QxV[i+2-1:i] = QxV[i+2-1:i] ^ ((Vu.h[i/2] '
                                 '>Vv.h[i/2]) ? 0x3 : 0);}'},
 'hexagon_V6_vgtub': {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.ub,Vv.ub)',
                      'spec': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                              '((Vu.ub[i/1] > Vv.ub[i/1]) ?0x1 : 0);}'},
 'hexagon_V6_vgtub_and': {'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.ub,Vv.ub)',
                          'spec': 'for( i = 0; i < VWIDTH; i += 1) '
                                  '{QxV[i+1-1:i] = QxV[i+1-1:i] &((Vu.ub[i/1] '
                                  '> Vv.ub[i/1]) ? 0x1 : 0);}'},
 'hexagon_V6_vgtub_or': {'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.ub,Vv.ub)',
                         'spec': 'for( i = 0; i < VWIDTH; i += 1) '
                                 '{QxV[i+1-1:i] = QxV[i+1-1:i] |((Vu.ub[i/1] > '
                                 'Vv.ub[i/1]) ? 0x1 : 0);}'},
 'hexagon_V6_vgtub_xor': {'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.ub,Vv.ub)',
                          'spec': 'for( i = 0; i < VWIDTH; i += 1) '
                                  '{QxV[i+1-1:i] = QxV[i+1-1:i] ^ ((Vu.ub[i/1] '
                                  '>Vv.ub[i/1]) ? 0x1 : 0);}'},
 'hexagon_V6_vgtuh': {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.uh,Vv.uh)',
                      'spec': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                              '((Vu.uh[i/2] > Vv.uh[i/2]) ?0x3 : 0);}'},
 'hexagon_V6_vgtuh_and': {'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.uh,Vv.uh)',
                          'spec': 'for( i = 0; i < VWIDTH; i += 2) '
                                  '{QxV[i+2-1:i] = QxV[i+2-1:i] &((Vu.uh[i/2] '
                                  '> Vv.uh[i/2]) ? 0x3 : 0);}'},
 'hexagon_V6_vgtuh_or': {'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.uh,Vv.uh)',
                         'spec': 'for( i = 0; i < VWIDTH; i += 2) '
                                 '{QxV[i+2-1:i] = QxV[i+2-1:i] |((Vu.uh[i/2] > '
                                 'Vv.uh[i/2]) ? 0x3 : 0);}'},
 'hexagon_V6_vgtuh_xor': {'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.uh,Vv.uh)',
                          'spec': 'for( i = 0; i < VWIDTH; i += 2) '
                                  '{QxV[i+2-1:i] = QxV[i+2-1:i] ^ ((Vu.uh[i/2] '
                                  '>Vv.uh[i/2]) ? 0x3 : 0);}'},
 'hexagon_V6_vgtuw': {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.uw,Vv.uw)',
                      'spec': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                              '((Vu.uw[i/4] > Vv.uw[i/4]) ?0xF : 0);}'},
 'hexagon_V6_vgtuw_and': {'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.uw,Vv.uw)',
                          'spec': 'for( i = 0; i < VWIDTH; i += 4) '
                                  '{QxV[i+4-1:i] = QxV[i+4-1:i] &((Vu.uw[i/4] '
                                  '> Vv.uw[i/4]) ? 0xF : 0);}'},
 'hexagon_V6_vgtuw_or': {'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.uw,Vv.uw)',
                         'spec': 'for( i = 0; i < VWIDTH; i += 4) '
                                 '{QxV[i+4-1:i] = QxV[i+4-1:i] |((Vu.uw[i/4] > '
                                 'Vv.uw[i/4]) ? 0xF : 0);}'},
 'hexagon_V6_vgtuw_xor': {'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.uw,Vv.uw)',
                          'spec': 'for( i = 0; i < VWIDTH; i += 4) '
                                  '{QxV[i+4-1:i] = QxV[i+4-1:i] ^ ((Vu.uw[i/4] '
                                  '>Vv.uw[i/4]) ? 0xF : 0);}'},
 'hexagon_V6_vgtw': {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.w,Vv.w)',
                     'spec': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                             '((Vu.w[i/4] > Vv.w[i/4]) ?0xF : 0);}'},
 'hexagon_V6_vgtw_and': {'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.w,Vv.w)',
                         'spec': 'for( i = 0; i < VWIDTH; i += 4) '
                                 '{QxV[i+4-1:i] = QxV[i+4-1:i] & ((Vu.w[i/4]> '
                                 'Vv.w[i/4]) ? 0xF : 0);}'},
 'hexagon_V6_vgtw_or': {'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.w,Vv.w)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] '
                                '= QxV[i+4-1:i] | ((Vu.w[i/4]> Vv.w[i/4]) ? '
                                '0xF : 0);}'},
 'hexagon_V6_vgtw_xor': {'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.w,Vv.w)',
                         'spec': 'for( i = 0; i < VWIDTH; i += 4) '
                                 '{QxV[i+4-1:i] = QxV[i+4-1:i] ^ ((Vu.w[i/4] '
                                 '>Vv.w[i/4]) ? 0xF : 0);}'},
 'hexagon_V6_vinsertwr': {'hvx_intrinsic': 'Vx.w=vinsert(Rt)',
                          'spec': 'Vx.uw[0] = Rt;'},
 'hexagon_V6_vlalignb': {'hvx_intrinsic': 'Vd=vlalign(Vu,Vv,Rt)',
                         'spec': 'unsigned shift = VWIDTH - (Rt & '
                                 '(VWIDTH-1));for(i = 0; i < VWIDTH; i++) '
                                 '{Vd.ub[i] = (i+shift>=VWIDTH) '
                                 '?Vu.ub[i+shift-VWIDTH] : Vv.ub[i+shift];}'},
 'hexagon_V6_vlalignbi': {'hvx_intrinsic': 'Vd=vlalign(Vu,Vv,#u3)',
                          'spec': 'unsigned shift = VWIDTH - #u;for(i = 0; i < '
                                  'VWIDTH; i++) {Vd.ub[i] = (i+shift>=VWIDTH) '
                                  '?Vu.ub[i+shift-VWIDTH] : Vv.ub[i+shift];}'},
 'hexagon_V6_vlut4': {'hvx_intrinsic': 'Vd.h=vlut4(Vu.uh,Rtt.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i]= '
                              'Rtt.h[((Vu.h[i]>>14)&0x3)] ;}'},
 'hexagon_V6_vlutvvb': {'hvx_intrinsic': 'Vd.b=vlut32(Vu.b,Vv.b,Rt)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {matchval = Rt '
                                '& 0x7;oddhalf = (Rt >> (log2(VECTOR_SIZE)-6)) '
                                '&0x1;idx = Vu.ub[i];Vd.b[i] = ((idx & 0xE0) '
                                '== (matchval << 5))? Vv.h[idx % '
                                'VBITS/16].b[oddhalf] : 0 ;}'},
 'hexagon_V6_vlutvvb_nm': {'hvx_intrinsic': 'Vd.b=vlut32(Vu.b,Vv.b,Rt):nomatch',
                           'spec': 'for (i = 0; i < VELEM(8); i++) {matchval = '
                                   'Rt & 0x7;oddhalf = (Rt >> '
                                   '(log2(VECTOR_SIZE)-6)) &0x1;idx = '
                                   'Vu.ub[i];idx = (idx&0x1F) | '
                                   '(matchval<<5);Vd.b[i] = Vv.h[idx % '
                                   'VBITS/16].b[oddhalf] ;}'},
 'hexagon_V6_vlutvvb_oracc': {'hvx_intrinsic': 'Vx.b|=vlut32(Vu.b,Vv.b,Rt)',
                              'spec': 'for (i = 0; i < VELEM(8); i++) '
                                      '{matchval = Rt & 0x7;oddhalf = (Rt >> '
                                      '(log2(VECTOR_SIZE)-6)) &0x1;idx = '
                                      'Vu.ub[i];Vx.b[i] |= ((idx & 0xE0) == '
                                      '(matchval <<5)) ? Vv.h[idx % '
                                      'VBITS/16].b[oddhalf] : 0 ;}'},
 'hexagon_V6_vlutvvb_oracci': {'hvx_intrinsic': 'Vx.b|=vlut32(Vu.b,Vv.b,#u3)',
                               'spec': 'for (i = 0; i < VELEM(8); i++) '
                                       '{matchval = #u & 0x7;oddhalf = (#u >> '
                                       '(log2(VECTOR_SIZE)-6)) &0x1;idx = '
                                       'Vu.ub[i];Vx.b[i] |= ((idx & 0xE0) == '
                                       '(matchval <<5)) ? Vv.h[idx % '
                                       'VBITS/16].b[oddhalf] : 0 ;}'},
 'hexagon_V6_vlutvvbi': {'hvx_intrinsic': 'Vd.b=vlut32(Vu.b,Vv.b,#u3)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {matchval = '
                                 '#u & 0x7;oddhalf = (#u >> '
                                 '(log2(VECTOR_SIZE)-6)) &0x1;idx = '
                                 'Vu.ub[i];Vd.b[i] = ((idx & 0xE0) == '
                                 '(matchval << 5))? Vv.h[idx % '
                                 'VBITS/16].b[oddhalf] : 0 ;}'},
 'hexagon_V6_vlutvwh': {'hvx_intrinsic': 'Vdd.h=vlut16(Vu.b,Vv.h,Rt)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {matchval = '
                                'Rt & 0xF;oddhalf = (Rt >> '
                                '(log2(VECTOR_SIZE)-6)) &0x1;idx = '
                                'Vu.uh[i].ub[0];Vdd.v[0].h[i] = ((idx & 0xF0) '
                                '==(matchval << 4)) ? Vv.w[idx '
                                '%VBITS/32].h[oddhalf] : 0;idx = '
                                'Vu.uh[i].ub[1];Vdd.v[1].h[i] = ((idx & 0xF0) '
                                '==(matchval << 4)) ? Vv.w[idx '
                                '%VBITS/32].h[oddhalf] : 0 ;}'},
 'hexagon_V6_vlutvwh_nm': {'hvx_intrinsic': 'Vdd.h=vlut16(Vu.b,Vv.h,Rt):nomatch',
                           'spec': 'for (i = 0; i < VELEM(16); i++) {matchval '
                                   '= Rt & 0xF;oddhalf = (Rt >> '
                                   '(log2(VECTOR_SIZE)-6)) &0x1;idx = '
                                   'Vu.uh[i].ub[0];idx = (idx&0x0F) | '
                                   '(matchval<<4);Vdd.v[0].h[i] = Vv.w[idx '
                                   '%VBITS/32].h[oddhalf];idx = '
                                   'Vu.uh[i].ub[1];idx = (idx&0x0F) | '
                                   '(matchval<<4);Vdd.v[1].h[i] = Vv.w[idx '
                                   '%VBITS/32].h[oddhalf] ;}'},
 'hexagon_V6_vlutvwh_oracc': {'hvx_intrinsic': 'Vxx.h|=vlut16(Vu.b,Vv.h,Rt)',
                              'spec': 'for (i = 0; i < VELEM(16); i++) '
                                      '{matchval = Rt.ub[0] & 0xF;oddhalf = '
                                      '(Rt >> (log2(VECTOR_SIZE)-6)) &0x1;idx '
                                      '= Vu.uh[i].ub[0];Vxx.v[0].h[i] |= ((idx '
                                      '& 0xF0) ==(matchval << 4)) ? Vv.w[idx '
                                      '%VBITS/32].h[oddhalf] : 0;idx = '
                                      'Vu.uh[i].ub[1];Vxx.v[1].h[i] |= ((idx & '
                                      '0xF0) ==(matchval << 4)) ? Vv.w[idx '
                                      '%VBITS/32].h[oddhalf] : 0 ;}'},
 'hexagon_V6_vlutvwh_oracci': {'hvx_intrinsic': 'Vxx.h|=vlut16(Vu.b,Vv.h,#u3)',
                               'spec': 'for (i = 0; i < VELEM(16); i++) '
                                       '{matchval = #u & 0xF;oddhalf = (#u >> '
                                       '(log2(VECTOR_SIZE)-6)) &0x1;idx = '
                                       'Vu.uh[i].ub[0];Vxx.v[0].h[i] |= ((idx '
                                       '& 0xF0) ==(matchval << 4)) ? Vv.w[idx '
                                       '%VBITS/32].h[oddhalf] : 0;idx = '
                                       'Vu.uh[i].ub[1];Vxx.v[1].h[i] |= ((idx '
                                       '& 0xF0) ==(matchval << 4)) ? Vv.w[idx '
                                       '%VBITS/32].h[oddhalf] : 0 ;}'},
 'hexagon_V6_vlutvwhi': {'hvx_intrinsic': 'Vdd.h=vlut16(Vu.b,Vv.h,#u3)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {matchval = '
                                 '#u & 0xF;oddhalf = (#u >> '
                                 '(log2(VECTOR_SIZE)-6)) &0x1;idx = '
                                 'Vu.uh[i].ub[0];Vdd.v[0].h[i] = ((idx & 0xF0) '
                                 '==(matchval << 4)) ? Vv.w[idx '
                                 '%VBITS/32].h[oddhalf] : 0;idx = '
                                 'Vu.uh[i].ub[1];Vdd.v[1].h[i] = ((idx & 0xF0) '
                                 '==(matchval << 4)) ? Vv.w[idx '
                                 '%VBITS/32].h[oddhalf] : 0 ;}'},
 'hexagon_V6_vmaxb': {'hvx_intrinsic': 'Vd.b=vmax(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i] > Vv.b[i]) ? Vu.b[i] :Vv.b[i] ;}'},
 'hexagon_V6_vmaxh': {'hvx_intrinsic': 'Vd.h=vmax(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i] > Vv.h[i]) ? Vu.h[i] :Vv.h[i] ;}'},
 'hexagon_V6_vmaxub': {'hvx_intrinsic': 'Vd.ub=vmax(Vu.ub,Vv.ub)',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               '(Vu.ub[i] > Vv.ub[i]) ? Vu.ub[i]: Vv.ub[i] ;}'},
 'hexagon_V6_vmaxuh': {'hvx_intrinsic': 'Vd.uh=vmax(Vu.uh,Vv.uh)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                               '(Vu.uh[i] > Vv.uh[i]) ? Vu.uh[i]: Vv.uh[i] ;}'},
 'hexagon_V6_vmaxw': {'hvx_intrinsic': 'Vd.w=vmax(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i] > Vv.w[i]) ? Vu.w[i] :Vv.w[i] ;}'},
 'hexagon_V6_vminb': {'hvx_intrinsic': 'Vd.b=vmin(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i] < Vv.b[i]) ? Vu.b[i] :Vv.b[i] ;}'},
 'hexagon_V6_vminh': {'hvx_intrinsic': 'Vd.h=vmin(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i] < Vv.h[i]) ? Vu.h[i] :Vv.h[i] ;}'},
 'hexagon_V6_vminub': {'hvx_intrinsic': 'Vd.ub=vmin(Vu.ub,Vv.ub)',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               '(Vu.ub[i] < Vv.ub[i]) ? Vu.ub[i]: Vv.ub[i] ;}'},
 'hexagon_V6_vminuh': {'hvx_intrinsic': 'Vd.uh=vmin(Vu.uh,Vv.uh)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                               '(Vu.uh[i] < Vv.uh[i]) ? Vu.uh[i]: Vv.uh[i] ;}'},
 'hexagon_V6_vminw': {'hvx_intrinsic': 'Vd.w=vmin(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i] < Vv.w[i]) ? Vu.w[i] :Vv.w[i] ;}'},
 'hexagon_V6_vmpabus': {'hvx_intrinsic': 'Vdd.h=vmpa(Vuu.ub,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].h[i] = (Vuu.v[0].uh[i].ub[0] '
                                '*Rt.b[0]) + (Vuu.v[1].uh[i].ub[0] * '
                                'Rt.b[1]);Vdd.v[1].h[i] = '
                                '(Vuu.v[0].uh[i].ub[1] *Rt.b[2]) + '
                                '(Vuu.v[1].uh[i].ub[1] * Rt.b[3]) ;}'},
 'hexagon_V6_vmpabus_acc': {'hvx_intrinsic': 'Vxx.h+=vmpa(Vuu.ub,Rt.b)',
                            'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vxx.v[0].h[i] += (Vuu.v[0].uh[i].ub[0] '
                                    '*Rt.b[0]) + (Vuu.v[1].uh[i].ub[0] * '
                                    'Rt.b[1]);Vxx.v[1].h[i] += '
                                    '(Vuu.v[0].uh[i].ub[1] *Rt.b[2]) + '
                                    '(Vuu.v[1].uh[i].ub[1] * Rt.b[3]) ;}'},
 'hexagon_V6_vmpabusv': {'hvx_intrinsic': 'Vdd.h=vmpa(Vuu.ub,Vvv.b)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].h[i] = (Vuu.v[0].uh[i].ub[0] '
                                 '*Vvv.v[0].uh[i].b[0]) + '
                                 '(Vuu.v[1].uh[i].ub[0] '
                                 '*Vvv.v[1].uh[i].b[0]);Vdd.v[1].h[i] = '
                                 '(Vuu.v[0].uh[i].ub[1] *Vvv.v[0].uh[i].b[1]) '
                                 '+ (Vuu.v[1].uh[i].ub[1] '
                                 '*Vvv.v[1].uh[i].b[1]) ;}'},
 'hexagon_V6_vmpabuu': {'hvx_intrinsic': 'Vdd.h=vmpa(Vuu.ub,Rt.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].uh[i] = (Vuu.v[0].uh[i].ub[0] '
                                '*Rt.ub[0]) + (Vuu.v[1].uh[i].ub[0] * '
                                'Rt.ub[1]);Vdd.v[1].uh[i] = '
                                '(Vuu.v[0].uh[i].ub[1] *Rt.ub[2]) + '
                                '(Vuu.v[1].uh[i].ub[1] * Rt.ub[3]) ;}'},
 'hexagon_V6_vmpabuu_acc': {'hvx_intrinsic': 'Vxx.h+=vmpa(Vuu.ub,Rt.ub)',
                            'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vxx.v[0].uh[i] += (Vuu.v[0].uh[i].ub[0] '
                                    '*Rt.ub[0]) + (Vuu.v[1].uh[i].ub[0] * '
                                    'Rt.ub[1]);Vxx.v[1].uh[i] += '
                                    '(Vuu.v[0].uh[i].ub[1] *Rt.ub[2]) + '
                                    '(Vuu.v[1].uh[i].ub[1] * Rt.ub[3]) ;}'},
 'hexagon_V6_vmpabuuv': {'hvx_intrinsic': 'Vdd.h=vmpa(Vuu.ub,Vvv.ub)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].h[i] = (Vuu.v[0].uh[i].ub[0] '
                                 '*Vvv.v[0].uh[i].ub[0]) + '
                                 '(Vuu.v[1].uh[i].ub[0] '
                                 '*Vvv.v[1].uh[i].ub[0]);Vdd.v[1].h[i] = '
                                 '(Vuu.v[0].uh[i].ub[1] *Vvv.v[0].uh[i].ub[1]) '
                                 '+ (Vuu.v[1].uh[i].ub[1] '
                                 '*Vvv.v[1].uh[i].ub[1]) ;}'},
 'hexagon_V6_vmpahb': {'hvx_intrinsic': 'Vdd.w=vmpa(Vuu.h,Rt.b)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                               '= (Vuu.v[0].w[i].h[0] *Rt.b[0]) + '
                               '(Vuu.v[1].w[i].h[0] * Rt.b[1]);Vdd.v[1].w[i] = '
                               '(Vuu.v[0].w[i].h[1] *Rt.b[2]) + '
                               '(Vuu.v[1].w[i].h[1] * Rt.b[3]) ;}'},
 'hexagon_V6_vmpahb_acc': {'hvx_intrinsic': 'Vxx.w+=vmpa(Vuu.h,Rt.b)',
                           'spec': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vxx.v[0].w[i] += (Vuu.v[0].w[i].h[0] '
                                   '*Rt.b[0]) + (Vuu.v[1].w[i].h[0] * '
                                   'Rt.b[1]);Vxx.v[1].w[i] += '
                                   '(Vuu.v[0].w[i].h[1] *Rt.b[2]) + '
                                   '(Vuu.v[1].w[i].h[1] * Rt.b[3]) ;}'},
 'hexagon_V6_vmpahhsat': {'hvx_intrinsic': 'Vx.h=vmpa(Vx.h,Vu.h,Rtt.h):sat',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i]= '
                                  'sat16(( ( (Vx.h[i] * Vu.h[i])<<1)+ (Rtt.h[( '
                                  '(Vu.h[i]>>14)&0x3)]<<15))>>16) ;}'},
 'hexagon_V6_vmpauhb': {'hvx_intrinsic': 'Vdd.w=vmpa(Vuu.uh,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] = (Vuu.v[0].w[i].uh[0] '
                                '*Rt.b[0]) + (Vuu.v[1].w[i].uh[0] * '
                                'Rt.b[1]);Vdd.v[1].w[i] = (Vuu.v[0].w[i].uh[1] '
                                '*Rt.b[2]) + (Vuu.v[1].w[i].uh[1] * Rt.b[3]) '
                                ';}'},
 'hexagon_V6_vmpauhb_acc': {'hvx_intrinsic': 'Vxx.w+=vmpa(Vuu.uh,Rt.b)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vxx.v[0].w[i] += (Vuu.v[0].w[i].uh[0] '
                                    '*Rt.b[0]) + (Vuu.v[1].w[i].uh[0] * '
                                    'Rt.b[1]);Vxx.v[1].w[i] += '
                                    '(Vuu.v[0].w[i].uh[1] *Rt.b[2]) + '
                                    '(Vuu.v[1].w[i].uh[1] * Rt.b[3]) ;}'},
 'hexagon_V6_vmpauhuhsat': {'hvx_intrinsic': 'Vx.h=vmpa(Vx.h,Vu.uh,Rtt.uh):sat',
                            'spec': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i]= '
                                    'sat16(( (Vx.h[i] * Vu.uh[i]) '
                                    '+(Rtt.uh[((Vu.uh[i]>>14)&0x3)]<<15))>>16) '
                                    ';}'},
 'hexagon_V6_vmpsuhuhsat': {'hvx_intrinsic': 'Vx.h=vmps(Vx.h,Vu.uh,Rtt.uh):sat',
                            'spec': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i]= '
                                    'sat16(( (Vx.h[i] * Vu.uh[i]) '
                                    '-(Rtt.uh[((Vu.uh[i]>>14)&0x3)]<<15))>>16) '
                                    ';}'},
 'hexagon_V6_vmpybus': {'hvx_intrinsic': 'Vdd.h=vmpy(Vu.ub,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].h[i] = (Vu.uh[i].ub[0] '
                                '*Rt.b[(2*i+0)%4]);Vdd.v[1].h[i] = '
                                '(Vu.uh[i].ub[1] *Rt.b[(2*i+1)%4]) ;}'},
 'hexagon_V6_vmpybus_acc': {'hvx_intrinsic': 'Vxx.h+=vmpy(Vu.ub,Rt.b)',
                            'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vxx.v[0].h[i] += (Vu.uh[i].ub[0] '
                                    '*Rt.b[(2*i+0)%4]);Vxx.v[1].h[i] += '
                                    '(Vu.uh[i].ub[1] *Rt.b[(2*i+1)%4]) ;}'},
 'hexagon_V6_vmpybusv': {'hvx_intrinsic': 'Vdd.h=vmpy(Vu.ub,Vv.b)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].h[i] = (Vu.uh[i].ub[0] '
                                 '*Vv.h[i].b[0]);Vdd.v[1].h[i] = '
                                 '(Vu.uh[i].ub[1] *Vv.h[i].b[1]) ;}'},
 'hexagon_V6_vmpybusv_acc': {'hvx_intrinsic': 'Vxx.h+=vmpy(Vu.ub,Vv.b)',
                             'spec': 'for (i = 0; i < VELEM(16); i++) '
                                     '{Vxx.v[0].h[i] += (Vu.uh[i].ub[0] '
                                     '*Vv.h[i].b[0]);Vxx.v[1].h[i] += '
                                     '(Vu.uh[i].ub[1] *Vv.h[i].b[1]) ;}'},
 'hexagon_V6_vmpybv': {'hvx_intrinsic': 'Vdd.h=vmpy(Vu.b,Vv.b)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] '
                               '= (Vu.h[i].b[0] *Vv.h[i].b[0]);Vdd.v[1].h[i] = '
                               '(Vu.h[i].b[1] *Vv.h[i].b[1]) ;}'},
 'hexagon_V6_vmpybv_acc': {'hvx_intrinsic': 'Vxx.h+=vmpy(Vu.b,Vv.b)',
                           'spec': 'for (i = 0; i < VELEM(16); i++) '
                                   '{Vxx.v[0].h[i] += (Vu.h[i].b[0] '
                                   '*Vv.h[i].b[0]);Vxx.v[1].h[i] += '
                                   '(Vu.h[i].b[1] *Vv.h[i].b[1]) ;}'},
 'hexagon_V6_vmpyewuh': {'hvx_intrinsic': 'Vd.w=vmpye(Vu.w,Vv.uh)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 '(Vu.w[i] * Vv.w[i].uh[0]) >> 16 ;}'},
 'hexagon_V6_vmpyewuh_64': {'hvx_intrinsic': 'Vdd=vmpye(Vu.w,Vv.uh)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) {prod = '
                                    '(Vu.w[i] * Vv.w[i].uh[0]);Vdd.v[1].w[i] = '
                                    'prod >> 16;Vdd.v[0].w[i] = prod << 16 ;}'},
 'hexagon_V6_vmpyh': {'hvx_intrinsic': 'Vdd.w=vmpy(Vu.h,Rt.h)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                              '= (Vu.w[i].h[0] * Rt.h[0]);Vdd.v[1].w[i] = '
                              '(Vu.w[i].h[1] * Rt.h[1]) ;}'},
 'hexagon_V6_vmpyh_acc': {'hvx_intrinsic': 'Vxx.w+=vmpy(Vu.h,Rt.h)',
                          'spec': 'for (i = 0; i < VELEM(32); i++) '
                                  '{Vxx.v[0].w[i] = Vxx.v[0].w[i].s64 '
                                  '+(Vu.w[i].h[0] * Rt.h[0]);Vxx.v[1].w[i] = '
                                  'Vxx.v[1].w[i].s64 +(Vu.w[i].h[1] * Rt.h[1]) '
                                  ';}'},
 'hexagon_V6_vmpyhsat_acc': {'hvx_intrinsic': 'Vxx.w+=vmpy(Vu.h,Rt.h):sat',
                             'spec': 'for (i = 0; i < VELEM(32); i++) '
                                     '{Vxx.v[0].w[i] = sat32(Vxx.v[0].w[i].s64 '
                                     '+(Vu.w[i].h[0] * Rt.h[0]));Vxx.v[1].w[i] '
                                     '= sat32(Vxx.v[1].w[i].s64 +(Vu.w[i].h[1] '
                                     '* Rt.h[1])) ;}'},
 'hexagon_V6_vmpyhsrs': {'hvx_intrinsic': 'Vd.h=vmpy(Vu.h,Rt.h):<<1:rnd:sat',
                         'spec': 'for (i = 0; i < VELEM(32); i++) '
                                 '{Vd.w[i].h[0]=sat16(sat32(round(((Vu.w[i].h[0]* '
                                 'Rt.h[0])<<1))).h[1]);Vd.w[i].h[1]=sat16(sat32(round(((Vu.w[i].h[1]* '
                                 'Rt.h[1])<<1))).h[1]);}'},
 'hexagon_V6_vmpyhss': {'hvx_intrinsic': 'Vd.h=vmpy(Vu.h,Rt.h):<<1:sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vd.w[i].h[0]=sat16(sat32(((Vu.w[i].h[0] '
                                '*Rt.h[0])<<1)).h[1]);Vd.w[i].h[1]=sat16(sat32(((Vu.w[i].h[1] '
                                '*Rt.h[1])<<1)).h[1]);}'},
 'hexagon_V6_vmpyhus': {'hvx_intrinsic': 'Vdd.w=vmpy(Vu.h,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] = (Vu.w[i].h[0] '
                                '*Vv.uw[i].uh[0]);Vdd.v[1].w[i] = '
                                '(Vu.w[i].h[1] *Vv.uw[i].uh[1]) ;}'},
 'hexagon_V6_vmpyhus_acc': {'hvx_intrinsic': 'Vxx.w+=vmpy(Vu.h,Vv.uh)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vxx.v[0].w[i] += (Vu.w[i].h[0] '
                                    '*Vv.uw[i].uh[0]);Vxx.v[1].w[i] += '
                                    '(Vu.w[i].h[1] *Vv.uw[i].uh[1]) ;}'},
 'hexagon_V6_vmpyhv': {'hvx_intrinsic': 'Vdd.w=vmpy(Vu.h,Vv.h)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                               '= (Vu.w[i].h[0] *Vv.w[i].h[0]);Vdd.v[1].w[i] = '
                               '(Vu.w[i].h[1] *Vv.w[i].h[1]) ;}'},
 'hexagon_V6_vmpyhv_acc': {'hvx_intrinsic': 'Vxx.w+=vmpy(Vu.h,Vv.h)',
                           'spec': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vxx.v[0].w[i] += (Vu.w[i].h[0] '
                                   '*Vv.w[i].h[0]);Vxx.v[1].w[i] += '
                                   '(Vu.w[i].h[1] *Vv.w[i].h[1]) ;}'},
 'hexagon_V6_vmpyhvsrs': {'hvx_intrinsic': 'Vd.h=vmpy(Vu.h,Vv.h):<<1:rnd:sat',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                  'sat16(sat32(round(((Vu.h[i] '
                                  '*Vv.h[i])<<1))).h[1]) ;}'},
 'hexagon_V6_vmpyieoh': {'hvx_intrinsic': 'Vd.w=vmpyieo(Vu.h,Vv.h)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 '(Vu.w[i].h[0]*Vv.w[i].h[1]) << 16;}'},
 'hexagon_V6_vmpyiewh_acc': {'hvx_intrinsic': 'Vx.w+=vmpyie(Vu.w,Vv.h)',
                             'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                     '= Vx.w[i] + (Vu.w[i] * Vv.w[i].h[0]);}'},
 'hexagon_V6_vmpyiewuh': {'hvx_intrinsic': 'Vd.w=vmpyie(Vu.w,Vv.uh)',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                  '(Vu.w[i] * Vv.w[i].uh[0]) ;}'},
 'hexagon_V6_vmpyiewuh_acc': {'hvx_intrinsic': 'Vx.w+=vmpyie(Vu.w,Vv.uh)',
                              'spec': 'for (i = 0; i < VELEM(32); i++) '
                                      '{Vx.w[i] = Vx.w[i] + (Vu.w[i] '
                                      '*Vv.w[i].uh[0]) ;}'},
 'hexagon_V6_vmpyih': {'hvx_intrinsic': 'Vd.h=vmpyi(Vu.h,Vv.h)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                               '(Vu.h[i] * Vv.h[i]) ;}'},
 'hexagon_V6_vmpyih_acc': {'hvx_intrinsic': 'Vx.h+=vmpyi(Vu.h,Vv.h)',
                           'spec': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i] '
                                   '+= (Vu.h[i] * Vv.h[i]) ;}'},
 'hexagon_V6_vmpyihb': {'hvx_intrinsic': 'Vd.h=vmpyi(Vu.h,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                '(Vu.h[i] * Rt.b[i % 4]) ;}'},
 'hexagon_V6_vmpyihb_acc': {'hvx_intrinsic': 'Vx.h+=vmpyi(Vu.h,Rt.b)',
                            'spec': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i] '
                                    '+= (Vu.h[i] * Rt.b[i % 4]) ;}'},
 'hexagon_V6_vmpyiowh': {'hvx_intrinsic': 'Vd.w=vmpyio(Vu.w,Vv.h)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 '(Vu.w[i] * Vv.w[i].h[1]) ;}'},
 'hexagon_V6_vmpyiwb': {'hvx_intrinsic': 'Vd.w=vmpyi(Vu.w,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                '(Vu.w[i] * Rt.b[i % 4]) ;}'},
 'hexagon_V6_vmpyiwb_acc': {'hvx_intrinsic': 'Vx.w+=vmpyi(Vu.w,Rt.b)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                    '+= (Vu.w[i] * Rt.b[i % 4]) ;}'},
 'hexagon_V6_vmpyiwh': {'hvx_intrinsic': 'Vd.w=vmpyi(Vu.w,Rt.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                '(Vu.w[i] * Rt.h[i % 2]) ;}'},
 'hexagon_V6_vmpyiwh_acc': {'hvx_intrinsic': 'Vx.w+=vmpyi(Vu.w,Rt.h)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                    '+= (Vu.w[i] * Rt.h[i % 2]) ;}'},
 'hexagon_V6_vmpyiwub': {'hvx_intrinsic': 'Vd.w=vmpyi(Vu.w,Rt.ub)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 '(Vu.w[i] * Rt.ub[i % 4]) ;}'},
 'hexagon_V6_vmpyiwub_acc': {'hvx_intrinsic': 'Vx.w+=vmpyi(Vu.w,Rt.ub)',
                             'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                     '+= (Vu.w[i] * Rt.ub[i % 4]) ;}'},
 'hexagon_V6_vmpyowh': {'hvx_intrinsic': 'Vd.w=vmpyo(Vu.w,Vv.h):<<1:sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                'sat32(((((Vu.w[i] * Vv.w[i].h[1])>> 14) + 1) '
                                '>> 1)) ;}'},
 'hexagon_V6_vmpyowh_64_acc': {'hvx_intrinsic': 'Vxx+=vmpyo(Vu.w,Vv.h)',
                               'spec': 'for (i = 0; i < VELEM(32); i++) {prod '
                                       '= (Vu.w[i] * Vv.w[i].h[1]) '
                                       '+Vxx.v[1].w[i];Vxx.v[1].w[i] = prod >> '
                                       '16;Vxx.v[0].w[i].h[0]=Vxx.v[0].w[i] >> '
                                       '16;Vxx.v[0].w[i].h[1]=prod & '
                                       '0x0000ffff ;}'},
 'hexagon_V6_vmpyowh_rnd': {'hvx_intrinsic': 'Vd.w=vmpyo(Vu.w,Vv.h):<<1:rnd:sat',
                            'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] '
                                    '= sat32(((((Vu.w[i] * Vv.w[i].h[1])>> 14) '
                                    '+ 1) >> 1)) ;}'},
 'hexagon_V6_vmpyowh_rnd_sacc': {'hvx_intrinsic': 'Vx.w+=vmpyo(Vu.w,Vv.h):<<1:rnd:sat:shift',
                                 'spec': 'for (i = 0; i < VELEM(32); i++) '
                                         '{Vx.w[i] = sat32(((((Vx.w[i] + '
                                         '(Vu.w[i] *Vv.w[i].h[1])) >> 14) + 1) '
                                         '>> 1)) ;}'},
 'hexagon_V6_vmpyowh_sacc': {'hvx_intrinsic': 'Vx.w+=vmpyo(Vu.w,Vv.h):<<1:sat:shift',
                             'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                     '= sat32(((((Vx.w[i] + (Vu.w[i] '
                                     '*Vv.w[i].h[1])) >> 14) + 1) >> 1)) ;}'},
 'hexagon_V6_vmpyub': {'hvx_intrinsic': 'Vdd.uh=vmpy(Vu.ub,Rt.ub)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) '
                               '{Vdd.v[0].uh[i] = (Vu.uh[i].ub[0] '
                               '*Rt.ub[(2*i+0)%4]);Vdd.v[1].uh[i] = '
                               '(Vu.uh[i].ub[1] *Rt.ub[(2*i+1)%4]) ;}'},
 'hexagon_V6_vmpyub_acc': {'hvx_intrinsic': 'Vxx.uh+=vmpy(Vu.ub,Rt.ub)',
                           'spec': 'for (i = 0; i < VELEM(16); i++) '
                                   '{Vxx.v[0].uh[i] += (Vu.uh[i].ub[0] '
                                   '*Rt.ub[(2*i+0)%4]);Vxx.v[1].uh[i] += '
                                   '(Vu.uh[i].ub[1] *Rt.ub[(2*i+1)%4]) ;}'},
 'hexagon_V6_vmpyubv': {'hvx_intrinsic': 'Vdd.uh=vmpy(Vu.ub,Vv.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].uh[i] = (Vu.uh[i].ub[0] '
                                '*Vv.uh[i].ub[0]);Vdd.v[1].uh[i] = '
                                '(Vu.uh[i].ub[1] *Vv.uh[i].ub[1]) ;}'},
 'hexagon_V6_vmpyubv_acc': {'hvx_intrinsic': 'Vxx.uh+=vmpy(Vu.ub,Vv.ub)',
                            'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vxx.v[0].uh[i] += (Vu.uh[i].ub[0] '
                                    '*Vv.uh[i].ub[0]);Vxx.v[1].uh[i] += '
                                    '(Vu.uh[i].ub[1] *Vv.uh[i].ub[1]) ;}'},
 'hexagon_V6_vmpyuh': {'hvx_intrinsic': 'Vdd.uw=vmpy(Vu.uh,Rt.uh)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) '
                               '{Vdd.v[0].uw[i] = (Vu.uw[i].uh[0] '
                               '*Rt.uh[0]);Vdd.v[1].uw[i] = (Vu.uw[i].uh[1] * '
                               'Rt.uh[1]);}'},
 'hexagon_V6_vmpyuh_acc': {'hvx_intrinsic': 'Vxx.uw+=vmpy(Vu.uh,Rt.uh)',
                           'spec': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vxx.v[0].uw[i] += (Vu.uw[i].uh[0] '
                                   '*Rt.uh[0]);Vxx.v[1].uw[i] += '
                                   '(Vu.uw[i].uh[1] *Rt.uh[1]) ;}'},
 'hexagon_V6_vmpyuhe': {'hvx_intrinsic': 'Vd.uw=vmpye(Vu.uh,Rt.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                '(Vu.uw[i].uh[0] * Rt.uh[0]) ;}'},
 'hexagon_V6_vmpyuhe_acc': {'hvx_intrinsic': 'Vx.uw+=vmpye(Vu.uh,Rt.uh)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.uw[i] '
                                    '+= (Vu.uw[i].uh[0] * Rt.uh[0]) ;}'},
 'hexagon_V6_vmpyuhv': {'hvx_intrinsic': 'Vdd.uw=vmpy(Vu.uh,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].uw[i] = (Vu.uw[i].uh[0] '
                                '*Vv.uw[i].uh[0]);Vdd.v[1].uw[i] = '
                                '(Vu.uw[i].uh[1] *Vv.uw[i].uh[1]) ;}'},
 'hexagon_V6_vmpyuhv_acc': {'hvx_intrinsic': 'Vxx.uw+=vmpy(Vu.uh,Vv.uh)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vxx.v[0].uw[i] += (Vu.uw[i].uh[0] '
                                    '*Vv.uw[i].uh[0]);Vxx.v[1].uw[i] += '
                                    '(Vu.uw[i].uh[1] *Vv.uw[i].uh[1]) ;}'},
 'hexagon_V6_vmux': {'hvx_intrinsic': 'Vd=vmux(Qt4,Vu,Vv)',
                     'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                             'QtV[i] ? Vu.ub[i] : Vv.ub[i] ;}'},
 'hexagon_V6_vnavgb': {'hvx_intrinsic': 'Vd.b=vnavg(Vu.b,Vv.b)',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                               '(Vu.b[i]-Vv.b[i])/2 ;}'},
 'hexagon_V6_vnavgh': {'hvx_intrinsic': 'Vd.h=vnavg(Vu.h,Vv.h)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                               '(Vu.h[i]-Vv.h[i])/2 ;}'},
 'hexagon_V6_vnavgub': {'hvx_intrinsic': 'Vd.b=vnavg(Vu.ub,Vv.ub)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                '(Vu.ub[i]-Vv.ub[i])/2 ;}'},
 'hexagon_V6_vnavgw': {'hvx_intrinsic': 'Vd.w=vnavg(Vu.w,Vv.w)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                               '(Vu.w[i]-Vv.w[i])/2 ;}'},
 'hexagon_V6_vnot': {'hvx_intrinsic': 'Vd=vnot(Vu)',
                     'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                             '~Vu.uh[i] ;}'},
 'hexagon_V6_vor': {'hvx_intrinsic': 'Vd=vor(Vu,Vv)',
                    'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                            'Vu.uh[i] | Vv.h[i] ;}'},
 'hexagon_V6_vpackeb': {'hvx_intrinsic': 'Vd.b=vpacke(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
                                'Vv.uh[i].ub[0];Vd.ub[i+VBITS/16] = '
                                'Vu.uh[i].ub[0] ;}'},
 'hexagon_V6_vpackeh': {'hvx_intrinsic': 'Vd.h=vpacke(Vu.w,Vv.w)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
                                'Vv.uw[i].uh[0];Vd.uh[i+VBITS/32] = '
                                'Vu.uw[i].uh[0] ;}'},
 'hexagon_V6_vpackhb_sat': {'hvx_intrinsic': 'Vd.b=vpack(Vu.h,Vv.h):sat',
                            'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.b[i] '
                                    '= sat8(Vv.h[i]);Vd.b[i+VBITS/16] = '
                                    'sat8(Vu.h[i]) ;}'},
 'hexagon_V6_vpackhub_sat': {'hvx_intrinsic': 'Vd.ub=vpack(Vu.h,Vv.h):sat',
                             'spec': 'for (i = 0; i < VELEM(16); i++) '
                                     '{Vd.ub[i] = '
                                     'usat8(Vv.h[i]);Vd.ub[i+VBITS/16] = '
                                     'usat8(Vu.h[i]) ;}'},
 'hexagon_V6_vpackob': {'hvx_intrinsic': 'Vd.b=vpacko(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
                                'Vv.uh[i].ub[1];Vd.ub[i+VBITS/16] = '
                                'Vu.uh[i].ub[1] ;}'},
 'hexagon_V6_vpackoh': {'hvx_intrinsic': 'Vd.h=vpacko(Vu.w,Vv.w)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
                                'Vv.uw[i].uh[1];Vd.uh[i+VBITS/32] = '
                                'Vu.uw[i].uh[1] ;}'},
 'hexagon_V6_vpackwh_sat': {'hvx_intrinsic': 'Vd.h=vpack(Vu.w,Vv.w):sat',
                            'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.h[i] '
                                    '= sat16(Vv.w[i]);Vd.h[i+VBITS/32] = '
                                    'sat16(Vu.w[i]) ;}'},
 'hexagon_V6_vpackwuh_sat': {'hvx_intrinsic': 'Vd.uh=vpack(Vu.w,Vv.w):sat',
                             'spec': 'for (i = 0; i < VELEM(32); i++) '
                                     '{Vd.uh[i] = '
                                     'usat16(Vv.w[i]);Vd.uh[i+VBITS/32] = '
                                     'usat16(Vu.w[i]) ;}'},
 'hexagon_V6_vrdelta': {'hvx_intrinsic': 'Vd=vrdelta(Vu,Vv)',
                        'spec': 'for (offset=1; offset<VWIDTH; offset<<=1){for '
                                '(k = 0; k<VWIDTH; k++) {Vd.ub[k] = '
                                '(Vv.ub[k]&offset) ?Vu.ub[k^offset] : '
                                'Vu.ub[k];}for (k = 0; k<VWIDTH; k++) '
                                '{Vu.ub[k] = Vd.ub[k];}}'},
 'hexagon_V6_vrmpybus': {'hvx_intrinsic': 'Vd.w=vrmpy(Vu.ub,Rt.b)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 '(Vu.uw[i].ub[0] * Rt.b[0]);Vd.w[i] += '
                                 '(Vu.uw[i].ub[1] * Rt.b[1]);Vd.w[i] += '
                                 '(Vu.uw[i].ub[2] * Rt.b[2]);Vd.w[i] += '
                                 '(Vu.uw[i].ub[3] * Rt.b[3]) ;}'},
 'hexagon_V6_vrmpybus_acc': {'hvx_intrinsic': 'Vx.w+=vrmpy(Vu.ub,Rt.b)',
                             'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                     '+= (Vu.uw[i].ub[0] * Rt.b[0]);Vx.w[i] += '
                                     '(Vu.uw[i].ub[1] * Rt.b[1]);Vx.w[i] += '
                                     '(Vu.uw[i].ub[2] * Rt.b[2]);Vx.w[i] += '
                                     '(Vu.uw[i].ub[3] * Rt.b[3]) ;}'},
 'hexagon_V6_vrmpybusi': {'hvx_intrinsic': 'Vdd.w=vrmpy(Vuu.ub,Rt.b,#u1)',
                          'spec': 'for (i = 0; i < VELEM(32); i++) '
                                  '{Vdd.v[0].w[i] = (Vuu.v[#u ? '
                                  '1:0].uw[i].ub[0]* Rt.b[(0-#u) & '
                                  '0x3]);Vdd.v[0].w[i] += (Vuu.v[0 '
                                  '].uw[i].ub[1] *Rt.b[(1-#u) & '
                                  '0x3]);Vdd.v[0].w[i] += (Vuu.v[0 '
                                  '].uw[i].ub[2] *Rt.b[(2-#u) & '
                                  '0x3]);Vdd.v[0].w[i] += (Vuu.v[0 '
                                  '].uw[i].ub[3] *Rt.b[(3-#u) & '
                                  '0x3]);Vdd.v[1].w[i] = (Vuu.v[1 '
                                  '].uw[i].ub[0] *Rt.b[(2-#u) & '
                                  '0x3]);Vdd.v[1].w[i] += (Vuu.v[1 '
                                  '].uw[i].ub[1] *Rt.b[(3-#u) & '
                                  '0x3]);Vdd.v[1].w[i] += (Vuu.v[#u '
                                  '?1:0].uw[i].ub[2] * Rt.b[(0-#u) & '
                                  '0x3]);Vdd.v[1].w[i] += (Vuu.v[0 '
                                  '].uw[i].ub[3] *Rt.b[(1-#u) & 0x3]) ;}'},
 'hexagon_V6_vrmpybusi_acc': {'hvx_intrinsic': 'Vxx.w+=vrmpy(Vuu.ub,Rt.b,#u1)',
                              'spec': 'for (i = 0; i < VELEM(32); i++) '
                                      '{Vxx.v[0].w[i] += (Vuu.v[#u '
                                      '?1:0].uw[i].ub[0] * Rt.b[(0-#u) & '
                                      '0x3]);Vxx.v[0].w[i] += (Vuu.v[0 '
                                      '].uw[i].ub[1] *Rt.b[(1-#u) & '
                                      '0x3]);Vxx.v[0].w[i] += (Vuu.v[0 '
                                      '].uw[i].ub[2] *Rt.b[(2-#u) & '
                                      '0x3]);Vxx.v[0].w[i] += (Vuu.v[0 '
                                      '].uw[i].ub[3] *Rt.b[(3-#u) & '
                                      '0x3]);Vxx.v[1].w[i] += (Vuu.v[1 '
                                      '].uw[i].ub[0] *Rt.b[(2-#u) & '
                                      '0x3]);Vxx.v[1].w[i] += (Vuu.v[1 '
                                      '].uw[i].ub[1] *Rt.b[(3-#u) & '
                                      '0x3]);Vxx.v[1].w[i] += (Vuu.v[#u '
                                      '?1:0].uw[i].ub[2] * Rt.b[(0-#u) & '
                                      '0x3]);Vxx.v[1].w[i] += (Vuu.v[0 '
                                      '].uw[i].ub[3] *Rt.b[(1-#u) & 0x3]) ;}'},
 'hexagon_V6_vrmpybusv': {'hvx_intrinsic': 'Vd.w=vrmpy(Vu.ub,Vv.b)',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                  '(Vu.uw[i].ub[0] * Vv.w[i].b[0]);Vd.w[i] += '
                                  '(Vu.uw[i].ub[1] * Vv.w[i].b[1]);Vd.w[i] += '
                                  '(Vu.uw[i].ub[2] * Vv.w[i].b[2]);Vd.w[i] += '
                                  '(Vu.uw[i].ub[3] * Vv.w[i].b[3]) ;}'},
 'hexagon_V6_vrmpybusv_acc': {'hvx_intrinsic': 'Vx.w+=vrmpy(Vu.ub,Vv.b)',
                              'spec': 'for (i = 0; i < VELEM(32); i++) '
                                      '{Vx.w[i] += (Vu.uw[i].ub[0] * '
                                      'Vv.w[i].b[0]);Vx.w[i] += '
                                      '(Vu.uw[i].ub[1] * Vv.w[i].b[1]);Vx.w[i] '
                                      '+= (Vu.uw[i].ub[2] * '
                                      'Vv.w[i].b[2]);Vx.w[i] += '
                                      '(Vu.uw[i].ub[3] * Vv.w[i].b[3]) ;}'},
 'hexagon_V6_vrmpybv': {'hvx_intrinsic': 'Vd.w=vrmpy(Vu.b,Vv.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                '(Vu.w[i].b[0] * Vv.w[i].b[0]);Vd.w[i] += '
                                '(Vu.w[i].b[1] * Vv.w[i].b[1]);Vd.w[i] += '
                                '(Vu.w[i].b[2] * Vv.w[i].b[2]);Vd.w[i] += '
                                '(Vu.w[i].b[3] * Vv.w[i].b[3]) ;}'},
 'hexagon_V6_vrmpybv_acc': {'hvx_intrinsic': 'Vx.w+=vrmpy(Vu.b,Vv.b)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                    '+= (Vu.w[i].b[0] * Vv.w[i].b[0]);Vx.w[i] '
                                    '+= (Vu.w[i].b[1] * Vv.w[i].b[1]);Vx.w[i] '
                                    '+= (Vu.w[i].b[2] * Vv.w[i].b[2]);Vx.w[i] '
                                    '+= (Vu.w[i].b[3] * Vv.w[i].b[3]) ;}'},
 'hexagon_V6_vrmpyub': {'hvx_intrinsic': 'Vd.uw=vrmpy(Vu.ub,Rt.ub)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                '(Vu.uw[i].ub[0] * Rt.ub[0]);Vd.uw[i] += '
                                '(Vu.uw[i].ub[1] * Rt.ub[1]);Vd.uw[i] += '
                                '(Vu.uw[i].ub[2] * Rt.ub[2]);Vd.uw[i] += '
                                '(Vu.uw[i].ub[3] * Rt.ub[3]) ;}'},
 'hexagon_V6_vrmpyub_acc': {'hvx_intrinsic': 'Vx.uw+=vrmpy(Vu.ub,Rt.ub)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.uw[i] '
                                    '+= (Vu.uw[i].ub[0] * Rt.ub[0]);Vx.uw[i] '
                                    '+= (Vu.uw[i].ub[1] * Rt.ub[1]);Vx.uw[i] '
                                    '+= (Vu.uw[i].ub[2] * Rt.ub[2]);Vx.uw[i] '
                                    '+= (Vu.uw[i].ub[3] * Rt.ub[3]) ;}'},
 'hexagon_V6_vrmpyubi': {'hvx_intrinsic': 'Vdd.uw=vrmpy(Vuu.ub,Rt.ub,#u1)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) '
                                 '{Vdd.v[0].uw[i] = (Vuu.v[#u '
                                 '?1:0].uw[i].ub[0] * Rt.ub[(0-#u) & '
                                 '0x3]);Vdd.v[0].uw[i] += (Vuu.v[0 '
                                 '].uw[i].ub[1] *Rt.ub[(1-#u) & '
                                 '0x3]);Vdd.v[0].uw[i] += (Vuu.v[0 '
                                 '].uw[i].ub[2] *Rt.ub[(2-#u) & '
                                 '0x3]);Vdd.v[0].uw[i] += (Vuu.v[0 '
                                 '].uw[i].ub[3] *Rt.ub[(3-#u) & '
                                 '0x3]);Vdd.v[1].uw[i] = (Vuu.v[1 '
                                 '].uw[i].ub[0] *Rt.ub[(2-#u) & '
                                 '0x3]);Vdd.v[1].uw[i] += (Vuu.v[1 '
                                 '].uw[i].ub[1] *Rt.ub[(3-#u) & '
                                 '0x3]);Vdd.v[1].uw[i] += (Vuu.v[#u '
                                 '?1:0].uw[i].ub[2] * Rt.ub[(0-#u) & '
                                 '0x3]);Vdd.v[1].uw[i] += (Vuu.v[0 '
                                 '].uw[i].ub[3] *Rt.ub[(1-#u) & 0x3]) ;}'},
 'hexagon_V6_vrmpyubi_acc': {'hvx_intrinsic': 'Vxx.uw+=vrmpy(Vuu.ub,Rt.ub,#u1)',
                             'spec': 'for (i = 0; i < VELEM(32); i++) '
                                     '{Vxx.v[0].uw[i] += (Vuu.v[#u '
                                     '?1:0].uw[i].ub[0] * Rt.ub[(0-#u) & '
                                     '0x3]);Vxx.v[0].uw[i] += (Vuu.v[0 '
                                     '].uw[i].ub[1] *Rt.ub[(1-#u) & '
                                     '0x3]);Vxx.v[0].uw[i] += (Vuu.v[0 '
                                     '].uw[i].ub[2] *Rt.ub[(2-#u) & '
                                     '0x3]);Vxx.v[0].uw[i] += (Vuu.v[0 '
                                     '].uw[i].ub[3] *Rt.ub[(3-#u) & '
                                     '0x3]);Vxx.v[1].uw[i] += (Vuu.v[1 '
                                     '].uw[i].ub[0] *Rt.ub[(2-#u) & '
                                     '0x3]);Vxx.v[1].uw[i] += (Vuu.v[1 '
                                     '].uw[i].ub[1] *Rt.ub[(3-#u) & '
                                     '0x3]);Vxx.v[1].uw[i] += (Vuu.v[#u '
                                     '?1:0].uw[i].ub[2] * Rt.ub[(0-#u) & '
                                     '0x3]);Vxx.v[1].uw[i] += (Vuu.v[0 '
                                     '].uw[i].ub[3] *Rt.ub[(1-#u) & 0x3]) ;}'},
 'hexagon_V6_vrmpyubv': {'hvx_intrinsic': 'Vd.uw=vrmpy(Vu.ub,Vv.ub)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                 '(Vu.uw[i].ub[0] *Vv.uw[i].ub[0]);Vd.uw[i] += '
                                 '(Vu.uw[i].ub[1] *Vv.uw[i].ub[1]);Vd.uw[i] += '
                                 '(Vu.uw[i].ub[2] *Vv.uw[i].ub[2]);Vd.uw[i] += '
                                 '(Vu.uw[i].ub[3] *Vv.uw[i].ub[3]) ;}'},
 'hexagon_V6_vrmpyubv_acc': {'hvx_intrinsic': 'Vx.uw+=vrmpy(Vu.ub,Vv.ub)',
                             'spec': 'for (i = 0; i < VELEM(32); i++) '
                                     '{Vx.uw[i] += (Vu.uw[i].ub[0] '
                                     '*Vv.uw[i].ub[0]);Vx.uw[i] += '
                                     '(Vu.uw[i].ub[1] '
                                     '*Vv.uw[i].ub[1]);Vx.uw[i] += '
                                     '(Vu.uw[i].ub[2] '
                                     '*Vv.uw[i].ub[2]);Vx.uw[i] += '
                                     '(Vu.uw[i].ub[3] *Vv.uw[i].ub[3]) ;}'},
 'hexagon_V6_vror': {'hvx_intrinsic': 'Vd=vror(Vu,Rt)',
                     'spec': 'for (k=0;k<VWIDTH;k++) {Vd.ub[k] = '
                             'Vu.ub[(k+Rt)&(VWIDTH-1)];}'},
 'hexagon_V6_vrsadubi': {'hvx_intrinsic': 'Vdd.uw=vrsad(Vuu.ub,Rt.ub,#u1)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) '
                                 '{Vdd.v[0].uw[i] '
                                 '=ABS(Vuu.v[#u?1:0].uw[i].ub[0] - '
                                 'Rt.ub[(0-#u)&3]);Vdd.v[0].uw[i] += '
                                 'ABS(Vuu.v[0 ].uw[i].ub[1]- '
                                 'Rt.ub[(1-#u)&3]);Vdd.v[0].uw[i] += '
                                 'ABS(Vuu.v[0 ].uw[i].ub[2]- '
                                 'Rt.ub[(2-#u)&3]);Vdd.v[0].uw[i] += '
                                 'ABS(Vuu.v[0 ].uw[i].ub[3]- '
                                 'Rt.ub[(3-#u)&3]);Vdd.v[1].uw[i] = '
                                 'ABS(Vuu.v[1 ].uw[i].ub[0] '
                                 '-Rt.ub[(2-#u)&3]);Vdd.v[1].uw[i] += '
                                 'ABS(Vuu.v[1 ].uw[i].ub[1]- '
                                 'Rt.ub[(3-#u)&3]);Vdd.v[1].uw[i] '
                                 '+=ABS(Vuu.v[#u?1:0].uw[i].ub[2] - '
                                 'Rt.ub[(0-#u)&3]);Vdd.v[1].uw[i] += '
                                 'ABS(Vuu.v[0 ].uw[i].ub[3]- Rt.ub[(1-#u)&3]) '
                                 ';}'},
 'hexagon_V6_vrsadubi_acc': {'hvx_intrinsic': 'Vxx.uw+=vrsad(Vuu.ub,Rt.ub,#u1)',
                             'spec': 'for (i = 0; i < VELEM(32); i++) '
                                     '{Vxx.v[0].uw[i] '
                                     '+=ABS(Vuu.v[#u?1:0].uw[i].ub[0] - '
                                     'Rt.ub[(0-#u)&3]);Vxx.v[0].uw[i] += '
                                     'ABS(Vuu.v[0 ].uw[i].ub[1]- '
                                     'Rt.ub[(1-#u)&3]);Vxx.v[0].uw[i] += '
                                     'ABS(Vuu.v[0 ].uw[i].ub[2]- '
                                     'Rt.ub[(2-#u)&3]);Vxx.v[0].uw[i] += '
                                     'ABS(Vuu.v[0 ].uw[i].ub[3]- '
                                     'Rt.ub[(3-#u)&3]);Vxx.v[1].uw[i] += '
                                     'ABS(Vuu.v[1 ].uw[i].ub[0]- '
                                     'Rt.ub[(2-#u)&3]);Vxx.v[1].uw[i] += '
                                     'ABS(Vuu.v[1 ].uw[i].ub[1]- '
                                     'Rt.ub[(3-#u)&3]);Vxx.v[1].uw[i] '
                                     '+=ABS(Vuu.v[#u?1:0].uw[i].ub[2] - '
                                     'Rt.ub[(0-#u)&3]);Vxx.v[1].uw[i] += '
                                     'ABS(Vuu.v[0 ].uw[i].ub[3]- '
                                     'Rt.ub[(1-#u)&3]) ;}'},
 'hexagon_V6_vsatdw': {'hvx_intrinsic': 'Vd.w=vsatdw(Vu.w, Vv.w)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                               'usat32(Vu.w[i]:Vv.w[i]) ;}'},
 'hexagon_V6_vsathub': {'hvx_intrinsic': 'Vd.ub=vsat(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vd.uh[i].b[0]=usat8(Vv.h[i]);Vd.uh[i].b[1]=usat8(Vu.h[i]) '
                                ';}'},
 'hexagon_V6_vsatuwuh': {'hvx_intrinsic': 'Vd.uh=vsat(Vu.uw,Vv.uw)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) '
                                 '{Vd.w[i].h[0]=usat16(Vv.uw[i]);Vd.w[i].h[1]=usat16(Vu.uw[i]) '
                                 ';}'},
 'hexagon_V6_vsatwh': {'hvx_intrinsic': 'Vd.h=vsat(Vu.w,Vv.w)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) '
                               '{Vd.w[i].h[0]=sat16(Vv.w[i]);Vd.w[i].h[1]=sat16(Vu.w[i]) '
                               ';}'},
 'hexagon_V6_vsb': {'hvx_intrinsic': 'Vdd.h=vsxt(Vu.b)',
                    'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
                            'Vu.h[i].b[0];Vdd.v[1].h[i] = Vu.h[i].b[1] ;}'},
 'hexagon_V6_vsh': {'hvx_intrinsic': 'Vdd.w=vsxt(Vu.h)',
                    'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = '
                            'Vu.w[i].h[0];Vdd.v[1].w[i] = Vu.w[i].h[1] ;}'},
 'hexagon_V6_vshufeh': {'hvx_intrinsic': 'Vd.h=vshuffe(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vd.uw[i].h[0]=Vv.uw[i].uh[0];Vd.uw[i].h[1]=Vu.uw[i].uh[0] '
                                ';}'},
 'hexagon_V6_vshuffb': {'hvx_intrinsic': 'Vd.b=vshuff(Vu.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vd.uh[i].b[0]=Vu.ub[i];Vd.uh[i].b[1]=Vu.ub[i+VBITS/16] '
                                ';}'},
 'hexagon_V6_vshuffeb': {'hvx_intrinsic': 'Vd.b=vshuffe(Vu.b,Vv.b)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vd.uh[i].b[0]=Vv.uh[i].ub[0];Vd.uh[i].b[1]=Vu.uh[i].ub[0] '
                                 ';}'},
 'hexagon_V6_vshuffh': {'hvx_intrinsic': 'Vd.h=vshuff(Vu.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vd.uw[i].h[0]=Vu.uh[i];Vd.uw[i].h[1]=Vu.uh[i+VBITS/32] '
                                ';}'},
 'hexagon_V6_vshuffob': {'hvx_intrinsic': 'Vd.b=vshuffo(Vu.b,Vv.b)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vd.uh[i].b[0]=Vv.uh[i].ub[1];Vd.uh[i].b[1]=Vu.uh[i].ub[1] '
                                 ';}'},
 'hexagon_V6_vshuffvdd': {'hvx_intrinsic': 'Vdd=vshuff(Vu,Vv,Rt)',
                          'spec': 'Vdd.v[0] = Vv;Vdd.v[1] = Vu;for (offset=1; '
                                  'offset<VWIDTH; offset<<=1) {if ( Rt & '
                                  'offset) {for (k = 0; k < VELEM(8); k++) {if '
                                  '(!( k & offset)) '
                                  '{SWAP(Vdd.v[1].ub[k],Vdd.v[0].ub[k+offset]);}}}}'},
 'hexagon_V6_vshufoeb': {'hvx_intrinsic': 'Vdd.b=vshuffoe(Vu.b,Vv.b)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].uh[i].b[0]=Vv.uh[i].ub[0];Vdd.v[0].uh[i].b[1]=Vu.uh[i].ub[0];Vdd.v[1].uh[i].b[0]=Vv.uh[i].ub[1];Vdd.v[1].uh[i].b[1]=Vu.uh[i].ub[1] '
                                 ';}'},
 'hexagon_V6_vshufoeh': {'hvx_intrinsic': 'Vdd.h=vshuffoe(Vu.h,Vv.h)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) '
                                 '{Vdd.v[0].uw[i].h[0]=Vv.uw[i].uh[0];Vdd.v[0].uw[i].h[1]=Vu.uw[i].uh[0];Vdd.v[1].uw[i].h[0]=Vv.uw[i].uh[1];Vdd.v[1].uw[i].h[1]=Vu.uw[i].uh[1] '
                                 ';}'},
 'hexagon_V6_vshufoh': {'hvx_intrinsic': 'Vd.h=vshuffo(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vd.uw[i].h[0]=Vv.uw[i].uh[1];Vd.uw[i].h[1]=Vu.uw[i].uh[1] '
                                ';}'},
 'hexagon_V6_vsubb': {'hvx_intrinsic': 'Vd.b=vsub(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i]-Vv.b[i]) ;}'},
 'hexagon_V6_vsubb_dv': {'hvx_intrinsic': 'Vdd.b=vsub(Vuu.b,Vvv.b)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{Vdd.v[0].b[i] = '
                                 '(Vuu.v[0].b[i]-Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                 '= (Vuu.v[1].b[i]-Vvv.v[1].b[i]) ;}'},
 'hexagon_V6_vsubbnq': {'hvx_intrinsic': 'if (!Qv4) Vx.b-=Vu.b',
                        'spec': 'for (i = 0; i < VELEM(8); i--) '
                                '{Vx.ub[i]=QvV.i ? Vx.ub[i] : '
                                'Vx.ub[i]-Vu.ub[i] ;}'},
 'hexagon_V6_vsubbq': {'hvx_intrinsic': 'if (Qv4) Vx.b-=Vu.b',
                       'spec': 'for (i = 0; i < VELEM(8); i--) {Vx.ub[i]=QvV.i '
                               '? Vx.ub[i] : Vx.ub[i]-Vu.ub[i] ;}'},
 'hexagon_V6_vsubbsat': {'hvx_intrinsic': 'Vd.b=vsub(Vu.b,Vv.b):sat',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                 'sat8(Vu.b[i]-Vv.b[i]) ;}'},
 'hexagon_V6_vsubbsat_dv': {'hvx_intrinsic': 'Vdd.b=vsub(Vuu.b,Vvv.b):sat',
                            'spec': 'for (i = 0; i < VELEM(8); i++) '
                                    '{Vdd.v[0].b[i] = '
                                    'sat8(Vuu.v[0].b[i]-Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                    '= sat8(Vuu.v[1].b[i]-Vvv.v[1].b[i]) ;}'},
 'hexagon_V6_vsubcarry': {'hvx_intrinsic': 'Vd.w,Qe4=vsub(Vu.w,Vv.w):carry',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                  'Vu.w[i]+~Vv.w[i]+1;QeV[4*i+4-1:4*i] = '
                                  '-carry_from(Vu.w[i],~Vv.w[i],1) ;}'},
 'hexagon_V6_vsubh': {'hvx_intrinsic': 'Vd.h=vsub(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i]-Vv.h[i]) ;}'},
 'hexagon_V6_vsubh_dv': {'hvx_intrinsic': 'Vdd.h=vsub(Vuu.h,Vvv.h)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].h[i] = '
                                 '(Vuu.v[0].h[i]-Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                 '= (Vuu.v[1].h[i]-Vvv.v[1].h[i]) ;}'},
 'hexagon_V6_vsubhnq': {'hvx_intrinsic': 'if (!Qv4) Vx.h-=Vu.h',
                        'spec': 'for (i = 0; i < VELEM(16); i--) '
                                '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]-Vu.h[i]) '
                                ';}'},
 'hexagon_V6_vsubhq': {'hvx_intrinsic': 'if (Qv4) Vx.h-=Vu.h',
                       'spec': 'for (i = 0; i < VELEM(16); i--) '
                               '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]-Vu.h[i]) '
                               ';}'},
 'hexagon_V6_vsubhsat': {'hvx_intrinsic': 'Vd.h=vsub(Vu.h,Vv.h):sat',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                 'sat16(Vu.h[i]-Vv.h[i]) ;}'},
 'hexagon_V6_vsubhsat_dv': {'hvx_intrinsic': 'Vdd.h=vsub(Vuu.h,Vvv.h):sat',
                            'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vdd.v[0].h[i] = '
                                    'sat16(Vuu.v[0].h[i]-Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                    '= sat16(Vuu.v[1].h[i]-Vvv.v[1].h[i]) ;}'},
 'hexagon_V6_vsubhw': {'hvx_intrinsic': 'Vdd.w=vsub(Vu.h,Vv.h)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                               '= Vu.w[i].h[0] - Vv.w[i].h[0];Vdd.v[1].w[i] = '
                               'Vu.w[i].h[1] - Vv.w[i].h[1];}'},
 'hexagon_V6_vsububh': {'hvx_intrinsic': 'Vdd.h=vsub(Vu.ub,Vv.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].h[i] = Vu.uh[i].ub[0] '
                                '-Vv.uh[i].ub[0];Vdd.v[1].h[i] = '
                                'Vu.uh[i].ub[1] -Vv.uh[i].ub[1] ;}'},
 'hexagon_V6_vsububsat': {'hvx_intrinsic': 'Vd.ub=vsub(Vu.ub,Vv.ub):sat',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                  'usat8(Vu.ub[i]-Vv.ub[i]) ;}'},
 'hexagon_V6_vsububsat_dv': {'hvx_intrinsic': 'Vdd.ub=vsub(Vuu.ub,Vvv.ub):sat',
                             'spec': 'for (i = 0; i < VELEM(8); i++) '
                                     '{Vdd.v[0].ub[i] = '
                                     'usat8(Vuu.v[0].ub[i]-Vvv.v[0].ub[i]);Vdd.v[1].ub[i] '
                                     '= usat8(Vuu.v[1].ub[i]-Vvv.v[1].ub[i]) '
                                     ';}'},
 'hexagon_V6_vsubububb_sat': {'hvx_intrinsic': 'Vd.ub=vsub(Vu.ub,Vv.b):sat',
                              'spec': 'for (i = 0; i < VELEM(8); i++) '
                                      '{Vd.ub[i] = usat8(Vu.ub[i] - Vv.b[i]) '
                                      ';}'},
 'hexagon_V6_vsubuhsat': {'hvx_intrinsic': 'Vd.uh=vsub(Vu.uh,Vv.uh):sat',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                  'usat16(Vu.uh[i]-Vv.uh[i]) ;}'},
 'hexagon_V6_vsubuhsat_dv': {'hvx_intrinsic': 'Vdd.uh=vsub(Vuu.uh,Vvv.uh):sat',
                             'spec': 'for (i = 0; i < VELEM(16); i++) '
                                     '{Vdd.v[0].uh[i] = '
                                     'usat16(Vuu.v[0].uh[i]-Vvv.v[0].uh[i]);Vdd.v[1].uh[i] '
                                     '= usat16(Vuu.v[1].uh[i]-Vvv.v[1].uh[i]) '
                                     ';}'},
 'hexagon_V6_vsubuhw': {'hvx_intrinsic': 'Vdd.w=vsub(Vu.uh,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] = Vu.uw[i].uh[0] '
                                '-Vv.uw[i].uh[0];Vdd.v[1].w[i] = '
                                'Vu.uw[i].uh[1] -Vv.uw[i].uh[1] ;}'},
 'hexagon_V6_vsubuwsat': {'hvx_intrinsic': 'Vd.uw=vsub(Vu.uw,Vv.uw):sat',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                  'usat32(Vu.uw[i]-Vv.uw[i]) ;}'},
 'hexagon_V6_vsubuwsat_dv': {'hvx_intrinsic': 'Vdd.uw=vsub(Vuu.uw,Vvv.uw):sat',
                             'spec': 'for (i = 0; i < VELEM(32); i++) '
                                     '{Vdd.v[0].uw[i] = '
                                     'usat32(Vuu.v[0].uw[i]-Vvv.v[0].uw[i]);Vdd.v[1].uw[i] '
                                     '= usat32(Vuu.v[1].uw[i]-Vvv.v[1].uw[i]) '
                                     ';}'},
 'hexagon_V6_vsubw': {'hvx_intrinsic': 'Vd.w=vsub(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i]-Vv.w[i]) ;}'},
 'hexagon_V6_vsubw_dv': {'hvx_intrinsic': 'Vdd.w=vsub(Vuu.w,Vvv.w)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) '
                                 '{Vdd.v[0].w[i] = '
                                 '(Vuu.v[0].w[i]-Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                 '= (Vuu.v[1].w[i]-Vvv.v[1].w[i]) ;}'},
 'hexagon_V6_vsubwnq': {'hvx_intrinsic': 'if (!Qv4) Vx.w-=Vu.w',
                        'spec': 'for (i = 0; i < VELEM(32); i--) '
                                '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]-Vu.w[i]) '
                                ';}'},
 'hexagon_V6_vsubwq': {'hvx_intrinsic': 'if (Qv4) Vx.w-=Vu.w',
                       'spec': 'for (i = 0; i < VELEM(32); i--) '
                               '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]-Vu.w[i]) '
                               ';}'},
 'hexagon_V6_vsubwsat': {'hvx_intrinsic': 'Vd.w=vsub(Vu.w,Vv.w):sat',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 'sat32(Vu.w[i]-Vv.w[i]) ;}'},
 'hexagon_V6_vsubwsat_dv': {'hvx_intrinsic': 'Vdd.w=vsub(Vuu.w,Vvv.w):sat',
                            'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vdd.v[0].w[i] = '
                                    'sat32(Vuu.v[0].w[i]-Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                    '= sat32(Vuu.v[1].w[i]-Vvv.v[1].w[i]) ;}'},
 'hexagon_V6_vswap': {'hvx_intrinsic': 'Vdd=vswap(Qt4,Vu,Vv)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].ub[i] '
                              '= QtV[i] ? Vu.ub[i] :Vv.ub[i];Vdd.v[1].ub[i] = '
                              '!QtV[i] ? Vu.ub[i] :Vv.ub[i] ;}'},
 'hexagon_V6_vtmpyb': {'hvx_intrinsic': 'Vdd.h=vtmpy(Vuu.b,Rt.b)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] '
                               '= (Vuu.v[0].h[i].b[0] *Rt.b[(2*i '
                               ')%4]);Vdd.v[0].h[i] += (Vuu.v[0].h[i].b[1] '
                               '*Rt.b[(2*i+1)%4]);Vdd.v[0].h[i] += '
                               'Vuu.v[1].h[i].b[0];Vdd.v[1].h[i] = '
                               '(Vuu.v[0].h[i].b[1] *Rt.b[(2*i '
                               ')%4]);Vdd.v[1].h[i] += (Vuu.v[1].h[i].b[0] '
                               '*Rt.b[(2*i+1)%4]);Vdd.v[1].h[i] += '
                               'Vuu.v[1].h[i].b[1] ;}'},
 'hexagon_V6_vtmpyb_acc': {'hvx_intrinsic': 'Vxx.h+=vtmpy(Vuu.b,Rt.b)',
                           'spec': 'for (i = 0; i < VELEM(16); i++) '
                                   '{Vxx.v[0].h[i] += (Vuu.v[0].h[i].b[0] '
                                   '*Rt.b[(2*i )%4]);Vxx.v[0].h[i] += '
                                   '(Vuu.v[0].h[i].b[1] '
                                   '*Rt.b[(2*i+1)%4]);Vxx.v[0].h[i] += '
                                   'Vuu.v[1].h[i].b[0];Vxx.v[1].h[i] += '
                                   '(Vuu.v[0].h[i].b[1] *Rt.b[(2*i '
                                   ')%4]);Vxx.v[1].h[i] += (Vuu.v[1].h[i].b[0] '
                                   '*Rt.b[(2*i+1)%4]);Vxx.v[1].h[i] += '
                                   'Vuu.v[1].h[i].b[1] ;}'},
 'hexagon_V6_vtmpybus': {'hvx_intrinsic': 'Vdd.h=vtmpy(Vuu.ub,Rt.b)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].h[i] = (Vuu.v[0].uh[i].ub[0] '
                                 '*Rt.b[(2*i )%4]);Vdd.v[0].h[i] += '
                                 '(Vuu.v[0].uh[i].ub[1] '
                                 '*Rt.b[(2*i+1)%4]);Vdd.v[0].h[i] += '
                                 'Vuu.v[1].uh[i].ub[0];Vdd.v[1].h[i] = '
                                 '(Vuu.v[0].uh[i].ub[1] *Rt.b[(2*i '
                                 ')%4]);Vdd.v[1].h[i] += (Vuu.v[1].uh[i].ub[0] '
                                 '*Rt.b[(2*i+1)%4]);Vdd.v[1].h[i] += '
                                 'Vuu.v[1].uh[i].ub[1] ;}'},
 'hexagon_V6_vtmpybus_acc': {'hvx_intrinsic': 'Vxx.h+=vtmpy(Vuu.ub,Rt.b)',
                             'spec': 'for (i = 0; i < VELEM(16); i++) '
                                     '{Vxx.v[0].h[i] += (Vuu.v[0].uh[i].ub[0] '
                                     '*Rt.b[(2*i )%4]);Vxx.v[0].h[i] += '
                                     '(Vuu.v[0].uh[i].ub[1] '
                                     '*Rt.b[(2*i+1)%4]);Vxx.v[0].h[i] += '
                                     'Vuu.v[1].uh[i].ub[0];Vxx.v[1].h[i] += '
                                     '(Vuu.v[0].uh[i].ub[1] *Rt.b[(2*i '
                                     ')%4]);Vxx.v[1].h[i] += '
                                     '(Vuu.v[1].uh[i].ub[0] '
                                     '*Rt.b[(2*i+1)%4]);Vxx.v[1].h[i] += '
                                     'Vuu.v[1].uh[i].ub[1] ;}'},
 'hexagon_V6_vtmpyhb': {'hvx_intrinsic': 'Vdd.w=vtmpy(Vuu.h,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] = (Vuu.v[0].w[i].h[0] '
                                '*Rt.b[(2*i+0)%4]);Vdd.v[0].w[i]+= '
                                '(Vuu.v[0].w[i].h[1] '
                                '*Rt.b[(2*i+1)%4]);Vdd.v[0].w[i]+= '
                                'Vuu.v[1].w[i].h[0];Vdd.v[1].w[i] = '
                                '(Vuu.v[0].w[i].h[1] '
                                '*Rt.b[(2*i+0)%4]);Vdd.v[1].w[i]+= '
                                '(Vuu.v[1].w[i].h[0] '
                                '*Rt.b[(2*i+1)%4]);Vdd.v[1].w[i]+= '
                                'Vuu.v[1].w[i].h[1] ;}'},
 'hexagon_V6_vtmpyhb_acc': {'hvx_intrinsic': 'Vxx.w+=vtmpy(Vuu.h,Rt.b)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vxx.v[0].w[i]+= (Vuu.v[0].w[i].h[0] '
                                    '*Rt.b[(2*i+0)%4]);Vxx.v[0].w[i]+= '
                                    '(Vuu.v[0].w[i].h[1] '
                                    '*Rt.b[(2*i+1)%4]);Vxx.v[0].w[i]+= '
                                    'Vuu.v[1].w[i].h[0];Vxx.v[1].w[i]+= '
                                    '(Vuu.v[0].w[i].h[1] '
                                    '*Rt.b[(2*i+0)%4]);Vxx.v[1].w[i]+= '
                                    '(Vuu.v[1].w[i].h[0] '
                                    '*Rt.b[(2*i+1)%4]);Vxx.v[1].w[i]+= '
                                    'Vuu.v[1].w[i].h[1] ;}'},
 'hexagon_V6_vunpackb': {'hvx_intrinsic': 'Vdd.h=vunpack(Vu.b)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.h[i] = '
                                 'Vu.b[i] ;}'},
 'hexagon_V6_vunpackh': {'hvx_intrinsic': 'Vdd.w=vunpack(Vu.h)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.w[i] = '
                                 'Vu.h[i] ;}'},
 'hexagon_V6_vunpackob': {'hvx_intrinsic': 'Vxx.h|=vunpacko(Vu.b)',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vxx.uh[i] '
                                  '|= Vu.ub[i]<<8 ;}'},
 'hexagon_V6_vunpackoh': {'hvx_intrinsic': 'Vxx.w|=vunpacko(Vu.h)',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vxx.uw[i] '
                                  '|= Vu.uh[i]<<16 ;}'},
 'hexagon_V6_vunpackub': {'hvx_intrinsic': 'Vdd.uh=vunpack(Vu.ub)',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.uh[i] = '
                                  'Vu.ub[i] ;}'},
 'hexagon_V6_vunpackuh': {'hvx_intrinsic': 'Vdd.uw=vunpack(Vu.uh)',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.uw[i] '
                                  '= Vu.uh[i] ;}'},
 'hexagon_V6_vxor': {'hvx_intrinsic': 'Vd=vxor(Vu,Vv)',
                     'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                             'Vu.uh[i] ^ Vv.h[i] ;}'},
 'hexagon_V6_vzb': {'hvx_intrinsic': 'Vdd.uh=vzxt(Vu.ub)',
                    'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].uh[i] = '
                            'Vu.uh[i].ub[0];Vdd.v[1].uh[i] = Vu.uh[i].ub[1] '
                            ';}'},
 'hexagon_V6_vzh': {'hvx_intrinsic': 'Vdd.uw=vzxt(Vu.uh)',
                    'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].uw[i] = '
                            'Vu.uw[i].uh[0];Vdd.v[1].uw[i] = Vu.uw[i].uh[1] '
                            ';}'}}