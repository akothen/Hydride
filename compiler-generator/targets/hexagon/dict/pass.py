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
}
