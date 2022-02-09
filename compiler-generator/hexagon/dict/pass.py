

PassHVXInsts = {
  'Vd.ub=vabsdiff(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                '(Vu.ub[i] > Vv.ub[i]) ? (Vu.ub[i]- Vv.ub[i]) '
                                ': (Vv.ub[i] - Vu.ub[i]) ;}',
 'Vd.h=vsub(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                         '(Vu.h[i]-Vv.h[i]) ;}',
 'Vd.b=vmax(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (Vu.b[i] > '
                         'Vv.b[i]) ? Vu.b[i] :Vv.b[i] ;}',
 'Vd.b=vmin(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (Vu.b[i] < '
                         'Vv.b[i]) ? Vu.b[i] :Vv.b[i] ;}',
 'Vd.b=vnavg(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                          '(Vu.b[i]-Vv.b[i])/2 ;}',
 'Vd.b=vnavg(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                            '(Vu.ub[i]-Vv.ub[i])/2 ;}',
 'Vd.b=vadd(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                         '(Vu.b[i]+Vv.b[i]) ;}',
  'Vd.b=vabs(Vu.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (ABS(Vu.b[i])) '
                    ';}',
 'Vxx.w|=vunpacko(Vu.h)': 'for (i = 0; i < VELEM(16); i++) {Vxx.uw[i] |= '
                          'Vu.uh[i]<<16 ;}',
 'Vxx.h|=vunpacko(Vu.b)': 'for (i = 0; i < VELEM(8); i++) {Vxx.uh[i] |= '
                          'Vu.ub[i]<<8 ;}',
 'Vd.ub=vmin(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                            '(Vu.ub[i] < Vv.ub[i]) ? Vu.ub[i]: Vv.ub[i] ;}',
 'Vd.ub=vmax(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                            '(Vu.ub[i] > Vv.ub[i]) ? Vu.ub[i]: Vv.ub[i] ;}',
 'Vd.uh=vabsdiff(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                              '(Vu.h[i] > Vv.h[i]) ? (Vu.h[i] -Vv.h[i]) : '
                              '(Vv.h[i] - Vu.h[i]) ;}',
 'Vd.ub=vavg(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                            '(Vu.ub[i]+Vv.ub[i])/2 ;}',
  'Vd.h=vnavg(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                          '(Vu.h[i]-Vv.h[i])/2 ;}',
 'Vd.b=vavg(Vu.b,Vv.b):rnd': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                             '(Vu.b[i]+Vv.b[i]+1)/2 ;}',
 'Vd.b=vavg(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                         '(Vu.b[i]+Vv.b[i])/2 ;}',
 'Vd.b=vabs(Vu.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                        'sat8(ABS(Vu.b[i])) ;}',
 'Vd.b=vadd(Vu.b,Vv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                             'sat8(Vu.b[i]+Vv.b[i]) ;}',
 'Vd.ub=vpack(Vu.h,Vv.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
                               'usat8(Vv.h[i]);Vd.ub[i+VBITS/16] = '
                               'usat8(Vu.h[i]) ;}',
 'Vd.ub=vavg(Vu.ub,Vv.ub):rnd': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                '(Vu.ub[i]+Vv.ub[i]+1)/2 ;}',
 'Vd.ub=vsub(Vu.ub,Vv.ub):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                'usat8(Vu.ub[i]-Vv.ub[i]) ;}',
 'Vd.ub=vsub(Vu.ub,Vv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               'usat8(Vu.ub[i] - Vv.b[i]) ;}',
 'Vd.ub=vadd(Vu.ub,Vv.ub):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                'usat8(Vu.ub[i]+Vv.ub[i]) ;}',
 'Vd.ub=vadd(Vu.ub,Vv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               'usat8(Vu.ub[i] + Vv.b[i]) ;}',
 'Vd.w=vabs(Vu.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (ABS(Vu.w[i])) '
                    ';}',
 'Vd.uw=vsub(Vu.uw,Vv.uw):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                'usat32(Vu.uw[i]-Vv.uw[i]) ;}',
 'Vd.uw=vavg(Vu.uw,Vv.uw):rnd': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                '(Vu.uw[i]+Vv.uw[i]+1)/2 ;}',
 'Vd.uw=vavg(Vu.uw,Vv.uw)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                            '(Vu.uw[i]+Vv.uw[i])/2 ;}',
 'Vd.uw=vadd(Vu.uw,Vv.uw):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                'usat32(Vu.uw[i]+Vv.uw[i]) ;}',
 'Vd.uw=vabsdiff(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                              '(Vu.w[i] > Vv.w[i]) ? (Vu.w[i] -Vv.w[i]) : '
                              '(Vv.w[i] - Vu.w[i]) ;}',
  'Vd.h=vsub(Vu.h,Vv.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                             'sat16(Vu.h[i]-Vv.h[i]) ;}',
 'Vd.b=vpack(Vu.h,Vv.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.b[i] = '
                              'sat8(Vv.h[i]);Vd.b[i+VBITS/16] = sat8(Vu.h[i]) '
                              ';}',
  'Vd.w=vnavg(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                          '(Vu.w[i]-Vv.w[i])/2 ;}',
 'Vd.b=vsub(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                         '(Vu.b[i]-Vv.b[i]) ;}',
 'Vd.w=vabs(Vu.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                        'sat32(ABS(Vu.w[i])) ;}',
 'Vd.w=vadd(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                         '(Vu.w[i]+Vv.w[i]) ;}',
 'Vd.w=vadd(Vu.w,Vv.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                             'sat32(Vu.w[i]+Vv.w[i]) ;}',
 'Vd.w=vavg(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                         '(Vu.w[i]+Vv.w[i])/2 ;}',
 'Vd.w=vavg(Vu.w,Vv.w):rnd': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                             '(Vu.w[i]+Vv.w[i]+1)/2 ;}',
 'Vd.w=vmax(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] '
                         '> Vv.w[i]) ? Vu.w[i] :Vv.w[i] ;}',
 'Vd.w=vmin(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] '
                         '< Vv.w[i]) ? Vu.w[i] :Vv.w[i] ;}',
 'Vd.w=vsub(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                         '(Vu.w[i]-Vv.w[i]) ;}',
 'Vd.w=vsub(Vu.w,Vv.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                             'sat32(Vu.w[i]-Vv.w[i]) ;}',
