
HVXInsts = {
 'hexagon_V6_vmaxb_128B': {
                      'hvx_intrinsic': 'Vd.b=vmax(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i] > Vv.b[i]) ? Vu.b[i] :Vv.b[i] ;}'
                    },
 'hexagon_V6_vmaxw_128B': {
                      'hvx_intrinsic': 'Vd.w=vmax(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i] > Vv.w[i]) ? Vu.w[i] :Vv.w[i] ;}'
                    },
 'hexagon_V6_vmaxh_128B': {
                      'hvx_intrinsic': 'Vd.h=vmax(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i] > Vv.h[i]) ? Vu.h[i] :Vv.h[i] ;}'
                    },
 'hexagon_V6_vmaxub_128B': {
                       'hvx_intrinsic': 'Vd.ub=vmax(Vu.ub,Vv.ub)',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               '(Vu.ub[i] > Vv.ub[i]) ? Vu.ub[i]: Vv.ub[i] ;}'
                    },
 'hexagon_V6_vmaxuh_128B': {
                       'hvx_intrinsic': 'Vd.uh=vmax(Vu.uh,Vv.uh)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                               '(Vu.uh[i] > Vv.uh[i]) ? Vu.uh[i]: Vv.uh[i] ;}'
                    },
 'hexagon_V6_vminb_128B': {
                      'hvx_intrinsic': 'Vd.b=vmin(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i] < Vv.b[i]) ? Vu.b[i] :Vv.b[i] ;}'
                    },
 'hexagon_V6_vminh_128B': {
                      'hvx_intrinsic': 'Vd.h=vmin(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i] < Vv.h[i]) ? Vu.h[i] :Vv.h[i] ;}'
                    },
 'hexagon_V6_vminub_128B': {
                       'hvx_intrinsic': 'Vd.ub=vmin(Vu.ub,Vv.ub)',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               '(Vu.ub[i] < Vv.ub[i]) ? Vu.ub[i]: Vv.ub[i] ;}'
                    },
 'hexagon_V6_vminuh_128B': {
                       'hvx_intrinsic': 'Vd.uh=vmin(Vu.uh,Vv.uh)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                               '(Vu.uh[i] < Vv.uh[i]) ? Vu.uh[i]: Vv.uh[i] ;}'
                    },
 'hexagon_V6_vminw_128B': {
                      'hvx_intrinsic': 'Vd.w=vmin(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i] < Vv.w[i]) ? Vu.w[i] :Vv.w[i] ;}'
                    },
 'hexagon_V6_vassign_128B': {
                        'hvx_intrinsic': 'Vd=Vu',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vd.w[i]=Vu.w[i] ;}'
                    },
 'hexagon_V6_vavgb_128B': {
                      'hvx_intrinsic': 'Vd.b=vavg(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i]+Vv.b[i])/2 ;}'
                    },
 'hexagon_V6_vavgh_128B': {
                      'hvx_intrinsic': 'Vd.h=vavg(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i]+Vv.h[i])/2 ;}'
                    },
 'hexagon_V6_vavgub_128B': {
                       'hvx_intrinsic': 'Vd.ub=vavg(Vu.ub,Vv.ub)',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               '(Vu.ub[i]+Vv.ub[i])/2 ;}'
                    },
 'hexagon_V6_vavguh_128B': {
                       'hvx_intrinsic': 'Vd.uh=vavg(Vu.uh,Vv.uh)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                               '(Vu.uh[i]+Vv.uh[i])/2 ;}'
                    },
 'hexagon_V6_vavguw_128B': {
                       'hvx_intrinsic': 'Vd.uw=vavg(Vu.uw,Vv.uw)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                               '(Vu.uw[i]+Vv.uw[i])/2 ;}'
                    },
 'hexagon_V6_vavgw_128B': {
                      'hvx_intrinsic': 'Vd.w=vavg(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i]+Vv.w[i])/2 ;}'
                    },
 'hexagon_V6_vavgbrnd_128B': {
                         'hvx_intrinsic': 'Vd.b=vavg(Vu.b,Vv.b):rnd',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                 '(Vu.b[i]+Vv.b[i]+1)/2 ;}'
                    },
 'hexagon_V6_vavghrnd_128B': {
                         'hvx_intrinsic': 'Vd.h=vavg(Vu.h,Vv.h):rnd',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                 '(Vu.h[i]+Vv.h[i]+1)/2 ;}'
                    },
 'hexagon_V6_vavgubrnd_128B': {
                          'hvx_intrinsic': 'Vd.ub=vavg(Vu.ub,Vv.ub):rnd',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                  '(Vu.ub[i]+Vv.ub[i]+1)/2 ;}'
                    },
 'hexagon_V6_vavguhrnd_128B': {
                          'hvx_intrinsic': 'Vd.uh=vavg(Vu.uh,Vv.uh):rnd',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                  '(Vu.uh[i]+Vv.uh[i]+1)/2 ;}'
                    },
 'hexagon_V6_vavguwrnd_128B': {
                          'hvx_intrinsic': 'Vd.uw=vavg(Vu.uw,Vv.uw):rnd',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                  '(Vu.uw[i]+Vv.uw[i]+1)/2 ;}'
                    },
 'hexagon_V6_vavgwrnd_128B': {
                         'hvx_intrinsic': 'Vd.w=vavg(Vu.w,Vv.w):rnd',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 '(Vu.w[i]+Vv.w[i]+1)/2 ;}'
                    },
 'hexagon_V6_vaddb_128B': {
                      'hvx_intrinsic': 'Vd.b=vadd(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i]+Vv.b[i]) ;}'
                    },
 'hexagon_V6_vaddh_128B': {
                      'hvx_intrinsic': 'Vd.h=vadd(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i]+Vv.h[i]) ;}'
                    },
 'hexagon_V6_vaddw_128B': {
                      'hvx_intrinsic': 'Vd.w=vadd(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i]+Vv.w[i]) ;}'
                    }, 
 'hexagon_V6_vadduwsat_128B': {
                          'hvx_intrinsic': 'Vd.uw=vadd(Vu.uw,Vv.uw):sat',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                  'usat32(Vu.uw[i]+Vv.uw[i]) ;}'
                    },
 'hexagon_V6_vaddububb_sat_128B': {
                              'hvx_intrinsic': 'Vd.ub=vadd(Vu.ub,Vv.b):sat',
                              'spec': 'for (i = 0; i < VELEM(8); i++) '
                                      '{Vd.ub[i] = usat8(Vu.ub[i] + Vv.b[i]) '
                                      ';}'
                    },
 'hexagon_V6_vaddubsat_128B': {
                          'hvx_intrinsic': 'Vd.ub=vadd(Vu.ub,Vv.ub):sat',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                  'usat8(Vu.ub[i]+Vv.ub[i]) ;}'
                    },
 'hexagon_V6_vadduhsat_128B': {
                          'hvx_intrinsic': 'Vd.uh=vadd(Vu.uh,Vv.uh):sat',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                  'usat16(Vu.uh[i]+Vv.uh[i]) ;}'
                    },
 'hexagon_V6_vaddhsat_128B': {
                         'hvx_intrinsic': 'Vd.h=vadd(Vu.h,Vv.h):sat',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                 'sat16(Vu.h[i]+Vv.h[i]) ;}'
                    }, 
 'hexagon_V6_vaddbsat_128B': {
                         'hvx_intrinsic': 'Vd.b=vadd(Vu.b,Vv.b):sat',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                 'sat8(Vu.b[i]+Vv.b[i]) ;}'
                    },  
 'hexagon_V6_vaddwsat_128B': {
                         'hvx_intrinsic': 'Vd.w=vadd(Vu.w,Vv.w):sat',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 'sat32(Vu.w[i]+Vv.w[i]) ;}'
                    },
 'hexagon_V6_vaddw_dv_128B': {
                        'hvx_intrinsic': 'Vdd.w=vadd(Vuu.w,Vvv.w)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                 '{Vdd.v[0].w[i] '
                                 '=(Vuu.v[0].w[i]+Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                 '=(Vuu.v[1].w[i]+Vvv.v[1].w[i]) ;}'
                },
 'hexagon_V6_vaddh_dv_128B': {
                        'hvx_intrinsic': 'Vdd.h=vadd(Vuu.h,Vvv.h)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].h[i] '
                                 '=(Vuu.v[0].h[i]+Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                 '=(Vuu.v[1].h[i]+Vvv.v[1].h[i]) ;}'
                },
 'hexagon_V6_vaddb_dv_128B': {
                        'hvx_intrinsic': 'Vdd.b=vadd(Vuu.b,Vvv.b)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{Vdd.v[0].b[i] '
                                 '=(Vuu.v[0].b[i]+Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                 '=(Vuu.v[1].b[i]+Vvv.v[1].b[i]) ;}'
                },
 'hexagon_V6_vaddhw_128B': {
                        'hvx_intrinsic': 'Vdd.w=vadd(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                               '= Vu.w[i].h[0] + Vv.w[i].h[0];Vdd.v[1].w[i] = '
                               'Vu.w[i].h[1] + Vv.w[i].h[1];}'
                },
 'hexagon_V6_vadduhw_128B': {
                        'hvx_intrinsic': 'Vdd.w=vadd(Vu.uh,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] = Vu.uw[i].uh[0] '
                                '+Vv.uw[i].uh[0];Vdd.v[1].w[i] = '
                                'Vu.uw[i].uh[1] +Vv.uw[i].uh[1] ;}'
                },
 'hexagon_V6_vaddubh_128B': {
                        'hvx_intrinsic': 'Vdd.h=vadd(Vu.ub,Vv.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].h[i] = Vu.uh[i].ub[0] '
                                '+Vv.uh[i].ub[0];Vdd.v[1].h[i] = '
                                'Vu.uh[i].ub[1] +Vv.uh[i].ub[1] ;}'
                },
 'hexagon_V6_vaddubsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.ub=vadd(Vuu.ub,Vvv.ub):sat',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                     '{Vdd.v[0].ub[i] '
                                     '=usat8(Vuu.v[0].ub[i]+Vvv.v[0].ub[i]);Vdd.v[1].ub[i] '
                                     '=usat8(Vuu.v[1].ub[i]+Vvv.v[1].ub[i]) '
                                     ';}'
                },
 'hexagon_V6_vadduhsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.uh=vadd(Vuu.uh,Vvv.uh):sat',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                     '{Vdd.v[0].uh[i] '
                                     '=usat16(Vuu.v[0].uh[i]+Vvv.v[0].uh[i]);Vdd.v[1].uh[i] '
                                     '=usat16(Vuu.v[1].uh[i]+Vvv.v[1].uh[i]) '
                                     ';}'
                },
 'hexagon_V6_vadduwsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.uw=vadd(Vuu.uw,Vvv.uw):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                     '{Vdd.v[0].uw[i] '
                                     '=usat32(Vuu.v[0].uw[i]+Vvv.v[0].uw[i]);Vdd.v[1].uw[i] '
                                     '=usat32(Vuu.v[1].uw[i]+Vvv.v[1].uw[i]) '
                                     ';}'
                },
 'hexagon_V6_vaddwsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.w=vadd(Vuu.w,Vvv.w):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vdd.v[0].w[i] '
                                    '=sat32(Vuu.v[0].w[i]+Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                    '=sat32(Vuu.v[1].w[i]+Vvv.v[1].w[i]) ;}'
                },
 'hexagon_V6_vaddbsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.b=vadd(Vuu.b,Vvv.b):sat',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                    '{Vdd.v[0].b[i] '
                                    '=sat8(Vuu.v[0].b[i]+Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                    '=sat8(Vuu.v[1].b[i]+Vvv.v[1].b[i]) ;}'
                },
 'hexagon_V6_vaddhsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.h=vadd(Vuu.h,Vvv.h):sat',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vdd.v[0].h[i] '
                                    '=sat16(Vuu.v[0].h[i]+Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                    '=sat16(Vuu.v[1].h[i]+Vvv.v[1].h[i]) ;}'
                },
 'hexagon_V6_vadduhw_acc_128B': {
                        'hvx_intrinsic': 'Vxx.w+=vadd(Vu.uh,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vxx.v[0].w[i] += Vu.w[i].uh[0] '
                                    '+Vv.w[i].uh[0];Vxx.v[1].w[i] += '
                                    'Vu.w[i].uh[1] +Vv.w[i].uh[1] ;}'
                },
 'hexagon_V6_vaddubh_acc_128B': {
                        'hvx_intrinsic': 'Vxx.h+=vadd(Vu.ub,Vv.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vxx.v[0].h[i] += Vu.h[i].ub[0] '
                                    '+Vv.h[i].ub[0];Vxx.v[1].h[i] += '
                                    'Vu.h[i].ub[1] +Vv.h[i].ub[1] ;}'
                },
 'hexagon_V6_vaddhw_acc_128B': {
                        'hvx_intrinsic': 'Vxx.w+=vadd(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vxx.v[0].w[i] += Vu.w[i].h[0] '
                                   '+Vv.w[i].h[0];Vxx.v[1].w[i] += '
                                   'Vu.w[i].h[1] + Vv.w[i].h[1];}'
                },
 'hexagon_V6_vnavgw_128B': {
                       'hvx_intrinsic': 'Vd.w=vnavg(Vu.w,Vv.w)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                               '(Vu.w[i]-Vv.w[i])/2 ;}'
                    },
 'hexagon_V6_vnavgb_128B': {
                       'hvx_intrinsic': 'Vd.b=vnavg(Vu.b,Vv.b)',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                               '(Vu.b[i]-Vv.b[i])/2 ;}'
                    },
 'hexagon_V6_vnavgh_128B': {
                       'hvx_intrinsic': 'Vd.h=vnavg(Vu.h,Vv.h)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                               '(Vu.h[i]-Vv.h[i])/2 ;}'
                    },
 'hexagon_V6_vnavgub_128B': {
                        'hvx_intrinsic': 'Vd.b=vnavg(Vu.ub,Vv.ub)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                '(Vu.ub[i]-Vv.ub[i])/2 ;}'
                    },
 'hexagon_V6_vor_128B': {
                    'hvx_intrinsic': 'Vd=vor(Vu,Vv)',
                    'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                            'Vu.uh[i] | Vv.h[i] ;}'
                    },
 'hexagon_V6_vsubwsat_128B': {
                         'hvx_intrinsic': 'Vd.w=vsub(Vu.w,Vv.w):sat',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 'sat32(Vu.w[i]-Vv.w[i]) ;}'
                    },
 'hexagon_V6_vsubhsat_128B': {
                         'hvx_intrinsic': 'Vd.h=vsub(Vu.h,Vv.h):sat',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                 'sat16(Vu.h[i]-Vv.h[i]) ;}'
                    },
 'hexagon_V6_vsubbsat_128B': {
                         'hvx_intrinsic': 'Vd.b=vsub(Vu.b,Vv.b):sat',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                 'sat8(Vu.b[i]-Vv.b[i]) ;}'
                    },
 'hexagon_V6_vsubububb_sat_128B': {
                              'hvx_intrinsic': 'Vd.ub=vsub(Vu.ub,Vv.b):sat',
                              'spec': 'for (i = 0; i < VELEM(8); i++) '
                                      '{Vd.ub[i] = usat8(Vu.ub[i] - Vv.b[i]) '
                                      ';}'
                    },
 'hexagon_V6_vsubuhsat_128B': {
                          'hvx_intrinsic': 'Vd.uh=vsub(Vu.uh,Vv.uh):sat',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                  'usat16(Vu.uh[i]-Vv.uh[i]) ;}'
                    },
 'hexagon_V6_vsubuwsat_128B': {
                          'hvx_intrinsic': 'Vd.uw=vsub(Vu.uw,Vv.uw):sat',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                  'usat32(Vu.uw[i]-Vv.uw[i]) ;}'
                    },
 'hexagon_V6_vsububsat_128B': {
                          'hvx_intrinsic': 'Vd.ub=vsub(Vu.ub,Vv.ub):sat',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                  'usat8(Vu.ub[i]-Vv.ub[i]) ;}'
                    },
 'hexagon_V6_vsubh_128B': {
                      'hvx_intrinsic': 'Vd.h=vsub(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i]-Vv.h[i]) ;}'
                    },
 'hexagon_V6_vsubb_dv_128B': {
                        'hvx_intrinsic': 'Vdd.b=vsub(Vuu.b,Vvv.b)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{Vdd.v[0].b[i] = '
                                 '(Vuu.v[0].b[i]-Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                 '= (Vuu.v[1].b[i]-Vvv.v[1].b[i]) ;}'
                },
 'hexagon_V6_vsubw_dv_128B': {
                        'hvx_intrinsic': 'Vdd.w=vsub(Vuu.w,Vvv.w)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                 '{Vdd.v[0].w[i] = '
                                 '(Vuu.v[0].w[i]-Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                 '= (Vuu.v[1].w[i]-Vvv.v[1].w[i]) ;}'
                },
 'hexagon_V6_vsubh_dv_128B': {
                        'hvx_intrinsic': 'Vdd.h=vsub(Vuu.h,Vvv.h)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].h[i] = '
                                 '(Vuu.v[0].h[i]-Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                 '= (Vuu.v[1].h[i]-Vvv.v[1].h[i]) ;}'
                },
 'hexagon_V6_vsubhsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.h=vsub(Vuu.h,Vvv.h):sat',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vdd.v[0].h[i] = '
                                    'sat16(Vuu.v[0].h[i]-Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                    '= sat16(Vuu.v[1].h[i]-Vvv.v[1].h[i]) ;}'
                },
 'hexagon_V6_vsubwsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.w=vsub(Vuu.w,Vvv.w):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vdd.v[0].w[i] = '
                                    'sat32(Vuu.v[0].w[i]-Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                    '= sat32(Vuu.v[1].w[i]-Vvv.v[1].w[i]) ;}'
                },
 'hexagon_V6_vsubb_128B': {
                      'hvx_intrinsic': 'Vd.b=vsub(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i]-Vv.b[i]) ;}'
                    },
 'hexagon_V6_vsubw_128B': {
                      'hvx_intrinsic': 'Vd.w=vsub(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i]-Vv.w[i]) ;}'
                    },
 'hexagon_V6_vsubhw_128B': {
                        'hvx_intrinsic': 'Vdd.w=vsub(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                               '= Vu.w[i].h[0] - Vv.w[i].h[0];Vdd.v[1].w[i] = '
                               'Vu.w[i].h[1] - Vv.w[i].h[1];}'
                },
 'hexagon_V6_vsububh_128B': {
                        'hvx_intrinsic': 'Vdd.h=vsub(Vu.ub,Vv.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].h[i] = Vu.uh[i].ub[0] '
                                '-Vv.uh[i].ub[0];Vdd.v[1].h[i] = '
                                'Vu.uh[i].ub[1] -Vv.uh[i].ub[1] ;}'
                },
 'hexagon_V6_vsubuhw_128B': {
                        'hvx_intrinsic': 'Vdd.w=vsub(Vu.uh,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] = Vu.uw[i].uh[0] '
                                '-Vv.uw[i].uh[0];Vdd.v[1].w[i] = '
                                'Vu.uw[i].uh[1] -Vv.uw[i].uh[1] ;}'
                },
 'hexagon_V6_vsubuwsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.uw=vsub(Vuu.uw,Vvv.uw):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                     '{Vdd.v[0].uw[i] = '
                                     'usat32(Vuu.v[0].uw[i]-Vvv.v[0].uw[i]);Vdd.v[1].uw[i] '
                                     '= usat32(Vuu.v[1].uw[i]-Vvv.v[1].uw[i]) '
                                     ';}'
                },
 'hexagon_V6_vsubbsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.b=vsub(Vuu.b,Vvv.b):sat',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                    '{Vdd.v[0].b[i] = '
                                    'sat8(Vuu.v[0].b[i]-Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                    '= sat8(Vuu.v[1].b[i]-Vvv.v[1].b[i]) ;}'
                },
 'hexagon_V6_vsububsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.ub=vsub(Vuu.ub,Vvv.ub):sat',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                     '{Vdd.v[0].ub[i] = '
                                     'usat8(Vuu.v[0].ub[i]-Vvv.v[0].ub[i]);Vdd.v[1].ub[i] '
                                     '= usat8(Vuu.v[1].ub[i]-Vvv.v[1].ub[i]) '
                                     ';}'
                },
 'hexagon_V6_vsubuhsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.uh=vsub(Vuu.uh,Vvv.uh):sat',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                     '{Vdd.v[0].uh[i] = '
                                     'usat16(Vuu.v[0].uh[i]-Vvv.v[0].uh[i]);Vdd.v[1].uh[i] '
                                     '= usat16(Vuu.v[1].uh[i]-Vvv.v[1].uh[i]) '
                                     ';}'
                },
 'hexagon_V6_vxor_128B': {
                     'hvx_intrinsic': 'Vd=vxor(Vu,Vv)',
                     'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                             'Vu.uh[i] ^ Vv.h[i] ;}'
                    },
 'hexagon_V6_vabsb_sat_128B': {
                          'hvx_intrinsic': 'Vd.b=vabs(Vu.b):sat',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                  'sat8(ABS(Vu.b[i])) ;}'
                    },
 'hexagon_V6_vabsb_128B': {
                      'hvx_intrinsic': 'Vd.b=vabs(Vu.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(ABS(Vu.b[i])) ;}'
                    },
 'hexagon_V6_vabsw_128B': {
                      'hvx_intrinsic': 'Vd.w=vabs(Vu.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(ABS(Vu.w[i])) ;}'
                    },
 'hexagon_V6_vabsh_sat_128B': {
                          'hvx_intrinsic': 'Vd.h=vabs(Vu.h):sat',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                  'sat16(ABS(Vu.h[i])) ;}'
                    },        
 'hexagon_V6_vabsh_128B': {
                      'hvx_intrinsic': 'Vd.h=vabs(Vu.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(ABS(Vu.h[i])) ;}'
                    },
 'hexagon_V6_vabsw_sat_128B': {
                          'hvx_intrinsic': 'Vd.w=vabs(Vu.w):sat',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                  'sat32(ABS(Vu.w[i])) ;}'
                    },
 'hexagon_V6_vabsdiffh_128B': {
                          'hvx_intrinsic': 'Vd.uh=vabsdiff(Vu.h,Vv.h)',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                  '(Vu.h[i] > Vv.h[i]) ? (Vu.h[i] -Vv.h[i]) : '
                                  '(Vv.h[i] - Vu.h[i]) ;}'
                    },
 'hexagon_V6_vabsdiffw_128B': {
                          'hvx_intrinsic': 'Vd.uw=vabsdiff(Vu.w,Vv.w)',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                  '(Vu.w[i] > Vv.w[i]) ? (Vu.w[i] -Vv.w[i]) : '
                                  '(Vv.w[i] - Vu.w[i]) ;}'
                    },
 'hexagon_V6_vabsdiffub_128B': {
                           'hvx_intrinsic': 'Vd.ub=vabsdiff(Vu.ub,Vv.ub)',
                           'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                   '(Vu.ub[i] > Vv.ub[i]) ? (Vu.ub[i]- '
                                   'Vv.ub[i]) : (Vv.ub[i] - Vu.ub[i]) ;}'
                    },
 'hexagon_V6_vabsdiffuh_128B': {
                           'hvx_intrinsic': 'Vd.uh=vabsdiff(Vu.uh,Vv.uh)',
                           'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] '
                                   '= (Vu.uh[i] > Vv.uh[i]) ? (Vu.uh[i]- '
                                   'Vv.uh[i]) : (Vv.uh[i] - Vu.uh[i]) ;}'
                    },
 'hexagon_V6_vmpyiowh_128B': {
                         'hvx_intrinsic': 'Vd.w=vmpyio(Vu.w,Vv.h)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 '(Vu.w[i] * Vv.w[i].h[1]) ;}'
                    },
 'hexagon_V6_vmpyiwub_128B': {
                        'hvx_intrinsic': 'Vd.w=vmpyi(Vu.w,Rt.ub)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 '(Vu.w[i] * Rt.ub[i % 4]) ;}'
                },
 'hexagon_V6_vsh_128B': {
                        'hvx_intrinsic': 'Vdd.w=vsxt(Vu.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = '
                            'Vu.w[i].h[0];Vdd.v[1].w[i] = Vu.w[i].h[1] ;}'
                },
 'hexagon_V6_vsb_128B': {
                        'hvx_intrinsic': 'Vdd.h=vsxt(Vu.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
                            'Vu.h[i].b[0];Vdd.v[1].h[i] = Vu.h[i].b[1] ;}'
                },
 'hexagon_V6_vzh_128B': {
                        'hvx_intrinsic': 'Vdd.uw=vzxt(Vu.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].uw[i] = '
                            'Vu.uw[i].uh[0];Vdd.v[1].uw[i] = Vu.uw[i].uh[1] '
                            ';}'
                },
 'hexagon_V6_vzb_128B': {
                        'hvx_intrinsic': 'Vdd.uh=vzxt(Vu.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].uh[i] = '
                            'Vu.uh[i].ub[0];Vdd.v[1].uh[i] = Vu.uh[i].ub[1] '
                            ';}'
                },
 'hexagon_V6_vunpackuh_128B': {
                          'hvx_intrinsic': 'Vdd.uw=vunpack(Vu.uh)',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.uw[i] '
                                  '= Vu.uh[i] ;}'
                    },
 'hexagon_V6_vunpackub_128B': {
                          'hvx_intrinsic': 'Vdd.uh=vunpack(Vu.ub)',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.uh[i] = '
                                  'Vu.ub[i] ;}'
                    },
 'hexagon_V6_vunpackb_128B': {
                         'hvx_intrinsic': 'Vdd.h=vunpack(Vu.b)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.h[i] = '
                                 'Vu.b[i] ;}'
                    },
 'hexagon_V6_vunpackh_128B': {
                         'hvx_intrinsic': 'Vdd.w=vunpack(Vu.h)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.w[i] = '
                                 'Vu.h[i] ;}'
                    },
 'hexagon_V6_vmpyih_128B': {
                        'hvx_intrinsic': 'Vd.h=vmpyi(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                               '(Vu.h[i] * Vv.h[i]) ;}'
                },
 'hexagon_V6_vmpyuhe_128B': {
                        'hvx_intrinsic': 'Vd.uw=vmpye(Vu.uh,Rt.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                '(Vu.uw[i].uh[0] * Rt.uh[0]) ;}'
                },
 'hexagon_V6_vmpyowh_rnd_sacc_128B': {
                        'hvx_intrinsic': 'Vx.w+=vmpyo(Vu.w,Vv.h):<<1:rnd:sat:shift',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                         '{Vx.w[i] = sat32(((((Vx.w[i] + '
                                         '(Vu.w[i] *Vv.w[i].h[1])) >> 14) + 1) '
                                         '>> 1)) ;}'
                },
 'hexagon_V6_vmpyowh_sacc_128B': {
                        'hvx_intrinsic': 'Vx.w+=vmpyo(Vu.w,Vv.h):<<1:sat:shift',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                     '= sat32(((((Vx.w[i] + (Vu.w[i] '
                                     '*Vv.w[i].h[1])) >> 14) + 1) >> 1)) ;}'
                },
 'hexagon_V6_vmpyuhe_acc_128B': {
                        'hvx_intrinsic': 'Vx.uw+=vmpye(Vu.uh,Rt.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.uw[i] '
                                    '+= (Vu.uw[i].uh[0] * Rt.uh[0]) ;}'
                },
 'hexagon_V6_vmpyihb_acc_128B': {
                        'hvx_intrinsic': 'Vx.h+=vmpyi(Vu.h,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i] '
                                    '+= (Vu.h[i] * Rt.b[i % 4]) ;}'
                },
 'hexagon_V6_vmpyiwub_acc_128B': {
                        'hvx_intrinsic': 'Vx.w+=vmpyi(Vu.w,Rt.ub)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                     '+= (Vu.w[i] * Rt.ub[i % 4]) ;}'
                },
 'hexagon_V6_vmpyiwh_acc_128B': {
                        'hvx_intrinsic': 'Vx.w+=vmpyi(Vu.w,Rt.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                    '+= (Vu.w[i] * Rt.h[i % 2]) ;}'
                },
 'hexagon_V6_vmpyiwb_acc_128B': {
                        'hvx_intrinsic': 'Vx.w+=vmpyi(Vu.w,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                    '+= (Vu.w[i] * Rt.b[i % 4]) ;}'
                },
 'hexagon_V6_vmpyiewuh_acc_128B': {
                              'hvx_intrinsic': 'Vx.w+=vmpyie(Vu.w,Vv.uh)',
                              'spec': 'for (i = 0; i < VELEM(32); i++) '
                                      '{Vx.w[i] = Vx.w[i] + (Vu.w[i] '
                                      '*Vv.w[i].uh[0]) ;}'
                    },
 'hexagon_V6_vmpyiewh_acc_128B': {
                             'hvx_intrinsic': 'Vx.w+=vmpyie(Vu.w,Vv.h)',
                             'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                     '= Vx.w[i] + (Vu.w[i] * Vv.w[i].h[0]);}'
                    },
 'hexagon_V6_vmpyiewuh_128B': {
                          'hvx_intrinsic': 'Vd.w=vmpyie(Vu.w,Vv.uh)',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                  '(Vu.w[i] * Vv.w[i].uh[0]) ;}'
                    },
 'hexagon_V6_vmpybus_acc_128B': {
                        'hvx_intrinsic': 'Vxx.h+=vmpy(Vu.ub,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vxx.v[0].h[i] += (Vu.uh[i].ub[0] '
                                    '*Rt.b[(2*i+0)%4]);Vxx.v[1].h[i] += '
                                    '(Vu.uh[i].ub[1] *Rt.b[(2*i+1)%4]) ;}'
                        },
 'hexagon_V6_vmpyub_acc_128B': {
                        'hvx_intrinsic': 'Vxx.uh+=vmpy(Vu.ub,Rt.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                   '{Vxx.v[0].uh[i] += (Vu.uh[i].ub[0] '
                                   '*Rt.ub[(2*i+0)%4]);Vxx.v[1].uh[i] += '
                                   '(Vu.uh[i].ub[1] *Rt.ub[(2*i+1)%4]) ;}'
                },
 'hexagon_V6_vmpyhus_acc_128B': {
                        'hvx_intrinsic': 'Vxx.w+=vmpy(Vu.h,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vxx.v[0].w[i] += (Vu.w[i].h[0] '
                                    '*Vv.uw[i].uh[0]);Vxx.v[1].w[i] += '
                                    '(Vu.w[i].h[1] *Vv.uw[i].uh[1]) ;}'
                },
 'hexagon_V6_vmpyih_acc_128B': {
                        'hvx_intrinsic': 'Vx.h+=vmpyi(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i] '
                                   '+= (Vu.h[i] * Vv.h[i]) ;}'
                },
 'hexagon_V6_vmpybusv_acc_128B': {
                        'hvx_intrinsic': 'Vxx.h+=vmpy(Vu.ub,Vv.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                     '{Vxx.v[0].h[i] += (Vu.uh[i].ub[0] '
                                     '*Vv.h[i].b[0]);Vxx.v[1].h[i] += '
                                     '(Vu.uh[i].ub[1] *Vv.h[i].b[1]) ;}'
                },
 'hexagon_V6_vmpybv_acc_128B': {
                        'hvx_intrinsic': 'Vxx.h+=vmpy(Vu.b,Vv.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                   '{Vxx.v[0].h[i] += (Vu.h[i].b[0] '
                                   '*Vv.h[i].b[0]);Vxx.v[1].h[i] += '
                                   '(Vu.h[i].b[1] *Vv.h[i].b[1]) ;}'
                },
 'hexagon_V6_vmpyhv_acc_128B': {
                        'hvx_intrinsic': 'Vxx.w+=vmpy(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vxx.v[0].w[i] += (Vu.w[i].h[0] '
                                   '*Vv.w[i].h[0]);Vxx.v[1].w[i] += '
                                   '(Vu.w[i].h[1] *Vv.w[i].h[1]) ;}'
                },
 'hexagon_V6_vmpyuh_acc_128B': {
                        'hvx_intrinsic': 'Vxx.uw+=vmpy(Vu.uh,Rt.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vxx.v[0].uw[i] += (Vu.uw[i].uh[0] '
                                   '*Rt.uh[0]);Vxx.v[1].uw[i] += '
                                   '(Vu.uw[i].uh[1] *Rt.uh[1]) ;}'
                },
 'hexagon_V6_vmpyubv_acc_128B': {
                        'hvx_intrinsic': 'Vxx.uh+=vmpy(Vu.ub,Vv.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vxx.v[0].uh[i] += (Vu.uh[i].ub[0] '
                                    '*Vv.uh[i].ub[0]);Vxx.v[1].uh[i] += '
                                    '(Vu.uh[i].ub[1] *Vv.uh[i].ub[1]) ;}'
                },
 'hexagon_V6_vmpyuhv_acc_128B': {
                        'hvx_intrinsic': 'Vxx.uw+=vmpy(Vu.uh,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vxx.v[0].uw[i] += (Vu.uw[i].uh[0] '
                                    '*Vv.uw[i].uh[0]);Vxx.v[1].uw[i] += '
                                    '(Vu.uw[i].uh[1] *Vv.uw[i].uh[1]) ;}'
                },
 'hexagon_V6_vmpybus_128B': {
                        'hvx_intrinsic': 'Vdd.h=vmpy(Vu.ub,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].h[i] = (Vu.uh[i].ub[0] '
                                '*Rt.b[(2*i+0)%4]);Vdd.v[1].h[i] = '
                                '(Vu.uh[i].ub[1] *Rt.b[(2*i+1)%4]) ;}'
                },
 'hexagon_V6_vmpyub_128B': {
                        'hvx_intrinsic': 'Vdd.uh=vmpy(Vu.ub,Rt.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                               '{Vdd.v[0].uh[i] = (Vu.uh[i].ub[0] '
                               '*Rt.ub[(2*i+0)%4]);Vdd.v[1].uh[i] = '
                               '(Vu.uh[i].ub[1] *Rt.ub[(2*i+1)%4]) ;}'
                },
 'hexagon_V6_vmpyh_128B': {
                        'hvx_intrinsic': 'Vdd.w=vmpy(Vu.h,Rt.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                              '= (Vu.w[i].h[0] * Rt.h[0]);Vdd.v[1].w[i] = '
                              '(Vu.w[i].h[1] * Rt.h[1]) ;}'
                },
 'hexagon_V6_vmpyuh_128B': {
                        'hvx_intrinsic': 'Vdd.uw=vmpy(Vu.uh,Rt.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                               '{Vdd.v[0].uw[i] = (Vu.uw[i].uh[0] '
                               '*Rt.uh[0]);Vdd.v[1].uw[i] = (Vu.uw[i].uh[1] * '
                               'Rt.uh[1]);}'
                },
 'hexagon_V6_vmpybusv_128B': {
                        'hvx_intrinsic': 'Vdd.h=vmpy(Vu.ub,Vv.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].h[i] = (Vu.uh[i].ub[0] '
                                 '*Vv.h[i].b[0]);Vdd.v[1].h[i] = '
                                 '(Vu.uh[i].ub[1] *Vv.h[i].b[1]) ;}'
                },
 'hexagon_V6_vmpyhus_128B': {
                        'hvx_intrinsic': 'Vdd.w=vmpy(Vu.h,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] = (Vu.w[i].h[0] '
                                '*Vv.uw[i].uh[0]);Vdd.v[1].w[i] = '
                                '(Vu.w[i].h[1] *Vv.uw[i].uh[1]) ;}'
                },
 'hexagon_V6_vmpybv_128B': {
                        'hvx_intrinsic': 'Vdd.h=vmpy(Vu.b,Vv.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] '
                               '= (Vu.h[i].b[0] *Vv.h[i].b[0]);Vdd.v[1].h[i] = '
                               '(Vu.h[i].b[1] *Vv.h[i].b[1]) ;}'
                },
'hexagon_V6_vmpyhv_128B': {
                        'hvx_intrinsic': 'Vdd.w=vmpy(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                               '= (Vu.w[i].h[0] *Vv.w[i].h[0]);Vdd.v[1].w[i] = '
                               '(Vu.w[i].h[1] *Vv.w[i].h[1]) ;}'
                },
 'hexagon_V6_vmpyuhv_128B': {
                        'hvx_intrinsic': 'Vdd.uw=vmpy(Vu.uh,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].uw[i] = (Vu.uw[i].uh[0] '
                                '*Vv.uw[i].uh[0]);Vdd.v[1].uw[i] = '
                                '(Vu.uw[i].uh[1] *Vv.uw[i].uh[1]) ;}'
                },
 'hexagon_V6_vmpyubv_128B': {
                        'hvx_intrinsic': 'Vdd.uh=vmpy(Vu.ub,Vv.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].uh[i] = (Vu.uh[i].ub[0] '
                                '*Vv.uh[i].ub[0]);Vdd.v[1].uh[i] = '
                                '(Vu.uh[i].ub[1] *Vv.uh[i].ub[1]) ;}'
                },
 'hexagon_V6_vrmpybusv_acc_128B': {
                        'hvx_intrinsic': 'Vx.w+=vrmpy(Vu.ub,Vv.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                      '{Vx.w[i] += (Vu.uw[i].ub[0] * '
                                      'Vv.w[i].b[0]);Vx.w[i] += '
                                      '(Vu.uw[i].ub[1] * Vv.w[i].b[1]);Vx.w[i] '
                                      '+= (Vu.uw[i].ub[2] * '
                                      'Vv.w[i].b[2]);Vx.w[i] += '
                                      '(Vu.uw[i].ub[3] * Vv.w[i].b[3]) ;}'
                },
 'hexagon_V6_vrmpybv_acc_128B': {
                        'hvx_intrinsic': 'Vx.w+=vrmpy(Vu.b,Vv.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                    '+= (Vu.w[i].b[0] * Vv.w[i].b[0]);Vx.w[i] '
                                    '+= (Vu.w[i].b[1] * Vv.w[i].b[1]);Vx.w[i] '
                                    '+= (Vu.w[i].b[2] * Vv.w[i].b[2]);Vx.w[i] '
                                    '+= (Vu.w[i].b[3] * Vv.w[i].b[3]) ;}'
                },
 'hexagon_V6_vrmpyub_acc_128B': {
                        'hvx_intrinsic': 'Vx.uw+=vrmpy(Vu.ub,Rt.ub)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.uw[i] '
                                    '+= (Vu.uw[i].ub[0] * Rt.ub[0]);Vx.uw[i] '
                                    '+= (Vu.uw[i].ub[1] * Rt.ub[1]);Vx.uw[i] '
                                    '+= (Vu.uw[i].ub[2] * Rt.ub[2]);Vx.uw[i] '
                                    '+= (Vu.uw[i].ub[3] * Rt.ub[3]) ;}'
                },
 'hexagon_V6_vrmpyubv_acc_128B': {
                        'hvx_intrinsic': 'Vx.uw+=vrmpy(Vu.ub,Vv.ub)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                     '{Vx.uw[i] += (Vu.uw[i].ub[0] '
                                     '*Vv.uw[i].ub[0]);Vx.uw[i] += '
                                     '(Vu.uw[i].ub[1] '
                                     '*Vv.uw[i].ub[1]);Vx.uw[i] += '
                                     '(Vu.uw[i].ub[2] '
                                     '*Vv.uw[i].ub[2]);Vx.uw[i] += '
                                     '(Vu.uw[i].ub[3] *Vv.uw[i].ub[3]) ;}'
                },
 'hexagon_V6_vrmpybus_acc_128B': {
                        'hvx_intrinsic': 'Vx.w+=vrmpy(Vu.ub,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                     '+= (Vu.uw[i].ub[0] * Rt.b[0]);Vx.w[i] += '
                                     '(Vu.uw[i].ub[1] * Rt.b[1]);Vx.w[i] += '
                                     '(Vu.uw[i].ub[2] * Rt.b[2]);Vx.w[i] += '
                                     '(Vu.uw[i].ub[3] * Rt.b[3]) ;}'
                },
 'hexagon_V6_vandvrt_acc_128B': {
                        'hvx_intrinsic': 'Qx4|=vand(Vu,Rt)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                    '{QxV[i]=QxV[i]|(((Vu.ub[i] & Rt.ub[i % '
                                    '4]) != 0) ? 1: 0) ;}'
                },
 'hexagon_V6_vand_128B': {
                     'hvx_intrinsic': 'Vd=vand(Vu,Vv)',
                     'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                             'Vu.uh[i] & Vv.h[i] ;}'
                    },
 'hexagon_V6_vandvrt_128B': {
                        'hvx_intrinsic': 'Qd4=vand(Vu,Rt)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                '{QdV[i]=((Vu.ub[i] & Rt.ub[i % 4]) != 0) ? 1 '
                                ': 0 ;}'
                },
 'hexagon_V6_pred_not_128B': {
                         'hvx_intrinsic': 'Qd4=not(Qs4)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{QdV[i]=!QsV[i] ;}'
                },
 'hexagon_V6_vnot_128B': {
                     'hvx_intrinsic': 'Vd=vnot(Vu)',
                     'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                             '~Vu.uh[i] ;}'
                    },
 'hexagon_V6_veqh_128B': {
                        'hvx_intrinsic': 'Qd4=vcmp.eq(Vu.h,Vv.h)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                             '((Vu.h[i/2] == Vv.h[i/2]) ?0x3 : 0);}'
                },
 'hexagon_V6_veqb_128B': {
                        'hvx_intrinsic': 'Qd4=vcmp.eq(Vu.b,Vv.b)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                             '((Vu.b[i/1] == Vv.b[i/1]) ?0x1 : 0);}'
                },
 'hexagon_V6_veqw_128B': {
                        'hvx_intrinsic': 'Qd4=vcmp.eq(Vu.w,Vv.w)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                             '((Vu.w[i/4] == Vv.w[i/4]) ?0xF : 0);}'
                },
 'hexagon_V6_vgtb_128B': {
                        'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.b,Vv.b)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                             '((Vu.b[i/1] > Vv.b[i/1]) ?0x1 : 0);}'
                },
 'hexagon_V6_vgth_128B': {
                        'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.h,Vv.h)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                             '((Vu.h[i/2] > Vv.h[i/2]) ?0x3 : 0);}'
                },
 'hexagon_V6_vgtub_128B': {
                        'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.ub,Vv.ub)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = '
                              '((Vu.ub[i/1] > Vv.ub[i/1]) ?0x1 : 0);}'
                },
 'hexagon_V6_vgtuh_128B': {
                        'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.uh,Vv.uh)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = '
                              '((Vu.uh[i/2] > Vv.uh[i/2]) ?0x3 : 0);}'
                },
 'hexagon_V6_vgtuw_128B': {
                        'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.uw,Vv.uw)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                              '((Vu.uw[i/4] > Vv.uw[i/4]) ?0xF : 0);}'
                },
 'hexagon_V6_vgtw_128B': {
                        'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.w,Vv.w)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = '
                             '((Vu.w[i/4] > Vv.w[i/4]) ?0xF : 0);}'
                },
 'hexagon_V6_vpackob_128B': {'hvx_intrinsic': 'Vd.b=vpacko(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
                                'Vv.uh[i].ub[1];Vd.ub[i+VBITS/16] = '
                                'Vu.uh[i].ub[1] ;}'},
 'hexagon_V6_vpackoh_128B': {'hvx_intrinsic': 'Vd.h=vpacko(Vu.w,Vv.w)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
                                'Vv.uw[i].uh[1];Vd.uh[i+VBITS/32] = '
                                'Vu.uw[i].uh[1] ;}'},
 'hexagon_V6_vpackwh_sat_128B': {'hvx_intrinsic': 'Vd.h=vpack(Vu.w,Vv.w):sat',
                            'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.h[i] '
                                    '= sat16(Vv.w[i]);Vd.h[i+VBITS/32] = '
                                    'sat16(Vu.w[i]) ;}'},
 'hexagon_V6_vpackwuh_sat_128B': {'hvx_intrinsic': 'Vd.uh=vpack(Vu.w,Vv.w):sat',
                             'spec': 'for (i = 0; i < VELEM(32); i++) '
                                     '{Vd.uh[i] = '
                                     'usat16(Vv.w[i]);Vd.uh[i+VBITS/32] = '
                                     'usat16(Vu.w[i]) ;}'},
 'hexagon_V6_vmpyewuh_128B': {
                        'hvx_intrinsic': 'Vd.w=vmpye(Vu.w,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 '(Vu.w[i] * Vv.w[i].uh[0]) >> 16 ;}'
                },
 'hexagon_V6_vmpyowh_rnd_128B': {
                        'hvx_intrinsic': 'Vd.w=vmpyo(Vu.w,Vv.h):<<1:rnd:sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] '
                                    '= sat32(((((Vu.w[i] * Vv.w[i].h[1])>> 14) '
                                    '+ 1) >> 1)) ;}'
                },
 'hexagon_V6_vmpyowh_128B': {
                        'hvx_intrinsic': 'Vd.w=vmpyo(Vu.w,Vv.h):<<1:sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                'sat32(((((Vu.w[i] * Vv.w[i].h[1])>> 14) + 1) '
                                '>> 1)) ;}'
                },
 'hexagon_V6_vmpyieoh_128B': {
                        'hvx_intrinsic': 'Vd.w=vmpyieo(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 '(Vu.w[i].h[0]*Vv.w[i].h[1]) << 16;}'
                },
 'hexagon_V6_vdmpyhvsat_acc_128B': {
                        'hvx_intrinsic': 'Vx.w+=vdmpy(Vu.h,Vv.h):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {accum '
                                       '= (Vu.w[i].h[0] * Vv.w[i].h[0]);accum '
                                       '+= (Vu.w[i].h[1] * '
                                       'Vv.w[i].h[1]);Vx.w[i] = '
                                       'sat32(Vx.w[i]+accum) ;}'
                },
 'hexagon_V6_vmpyihb_128B': {
                        'hvx_intrinsic': 'Vd.h=vmpyi(Vu.h,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                '(Vu.h[i] * Rt.b[i % 4]) ;}'
                },
 'hexagon_V6_vmpyiwh_128B': {
                        'hvx_intrinsic': 'Vd.w=vmpyi(Vu.w,Rt.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                '(Vu.w[i] * Rt.h[i % 2]) ;}'
                },
 'hexagon_V6_vmpyiwb_128B': {
                        'hvx_intrinsic': 'Vd.w=vmpyi(Vu.w,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                '(Vu.w[i] * Rt.b[i % 4]) ;}'
                },
 'hexagon_V6_vdmpyhsat_acc_128B': {
                        'hvx_intrinsic': 'Vx.w+=vdmpy(Vu.h,Rt.h):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {accum '
                                      '= Vx.w[i];accum += (Vu.w[i].h[0] * '
                                      'Rt.h[0]);accum += (Vu.w[i].h[1] * '
                                      'Rt.h[1]);Vx.w[i] = sat32(accum) ;}'
                },
 'hexagon_V6_veqw_and_128B': {
                        'hvx_intrinsic': 'Qx4&=vcmp.eq(Vu.w,Vv.w)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 4) '
                                 '{QxV[i+4-1:i] = QxV[i+4-1:i] & ((Vu.w[i/4]== '
                                 'Vv.w[i/4]) ? 0xF : 0);}'
                },
 'hexagon_V6_veqb_and_128B': {
                        'hvx_intrinsic': 'Qx4&=vcmp.eq(Vu.b,Vv.b)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 1) '
                                 '{QxV[i+1-1:i] = QxV[i+1-1:i] & ((Vu.b[i/1]== '
                                 'Vv.b[i/1]) ? 0x1 : 0);}'
                },
 'hexagon_V6_veqb_or_128B': {
                        'hvx_intrinsic': 'Qx4|=vcmp.eq(Vu.b,Vv.b)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] '
                                '= QxV[i+1-1:i] | ((Vu.b[i/1]== Vv.b[i/1]) ? '
                                '0x1 : 0);}'
                },
 'hexagon_V6_veqb_xor_128B': {
                        'hvx_intrinsic': 'Qx4^=vcmp.eq(Vu.b,Vv.b)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 1) '
                                 '{QxV[i+1-1:i] = QxV[i+1-1:i] ^ ((Vu.b[i/1] '
                                 '==Vv.b[i/1]) ? 0x1 : 0);}'
                },
 'hexagon_V6_veqh_and_128B': {
                        'hvx_intrinsic': 'Qx4&=vcmp.eq(Vu.h,Vv.h)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 2) '
                                 '{QxV[i+2-1:i] = QxV[i+2-1:i] & ((Vu.h[i/2]== '
                                 'Vv.h[i/2]) ? 0x3 : 0);}'
                },
 'hexagon_V6_veqh_or_128B': {
                        'hvx_intrinsic': 'Qx4|=vcmp.eq(Vu.h,Vv.h)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] '
                                '= QxV[i+2-1:i] | ((Vu.h[i/2]== Vv.h[i/2]) ? '
                                '0x3 : 0);}'
                },
 'hexagon_V6_veqh_xor_128B': {
                        'hvx_intrinsic': 'Qx4^=vcmp.eq(Vu.h,Vv.h)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 2) '
                                 '{QxV[i+2-1:i] = QxV[i+2-1:i] ^ ((Vu.h[i/2] '
                                 '==Vv.h[i/2]) ? 0x3 : 0);}'
                },
 'hexagon_V6_veqw_or_128B': {
                        'hvx_intrinsic': 'Qx4|=vcmp.eq(Vu.w,Vv.w)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] '
                                '= QxV[i+4-1:i] | ((Vu.w[i/4]== Vv.w[i/4]) ? '
                                '0xF : 0);}'
                },
 'hexagon_V6_veqw_xor_128B': {
                        'hvx_intrinsic': 'Qx4^=vcmp.eq(Vu.w,Vv.w)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 4) '
                                 '{QxV[i+4-1:i] = QxV[i+4-1:i] ^ ((Vu.w[i/4] '
                                 '==Vv.w[i/4]) ? 0xF : 0);}'
                },
 'hexagon_V6_vgtb_and_128B': {
                        'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.b,Vv.b)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 1) '
                                 '{QxV[i+1-1:i] = QxV[i+1-1:i] & ((Vu.b[i/1]> '
                                 'Vv.b[i/1]) ? 0x1 : 0);}'
                },
 'hexagon_V6_vgtb_or_128B': {
                        'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.b,Vv.b)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] '
                                '= QxV[i+1-1:i] | ((Vu.b[i/1]> Vv.b[i/1]) ? '
                                '0x1 : 0);}'
                },
 'hexagon_V6_vgtb_xor_128B': {
                        'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.b,Vv.b)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 1) '
                                 '{QxV[i+1-1:i] = QxV[i+1-1:i] ^ ((Vu.b[i/1] '
                                 '>Vv.b[i/1]) ? 0x1 : 0);}'
                },
 'hexagon_V6_vgth_and_128B': {
                        'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.h,Vv.h)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 2) '
                                 '{QxV[i+2-1:i] = QxV[i+2-1:i] & ((Vu.h[i/2]> '
                                 'Vv.h[i/2]) ? 0x3 : 0);}'
                },
 'hexagon_V6_vgth_or_128B': {
                        'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.h,Vv.h)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] '
                                '= QxV[i+2-1:i] | ((Vu.h[i/2]> Vv.h[i/2]) ? '
                                '0x3 : 0);}'
                },
 'hexagon_V6_vgth_xor_128B': {
                        'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.h,Vv.h)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 2) '
                                 '{QxV[i+2-1:i] = QxV[i+2-1:i] ^ ((Vu.h[i/2] '
                                 '>Vv.h[i/2]) ? 0x3 : 0);}'
                },
 'hexagon_V6_vgtub_and_128B': {
                        'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.ub,Vv.ub)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 1) '
                                  '{QxV[i+1-1:i] = QxV[i+1-1:i] &((Vu.ub[i/1] '
                                  '> Vv.ub[i/1]) ? 0x1 : 0);}'
                },
 'hexagon_V6_vgtub_or_128B': {
                        'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.ub,Vv.ub)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 1) '
                                 '{QxV[i+1-1:i] = QxV[i+1-1:i] |((Vu.ub[i/1] > '
                                 'Vv.ub[i/1]) ? 0x1 : 0);}'
                },
 'hexagon_V6_vgtub_xor_128B': {
                        'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.ub,Vv.ub)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 1) '
                                  '{QxV[i+1-1:i] = QxV[i+1-1:i] ^ ((Vu.ub[i/1] '
                                  '>Vv.ub[i/1]) ? 0x1 : 0);}'
                },
 'hexagon_V6_vgtuh_and_128B': {
                        'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.uh,Vv.uh)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 2) '
                                  '{QxV[i+2-1:i] = QxV[i+2-1:i] &((Vu.uh[i/2] '
                                  '> Vv.uh[i/2]) ? 0x3 : 0);}'
                },
 'hexagon_V6_vgtuh_or_128B': {
                        'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.uh,Vv.uh)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 2) '
                                 '{QxV[i+2-1:i] = QxV[i+2-1:i] |((Vu.uh[i/2] > '
                                 'Vv.uh[i/2]) ? 0x3 : 0);}'
                },
 'hexagon_V6_vgtuh_xor_128B': {
                        'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.uh,Vv.uh)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 2) '
                                  '{QxV[i+2-1:i] = QxV[i+2-1:i] ^ ((Vu.uh[i/2] '
                                  '>Vv.uh[i/2]) ? 0x3 : 0);}'
                },
 'hexagon_V6_vgtuw_and_128B': {
                        'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.uw,Vv.uw)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 4) '
                                  '{QxV[i+4-1:i] = QxV[i+4-1:i] &((Vu.uw[i/4] '
                                  '> Vv.uw[i/4]) ? 0xF : 0);}'
                },
 'hexagon_V6_vgtuw_or_128B': {
                        'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.uw,Vv.uw)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 4) '
                                 '{QxV[i+4-1:i] = QxV[i+4-1:i] |((Vu.uw[i/4] > '
                                 'Vv.uw[i/4]) ? 0xF : 0);}'
                },
 'hexagon_V6_vgtuw_xor_128B': {
                        'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.uw,Vv.uw)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 4) '
                                  '{QxV[i+4-1:i] = QxV[i+4-1:i] ^ ((Vu.uw[i/4] '
                                  '>Vv.uw[i/4]) ? 0xF : 0);}'
                },
 'hexagon_V6_vgtw_and_128B': {
                        'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.w,Vv.w)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 4) '
                                 '{QxV[i+4-1:i] = QxV[i+4-1:i] & ((Vu.w[i/4]> '
                                 'Vv.w[i/4]) ? 0xF : 0);}'
                },
 'hexagon_V6_vgtw_or_128B': {
                        'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.w,Vv.w)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] '
                                '= QxV[i+4-1:i] | ((Vu.w[i/4]> Vv.w[i/4]) ? '
                                '0xF : 0);}'
                },
 'hexagon_V6_vgtw_xor_128B': {
                        'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.w,Vv.w)',
                        'spec': 'for( i = 0; i < VWIDTH; i += 4) '
                                 '{QxV[i+4-1:i] = QxV[i+4-1:i] ^ ((Vu.w[i/4] '
                                 '>Vv.w[i/4]) ? 0xF : 0);}'
                },
 'hexagon_V6_vunpackob_128B': {
                        'hvx_intrinsic': 'Vxx.h|=vunpacko(Vu.b)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {Vxx.uh[i] '
                                  '|= Vu.ub[i]<<8 ;}'
                },
 'hexagon_V6_vunpackoh_128B': {
                        'hvx_intrinsic': 'Vxx.w|=vunpacko(Vu.h)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vxx.uw[i] '
                                  '|= Vu.uh[i]<<16 ;}'
                },
 'hexagon_V6_vsubhnq_128B': {
                        'hvx_intrinsic': 'if (!Qv4) Vx.h-=Vu.h',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]-Vu.h[i]) '
                                ';}'
                },
 'hexagon_V6_vsubhq_128B': {
                       'hvx_intrinsic': 'if (Qv4) Vx.h-=Vu.h',
                       'spec': 'for (i = 0; i < VELEM(16); i++) '
                               '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]-Vu.h[i]) '
                               ';}'
                },
 'hexagon_V6_vmux_128B': {
                     'hvx_intrinsic': 'Vd=vmux(Qt4,Vu,Vv)',
                     'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                             'QtV[i] ? Vu.ub[i] : Vv.ub[i] ;}'
                    },
 'hexagon_V6_vsubbq_128B': {
                       'hvx_intrinsic': 'if (Qv4) Vx.b-=Vu.b',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i]=QvV.i '
                               '? Vx.ub[i] : Vx.ub[i]-Vu.ub[i] ;}'
                    },
 'hexagon_V6_vsubbnq_128B': {
                        'hvx_intrinsic': 'if (!Qv4) Vx.b-=Vu.b',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                '{Vx.ub[i]=QvV.i ? Vx.ub[i] : '
                                'Vx.ub[i]-Vu.ub[i] ;}'
                    },
 'hexagon_V6_vaddbq_128B': {
                       'hvx_intrinsic': 'if (Qv4) Vx.b+=Vu.b',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i]=QvV.i '
                               '? Vx.ub[i] : Vx.ub[i]+Vu.ub[i] ;}'
                    },       
 'hexagon_V6_vaddbnq_128B': {
                        'hvx_intrinsic': 'if (!Qv4) Vx.b+=Vu.b',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                '{Vx.ub[i]=QvV.i ? Vx.ub[i] : '
                                'Vx.ub[i]+Vu.ub[i] ;}'
                    },  
 'hexagon_V6_vandvqv_128B': {
                        'hvx_intrinsic': 'Vd=vand(Qv4,Vu)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                'QvV[i] ? Vu.b[i] : 0 ;}'
                },
 'hexagon_V6_vandvnqv_128B': {
                        'hvx_intrinsic': 'Vd=vand(!Qv4,Vu)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                 '!QvV[i] ? Vu.b[i] : 0 ;}'
                },
 'hexagon_V6_vandqrt_128B': {
                        'hvx_intrinsic': 'Vd=vand(Qu4,Rt)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                'QuV[i] ? Rt.ub[i % 4] : 0 ;}'
                },
 'hexagon_V6_vandnqrt_128B': {
                        'hvx_intrinsic': 'Vd=vand(!Qu4,Rt)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                 '!QuV[i] ? Rt.ub[i % 4] : 0 ;}'
                },
 'hexagon_V6_vandqrt_acc_128B': {
                        'hvx_intrinsic': 'Vx|=vand(Qu4,Rt)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i] '
                                    '|= (QuV[i]) ? Rt.ub[i % 4] : 0 ;}'
                },
 'hexagon_V6_vandnqrt_acc_128B': {
                        'hvx_intrinsic': 'Vx|=vand(!Qu4,Rt)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i] '
                                     '|= !(QuV[i]) ? Rt.ub[i % 4] : 0 ;}'
                },
 'hexagon_V6_vsubhnq_128B': {
                        'hvx_intrinsic': 'if (!Qv4) Vx.h-=Vu.h',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]-Vu.h[i]) '
                                ';}'
                    },
 'hexagon_V6_vsubhq_128B': {
                       'hvx_intrinsic': 'if (Qv4) Vx.h-=Vu.h',
                       'spec': 'for (i = 0; i < VELEM(16); i++) '
                               '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]-Vu.h[i]) '
                               ';}'
                    },
 'hexagon_V6_vsubwnq_128B': {
                        'hvx_intrinsic': 'if (!Qv4) Vx.w-=Vu.w',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]-Vu.w[i]) '
                                ';}'
                    },
 'hexagon_V6_vsubwq_128B': {
                       'hvx_intrinsic': 'if (Qv4) Vx.w-=Vu.w',
                       'spec': 'for (i = 0; i < VELEM(32); i++) '
                               '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]-Vu.w[i]) '
                               ';}'
                    },
 'hexagon_V6_vaddhnq': {
                        'hvx_intrinsic': 'if (!Qv4) Vx.h+=Vu.h',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]+Vu.h[i]) '
                                ';}'
                    },
 'hexagon_V6_vaddhq_128B': {
                       'hvx_intrinsic': 'if (Qv4) Vx.h+=Vu.h',
                       'spec': 'for (i = 0; i < VELEM(16); i++) '
                               '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]+Vu.h[i]) '
                               ';}'
                    },
 'hexagon_V6_vaddwq_128B': {
                       'hvx_intrinsic': 'if (Qv4) Vx.w+=Vu.w',
                       'spec': 'for (i = 0; i < VELEM(32); i++) '
                               '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]+Vu.w[i]) '
                               ';}'
                    },
 'hexagon_V6_vaddwnq_128B': {
                        'hvx_intrinsic': 'if (!Qv4) Vx.w+=Vu.w',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]+Vu.w[i]) '
                                ';}'
                    },
 'hexagon_V6_vdmpyhsuisat_acc_128B': {
                        'hvx_intrinsic': 'Vx.w+=vdmpy(Vuu.h,Rt.uh,#1):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                         '{accum=Vx.w[i];accum += '
                                         '(Vuu.v[0].w[i].h[1] * '
                                         'Rt.uh[0]);accum += '
                                         '(Vuu.v[1].w[i].h[0] * '
                                         'Rt.uh[1]);Vx.w[i] = sat32(accum) ;}'
                },
 'hexagon_V6_vdmpyhisat_acc_128B': {
                        'hvx_intrinsic': 'Vx.w+=vdmpy(Vuu.h,Rt.h):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {accum '
                                       '= Vx.w[i];accum += (Vuu.v[0].w[i].h[1] '
                                       '* Rt.h[0]);accum += '
                                       '(Vuu.v[1].w[i].h[0] * Rt.h[1]);Vx.w[i] '
                                       '= sat32(accum) ;}'
                },
 'hexagon_V6_vdmpyhsusat_acc_128B': {
                        'hvx_intrinsic': 'Vx.w+=vdmpy(Vu.h,Rt.uh):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                        '{accum=Vx.w[i];accum += (Vu.w[i].h[0] '
                                        '* Rt.uh[0]);accum += (Vu.w[i].h[1] * '
                                        'Rt.uh[1]);Vx.w[i] = sat32(accum) ;}'
                },
 'hexagon_V6_vdmpybus_acc_128B': {
                        'hvx_intrinsic': 'Vx.h+=vdmpy(Vu.ub,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i] '
                                     '+= (Vu.uh[i].ub[0] * Rt.b[(2*i) '
                                     '%4]);Vx.h[i] += (Vu.uh[i].ub[1] '
                                     '*Rt.b[(2*i+1)%4]) ;}'
                },
 'hexagon_V6_vdmpyhb_acc_128B': {
                        'hvx_intrinsic': 'Vx.w+=vdmpy(Vu.h,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                    '+= (Vu.w[i].h[0] * '
                                    'Rt.b[(2*i+0)%4]);Vx.w[i] += (Vu.w[i].h[1] '
                                    '* Rt.b[(2*i+1)%4]);}'
                },
 'hexagon_V6_vshufoeb_128B': {
                        'hvx_intrinsic': 'Vdd.b=vshuffoe(Vu.b,Vv.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].uh[i].b[0]=Vv.uh[i].ub[0];'
                                'Vdd.v[0].uh[i].b[1]=Vu.uh[i].ub[0];'
                                'Vdd.v[1].uh[i].b[0]=Vv.uh[i].ub[1];'
                                'Vdd.v[1].uh[i].b[1]=Vu.uh[i].ub[1] '
                                ';}'
                   },
 'hexagon_V6_vshufoeh_128B': {
                        'hvx_intrinsic': 'Vdd.h=vshuffoe(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].uw[i].h[0]=Vv.uw[i].uh[0];'
                                'Vdd.v[0].uw[i].h[1]=Vu.uw[i].uh[0];'
                                'Vdd.v[1].uw[i].h[0]=Vv.uw[i].uh[1];'
                                'Vdd.v[1].uw[i].h[1]=Vu.uw[i].uh[1] '
                                ';}'
                  },
 'hexagon_V6_vshufoh_128B': {
                        'hvx_intrinsic': 'Vd.h=vshuffo(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vd.uw[i].h[0]=Vv.uw[i].uh[1];'
                                'Vd.uw[i].h[1]=Vu.uw[i].uh[1] '
                                ';}'
                  },
 'hexagon_V6_vshuffob_128B': {
                        'hvx_intrinsic': 'Vd.b=vshuffo(Vu.b,Vv.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vd.uh[i].b[0]=Vv.uh[i].ub[1];Vd.uh[i].b[1]=Vu.uh[i].ub[1] '
                                 ';}'
                 },
 'hexagon_V6_vshufeh_128B': {
                        'hvx_intrinsic': 'Vd.h=vshuffe(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vd.uw[i].h[0]=Vv.uw[i].uh[0];Vd.uw[i].h[1]=Vu.uw[i].uh[0] '
                                ';}'
                },
 'hexagon_V6_vshuffeb_128B': {
                        'hvx_intrinsic': 'Vd.b=vshuffe(Vu.b,Vv.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vd.uh[i].b[0]=Vv.uh[i].ub[0];Vd.uh[i].b[1]=Vu.uh[i].ub[0] '
                                 ';}'
                },
 'hexagon_V6_vcombine_128B': {
                        'hvx_intrinsic': 'Vdd=vcombine(Vu,Vv)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{Vdd.v[0].ub[i] = Vv.ub[i];Vdd.v[1].ub[i] = '
                                 'Vu.ub[i] ;}'
                },
 'hexagon_V6_vdmpyhsat_128B': {
                        'hvx_intrinsic': 'Vd.w=vdmpy(Vu.h,Rt.h):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {accum = '
                                  '(Vu.w[i].h[0] * Rt.h[0]);accum += '
                                  '(Vu.w[i].h[1] * Rt.h[1]);Vd.w[i] = '
                                  'sat32(accum) ;}'
                },
 'hexagon_V6_vdmpyhsusat_128B': {
                        'hvx_intrinsic': 'Vd.w=vdmpy(Vu.h,Rt.uh):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {accum = '
                                    '(Vu.w[i].h[0] * Rt.uh[0]);accum += '
                                    '(Vu.w[i].h[1] * Rt.uh[1]);Vd.w[i] = '
                                    'sat32(accum) ;}'
                },
 'hexagon_V6_vdmpyhisat_128B': {
                        'hvx_intrinsic': 'Vd.w=vdmpy(Vuu.h,Rt.h):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {accum = '
                                   '(Vuu.v[0].w[i].h[1] * Rt.h[0]);accum += '
                                   '(Vuu.v[1].w[i].h[0] * Rt.h[1]);Vd.w[i] = '
                                   'sat32(accum) ;}'
                },
 'hexagon_V6_vdmpyhsuisat_128B': {
                        'hvx_intrinsic': 'Vd.w=vdmpy(Vuu.h,Rt.uh,#1):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {accum = '
                                     '(Vuu.v[0].w[i].h[1] * Rt.uh[0]);accum += '
                                     '(Vuu.v[1].w[i].h[0] * Rt.uh[1]);Vd.w[i] '
                                     '= sat32(accum) ;}'
                },
 'hexagon_V6_vdmpyhvsat_128B': {
                        'hvx_intrinsic': 'Vd.w=vdmpy(Vu.h,Vv.h):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {accum = '
                                   '(Vu.w[i].h[0] * Vv.w[i].h[0]);accum += '
                                   '(Vu.w[i].h[1] * Vv.w[i].h[1]);Vd.w[i] = '
                                   'sat32(accum) ;}'
                },
 'hexagon_V6_vdealb_128B': {
                        'hvx_intrinsic': 'Vd.b=vdeal(Vu.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i+0*VBITS/16] = '
                               'Vu.uh[i].ub[0];Vd.ub[i+1*VBITS/16] = '
                               'Vu.uh[i].ub[1] ;}'
                },
 'hexagon_V6_vdealh_128B': {
                        'hvx_intrinsic': 'Vd.h=vdeal(Vu.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i+0*VBITS/32] = '
                               'Vu.uw[i].uh[0];Vd.uh[i+1*VBITS/32] = '
                               'Vu.uw[i].uh[1] ;}'
                },
 'hexagon_V6_vpackeb_128B': {'hvx_intrinsic': 'Vd.b=vpacke(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i + 0*VBITS/16] = '
                                'Vv.uh[i].ub[0];Vd.ub[i+1*VBITS/16] = '
                                'Vu.uh[i].ub[0] ;}'},
 'hexagon_V6_vpackeh_128B': {'hvx_intrinsic': 'Vd.h=vpacke(Vu.w,Vv.w)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i+0*VBITS/32] = '
                                'Vv.uw[i].uh[0];Vd.uh[i+1*VBITS/32] = '
                                'Vu.uw[i].uh[0] ;}'},
 'hexagon_V6_vpackhb_sat_128B': {'hvx_intrinsic': 'Vd.b=vpack(Vu.h,Vv.h):sat',
                            'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.b[i+0*VBITS/16] '
                                    '= sat8(Vv.h[i]);Vd.b[i+1*VBITS/16] = '
                                    'sat8(Vu.h[i]) ;}'},
 'hexagon_V6_vpackhub_sat_128B': {'hvx_intrinsic': 'Vd.ub=vpack(Vu.h,Vv.h):sat',
                             'spec': 'for (i = 0; i < VELEM(16); i++) '
                                     '{Vd.ub[i+0*VBITS/16] = '
                                     'usat8(Vv.h[i]);Vd.ub[i+1*VBITS/16] = '
                                     'usat8(Vu.h[i]) ;}'},
 'hexagon_V6_vrmpyubv_128B': {
                        'hvx_intrinsic': 'Vd.uw=vrmpy(Vu.ub,Vv.ub)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                 '(Vu.uw[i].ub[0] *Vv.uw[i].ub[0]);Vd.uw[i] += '
                                 '(Vu.uw[i].ub[1] *Vv.uw[i].ub[1]);Vd.uw[i] += '
                                 '(Vu.uw[i].ub[2] *Vv.uw[i].ub[2]);Vd.uw[i] += '
                                 '(Vu.uw[i].ub[3] *Vv.uw[i].ub[3]) ;}'
                },
 'hexagon_V6_vdmpyhb_128B': {
                        'hvx_intrinsic': 'Vd.w=vdmpy(Vu.h,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                '(Vu.w[i].h[0] * Rt.b[(2*i+0)%4]);Vd.w[i] += '
                                '(Vu.w[i].h[1] * Rt.b[(2*i+1)%4]);}'
                },
 'hexagon_V6_vdmpybus_128B': {
                        'hvx_intrinsic': 'Vd.h=vdmpy(Vu.ub,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                 '(Vu.uh[i].ub[0] * Rt.b[(2*i) %4]);Vd.h[i] += '
                                 '(Vu.uh[i].ub[1] *Rt.b[(2*i+1)%4]) ;}'
                },
 'hexagon_V6_vrmpyub_128B': {
                        'hvx_intrinsic': 'Vd.uw=vrmpy(Vu.ub,Rt.ub)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                '(Vu.uw[i].ub[0] * Rt.ub[0]);Vd.uw[i] += '
                                '(Vu.uw[i].ub[1] * Rt.ub[1]);Vd.uw[i] += '
                                '(Vu.uw[i].ub[2] * Rt.ub[2]);Vd.uw[i] += '
                                '(Vu.uw[i].ub[3] * Rt.ub[3]) ;}'
                },
 'hexagon_V6_vrmpybus_128B': {
                        'hvx_intrinsic': 'Vd.w=vrmpy(Vu.ub,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 '(Vu.uw[i].ub[0] * Rt.b[0]);Vd.w[i] += '
                                 '(Vu.uw[i].ub[1] * Rt.b[1]);Vd.w[i] += '
                                 '(Vu.uw[i].ub[2] * Rt.b[2]);Vd.w[i] += '
                                 '(Vu.uw[i].ub[3] * Rt.b[3]) ;}'
                },
 'hexagon_V6_vrmpybv_128B': {
                        'hvx_intrinsic': 'Vd.w=vrmpy(Vu.b,Vv.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                '(Vu.w[i].b[0] * Vv.w[i].b[0]);Vd.w[i] += '
                                '(Vu.w[i].b[1] * Vv.w[i].b[1]);Vd.w[i] += '
                                '(Vu.w[i].b[2] * Vv.w[i].b[2]);Vd.w[i] += '
                                '(Vu.w[i].b[3] * Vv.w[i].b[3]) ;}'
                },
 'hexagon_V6_vrmpybusv_128B': {
                        'hvx_intrinsic': 'Vd.w=vrmpy(Vu.ub,Vv.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                  '(Vu.uw[i].ub[0] * Vv.w[i].b[0]);Vd.w[i] += '
                                  '(Vu.uw[i].ub[1] * Vv.w[i].b[1]);Vd.w[i] += '
                                  '(Vu.uw[i].ub[2] * Vv.w[i].b[2]);Vd.w[i] += '
                                  '(Vu.uw[i].ub[3] * Vv.w[i].b[3]) ;}'
                },
  'hexagon_V6_vshuffh_128B': {
                         'hvx_intrinsic': 'Vd.h=vshuff(Vu.h)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) '
                                 '{Vd.uw[i].h[0]=Vu.uh[i+0*VBITS/32];Vd.uw[i].h[1]=Vu.uh[i+1*VBITS/32] '
                                 ';}'
                 },
  'hexagon_V6_vshuffb_128B': {
                         'hvx_intrinsic': 'Vd.b=vshuff(Vu.b)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vd.uh[i].b[0]=Vu.ub[i+0*VBITS/16];Vd.uh[i].b[1]=Vu.ub[i+1*VBITS/16] '
                                 ';}'
                 },
 'hexagon_V6_vinsertwr_128B': {
                        'hvx_intrinsic': 'Vx.w=vinsert(Rt)',
                        'spec': 'Vx.uw[0] = Rt;'
                },
 'hexagon_V6_vaddcarrysat_128B': {
                        'hvx_intrinsic': 'Vd.w=vadd(Vu.w,Vv.w,Qs4):carry:sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] '
                                     '= sat32(Vu.w[i]+Vv.w[i]+QsV[i*4]) ;}'
                },
 'hexagon_V6_vsathub_128B': {'hvx_intrinsic': 'Vd.ub=vsat(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vd.uh[i].b[0]=usat8(Vv.h[i]);Vd.uh[i].b[1]=usat8(Vu.h[i]) '
                                ';}'},
 'hexagon_V6_vsatuwuh_128B': {'hvx_intrinsic': 'Vd.uh=vsat(Vu.uw,Vv.uw)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) '
                                 '{Vd.w[i].h[0]=usat16(Vv.uw[i]);Vd.w[i].h[1]=usat16(Vu.uw[i]) '
                                 ';}'},
 'hexagon_V6_vsatwh_128B': {'hvx_intrinsic': 'Vd.h=vsat(Vu.w,Vv.w)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) '
                               '{Vd.w[i].h[0]=sat16(Vv.w[i]);Vd.w[i].h[1]=sat16(Vu.w[i]) '
                               ';}'},
 'hexagon_V6_vdealb4w_128B': {'hvx_intrinsic': 'Vd.b=vdeale(Vu.b,Vv.b)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {'
                                 'Vd.ub[0*VBITS/32+i ] = Vv.uw[i].ub[0];'
                                 'Vd.ub[1*VBITS/32+i ] = Vv.uw[i].ub[2];'
                                 'Vd.ub[2*VBITS/32+i] = Vu.uw[i].ub[0];'
                                 'Vd.ub[3*VBITS/32+i] = Vu.uw[i].ub[2] ;}'
                },
 'hexagon_V6_vmpabuu_acc_128B': {
                        'hvx_intrinsic': 'Vxx.h+=vmpa(Vuu.ub,Rt.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vxx.v[0].uh[i] += (Vuu.v[0].uh[i].ub[0] '
                                    '*Rt.ub[0]) + (Vuu.v[1].uh[i].ub[0] * '
                                    'Rt.ub[1]);Vxx.v[1].uh[i] += '
                                    '(Vuu.v[0].uh[i].ub[1] *Rt.ub[2]) + '
                                    '(Vuu.v[1].uh[i].ub[1] * Rt.ub[3]) ;}'
                },
  'hexagon_V6_vmpauhb_acc_128B': {'hvx_intrinsic': 'Vxx.w+=vmpa(Vuu.uh,Rt.b)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vxx.v[0].w[i] += (Vuu.v[0].w[i].uh[0] '
                                    '*Rt.b[0]) + (Vuu.v[1].w[i].uh[0] * '
                                    'Rt.b[1]);Vxx.v[1].w[i] += '
                                    '(Vuu.v[0].w[i].uh[1] *Rt.b[2]) + '
                                    '(Vuu.v[1].w[i].uh[1] * Rt.b[3]) ;}'},
   'hexagon_V6_vmpauhb_128B': {'hvx_intrinsic': 'Vdd.w=vmpa(Vuu.uh,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] = (Vuu.v[0].w[i].uh[0] '
                                '*Rt.b[0]) + (Vuu.v[1].w[i].uh[0] * '
                                'Rt.b[1]);Vdd.v[1].w[i] = (Vuu.v[0].w[i].uh[1] '
                                '*Rt.b[2]) + (Vuu.v[1].w[i].uh[1] * Rt.b[3]) '
                                ';}'},
 'hexagon_V6_vmpabuuv_128B': {'hvx_intrinsic': 'Vdd.h=vmpa(Vuu.ub,Vvv.ub)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].h[i] = (Vuu.v[0].uh[i].ub[0] '
                                 '*Vvv.v[0].uh[i].ub[0]) + '
                                 '(Vuu.v[1].uh[i].ub[0] '
                                 '*Vvv.v[1].uh[i].ub[0]);Vdd.v[1].h[i] = '
                                 '(Vuu.v[0].uh[i].ub[1] *Vvv.v[0].uh[i].ub[1]) '
                                 '+ (Vuu.v[1].uh[i].ub[1] '
                                 '*Vvv.v[1].uh[i].ub[1]) ;}'},
 'hexagon_V6_vmpahb_128B': {'hvx_intrinsic': 'Vdd.w=vmpa(Vuu.h,Rt.b)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                               '= (Vuu.v[0].w[i].h[0] *Rt.b[0]) + '
                               '(Vuu.v[1].w[i].h[0] * Rt.b[1]);Vdd.v[1].w[i] = '
                               '(Vuu.v[0].w[i].h[1] *Rt.b[2]) + '
                               '(Vuu.v[1].w[i].h[1] * Rt.b[3]) ;}'},
 'hexagon_V6_vmpahb_acc_128B': {'hvx_intrinsic': 'Vxx.w+=vmpa(Vuu.h,Rt.b)',
                           'spec': 'for (i = 0; i < VELEM(32); i++) '
                                   '{Vxx.v[0].w[i] += (Vuu.v[0].w[i].h[0] '
                                   '*Rt.b[0]) + (Vuu.v[1].w[i].h[0] * '
                                   'Rt.b[1]);Vxx.v[1].w[i] += '
                                   '(Vuu.v[0].w[i].h[1] *Rt.b[2]) + '
                                   '(Vuu.v[1].w[i].h[1] * Rt.b[3]) ;}'},
 'hexagon_V6_vmpabuu_128B': {'hvx_intrinsic': 'Vdd.h=vmpa(Vuu.ub,Rt.ub)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].uh[i] = (Vuu.v[0].uh[i].ub[0] '
                                '*Rt.ub[0]) + (Vuu.v[1].uh[i].ub[0] * '
                                'Rt.ub[1]);Vdd.v[1].uh[i] = '
                                '(Vuu.v[0].uh[i].ub[1] *Rt.ub[2]) + '
                                '(Vuu.v[1].uh[i].ub[1] * Rt.ub[3]) ;}'},
  'hexagon_V6_vmpabus_128B': {'hvx_intrinsic': 'Vdd.h=vmpa(Vuu.ub,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].h[i] = (Vuu.v[0].uh[i].ub[0] '
                                '*Rt.b[0]) + (Vuu.v[1].uh[i].ub[0] * '
                                'Rt.b[1]);Vdd.v[1].h[i] = '
                                '(Vuu.v[0].uh[i].ub[1] *Rt.b[2]) + '
                                '(Vuu.v[1].uh[i].ub[1] * Rt.b[3]) ;}'},
 'hexagon_V6_vmpabus_acc_128B': {'hvx_intrinsic': 'Vxx.h+=vmpa(Vuu.ub,Rt.b)',
                            'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vxx.v[0].h[i] += (Vuu.v[0].uh[i].ub[0] '
                                    '*Rt.b[0]) + (Vuu.v[1].uh[i].ub[0] * '
                                    'Rt.b[1]);Vxx.v[1].h[i] += '
                                    '(Vuu.v[0].uh[i].ub[1] *Rt.b[2]) + '
                                    '(Vuu.v[1].uh[i].ub[1] * Rt.b[3]) ;}'},
 'hexagon_V6_vmpabusv_128B': {'hvx_intrinsic': 'Vdd.h=vmpa(Vuu.ub,Vvv.b)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].h[i] = (Vuu.v[0].uh[i].ub[0] '
                                 '*Vvv.v[0].uh[i].b[0]) + '
                                 '(Vuu.v[1].uh[i].ub[0] '
                                 '*Vvv.v[1].uh[i].b[0]);Vdd.v[1].h[i] = '
                                 '(Vuu.v[0].uh[i].ub[1] *Vvv.v[0].uh[i].b[1]) '
                                 '+ (Vuu.v[1].uh[i].ub[1] '
                                 '*Vvv.v[1].uh[i].b[1]) ;}'},
 'hexagon_V6_lvsplatb_128B': {
                          'hvx_intrinsic': 'Vd.b=vsplat(Rt)',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                  'Rt ;}'
                          },
 'hexagon_V6_lvsplath_128B': {
                         'hvx_intrinsic': 'Vd.h=vsplat(Rt)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                 'Rt ;}'
                          },
 'hexagon_V6_lvsplatw_128B': {
                         'hvx_intrinsic': 'Vd=vsplat(Rt)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                 'Rt ;}'
                        },
 'hexagon_V6_pred_and_128B': {
                         'hvx_intrinsic': 'Qd4=and(Qs4,Qt4)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{QdV[i]=QsV[i] && QtV[i] ;}'
                        },
 'hexagon_V6_pred_and_n_128B': {
                           'hvx_intrinsic': 'Qd4=and(Qs4,!Qt4)',
                           'spec': 'for (i = 0; i < VELEM(8); i++) '
                                   '{QdV[i]=QsV[i] && !QtV[i] ;}'
                          },
 'hexagon_V6_pred_not_128B': {
                         'hvx_intrinsic': 'Qd4=not(Qs4)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{QdV[i]=!QsV[i] ;}'
                        },
 'hexagon_V6_pred_or_128B': {
                        'hvx_intrinsic': 'Qd4=or(Qs4,Qt4)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] '
                                '|| QtV[i] ;}'
                       },
 'hexagon_V6_pred_or_n_128B': {
                          'hvx_intrinsic': 'Qd4=or(Qs4,!Qt4)',
                          'spec': 'for (i = 0; i < VELEM(8); i++) '
                                  '{QdV[i]=QsV[i] || !QtV[i] ;}'
                        },
 'hexagon_V6_pred_xor_128B': {
                         'hvx_intrinsic': 'Qd4=xor(Qs4,Qt4)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{QdV[i]=QsV[i] ^ QtV[i] ;}'
                        },
 'hexagon_V6_vmpyh_acc_128B': {'hvx_intrinsic': 'Vxx.w+=vmpy(Vu.h,Rt.h)',
                          'spec': 'for (i = 0; i < VELEM(32); i++) '
                                  '{Vxx.v[0].w[i] = Vxx.v[0].w[i] '
                                  '+(Vu.w[i].h[0] * Rt.h[0]);Vxx.v[1].w[i] = '
                                  'Vxx.v[1].w[i] +(Vu.w[i].h[1] * Rt.h[1]) '
                                  ';}'},
 'hexagon_V6_vmpyhsat_acc_128B': {'hvx_intrinsic': 'Vxx.w+=vmpy(Vu.h,Rt.h):sat',
                             'spec': 'for (i = 0; i < VELEM(32); i++) '
                                     '{Vxx.v[0].w[i] = sat32(Vxx.v[0].w[i] '
                                     '+(Vu.w[i].h[0] * Rt.h[0]));Vxx.v[1].w[i] '
                                     '= sat32(Vxx.v[1].w[i] +(Vu.w[i].h[1] '
                                     '* Rt.h[1])) ;}'},
 'hexagon_V6_vswap_128B': {'hvx_intrinsic': 'Vdd=vswap(Qt4,Vu,Vv)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].ub[i] '
                              '= QtV[i] ? Vu.ub[i] :Vv.ub[i];Vdd.v[1].ub[i] = '
                              '!QtV[i] ? Vu.ub[i] :Vv.ub[i] ;}'},
 'hexagon_V6_hi_128B': {
                        'hvx_intrinsic': 'Vd=vhi(Vxx)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              'Vxx.v[0].b[i];}'
                    },
 'hexagon_V6_lo_128B': {
                        'hvx_intrinsic': 'Vd=vlo(Vxx)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              'Vxx.v[1].b[i];}'
                    },
 'hexagon_V6_vroundhb_128B': {
                        'hvx_intrinsic': 'Vd.b=vround(Vu.h,Vv.h):sat',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {'
                                'Vd.uh[i].b[0]=sat8((Vv.h[i] + 0x80) >> 8);'
                                'Vd.uh[i].b[1]=sat8((Vu.h[i] + 0x80) >> 8) ;}'
                },
 'hexagon_V6_vroundwh_128B': {
                        'hvx_intrinsic': 'Vd.h=vround(Vu.w,Vv.w):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {'
                                'Vd.uw[i].h[0]=sat16((Vv.w[i] + 0x8000) >>16);'
                                'Vd.uw[i].h[1]=sat16((Vu.w[i] + 0x8000) >> 16);}'
                },
 'hexagon_V6_vroundhub_128B': {
                        'hvx_intrinsic': 'Vd.ub=vround(Vu.h,Vv.h):sat',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {'
                                'Vd.uh[i].b[0]=usat8((Vv.h[i] + 0x80) >> 8);'
                                'Vd.uh[i].b[1]=usat8((Vu.h[i] + 0x80) >> 8) ;}'
                },
 'hexagon_V6_vrounduhub_128B': {
                        'hvx_intrinsic': 'Vd.ub=vround(Vu.uh,Vv.uh):sat',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {'
                                'Vd.uh[i].b[0]=usat8((Vv.uh[i] + 0x80) >> 8);'
                                'Vd.uh[i].b[1]=usat8((Vu.uh[i] + 0x80) >> 8);}'
                },       
 'hexagon_V6_vrounduwuh_128B': {
                        'hvx_intrinsic': 'Vd.uh=vround(Vu.uw,Vv.uw):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {'
                                'Vd.uw[i].h[0]=usat16((Vv.uw[i] + 0x8000) >> 16);'
                                'Vd.uw[i].h[1]=usat16((Vu.uw[i] + 0x8000) >> 16) ;}'
                },       
 'hexagon_V6_vroundwuh_128B': {
                        'hvx_intrinsic': 'Vd.uh=vround(Vu.w,Vv.w):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {'
                                'Vd.uw[i].h[0]=usat16((Vv.w[i] + 0x8000) >> 16);'
                                'Vd.uw[i].h[1]=usat16((Vu.w[i] + 0x8000) >> 16) ;}'
                },  
  'hexagon_V6_vaslh_acc_128B': {
                      'hvx_intrinsic': 'Vx.h+=vasl(Vu.h,Rt)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {'
                                'Vx.h[i] += (Vu.h[i] << (Rt & 0xf)) ;'
                                '}'
                    },
  'hexagon_V6_vasrh_acc_128B': {
                      'hvx_intrinsic': 'Vx.h+=vasr(Vu.h,Rt)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {'
                                'Vx.h[i] += (Vu.h[i] >>> (Rt & 0xf ) ) ;'
                                '}'
                    },
  'hexagon_V6_vaslw_acc_128B': {
                      'hvx_intrinsic': 'Vx.w+=vasl(Vu.w,Rt)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {'
                                'Vx.w[i] += (Vu.w[i] << (Rt & 0x1f ) ) ;'
                                '}'
                    },
  'hexagon_V6_vasrw_acc_128B': {
                      'hvx_intrinsic': 'Vx.w+=vasr(Vu.w,Rt)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {'
                                'Vx.w[i] += (Vu.w[i] >>> (Rt & 0x1f ) ) ;'
                                '}'
                    },
 'hexagon_V6_vmpyewuh_64_128B': {'hvx_intrinsic': 'Vdd=vmpye(Vu.w,Vv.uh)',
                            'spec': 'for (i = 0; i < VELEM(32); i++) {'
                                    'Vdd.v[0].w[i] = (Vu.w[i] * Vv.w[i].uh[0]) << 16 ;'
                                    'Vdd.v[1].w[i] = (Vu.w[i] * Vv.w[i].uh[0]) >> 16;}'},
'hexagon_V6_vasruwuhrndsat_128B' : {
        'hvx_intrinsic': 'Vd.uh=vasr(Vu.uw,Vv.uw,Rt):rnd:sat',
        'spec' : 'for (i = 0; i < VELEM(32); i++) { '
                 'shamt = Rt & 0xF; '
                 'Vd.uw[i].h[0]=usat16(Vv.uw[i] + (1<<(shamt-1)) >>> shamt);'
                 'Vd.uw[i].h[1]=usat16(Vu.uw[i] + (1<<(shamt-1)) >>> shamt); }'

},
'hexagon_V6_vasrwuhrndsat_128B' : {
        'hvx_intrinsic': 'Vd.uh=vasr(Vu.w,Vv.w,Rt):rnd:sat',
        'spec' : 'for (i = 0; i < VELEM(32); i++) { '
                 'shamt = Rt & 0xF; '
                 'Vd.w[i].h[0]=usat16(Vv.w[i] + (1<<(shamt-1)) >>> shamt);'
                 'Vd.w[i].h[1]=usat16(Vu.w[i] + (1<<(shamt-1)) >>> shamt); }'

},
'hexagon_V6_vasruhubrndsat_128B' : {
        'hvx_intrinsic': 'Vd.ub=vasr(Vu.uh,Vv.uh,Rt):rnd:sat',
        'spec' : 'for (i = 0; i < VELEM(16); i++) { '
                 'shamt = Rt & 0x7;'
                 'Vd.uh[i].b[0]=usat8(Vv.uh[i] + (1<<(shamt-1)) >>> shamt);'
                 'Vd.uh[i].b[1]=usat8(Vu.uh[i] + (1<<(shamt-1)) >>> shamt) ; }'

},
'hexagon_V6_vasrhubrndsat_128B' : {
        'hvx_intrinsic': 'Vd.ub=vasr(Vu.h,Vv.h,Rt):rnd:sat',
        'spec' : 'for (i = 0; i < VELEM(16); i++) { '
                 'shamt = Rt & 0x7;'
                 'Vd.h[i].b[0]=usat8(Vv.h[i] + (1<<(shamt-1)) >>> shamt);'
                 'Vd.h[i].b[1]=usat8(Vu.h[i] + (1<<(shamt-1)) >>> shamt); }'

},
'hexagon_V6_vasrwhrndsat_128B' : {
        'hvx_intrinsic': 'Vd.h=vasr(Vu.w,Vv.w,Rt):rnd:sat',
        'spec' : 'for (i = 0; i < VELEM(32); i++) { '
                 'shamt = Rt & 0xF;'
                 'Vd.w[i].h[0]=sat16(Vv.w[i] + (1<<(shamt-1)) >>> shamt);'
                 'Vd.w[i].h[1]=sat16(Vu.w[i] + (1<<(shamt-1)) >>> shamt); }'

},
'hexagon_V6_vasrhbrndsat_128B' : {
        'hvx_intrinsic': 'Vd.b=vasr(Vu.h,Vv.h,Rt):rnd:sat ',
        'spec' : 'for (i = 0; i < VELEM(16); i++) { '
                 'shamt = Rt & 0x7;'
                 'Vd.h[i].b[0]=sat8(Vv.h[i] + (1<<(shamt-1)) >>> shamt);'
                 'Vd.h[i].b[1]=sat8(Vu.h[i] + (1<<(shamt-1)) >>> shamt); }'

},
'hexagon_V6_vasruwuhsat_128B' : {
        'hvx_intrinsic': 'Vd32.uh=vasr(Vu32.uw,Vv32.uw,Rt8):sat',
        'spec' : ' for (i = 0; i < VELEM(32); i++) {'
                 'shamt = RtV & 0xF; '
                 'VdV.uw[i].h[0]=usat16(VvV.uw[i] >>> shamt);'
                 ' VdV.uw[i].h[1]=usat16(VuV.uw[i] >>> shamt) ; }'
},
'hexagon_V6_vasruhubsat_128B' : {
        'hvx_intrinsic': 'Vd32.ub=vasr(Vu32.uh,Vv32.uh,Rt8):sat',
        'spec' : 'for (i = 0; i < VELEM(16); i++) { '
                'shamt = RtV & 0x7; '
                'VdV.uh[i].b[0]=usat8(VvV.uh[i] >>> shamt);'
                ' VdV.uh[i].b[1]=usat8(VuV.uh[i] >>> shamt) ; } '
},
'hexagon_V6_vasrwh_128B' : {
        'hvx_intrinsic': 'Vd32.h=vasr(Vu32.w,Vv32.w,Rt8)',
        'spec' : 'for (i = 0; i < VELEM(32); i++) { '
                 'shamt = RtV & 0xF;'
                 ' VdV.w[i].h[0]=VvV.w[i] >>> shamt; '
                 'VdV.w[i].h[1]=VuV.w[i] >>> shamt ; } '
},
'hexagon_V6_vasrwhsat_128B' : {
        'hvx_intrinsic': 'Vd32.h=vasr(Vu32.w,Vv32.w,Rt8):sat',
        'spec' : ' for (i = 0; i < VELEM(32); i++) { '
                'shamt = RtV & 0xF;'
                ' VdV.w[i].h[0]=sat16(VvV.w[i] >>> shamt); '
                'VdV.w[i].h[1]=sat16(VuV.w[i] >>> shamt) ; } '
},
'hexagon_V6_vasrwuhsat_128B' : {
        'hvx_intrinsic': 'Vd32.uh=vasr(Vu32.w,Vv32.w,Rt8):sat',
        'spec' : 'for (i = 0; i < VELEM(32); i++) { '
                'shamt = RtV & 0xF;'
                ' VdV.w[i].h[0]=usat16(VvV.w[i] >>> shamt); '
                'VdV.w[i].h[1]=usat16(VuV.w[i] >>> shamt) ; } '
},
'hexagon_V6_vasrhubsat_128B' : {
        'hvx_intrinsic': 'Vd32.ub=vasr(Vu32.h,Vv32.h,Rt8):sat',
        'spec' : 'for (i = 0; i < VELEM(16); i++) { '
                'shamt = RtV & 0x7; '
                'VdV.h[i].b[0]=usat8(VvV.h[i] >>> shamt); '
                'VdV.h[i].b[1]=usat8(VuV.h[i] >>> shamt) ; } '
},
'hexagon_V6_vasrhbsat_128B' : {
        'hvx_intrinsic': 'Vd32.b=vasr(Vu32.h,Vv32.h,Rt8):sat',
        'spec' : 'for (i = 0; i < VELEM(16); i++) '
                '{ shamt = RtV & 0x7; '
                'VdV.h[i].b[0]=sat8(VvV.h[i] >>> shamt); '
                'VdV.h[i].b[1]=sat8(VuV.h[i] >>> shamt) ; } '
},
 'hexagon_V6_vaslw_128B': {
                      'hvx_intrinsic': 'Vd32.w=vasl(Vu32.w,Rt32)',
                      'spec': 'for (i = 0; i < VELEM(32); i++)'
                      ' { VdV.w[i] = (VuV.w[i] << (RtV & 0x1f)) ; } ',
                    },

 'hexagon_V6_vaslh_128B': {
                      'hvx_intrinsic': 'Vd32.h=vasl(Vu32.h,Rt32)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) { '
                      'VdV.h[i] = (VuV.h[i] << (RtV & 0xf)) ; } ',
                    },
 'hexagon_V6_vlsrw_128B': {
                      'hvx_intrinsic': 'Vd32.uw=vlsr(Vu32.uw,Rt32)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) { '
                                'VdV.uw[i] = (VuV.uw[i] >> (RtV & 0x1f)) ; }',
                    },
 'hexagon_V6_vlsrh_128B': {
                      'hvx_intrinsic': 'Vd32.uh=vlsr(Vu32.uh,Rt32)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) '
                                ' { VdV.uh[i] = (VuV.uh[i] >> (RtV & 0xf)) ; }',
                    },
 'hexagon_V6_vlsrb_128B': {
                      'hvx_intrinsic': 'Vd32.ub=vlsr(Vu32.ub,Rt32)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {'
                                ' VdV.b[i] = VuV.ub[i] >> (RtV & 0x7) ; }',
                    },
}

