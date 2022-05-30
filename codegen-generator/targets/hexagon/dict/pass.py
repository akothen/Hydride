HVXInsts = {
 'hexagon_V6_vaddb_128B': {
                      'hvx_intrinsic': 'Vd.b=vadd(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i]+Vv.b[i]) ;}'
                    },
 'hexagon_V6_vmaxb_128B': {
                      'hvx_intrinsic': 'Vd.b=vmax(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i] > Vv.b[i]) ? Vu.b[i] :Vv.b[i] ;}'
                    },
 'hexagon_V6_vabsw_128B': {
                      'hvx_intrinsic': 'Vd.w=vabs(Vu.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(ABS(Vu.w[i])) ;}'
                    },
 'hexagon_V6_vadduwsat_128B': {
                          'hvx_intrinsic': 'Vd.uw=vadd(Vu.uw,Vv.uw):sat',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                  'usat32(Vu.uw[i]+Vv.uw[i]) ;}'
                    },
 'hexagon_V6_vnavgw_128B': {
                       'hvx_intrinsic': 'Vd.w=vnavg(Vu.w,Vv.w)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                               '(Vu.w[i]-Vv.w[i])/2 ;}'
                    },
 'hexagon_V6_vsubwsat_128B': {
                         'hvx_intrinsic': 'Vd.w=vsub(Vu.w,Vv.w):sat',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 'sat32(Vu.w[i]-Vv.w[i]) ;}'
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
 'hexagon_V6_vavgbrnd_128B': {
                         'hvx_intrinsic': 'Vd.b=vavg(Vu.b,Vv.b):rnd',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                 '(Vu.b[i]+Vv.b[i]+1)/2 ;}'
                    },
 'hexagon_V6_vavgh_128B': {
                      'hvx_intrinsic': 'Vd.h=vavg(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i]+Vv.h[i])/2 ;}'
                    },
 'hexagon_V6_vavghrnd_128B': {
                         'hvx_intrinsic': 'Vd.h=vavg(Vu.h,Vv.h):rnd',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                 '(Vu.h[i]+Vv.h[i]+1)/2 ;}'
                    },
 'hexagon_V6_vavgub_128B': {
                       'hvx_intrinsic': 'Vd.ub=vavg(Vu.ub,Vv.ub)',
                       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               '(Vu.ub[i]+Vv.ub[i])/2 ;}'
                    },
 'hexagon_V6_vavgubrnd_128B': {
                          'hvx_intrinsic': 'Vd.ub=vavg(Vu.ub,Vv.ub):rnd',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                  '(Vu.ub[i]+Vv.ub[i]+1)/2 ;}'
                    },
 'hexagon_V6_vavguh_128B': {
                       'hvx_intrinsic': 'Vd.uh=vavg(Vu.uh,Vv.uh)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                               '(Vu.uh[i]+Vv.uh[i])/2 ;}'
                    },
 'hexagon_V6_vavguhrnd_128B': {
                          'hvx_intrinsic': 'Vd.uh=vavg(Vu.uh,Vv.uh):rnd',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                  '(Vu.uh[i]+Vv.uh[i]+1)/2 ;}'
                    },
 'hexagon_V6_vavguw_128B': {
                       'hvx_intrinsic': 'Vd.uw=vavg(Vu.uw,Vv.uw)',
                       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                               '(Vu.uw[i]+Vv.uw[i])/2 ;}'
                    },
 'hexagon_V6_vavguwrnd_128B': {
                          'hvx_intrinsic': 'Vd.uw=vavg(Vu.uw,Vv.uw):rnd',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                  '(Vu.uw[i]+Vv.uw[i]+1)/2 ;}'
                    },
 'hexagon_V6_vavgw_128B': {
                      'hvx_intrinsic': 'Vd.w=vavg(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i]+Vv.w[i])/2 ;}'
                    },
 'hexagon_V6_vavgwrnd_128B': {
                         'hvx_intrinsic': 'Vd.w=vavg(Vu.w,Vv.w):rnd',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 '(Vu.w[i]+Vv.w[i]+1)/2 ;}'
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
 'hexagon_V6_vaddh_128B': {
                      'hvx_intrinsic': 'Vd.h=vadd(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i]+Vv.h[i]) ;}'
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
 'hexagon_V6_vaddbsat_128B': {
                         'hvx_intrinsic': 'Vd.b=vadd(Vu.b,Vv.b):sat',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                 'sat8(Vu.b[i]+Vv.b[i]) ;}'
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
 'hexagon_V6_vsubb_128B': {
                      'hvx_intrinsic': 'Vd.b=vsub(Vu.b,Vv.b)',
                      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                              '(Vu.b[i]-Vv.b[i]) ;}'
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
 'hexagon_V6_vaddw_128B': {
                      'hvx_intrinsic': 'Vd.w=vadd(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i]+Vv.w[i]) ;}'
                    },
 'hexagon_V6_vmux_128B': {
                     'hvx_intrinsic': 'Vd=vmux(Qt4,Vu,Vv)',
                     'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                             'QtV[i] ? Vu.ub[i] : Vv.ub[i] ;}'
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
 'hexagon_V6_vnot_128B': {
                     'hvx_intrinsic': 'Vd=vnot(Vu)',
                     'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                             '~Vu.uh[i] ;}'
                    },
 'hexagon_V6_vor_128B': {
                    'hvx_intrinsic': 'Vd=vor(Vu,Vv)',
                    'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                            'Vu.uh[i] | Vv.h[i] ;}'
                    },
 'hexagon_V6_vsubuwsat_128B': {
                          'hvx_intrinsic': 'Vd.uw=vsub(Vu.uw,Vv.uw):sat',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                  'usat32(Vu.uw[i]-Vv.uw[i]) ;}'
                    },
 'hexagon_V6_vsubw_128B': {
                      'hvx_intrinsic': 'Vd.w=vsub(Vu.w,Vv.w)',
                      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                              '(Vu.w[i]-Vv.w[i]) ;}'
                    },
 'hexagon_V6_vsubh_128B': {
                      'hvx_intrinsic': 'Vd.h=vsub(Vu.h,Vv.h)',
                      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                              '(Vu.h[i]-Vv.h[i]) ;}'
                    },
 'hexagon_V6_vsububsat_128B': {
                          'hvx_intrinsic': 'Vd.ub=vsub(Vu.ub,Vv.ub):sat',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                  'usat8(Vu.ub[i]-Vv.ub[i]) ;}'
                    },
 'hexagon_V6_vunpackub_128B': {
                          'hvx_intrinsic': 'Vdd.uh=vunpack(Vu.ub)',
                          'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.uh[i] = '
                                  'Vu.ub[i] ;}'
                    },
 'hexagon_V6_vxor_128B': {
                     'hvx_intrinsic': 'Vd=vxor(Vu,Vv)',
                     'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                             'Vu.uh[i] ^ Vv.h[i] ;}'
                    },
 'hexagon_V6_vabsdiffh_128B': {
                          'hvx_intrinsic': 'Vd.uh=vabsdiff(Vu.h,Vv.h)',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                  '(Vu.h[i] > Vv.h[i]) ? (Vu.h[i] -Vv.h[i]) : '
                                  '(Vv.h[i] - Vu.h[i]) ;}'
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
 'hexagon_V6_vabsdiffuh_128B': {
                           'hvx_intrinsic': 'Vd.uh=vabsdiff(Vu.uh,Vv.uh)',
                           'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] '
                                   '= (Vu.uh[i] > Vv.uh[i]) ? (Vu.uh[i]- '
                                   'Vv.uh[i]) : (Vv.uh[i] - Vu.uh[i]) ;}'
                    },
 'hexagon_V6_vsubbsat_128B': {
                         'hvx_intrinsic': 'Vd.b=vsub(Vu.b,Vv.b):sat',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                 'sat8(Vu.b[i]-Vv.b[i]) ;}'
                    },
 'hexagon_V6_vsubhsat_128B': {
                         'hvx_intrinsic': 'Vd.h=vsub(Vu.h,Vv.h):sat',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                 'sat16(Vu.h[i]-Vv.h[i]) ;}'
                    },
 'hexagon_V6_vunpackuh_128B': {
                          'hvx_intrinsic': 'Vdd.uw=vunpack(Vu.uh)',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.uw[i] '
                                  '= Vu.uh[i] ;}'
                    },
 'hexagon_V6_vabsdiffw_128B': {
                          'hvx_intrinsic': 'Vd.uw=vabsdiff(Vu.w,Vv.w)',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                  '(Vu.w[i] > Vv.w[i]) ? (Vu.w[i] -Vv.w[i]) : '
                                  '(Vv.w[i] - Vu.w[i]) ;}'
                    },
 'hexagon_V6_vmpyiewuh_128B': {
                          'hvx_intrinsic': 'Vd.w=vmpyie(Vu.w,Vv.uh)',
                          'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                  '(Vu.w[i] * Vv.w[i].uh[0]) ;}'
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
 'hexagon_V6_vmpyiowh_128B': {
                         'hvx_intrinsic': 'Vd.w=vmpyio(Vu.w,Vv.h)',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 '(Vu.w[i] * Vv.w[i].h[1]) ;}'
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
 'hexagon_V6_vaddwsat_128B': {
                         'hvx_intrinsic': 'Vd.w=vadd(Vu.w,Vv.w):sat',
                         'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                                 'sat32(Vu.w[i]+Vv.w[i]) ;}'
                    },
 'hexagon_V6_vaddwnq_128B': {
                        'hvx_intrinsic': 'if (!Qv4) Vx.w+=Vu.w',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]+Vu.w[i]) '
                                ';}'
                    },
 'hexagon_V6_vand_128B': {
                     'hvx_intrinsic': 'Vd=vand(Vu,Vv)',
                     'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                             'Vu.uh[i] & Vv.h[i] ;}'
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
 'hexagon_V6_vshufoeb_128B': {
                        'hvx_intrinsic': 'Vdd.b=vshuffoe(Vu.b,Vv.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vdd.v[0].uh[i].b[0]=Vv.uh[i].ub[0];Vdd.v[0].uh[i].b[1]=Vu.uh[i].ub[0];Vdd.v[1].uh[i].b[0]=Vv.uh[i].ub[1];Vdd.v[1].uh[i].b[1]=Vu.uh[i].ub[1] '
                                ';}'
                   },
 'hexagon_V6_vshufoeh_128B': {
                        'hvx_intrinsic': 'Vdd.h=vshuffoe(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].uw[i].h[0]=Vv.uw[i].uh[0];Vdd.v[0].uw[i].h[1]=Vu.uw[i].uh[0];Vdd.v[1].uw[i].h[0]=Vv.uw[i].uh[1];Vdd.v[1].uw[i].h[1]=Vu.uw[i].uh[1] '
                                ';}'
                  },
 'hexagon_V6_vshufoh_128B': {
                        'hvx_intrinsic': 'Vd.h=vshuffo(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vd.uw[i].h[0]=Vv.uw[i].uh[1];Vd.uw[i].h[1]=Vu.uw[i].uh[1] '
                                ';}'
                  },
 'hexagon_V6_vshuffob_128B': {
                        'hvx_intrinsic': 'Vd.b=vshuffo(Vu.b,Vv.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vd.uh[i].b[0]=Vv.uh[i].ub[1];Vd.uh[i].b[1]=Vu.uh[i].ub[1] '
                                 ';}'
                 },
 'hexagon_V6_vshuffeb_128B': {
                        'hvx_intrinsic': 'Vd.b=vshuffe(Vu.b,Vv.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vd.uh[i].b[0]=Vv.uh[i].ub[0];Vd.uh[i].b[1]=Vu.uh[i].ub[0] '
                                 ';}'
                },
 'hexagon_V6_vshufeh_128B': {
                        'hvx_intrinsic': 'Vd.h=vshuffe(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vd.uw[i].h[0]=Vv.uw[i].uh[0];Vd.uw[i].h[1]=Vu.uw[i].uh[0] '
                                ';}'
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
 'hexagon_V6_vcombine_128B': {
                        'hvx_intrinsic': 'Vdd=vcombine(Vu,Vv)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{Vdd.v[0].ub[i] = Vv.ub[i];Vdd.v[1].ub[i] = '
                                 'Vu.ub[i] ;}'
                },
 'hexagon_V6_vsubw_dv_128B': {
                        'hvx_intrinsic': 'Vdd.w=vsub(Vuu.w,Vvv.w)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                 '{Vdd.v[0].w[i] = '
                                 '(Vuu.v[0].w[i]-Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                 '= (Vuu.v[1].w[i]-Vvv.v[1].w[i]) ;}'
                },
 'hexagon_V6_vsubwsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.w=vsub(Vuu.w,Vvv.w):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vdd.v[0].w[i] = '
                                    'sat32(Vuu.v[0].w[i]-Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                    '= sat32(Vuu.v[1].w[i]-Vvv.v[1].w[i]) ;}'
                },
 'hexagon_V6_vandvqv_128B': {
                        'hvx_intrinsic': 'Vd=vand(Qv4,Vu)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                                'QvV[i] ? Vu.b[i] : 0 ;}'
                },
 'hexagon_V6_vsubb_dv_128B': {
                        'hvx_intrinsic': 'Vdd.b=vsub(Vuu.b,Vvv.b)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{Vdd.v[0].b[i] = '
                                 '(Vuu.v[0].b[i]-Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                 '= (Vuu.v[1].b[i]-Vvv.v[1].b[i]) ;}'
                },
 'hexagon_V6_vsubbsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.b=vsub(Vuu.b,Vvv.b):sat',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                    '{Vdd.v[0].b[i] = '
                                    'sat8(Vuu.v[0].b[i]-Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                    '= sat8(Vuu.v[1].b[i]-Vvv.v[1].b[i]) ;}'
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
 'hexagon_V6_vmpybv_128B': {
                        'hvx_intrinsic': 'Vdd.h=vmpy(Vu.b,Vv.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] '
                               '= (Vu.h[i].b[0] *Vv.h[i].b[0]);Vdd.v[1].h[i] = '
                               '(Vu.h[i].b[1] *Vv.h[i].b[1]) ;}'
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
'hexagon_V6_vmpyhv_128B': {
                        'hvx_intrinsic': 'Vdd.w=vmpy(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                               '= (Vu.w[i].h[0] *Vv.w[i].h[0]);Vdd.v[1].w[i] = '
                               '(Vu.w[i].h[1] *Vv.w[i].h[1]) ;}'
                },
 'hexagon_V6_vaddb_dv_128B': {
                        'hvx_intrinsic': 'Vdd.b=vadd(Vuu.b,Vvv.b)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                 '{Vdd.v[0].b[i] '
                                 '=(Vuu.v[0].b[i]+Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                 '=(Vuu.v[1].b[i]+Vvv.v[1].b[i]) ;}'
                },
 'hexagon_V6_vaddbsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.b=vadd(Vuu.b,Vvv.b):sat',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                    '{Vdd.v[0].b[i] '
                                    '=sat8(Vuu.v[0].b[i]+Vvv.v[0].b[i]);Vdd.v[1].b[i] '
                                    '=sat8(Vuu.v[1].b[i]+Vvv.v[1].b[i]) ;}'
                },
 'hexagon_V6_vaddh_dv_128B': {
                        'hvx_intrinsic': 'Vdd.h=vadd(Vuu.h,Vvv.h)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                 '{Vdd.v[0].h[i] '
                                 '=(Vuu.v[0].h[i]+Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                 '=(Vuu.v[1].h[i]+Vvv.v[1].h[i]) ;}'
                },
 'hexagon_V6_vaddhsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.h=vadd(Vuu.h,Vvv.h):sat',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                    '{Vdd.v[0].h[i] '
                                    '=sat16(Vuu.v[0].h[i]+Vvv.v[0].h[i]);Vdd.v[1].h[i] '
                                    '=sat16(Vuu.v[1].h[i]+Vvv.v[1].h[i]) ;}'
                },
 'hexagon_V6_vaddhw_128B': {
                        'hvx_intrinsic': 'Vdd.w=vadd(Vu.h,Vv.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
                               '= Vu.w[i].h[0] + Vv.w[i].h[0];Vdd.v[1].w[i] = '
                               'Vu.w[i].h[1] + Vv.w[i].h[1];}'
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
 'hexagon_V6_vadduhw_128B': {
                        'hvx_intrinsic': 'Vdd.w=vadd(Vu.uh,Vv.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vdd.v[0].w[i] = Vu.uw[i].uh[0] '
                                '+Vv.uw[i].uh[0];Vdd.v[1].w[i] = '
                                'Vu.uw[i].uh[1] +Vv.uw[i].uh[1] ;}'
                },
 'hexagon_V6_vadduwsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.uw=vadd(Vuu.uw,Vvv.uw):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                     '{Vdd.v[0].uw[i] '
                                     '=usat32(Vuu.v[0].uw[i]+Vvv.v[0].uw[i]);Vdd.v[1].uw[i] '
                                     '=usat32(Vuu.v[1].uw[i]+Vvv.v[1].uw[i]) '
                                     ';}'
                },
 'hexagon_V6_vaddw_dv_128B': {
                        'hvx_intrinsic': 'Vdd.w=vadd(Vuu.w,Vvv.w)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                 '{Vdd.v[0].w[i] '
                                 '=(Vuu.v[0].w[i]+Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                 '=(Vuu.v[1].w[i]+Vvv.v[1].w[i]) ;}'
                },
 'hexagon_V6_vaddwsat_dv_128B': {
                        'hvx_intrinsic': 'Vdd.w=vadd(Vuu.w,Vvv.w):sat',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                    '{Vdd.v[0].w[i] '
                                    '=sat32(Vuu.v[0].w[i]+Vvv.v[0].w[i]);Vdd.v[1].w[i] '
                                    '=sat32(Vuu.v[1].w[i]+Vvv.v[1].w[i]) ;}'
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
 'hexagon_V6_vshuffh_128B': {
                        'hvx_intrinsic': 'Vd.h=vshuff(Vu.h)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) '
                                '{Vd.uw[i].h[0]=Vu.uh[i];Vd.uw[i].h[1]=Vu.uh[i+VBITS/32] '
                                ';}'
                },
 'hexagon_V6_vshuffb_128B': {
                        'hvx_intrinsic': 'Vd.b=vshuff(Vu.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) '
                                '{Vd.uh[i].b[0]=Vu.ub[i];Vd.uh[i].b[1]=Vu.ub[i+VBITS/16] '
                                ';}'
                },
 'hexagon_V6_vrmpybus_acc_128B': {
                        'hvx_intrinsic': 'Vx.w+=vrmpy(Vu.ub,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] '
                                     '+= (Vu.uw[i].ub[0] * Rt.b[0]);Vx.w[i] += '
                                     '(Vu.uw[i].ub[1] * Rt.b[1]);Vx.w[i] += '
                                     '(Vu.uw[i].ub[2] * Rt.b[2]);Vx.w[i] += '
                                     '(Vu.uw[i].ub[3] * Rt.b[3]) ;}'
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
}