'Vdd.h=vunpack(Vu.b)': 'for (i = 0; i < VELEM(8); i++) {Vdd.h[i] = Vu.b[i] ;}',
 'Vdd.w=vunpack(Vu.h)': 'for (i = 0; i < VELEM(16); i++) {Vdd.w[i] = Vu.h[i] '
                        ';}',
 'Vdd.uh=vunpack(Vu.ub)': 'for (i = 0; i < VELEM(8); i++) {Vdd.uh[i] = '
                          'Vu.ub[i] ;}',
 'Vdd.uw=vunpack(Vu.uh)': 'for (i = 0; i < VELEM(16); i++) {Vdd.uw[i] = '
                          'Vu.uh[i] ;}',
 'Vd.h=vmax(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i] '
                         '> Vv.h[i]) ? Vu.h[i] :Vv.h[i] ;}',
 'Vd.h=vmin(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i] '
                         '< Vv.h[i]) ? Vu.h[i] :Vv.h[i] ;}',
 'Vd.uh=vsub(Vu.uh,Vv.uh):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                'usat16(Vu.uh[i]-Vv.uh[i]) ;}',
 'Vd.uh=vpack(Vu.w,Vv.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
                               'usat16(Vv.w[i]);Vd.uh[i+VBITS/32] = '
                               'usat16(Vu.w[i]) ;}',
 'Vd.uh=vmin(Vu.uh,Vv.uh)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                            '(Vu.uh[i] < Vv.uh[i]) ? Vu.uh[i]: Vv.uh[i] ;}',
 'Vd.uh=vmax(Vu.uh,Vv.uh)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                            '(Vu.uh[i] > Vv.uh[i]) ? Vu.uh[i]: Vv.uh[i] ;}',
 'Vd.uh=vavg(Vu.uh,Vv.uh):rnd': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                '(Vu.uh[i]+Vv.uh[i]+1)/2 ;}',
 'Vd.uh=vavg(Vu.uh,Vv.uh)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                            '(Vu.uh[i]+Vv.uh[i])/2 ;}',
 'Vd.uh=vadd(Vu.uh,Vv.uh):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                'usat16(Vu.uh[i]+Vv.uh[i]) ;}',
 'Vd.uh=vabsdiff(Vu.uh,Vv.uh)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                '(Vu.uh[i] > Vv.uh[i]) ? (Vu.uh[i]- Vv.uh[i]) '
                                ': (Vv.uh[i] - Vu.uh[i]) ;}',
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
 'Vd.h=vpack(Vu.w,Vv.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.h[i] = '
                              'sat16(Vv.w[i]);Vd.h[i+VBITS/32] = '
                              'sat16(Vu.w[i]) ;}',
 'Vx.uw+=vmpye(Vu.uh,Rt.uh)': 'for (i = 0; i < VELEM(32); i++) {Vx.uw[i] += '
                              '(Vu.uw[i].uh[0] * Rt.uh[0]) ;}',
 'Vd.b=vshuffe(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(16); i++) '
                            '{Vd.uh[i].b[0]=Vv.uh[i].ub[0];Vd.uh[i].b[1]=Vu.uh[i].ub[0] '
                            ';}',
 'Vd.h=vsat(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) '
                         '{Vd.w[i].h[0]=sat16(Vv.w[i]);Vd.w[i].h[1]=sat16(Vu.w[i]) '
                         ';}',
 'Vd.ub=vsat(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) '
                          '{Vd.uh[i].b[0]=usat8(Vv.h[i]);Vd.uh[i].b[1]=usat8(Vu.h[i]) '
                          ';}',
 'Vd.h=vpacko(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
                           'Vv.uw[i].uh[1];Vd.uh[i+VBITS/32] = Vu.uw[i].uh[1] '
                           ';}',
 'Vd.h=vpacke(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
                           'Vv.uw[i].uh[0];Vd.uh[i+VBITS/32] = Vu.uw[i].uh[0] '
                           ';}',
 'Vd.uh=vsat(Vu.uw,Vv.uw)': 'for (i = 0; i < VELEM(32); i++) '
                            '{Vd.w[i].h[0]=usat16(Vv.uw[i]);Vd.w[i].h[1]=usat16(Vu.uw[i]) '
                            ';}',
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
 'Vd.b=vdeal(Vu.b)': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i ] = '
                     'Vu.uh[i].ub[0];Vd.ub[i+VBITS/16] = Vu.uh[i].ub[1] ;}',
 'Vd.b=vdeale(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.ub[0+i ] = '
                           'Vv.uw[i].ub[0];Vd.ub[VBITS/32+i ] = '
                           'Vv.uw[i].ub[2];Vd.ub[2*VBITS/32+i] = '
                           'Vu.uw[i].ub[0];Vd.ub[3*VBITS/32+i] = '
                           'Vu.uw[i].ub[2] ;}',
 'Vd.w=vrmpy(Vu.ub,Vv.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                           '(Vu.uw[i].ub[0] * Vv.w[i].b[0]);Vd.w[i] += '
                           '(Vu.uw[i].ub[1] * Vv.w[i].b[1]);Vd.w[i] += '
                           '(Vu.uw[i].ub[2] * Vv.w[i].b[2]);Vd.w[i] += '
                           '(Vu.uw[i].ub[3] * Vv.w[i].b[3]) ;}',
 'Vd.w=vrmpy(Vu.ub,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                           '(Vu.uw[i].ub[0] * Rt.b[0]);Vd.w[i] += '
                           '(Vu.uw[i].ub[1] * Rt.b[1]);Vd.w[i] += '
                           '(Vu.uw[i].ub[2] * Rt.b[2]);Vd.w[i] += '
                           '(Vu.uw[i].ub[3] * Rt.b[3]) ;}',
 'Vd.w=vmpyieo(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                            '(Vu.w[i].h[0]*Vv.w[i].h[1]) << 16;}',
 'Vd.w=vrmpy(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                          '(Vu.w[i].b[0] * Vv.w[i].b[0]);Vd.w[i] += '
                          '(Vu.w[i].b[1] * Vv.w[i].b[1]);Vd.w[i] += '
                          '(Vu.w[i].b[2] * Vv.w[i].b[2]);Vd.w[i] += '
                          '(Vu.w[i].b[3] * Vv.w[i].b[3]) ;}',
 'Vd.h=vdeal(Vu.h)': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i ] = '
                     'Vu.uw[i].uh[0];Vd.uh[i+VBITS/32] = Vu.uw[i].uh[1] ;}',
 'Vd.b=vpacke(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
                           'Vv.uh[i].ub[0];Vd.ub[i+VBITS/16] = Vu.uh[i].ub[0] '
                           ';}',
 'Vd.b=vpacko(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
                           'Vv.uh[i].ub[1];Vd.ub[i+VBITS/16] = Vu.uh[i].ub[1] '
                           ';}',
 'Vd.b=vshuff(Vu.b)': 'for (i = 0; i < VELEM(16); i++) '
                      '{Vd.uh[i].b[0]=Vu.ub[i];Vd.uh[i].b[1]=Vu.ub[i+VBITS/16] '
                      ';}',
 'Vd.b=vshuffo(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(16); i++) '
                            '{Vd.uh[i].b[0]=Vv.uh[i].ub[1];Vd.uh[i].b[1]=Vu.uh[i].ub[1] '
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
 'Vx.w+=vrmpy(Vu.ub,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += '
                            '(Vu.uw[i].ub[0] * Rt.b[0]);Vx.w[i] += '
                            '(Vu.uw[i].ub[1] * Rt.b[1]);Vx.w[i] += '
                            '(Vu.uw[i].ub[2] * Rt.b[2]);Vx.w[i] += '
                            '(Vu.uw[i].ub[3] * Rt.b[3]) ;}',
 'Vx.uw+=vrmpy(Vu.ub,Rt.ub)': 'for (i = 0; i < VELEM(32); i++) {Vx.uw[i] += '
                              '(Vu.uw[i].ub[0] * Rt.ub[0]);Vx.uw[i] += '
                              '(Vu.uw[i].ub[1] * Rt.ub[1]);Vx.uw[i] += '
                              '(Vu.uw[i].ub[2] * Rt.ub[2]);Vx.uw[i] += '
                              '(Vu.uw[i].ub[3] * Rt.ub[3]) ;}',
 'Vd.h=vmpyi(Vu.h,Rt.b)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i] '
                          '* Rt.b[i % 4]) ;}',
 'Vd.h=vdmpy(Vu.ub,Rt.b)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                           '(Vu.uh[i].ub[0] * Rt.b[(2*i) %4]);Vd.h[i] += '
                           '(Vu.uh[i].ub[1] *Rt.b[(2*i+1)%4]) ;}',
 'Vd.w=vmpyi(Vu.w,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] '
                          '* Rt.b[i % 4]) ;}',
 'Vd.w=vmpyi(Vu.w,Rt.ub)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                           '(Vu.w[i] * Rt.ub[i % 4]) ;}',
 'Vd.w=vmpyi(Vu.w,Rt.ub)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                           '(Vu.w[i] * Rt.ub[i % 4]) ;}',
 'Vd.w=vdmpy(Vu.h,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                          '(Vu.w[i].h[0] * Rt.b[(2*i+0)%4]);Vd.w[i] += '
                          '(Vu.w[i].h[1] * Rt.b[(2*i+1)%4]);}',
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
  'Vdd=vcombine(Vu,Vv)': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].ub[i] = '
                        'Vv.ub[i];Vdd.v[1].ub[i] = Vu.ub[i] ;}',
 'Vdd.uw=vsub(Vuu.uw,Vvv.uw):sat': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vdd.v[0].uw[i] = '
                                   'usat32(Vuu.v[0].uw[i]-Vvv.v[0].uw[i]);Vdd.v[1].uw[i] '
                                   '= usat32(Vuu.v[1].uw[i]-Vvv.v[1].uw[i]) ;}',
 'Vdd.uw=vadd(Vuu.uw,Vvv.uw):sat': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vdd.v[0].uw[i] '
                                   '=usat32(Vuu.v[0].uw[i]+Vvv.v[0].uw[i]);Vdd.v[1].uw[i] '
                                   '=usat32(Vuu.v[1].uw[i]+Vvv.v[1].uw[i]) ;}',
 'Vdd.uh=vzxt(Vu.ub)': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].uh[i] = '
                       'Vu.uh[i].ub[0];Vdd.v[1].uh[i] = Vu.uh[i].ub[1] ;}',
 'Vdd.uh=vsub(Vuu.uh,Vvv.uh):sat': 'for (i = 0; i < VELEM(16); i++) '
                                   '{Vdd.v[0].uh[i] = '
                                   'usat16(Vuu.v[0].uh[i]-Vvv.v[0].uh[i]);Vdd.v[1].uh[i] '
                                   '= usat16(Vuu.v[1].uh[i]-Vvv.v[1].uh[i]) ;}',
 'Vdd.uh=vadd(Vuu.uh,Vvv.uh):sat': 'for (i = 0; i < VELEM(16); i++) '
                                   '{Vdd.v[0].uh[i] '
                                   '=usat16(Vuu.v[0].uh[i]+Vvv.v[0].uh[i]);Vdd.v[1].uh[i] '
                                   '=usat16(Vuu.v[1].uh[i]+Vvv.v[1].uh[i]) ;}',
 'Vdd.ub=vsub(Vuu.ub,Vvv.ub):sat': 'for (i = 0; i < VELEM(8); i++) '
                                   '{Vdd.v[0].ub[i] = '
                                   'usat8(Vuu.v[0].ub[i]-Vvv.v[0].ub[i]);Vdd.v[1].ub[i] '
                                   '= usat8(Vuu.v[1].ub[i]-Vvv.v[1].ub[i]) ;}',
 'Vdd.ub=vadd(Vuu.ub,Vvv.ub):sat': 'for (i = 0; i < VELEM(8); i++) '
                                   '{Vdd.v[0].ub[i] '
                                   '=usat8(Vuu.v[0].ub[i]+Vvv.v[0].ub[i]);Vdd.v[1].ub[i] '
                                   '=usat8(Vuu.v[1].ub[i]+Vvv.v[1].ub[i]) ;}',
   'Vdd.h=vsxt(Vu.b)': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
                     'Vu.h[i].b[0];Vdd.v[1].h[i] = Vu.h[i].b[1] ;}',
   'Vdd.h=vsub(Vuu.h,Vvv.h):sat': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].h[i] = '
                                'sat16(Vuu.v[0].h[i]-Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                '= sat16(Vuu.v[1].h[i]-Vvv.v[1].h[i]) ;}',
 'Vdd.h=vsub(Vuu.h,Vvv.h)': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
                            '(Vuu.v[0].h[i]-Vvv.v[0].h[i]);Vdd.v[1].h[i] = '
                            '(Vuu.v[1].h[i]-Vvv.v[1].h[i]) ;}',
   'Vdd.b=vsub(Vuu.b,Vvv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].b[i] '
                                '= '
                                'sat8(Vuu.v[0].b[i]-Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                '= sat8(Vuu.v[1].b[i]-Vvv.v[1].b[i]) ;}',
 'Vdd.b=vsub(Vuu.b,Vvv.b)': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].b[i] = '
                            '(Vuu.v[0].b[i]-Vvv.v[0].b[i]);Vdd.v[1].b[i] = '
                            '(Vuu.v[1].b[i]-Vvv.v[1].b[i]) ;}',
 'Vdd.h=vadd(Vuu.h,Vvv.h)': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] '
                            '=(Vuu.v[0].h[i]+Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                            '=(Vuu.v[1].h[i]+Vvv.v[1].h[i]) ;}',
   'Vdd.h=vadd(Vuu.h,Vvv.h):sat': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].h[i] '
                                '=sat16(Vuu.v[0].h[i]+Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                '=sat16(Vuu.v[1].h[i]+Vvv.v[1].h[i]) ;}',
 'Vd=vnot(Vu)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = ~Vu.uh[i] ;}',
 'Vd=vor(Vu,Vv)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Vu.uh[i] | '
                  'Vv.h[i] ;}',
 'Vd=vxor(Vu,Vv)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Vu.uh[i] ^ '
                   'Vv.h[i] ;}',
 'Vx.w+=vmpyi(Vu.w,Rt.ub)': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += '
                            '(Vu.w[i] * Rt.ub[i % 4]) ;}',
 'Vx.w+=vmpyi(Vu.w,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += '
                           '(Vu.w[i] * Rt.b[i % 4]) ;}',
 'Vx.w+=vdmpy(Vu.h,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += '
                           '(Vu.w[i].h[0] * Rt.b[(2*i+0)%4]);Vx.w[i] += '
                           '(Vu.w[i].h[1] * Rt.b[(2*i+1)%4]);}',
 'Vx.h+=vmpyi(Vu.h,Rt.b)': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i] += '
                           '(Vu.h[i] * Rt.b[i % 4]) ;}',
 'Vx.h+=vdmpy(Vu.ub,Rt.b)': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i] += '
                            '(Vu.uh[i].ub[0] * Rt.b[(2*i) %4]);Vx.h[i] += '
                            '(Vu.uh[i].ub[1] *Rt.b[(2*i+1)%4]) ;}',
 'Vd=vand(Vu,Vv)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Vu.uh[i] & '
                   'Vv.h[i] ;}',
'Vd=vand(Qv4,Vu)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = QvV[i] ? '
                    'Vu.b[i] : 0 ;}',
 'Vd=vand(Qu4,Rt)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = QuV[i] ? '
                    'Rt.ub[i % 4] : 0 ;}',
 'Vd=vand(!Qv4,Vu)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = !QvV[i] ? '
                     'Vu.b[i] : 0 ;}',
 'Vd=vand(!Qu4,Rt)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = !QuV[i] ? '
                     'Rt.ub[i % 4] : 0 ;}',
 'Qd4=or(Qs4,Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] || QtV[i] '
                    ';}',
 'Qd4=or(Qs4,!Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] || !QtV[i] '
                     ';}',
   'Qd4=not(Qs4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=!QsV[i] ;}',
 'Qd4=vand(Vu,Rt)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=((Vu.ub[i] & '
                    'Rt.ub[i % 4]) != 0) ? 1 : 0 ;}',
   'Qd4=and(Qs4,Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] && QtV[i] '
                     ';}',
 'Qd4=and(Qs4,!Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] && '
                      '!QtV[i] ;}',
   'Vx.w=vinsert(Rt)': 'Vx.uw[0] = Rt;',
 'Qx4|=vand(Vu,Rt)': 'for (i = 0; i < VELEM(8); i++) '
                     '{QxV[i]=QxV[i]|(((Vu.ub[i] & Rt.ub[i % 4]) != 0) ? 1: 0) '
                     ';}',
 'Qd4=xor(Qs4,Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] ^ QtV[i] '
                     ';}',
 'Vd=vsplat(Rt)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = Rt ;}',
 'Vd.b=vsplat(Rt)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = Rt ;}',
 'Vd.h=vsplat(Rt)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Rt ;}',
 'if (Qv4) Vx.b+=Vu.b': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i]=QvV.i ? '
                        'Vx.ub[i] : Vx.ub[i]+Vu.ub[i] ;}',
 'if (!Qv4) Vx.b+=Vu.b': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i]=QvV.i ? '
                         'Vx.ub[i] : Vx.ub[i]+Vu.ub[i] ;}',
 'Vd=Vu': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i]=Vu.w[i] ;}',
 'Vd.w=vadd(Vu.w,Vv.w,Qs4):carry:sat': 'for (i = 0; i < VELEM(32); i++) '
                                       '{Vd.w[i] = '
                                       'sat32(Vu.w[i]+Vv.w[i]+QsV[i*4]) ;}',
   'if (!Qv4) Vx.b-=Vu.b': 'for (i = 0; i < VELEM(8); i--) {Vx.ub[i]=QvV.i ? '
                         'Vx.ub[i] : Vx.ub[i]-Vu.ub[i] ;}',
 'Vx|=vand(!Qu4,Rt)': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i] |= !(QuV[i]) ? '
                      'Rt.ub[i % 4] : 0 ;}',
 'Vx|=vand(Qu4,Rt)': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i] |= (QuV[i]) ? '
                     'Rt.ub[i % 4] : 0 ;}',
 'Vd=vmux(Qt4,Vu,Vv)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = QtV[i] ? '
                       'Vu.ub[i] : Vv.ub[i] ;}',
 'Vdd.b=vadd(Vuu.b,Vvv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].b[i] '
                                '=sat8(Vuu.v[0].b[i]+Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                '=sat8(Vuu.v[1].b[i]+Vvv.v[1].b[i]) ;}',
 'Vdd.b=vadd(Vuu.b,Vvv.b)': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].b[i] '
                            '=(Vuu.v[0].b[i]+Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                            '=(Vuu.v[1].b[i]+Vvv.v[1].b[i]) ;}',
 'if (!Qv4) Vx.w+=Vu.w': 'for (i = 0; i < VELEM(32); i++) '
                         '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]+Vu.w[i]) '
                         ';}',
   'if (!Qv4) Vx.h-=Vu.h': 'for (i = 0; i < VELEM(16); i--) '
                         '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]-Vu.h[i]) '
                         ';}',
 'if (!Qv4) Vx.h+=Vu.h': 'for (i = 0; i < VELEM(16); i++) '
                         '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]+Vu.h[i]) '
                         ';}',
 'if (!Qv4) Vx.w-=Vu.w': 'for (i = 0; i < VELEM(32); i--) '
                         '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]-Vu.w[i]) '
                         ';}',
 'if (Qv4) Vx.w+=Vu.w': 'for (i = 0; i < VELEM(32); i++) '
                        '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]+Vu.w[i]) '
                        ';}',
 'if (Qv4) Vx.w-=Vu.w': 'for (i = 0; i < VELEM(32); i--) '
                        '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]-Vu.w[i]) '
                        ';}',
 'if (Qv4) Vx.h-=Vu.h': 'for (i = 0; i < VELEM(16); i--) '
                        '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]-Vu.h[i]) '
                        ';}',
 'if (Qv4) Vx.h+=Vu.h': 'for (i = 0; i < VELEM(16); i++) '
                        '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]+Vu.h[i]) '
                        ';}',
 'if (Qv4) Vx.b-=Vu.b': 'for (i = 0; i < VELEM(8); i--) {Vx.ub[i]=QvV.i ? '
                        'Vx.ub[i] : Vx.ub[i]-Vu.ub[i] ;}',
 'Qd4=vcmp.gt(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                           '((Vu.h[i/2] > Vv.h[i/2]) ?0x3 : 0);}',
 'Qd4=vcmp.gt(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                           '((Vu.b[i/1] > Vv.b[i/1]) ?0x1 : 0);}',
 'Qd4=vcmp.eq(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                           '((Vu.b[i/1] == Vv.b[i/1]) ?0x1 : 0);}',
 'Qd4=vcmp.eq(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                           '((Vu.h[i/2] == Vv.h[i/2]) ?0x3 : 0);}',
 'Qd4=vcmp.gt(Vu.uw,Vv.uw)': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                             '((Vu.uw[i/4] > Vv.uw[i/4]) ?0xF : 0);}',
 'Qd4=vcmp.gt(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                           '((Vu.w[i/4] > Vv.w[i/4]) ?0xF : 0);}',
 'Qd4=vcmp.gt(Vu.uh,Vv.uh)': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                             '((Vu.uh[i/2] > Vv.uh[i/2]) ?0x3 : 0);}',
 'Qd4=vcmp.gt(Vu.ub,Vv.ub)': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                             '((Vu.ub[i/1] > Vv.ub[i/1]) ?0x1 : 0);}',
 'Qd4=vcmp.eq(Vu.w,Vv.w)': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                           '((Vu.w[i/4] == Vv.w[i/4]) ?0xF : 0);}',
 'Qx4&=vcmp.eq(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                            'QxV[i+1-1:i] & ((Vu.b[i/1]== Vv.b[i/1]) ? 0x1 : '
                            '0);}',
 'Qx4&=vcmp.eq(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                            'QxV[i+2-1:i] & ((Vu.h[i/2]== Vv.h[i/2]) ? 0x3 : '
                            '0);}',
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
 'Qx4|=vcmp.eq(Vu.b,Vv.b)': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = '
                            'QxV[i+1-1:i] | ((Vu.b[i/1]== Vv.b[i/1]) ? 0x1 : '
                            '0);}',
 'Qx4|=vcmp.eq(Vu.h,Vv.h)': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = '
                            'QxV[i+2-1:i] | ((Vu.h[i/2]== Vv.h[i/2]) ? 0x3 : '
                            '0);}',
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
 'Vdd=vswap(Qt4,Vu,Vv)': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].ub[i] = '
                         'QtV[i] ? Vu.ub[i] :Vv.ub[i];Vdd.v[1].ub[i] = !QtV[i] '
                         '? Vu.ub[i] :Vv.ub[i] ;}',
}
