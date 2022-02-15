Insts = {8: {'hvx_intrinsic': 'Qd4=vcmp.eq(Vu.b,Vv.b)',
     'spec': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = ((Vu.b[i/1] == '
             'Vv.b[i/1]) ?0x1 : 0);}'},
 9: {'hvx_intrinsic': 'Qd4=vcmp.eq(Vu.h,Vv.h)',
     'spec': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = ((Vu.h[i/2] == '
             'Vv.h[i/2]) ?0x3 : 0);}'},
 10: {'hvx_intrinsic': 'Qd4=vcmp.eq(Vu.ub,Vv.ub)',
      'spec': 'Assembler mapped to: "Qd4=vcmp.eq(Vu." "b"",Vv." "b" ")"'},
 11: {'hvx_intrinsic': 'Qd4=vcmp.eq(Vu.uh,Vv.uh)',
      'spec': 'Assembler mapped to: "Qd4=vcmp.eq(Vu." "h"",Vv." "h" ")"'},
 12: {'hvx_intrinsic': 'Qd4=vcmp.eq(Vu.uw,Vv.uw)',
      'spec': 'Assembler mapped to: "Qd4=vcmp.eq(Vu." "w"",Vv." "w" ")"'},
 13: {'hvx_intrinsic': 'Qd4=vcmp.eq(Vu.w,Vv.w)',
      'spec': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = ((Vu.w[i/4] == '
              'Vv.w[i/4]) ?0xF : 0);}'},
 14: {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.b,Vv.b)',
      'spec': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = ((Vu.b[i/1] > '
              'Vv.b[i/1]) ?0x1 : 0);}'},
 15: {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.h,Vv.h)',
      'spec': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = ((Vu.h[i/2] > '
              'Vv.h[i/2]) ?0x3 : 0);}'},
 16: {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.ub,Vv.ub)',
      'spec': 'for( i = 0; i < VWIDTH; i += 1) {QdV[i+1-1:i] = ((Vu.ub[i/1] > '
              'Vv.ub[i/1]) ?0x1 : 0);}'},
 17: {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.uh,Vv.uh)',
      'spec': 'for( i = 0; i < VWIDTH; i += 2) {QdV[i+2-1:i] = ((Vu.uh[i/2] > '
              'Vv.uh[i/2]) ?0x3 : 0);}'},
 18: {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.uw,Vv.uw)',
      'spec': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = ((Vu.uw[i/4] > '
              'Vv.uw[i/4]) ?0xF : 0);}'},
 19: {'hvx_intrinsic': 'Qd4=vcmp.gt(Vu.w,Vv.w)',
      'spec': 'for( i = 0; i < VWIDTH; i += 4) {QdV[i+4-1:i] = ((Vu.w[i/4] > '
              'Vv.w[i/4]) ?0xF : 0);}'},
 20: {'hvx_intrinsic': 'Qd4=vsetq(Rt)',
      'spec': 'for(i = 0; i < VWIDTH; i++) QdV[i]=(i < (Rt &(VWIDTH-1))) ? 1 : '
              '0;'},
 21: {'hvx_intrinsic': 'Qd4=vsetq2(Rt)',
      'spec': 'for(i = 0; i < VWIDTH; i++) QdV[i]=(i <= ((Rt-1)& (VWIDTH-1))) '
              '? 1 : 0;'},
 22: {'hvx_intrinsic': 'Qd4=xor(Qs4,Qt4)',
      'spec': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] ^ QtV[i] ;}'},
 23: {'hvx_intrinsic': 'Qx4&=vcmp.eq(Vu.b,Vv.b)',
      'spec': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = QxV[i+1-1:i] & '
              '((Vu.b[i/1]== Vv.b[i/1]) ? 0x1 : 0);}'},
 24: {'hvx_intrinsic': 'Qx4&=vcmp.eq(Vu.h,Vv.h)',
      'spec': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = QxV[i+2-1:i] & '
              '((Vu.h[i/2]== Vv.h[i/2]) ? 0x3 : 0);}'},
 25: {'hvx_intrinsic': 'Qx4&=vcmp.eq(Vu.ub,Vv.ub)',
      'spec': 'Assembler mapped to: "Qx4&=vcmp.eq(Vu." "b"",Vv." "b" ")"'},
 26: {'hvx_intrinsic': 'Qx4&=vcmp.eq(Vu.uh,Vv.uh)',
      'spec': 'Assembler mapped to: "Qx4&=vcmp.eq(Vu." "h"",Vv." "h" ")"'},
 27: {'hvx_intrinsic': 'Qx4&=vcmp.eq(Vu.uw,Vv.uw)',
      'spec': 'Assembler mapped to: "Qx4&=vcmp.eq(Vu." "w"",Vv." "w" ")"'},
 28: {'hvx_intrinsic': 'Qx4&=vcmp.eq(Vu.w,Vv.w)',
      'spec': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = QxV[i+4-1:i] & '
              '((Vu.w[i/4]== Vv.w[i/4]) ? 0xF : 0);}'},
 29: {'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.b,Vv.b)',
      'spec': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = QxV[i+1-1:i] & '
              '((Vu.b[i/1]> Vv.b[i/1]) ? 0x1 : 0);}'},
 30: {'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.h,Vv.h)',
      'spec': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = QxV[i+2-1:i] & '
              '((Vu.h[i/2]> Vv.h[i/2]) ? 0x3 : 0);}'},
 31: {'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.ub,Vv.ub)',
      'spec': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = QxV[i+1-1:i] '
              '&((Vu.ub[i/1] > Vv.ub[i/1]) ? 0x1 : 0);}'},
 32: {'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.uh,Vv.uh)',
      'spec': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = QxV[i+2-1:i] '
              '&((Vu.uh[i/2] > Vv.uh[i/2]) ? 0x3 : 0);}'},
 33: {'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.uw,Vv.uw)',
      'spec': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = QxV[i+4-1:i] '
              '&((Vu.uw[i/4] > Vv.uw[i/4]) ? 0xF : 0);}'},
 34: {'hvx_intrinsic': 'Qx4&=vcmp.gt(Vu.w,Vv.w)',
      'spec': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = QxV[i+4-1:i] & '
              '((Vu.w[i/4]> Vv.w[i/4]) ? 0xF : 0);}'},
 35: {'hvx_intrinsic': 'Qx4^=vcmp.eq(Vu.b,Vv.b)',
      'spec': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = QxV[i+1-1:i] ^ '
              '((Vu.b[i/1] ==Vv.b[i/1]) ? 0x1 : 0);}'},
 36: {'hvx_intrinsic': 'Qx4^=vcmp.eq(Vu.h,Vv.h)',
      'spec': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = QxV[i+2-1:i] ^ '
              '((Vu.h[i/2] ==Vv.h[i/2]) ? 0x3 : 0);}'},
 37: {'hvx_intrinsic': 'Qx4^=vcmp.eq(Vu.ub,Vv.ub)',
      'spec': 'Assembler mapped to: "Qx4^=vcmp.eq(Vu." "b"",Vv." "b" ")"'},
 38: {'hvx_intrinsic': 'Qx4^=vcmp.eq(Vu.uh,Vv.uh)',
      'spec': 'Assembler mapped to: "Qx4^=vcmp.eq(Vu." "h"",Vv." "h" ")"'},
 39: {'hvx_intrinsic': 'Qx4^=vcmp.eq(Vu.uw,Vv.uw)',
      'spec': 'Assembler mapped to: "Qx4^=vcmp.eq(Vu." "w"",Vv." "w" ")"'},
 40: {'hvx_intrinsic': 'Qx4^=vcmp.eq(Vu.w,Vv.w)',
      'spec': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = QxV[i+4-1:i] ^ '
              '((Vu.w[i/4] ==Vv.w[i/4]) ? 0xF : 0);}'},
 41: {'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.b,Vv.b)',
      'spec': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = QxV[i+1-1:i] ^ '
              '((Vu.b[i/1] >Vv.b[i/1]) ? 0x1 : 0);}'},
 42: {'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.h,Vv.h)',
      'spec': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = QxV[i+2-1:i] ^ '
              '((Vu.h[i/2] >Vv.h[i/2]) ? 0x3 : 0);}'},
 43: {'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.ub,Vv.ub)',
      'spec': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = QxV[i+1-1:i] ^ '
              '((Vu.ub[i/1] >Vv.ub[i/1]) ? 0x1 : 0);}'},
 44: {'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.uh,Vv.uh)',
      'spec': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = QxV[i+2-1:i] ^ '
              '((Vu.uh[i/2] >Vv.uh[i/2]) ? 0x3 : 0);}'},
 45: {'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.uw,Vv.uw)',
      'spec': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = QxV[i+4-1:i] ^ '
              '((Vu.uw[i/4] >Vv.uw[i/4]) ? 0xF : 0);}'},
 46: {'hvx_intrinsic': 'Qx4^=vcmp.gt(Vu.w,Vv.w)',
      'spec': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = QxV[i+4-1:i] ^ '
              '((Vu.w[i/4] >Vv.w[i/4]) ? 0xF : 0);}'},
 47: {'hvx_intrinsic': 'Qx4|=vand(Vu,Rt)',
      'spec': 'for (i = 0; i < VELEM(8); i++) {QxV[i]=QxV[i]|(((Vu.ub[i] & '
              'Rt.ub[i % 4]) != 0) ? 1: 0) ;}'},
 48: {'hvx_intrinsic': 'Qx4|=vcmp.eq(Vu.b,Vv.b)',
      'spec': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = QxV[i+1-1:i] | '
              '((Vu.b[i/1]== Vv.b[i/1]) ? 0x1 : 0);}'},
 49: {'hvx_intrinsic': 'Qx4|=vcmp.eq(Vu.h,Vv.h)',
      'spec': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = QxV[i+2-1:i] | '
              '((Vu.h[i/2]== Vv.h[i/2]) ? 0x3 : 0);}'},
 50: {'hvx_intrinsic': 'Qx4|=vcmp.eq(Vu.ub,Vv.ub)',
      'spec': 'Assembler mapped to: "Qx4|=vcmp.eq(Vu." "b"",Vv." "b" ")"'},
 51: {'hvx_intrinsic': 'Qx4|=vcmp.eq(Vu.uh,Vv.uh)',
      'spec': 'Assembler mapped to: "Qx4|=vcmp.eq(Vu." "h"",Vv." "h" ")"'},
 52: {'hvx_intrinsic': 'Qx4|=vcmp.eq(Vu.uw,Vv.uw)',
      'spec': 'Assembler mapped to: "Qx4|=vcmp.eq(Vu." "w"",Vv." "w" ")"'},
 53: {'hvx_intrinsic': 'Qx4|=vcmp.eq(Vu.w,Vv.w)',
      'spec': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = QxV[i+4-1:i] | '
              '((Vu.w[i/4]== Vv.w[i/4]) ? 0xF : 0);}'},
 54: {'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.b,Vv.b)',
      'spec': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = QxV[i+1-1:i] | '
              '((Vu.b[i/1]> Vv.b[i/1]) ? 0x1 : 0);}'},
 55: {'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.h,Vv.h)',
      'spec': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = QxV[i+2-1:i] | '
              '((Vu.h[i/2]> Vv.h[i/2]) ? 0x3 : 0);}'},
 56: {'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.ub,Vv.ub)',
      'spec': 'for( i = 0; i < VWIDTH; i += 1) {QxV[i+1-1:i] = QxV[i+1-1:i] '
              '|((Vu.ub[i/1] > Vv.ub[i/1]) ? 0x1 : 0);}'},
 57: {'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.uh,Vv.uh)',
      'spec': 'for( i = 0; i < VWIDTH; i += 2) {QxV[i+2-1:i] = QxV[i+2-1:i] '
              '|((Vu.uh[i/2] > Vv.uh[i/2]) ? 0x3 : 0);}'},
 58: {'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.uw,Vv.uw)',
      'spec': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = QxV[i+4-1:i] '
              '|((Vu.uw[i/4] > Vv.uw[i/4]) ? 0xF : 0);}'},
 59: {'hvx_intrinsic': 'Qx4|=vcmp.gt(Vu.w,Vv.w)',
      'spec': 'for( i = 0; i < VWIDTH; i += 4) {QxV[i+4-1:i] = QxV[i+4-1:i] | '
              '((Vu.w[i/4]> Vv.w[i/4]) ? 0xF : 0);}'},
 60: {'hvx_intrinsic': 'Vd.b=vabs(Vu.b)',
      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (ABS(Vu.b[i])) ;}'},
 61: {'hvx_intrinsic': 'Vd.b=vabs(Vu.b):sat',
      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = sat8(ABS(Vu.b[i])) '
              ';}'},
 62: {'hvx_intrinsic': 'Vd.b=vadd(Vu.b,Vv.b)',
      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (Vu.b[i]+Vv.b[i]) ;}'},
 63: {'hvx_intrinsic': 'Vd.b=vadd(Vu.b,Vv.b):sat',
      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = sat8(Vu.b[i]+Vv.b[i]) '
              ';}'},
 64: {'hvx_intrinsic': 'Vd.b=vavg(Vu.b,Vv.b)',
      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (Vu.b[i]+Vv.b[i])/2 '
              ';}'},
 65: {'hvx_intrinsic': 'Vd.b=vavg(Vu.b,Vv.b):rnd',
      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (Vu.b[i]+Vv.b[i]+1)/2 '
              ';}'},
 66: {'hvx_intrinsic': 'Vd.b=vdeal(Vu.b)',
      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i ] = '
              'Vu.uh[i].ub[0];Vd.ub[i+VBITS/16] = Vu.uh[i].ub[1] ;}'},
 67: {'hvx_intrinsic': 'Vd.b=vdeale(Vu.b,Vv.b)',
      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.ub[0+i ] = '
              'Vv.uw[i].ub[0];Vd.ub[VBITS/32+i ] = '
              'Vv.uw[i].ub[2];Vd.ub[2*VBITS/32+i] = '
              'Vu.uw[i].ub[0];Vd.ub[3*VBITS/32+i] = Vu.uw[i].ub[2] ;}'},
 68: {'hvx_intrinsic': 'Vd.b=vlut32(Vu.b,Vv.b,#u3)',
      'spec': 'for (i = 0; i < VELEM(8); i++) {matchval = #u & 0x7;oddhalf = '
              '(#u >> (log2(VECTOR_SIZE)-6)) &0x1;idx = Vu.ub[i];Vd.b[i] = '
              '((idx & 0xE0) == (matchval << 5))? Vv.h[idx % '
              'VBITS/16].b[oddhalf] : 0 ;}'},
 69: {'hvx_intrinsic': 'Vd.b=vlut32(Vu.b,Vv.b,Rt)',
      'spec': 'for (i = 0; i < VELEM(8); i++) {matchval = Rt & 0x7;oddhalf = '
              '(Rt >> (log2(VECTOR_SIZE)-6)) &0x1;idx = Vu.ub[i];Vd.b[i] = '
              '((idx & 0xE0) == (matchval << 5))? Vv.h[idx % '
              'VBITS/16].b[oddhalf] : 0 ;}'},
 70: {'hvx_intrinsic': 'Vd.b=vlut32(Vu.b,Vv.b,Rt):nomatch',
      'spec': 'for (i = 0; i < VELEM(8); i++) {matchval = Rt & 0x7;oddhalf = '
              '(Rt >> (log2(VECTOR_SIZE)-6)) &0x1;idx = Vu.ub[i];idx = '
              '(idx&0x1F) | (matchval<<5);Vd.b[i] = Vv.h[idx % '
              'VBITS/16].b[oddhalf] ;}'},
 71: {'hvx_intrinsic': 'Vd.b=vmax(Vu.b,Vv.b)',
      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (Vu.b[i] > Vv.b[i]) ? '
              'Vu.b[i] :Vv.b[i] ;}'},
 72: {'hvx_intrinsic': 'Vd.b=vmin(Vu.b,Vv.b)',
      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (Vu.b[i] < Vv.b[i]) ? '
              'Vu.b[i] :Vv.b[i] ;}'},
 73: {'hvx_intrinsic': 'Vd.b=vnavg(Vu.b,Vv.b)',
      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (Vu.b[i]-Vv.b[i])/2 '
              ';}'},
 74: {'hvx_intrinsic': 'Vd.b=vnavg(Vu.ub,Vv.ub)',
      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (Vu.ub[i]-Vv.ub[i])/2 '
              ';}'},
 75: {'hvx_intrinsic': 'Vd.b=vpack(Vu.h,Vv.h):sat',
      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.b[i] = '
              'sat8(Vv.h[i]);Vd.b[i+VBITS/16] = sat8(Vu.h[i]) ;}'},
 76: {'hvx_intrinsic': 'Vd.b=vpacke(Vu.h,Vv.h)',
      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
              'Vv.uh[i].ub[0];Vd.ub[i+VBITS/16] = Vu.uh[i].ub[0] ;}'},
 77: {'hvx_intrinsic': 'Vd.b=vpacko(Vu.h,Vv.h)',
      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
              'Vv.uh[i].ub[1];Vd.ub[i+VBITS/16] = Vu.uh[i].ub[1] ;}'},
 78: {'hvx_intrinsic': 'Vd.b=vshuff(Vu.b)',
      'spec': 'for (i = 0; i < VELEM(16); i++) '
              '{Vd.uh[i].b[0]=Vu.ub[i];Vd.uh[i].b[1]=Vu.ub[i+VBITS/16] ;}'},
 79: {'hvx_intrinsic': 'Vd.b=vshuffe(Vu.b,Vv.b)',
      'spec': 'for (i = 0; i < VELEM(16); i++) '
              '{Vd.uh[i].b[0]=Vv.uh[i].ub[0];Vd.uh[i].b[1]=Vu.uh[i].ub[0] ;}'},
 80: {'hvx_intrinsic': 'Vd.b=vshuffo(Vu.b,Vv.b)',
      'spec': 'for (i = 0; i < VELEM(16); i++) '
              '{Vd.uh[i].b[0]=Vv.uh[i].ub[1];Vd.uh[i].b[1]=Vu.uh[i].ub[1] ;}'},
 81: {'hvx_intrinsic': 'Vd.b=vsplat(Rt)',
      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = Rt ;}'},
 82: {'hvx_intrinsic': 'Vd.b=vsub(Vu.b,Vv.b)',
      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (Vu.b[i]-Vv.b[i]) ;}'},
 83: {'hvx_intrinsic': 'Vd.b=vsub(Vu.b,Vv.b):sat',
      'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = sat8(Vu.b[i]-Vv.b[i]) '
              ';}'},
 84: {'hvx_intrinsic': 'Vd.h=vabs(Vu.h)',
      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (ABS(Vu.h[i])) ;}'},
 85: {'hvx_intrinsic': 'Vd.h=vabs(Vu.h):sat',
      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = sat16(ABS(Vu.h[i])) '
              ';}'},
 86: {'hvx_intrinsic': 'Vd.h=vadd(Vu.h,Vv.h)',
      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i]+Vv.h[i]) '
              ';}'},
 87: {'hvx_intrinsic': 'Vd.h=vadd(Vu.h,Vv.h):sat',
      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
              'sat16(Vu.h[i]+Vv.h[i]) ;}'},
 88: {'hvx_intrinsic': 'Vd.h=vavg(Vu.h,Vv.h)',
      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i]+Vv.h[i])/2 '
              ';}'},
 89: {'hvx_intrinsic': 'Vd.h=vavg(Vu.h,Vv.h):rnd',
      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
              '(Vu.h[i]+Vv.h[i]+1)/2 ;}'},
 90: {'hvx_intrinsic': 'Vd.h=vdeal(Vu.h)',
      'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i ] = '
              'Vu.uw[i].uh[0];Vd.uh[i+VBITS/32] = Vu.uw[i].uh[1] ;}'},
 92: {'hvx_intrinsic': 'Vd.h=vlut4(Vu.uh,Rtt.h)',
      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i]= '
              'Rtt.h[((Vu.h[i]>>14)&0x3)] ;}'},
 93: {'hvx_intrinsic': 'Vd.h=vmax(Vu.h,Vv.h)',
      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i] > Vv.h[i]) '
              '? Vu.h[i] :Vv.h[i] ;}'},
 94: {'hvx_intrinsic': 'Vd.h=vmin(Vu.h,Vv.h)',
      'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i] < Vv.h[i]) '
              '? Vu.h[i] :Vv.h[i] ;}'},
 100: {'hvx_intrinsic': 'Vd.h=vnavg(Vu.h,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i]-Vv.h[i])/2 '
               ';}'},
 101: {'hvx_intrinsic': 'Vd.h=vpack(Vu.w,Vv.w):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.h[i] = '
               'sat16(Vv.w[i]);Vd.h[i+VBITS/32] = sat16(Vu.w[i]) ;}'},
 102: {'hvx_intrinsic': 'Vd.h=vpacke(Vu.w,Vv.w)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
               'Vv.uw[i].uh[0];Vd.uh[i+VBITS/32] = Vu.uw[i].uh[0] ;}'},
 103: {'hvx_intrinsic': 'Vd.h=vpacko(Vu.w,Vv.w)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
               'Vv.uw[i].uh[1];Vd.uh[i+VBITS/32] = Vu.uw[i].uh[1] ;}'},
 104: {'hvx_intrinsic': 'Vd.h=vsat(Vu.w,Vv.w)',
       'spec': 'for (i = 0; i < VELEM(32); i++) '
               '{Vd.w[i].h[0]=sat16(Vv.w[i]);Vd.w[i].h[1]=sat16(Vu.w[i]) ;}'},
 105: {'hvx_intrinsic': 'Vd.h=vshuff(Vu.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) '
               '{Vd.uw[i].h[0]=Vu.uh[i];Vd.uw[i].h[1]=Vu.uh[i+VBITS/32] ;}'},
 106: {'hvx_intrinsic': 'Vd.h=vshuffe(Vu.h,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) '
               '{Vd.uw[i].h[0]=Vv.uw[i].uh[0];Vd.uw[i].h[1]=Vu.uw[i].uh[0] ;}'},
 107: {'hvx_intrinsic': 'Vd.h=vshuffo(Vu.h,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) '
               '{Vd.uw[i].h[0]=Vv.uw[i].uh[1];Vd.uw[i].h[1]=Vu.uw[i].uh[1] ;}'},
 108: {'hvx_intrinsic': 'Vd.h=vsplat(Rt)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Rt ;}'},
 109: {'hvx_intrinsic': 'Vd.h=vsub(Vu.h,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i]-Vv.h[i]) '
               ';}'},
 110: {'hvx_intrinsic': 'Vd.h=vsub(Vu.h,Vv.h):sat',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
               'sat16(Vu.h[i]-Vv.h[i]) ;}'},
 111: {'hvx_intrinsic': 'Vd.ub=vabs(Vu.b)',
       'spec': 'Assembler mapped to: "Vd.b=vabs(Vu.b)"'},
 112: {'hvx_intrinsic': 'Vd.ub=vabsdiff(Vu.ub,Vv.ub)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = (Vu.ub[i] > '
               'Vv.ub[i]) ? (Vu.ub[i]- Vv.ub[i]) : (Vv.ub[i] - Vu.ub[i]) ;}'},
 113: {'hvx_intrinsic': 'Vd.ub=vadd(Vu.ub,Vv.b):sat',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = usat8(Vu.ub[i] + '
               'Vv.b[i]) ;}'},
 114: {'hvx_intrinsic': 'Vd.ub=vadd(Vu.ub,Vv.ub):sat',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
               'usat8(Vu.ub[i]+Vv.ub[i]) ;}'},
 115: {'hvx_intrinsic': 'Vd.ub=vavg(Vu.ub,Vv.ub)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
               '(Vu.ub[i]+Vv.ub[i])/2 ;}'},
 116: {'hvx_intrinsic': 'Vd.ub=vavg(Vu.ub,Vv.ub):rnd',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
               '(Vu.ub[i]+Vv.ub[i]+1)/2 ;}'},
 117: {'hvx_intrinsic': 'Vd.ub=vmax(Vu.ub,Vv.ub)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = (Vu.ub[i] > '
               'Vv.ub[i]) ? Vu.ub[i]: Vv.ub[i] ;}'},
 118: {'hvx_intrinsic': 'Vd.ub=vmin(Vu.ub,Vv.ub)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = (Vu.ub[i] < '
               'Vv.ub[i]) ? Vu.ub[i]: Vv.ub[i] ;}'},
 119: {'hvx_intrinsic': 'Vd.ub=vpack(Vu.h,Vv.h):sat',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
               'usat8(Vv.h[i]);Vd.ub[i+VBITS/16] = usat8(Vu.h[i]) ;}'},
 120: {'hvx_intrinsic': 'Vd.ub=vsat(Vu.h,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(16); i++) '
               '{Vd.uh[i].b[0]=usat8(Vv.h[i]);Vd.uh[i].b[1]=usat8(Vu.h[i]) ;}'},
 121: {'hvx_intrinsic': 'Vd.ub=vsub(Vu.ub,Vv.b):sat',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = usat8(Vu.ub[i] - '
               'Vv.b[i]) ;}'},
 122: {'hvx_intrinsic': 'Vd.ub=vsub(Vu.ub,Vv.ub):sat',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
               'usat8(Vu.ub[i]-Vv.ub[i]) ;}'},
 123: {'hvx_intrinsic': 'Vd.uh=vabs(Vu.h)',
       'spec': 'Assembler mapped to: "Vd.h=vabs(Vu.h)"'},
 124: {'hvx_intrinsic': 'Vd.uh=vabsdiff(Vu.h,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = (Vu.h[i] > '
               'Vv.h[i]) ? (Vu.h[i] -Vv.h[i]) : (Vv.h[i] - Vu.h[i]) ;}'},
 125: {'hvx_intrinsic': 'Vd.uh=vabsdiff(Vu.uh,Vv.uh)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = (Vu.uh[i] > '
               'Vv.uh[i]) ? (Vu.uh[i]- Vv.uh[i]) : (Vv.uh[i] - Vu.uh[i]) ;}'},
 126: {'hvx_intrinsic': 'Vd.uh=vadd(Vu.uh,Vv.uh):sat',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
               'usat16(Vu.uh[i]+Vv.uh[i]) ;}'},
 127: {'hvx_intrinsic': 'Vd.uh=vavg(Vu.uh,Vv.uh)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
               '(Vu.uh[i]+Vv.uh[i])/2 ;}'},
 128: {'hvx_intrinsic': 'Vd.uh=vavg(Vu.uh,Vv.uh):rnd',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
               '(Vu.uh[i]+Vv.uh[i]+1)/2 ;}'},
 129: {'hvx_intrinsic': 'Vd.uh=vmax(Vu.uh,Vv.uh)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = (Vu.uh[i] > '
               'Vv.uh[i]) ? Vu.uh[i]: Vv.uh[i] ;}'},
 130: {'hvx_intrinsic': 'Vd.uh=vmin(Vu.uh,Vv.uh)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = (Vu.uh[i] < '
               'Vv.uh[i]) ? Vu.uh[i]: Vv.uh[i] ;}'},
 131: {'hvx_intrinsic': 'Vd.uh=vpack(Vu.w,Vv.w):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
               'usat16(Vv.w[i]);Vd.uh[i+VBITS/32] = usat16(Vu.w[i]) ;}'},
 132: {'hvx_intrinsic': 'Vd.uh=vsat(Vu.uw,Vv.uw)',
       'spec': 'for (i = 0; i < VELEM(32); i++) '
               '{Vd.w[i].h[0]=usat16(Vv.uw[i]);Vd.w[i].h[1]=usat16(Vu.uw[i]) '
               ';}'},
 133: {'hvx_intrinsic': 'Vd.uh=vsub(Vu.uh,Vv.uh):sat',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
               'usat16(Vu.uh[i]-Vv.uh[i]) ;}'},
 134: {'hvx_intrinsic': 'Vd.uw=vabs(Vu.w)',
       'spec': 'Assembler mapped to: "Vd.w=vabs(Vu.w)"'},
 135: {'hvx_intrinsic': 'Vd.uw=vabsdiff(Vu.w,Vv.w)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = (Vu.w[i] > '
               'Vv.w[i]) ? (Vu.w[i] -Vv.w[i]) : (Vv.w[i] - Vu.w[i]) ;}'},
 136: {'hvx_intrinsic': 'Vd.uw=vadd(Vu.uw,Vv.uw):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
               'usat32(Vu.uw[i]+Vv.uw[i]) ;}'},
 137: {'hvx_intrinsic': 'Vd.uw=vavg(Vu.uw,Vv.uw)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
               '(Vu.uw[i]+Vv.uw[i])/2 ;}'},
 138: {'hvx_intrinsic': 'Vd.uw=vavg(Vu.uw,Vv.uw):rnd',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
               '(Vu.uw[i]+Vv.uw[i]+1)/2 ;}'},
 141: {'hvx_intrinsic': 'Vd.uw=vrmpy(Vu.ub,Vv.ub)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = (Vu.uw[i].ub[0] '
               '*Vv.uw[i].ub[0]);Vd.uw[i] += (Vu.uw[i].ub[1] '
               '*Vv.uw[i].ub[1]);Vd.uw[i] += (Vu.uw[i].ub[2] '
               '*Vv.uw[i].ub[2]);Vd.uw[i] += (Vu.uw[i].ub[3] *Vv.uw[i].ub[3]) '
               ';}'},
 142: {'hvx_intrinsic': 'Vd.uw=vsub(Vu.uw,Vv.uw):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
               'usat32(Vu.uw[i]-Vv.uw[i]) ;}'},
 143: {'hvx_intrinsic': 'Vd.w,Qe4=vadd(Vu.w,Vv.w):carry',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
               'Vu.w[i]+Vv.w[i];QeV[4*i+4-1:4*i] = '
               '-carry_from(Vu.w[i],Vv.w[i],0) ;}'},
 144: {'hvx_intrinsic': 'Vd.w,Qe4=vsub(Vu.w,Vv.w):carry',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
               'Vu.w[i]+~Vv.w[i]+1;QeV[4*i+4-1:4*i] = '
               '-carry_from(Vu.w[i],~Vv.w[i],1) ;}'},
 145: {'hvx_intrinsic': 'Vd.w=vabs(Vu.w)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (ABS(Vu.w[i])) ;}'},
 146: {'hvx_intrinsic': 'Vd.w=vabs(Vu.w):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = sat32(ABS(Vu.w[i])) '
               ';}'},
 147: {'hvx_intrinsic': 'Vd.w=vadd(Vu.w,Vv.w)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i]+Vv.w[i]) '
               ';}'},
 148: {'hvx_intrinsic': 'Vd.w=vadd(Vu.w,Vv.w):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
               'sat32(Vu.w[i]+Vv.w[i]) ;}'},
 149: {'hvx_intrinsic': 'Vd.w=vadd(Vu.w,Vv.w,Qs4):carry:sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
               'sat32(Vu.w[i]+Vv.w[i]+QsV[i*4]) ;}'},
 150: {'hvx_intrinsic': 'Vd.w=vadd(Vu.w,Vv.w,Qx4):carry',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
               'Vu.w[i]+Vv.w[i]+QxV[i*4];QxV[4*i+4-1:4*i] = '
               '-carry_from(Vu.w[i],Vv.w[i],QxV[i*4]) ;}'},
 151: {'hvx_intrinsic': 'Vd.w=vavg(Vu.w,Vv.w)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i]+Vv.w[i])/2 '
               ';}'},
 152: {'hvx_intrinsic': 'Vd.w=vavg(Vu.w,Vv.w):rnd',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
               '(Vu.w[i]+Vv.w[i]+1)/2 ;}'},
 153: {'hvx_intrinsic': 'Vd.w=vdmpy(Vu.h,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i].h[0] * '
               'Rt.b[(2*i+0)%4]);Vd.w[i] += (Vu.w[i].h[1] * '
               'Rt.b[(2*i+1)%4]);}'},
 154: {'hvx_intrinsic': 'Vd.w=vdmpy(Vu.h,Rt.h):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {accum = (Vu.w[i].h[0] * '
               'Rt.h[0]);accum += (Vu.w[i].h[1] * Rt.h[1]);Vd.w[i] = '
               'sat32(accum) ;}'},
 155: {'hvx_intrinsic': 'Vd.w=vdmpy(Vu.h,Rt.uh):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {accum = (Vu.w[i].h[0] * '
               'Rt.uh[0]);accum += (Vu.w[i].h[1] * Rt.uh[1]);Vd.w[i] = '
               'sat32(accum) ;}'},
 156: {'hvx_intrinsic': 'Vd.w=vdmpy(Vu.h,Vv.h):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {accum = (Vu.w[i].h[0] * '
               'Vv.w[i].h[0]);accum += (Vu.w[i].h[1] * Vv.w[i].h[1]);Vd.w[i] = '
               'sat32(accum) ;}'},
 157: {'hvx_intrinsic': 'Vd.w=vdmpy(Vuu.h,Rt.h):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {accum = (Vuu.v[0].w[i].h[1] * '
               'Rt.h[0]);accum += (Vuu.v[1].w[i].h[0] * Rt.h[1]);Vd.w[i] = '
               'sat32(accum) ;}'},
 158: {'hvx_intrinsic': 'Vd.w=vdmpy(Vuu.h,Rt.uh,#1):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {accum = (Vuu.v[0].w[i].h[1] * '
               'Rt.uh[0]);accum += (Vuu.v[1].w[i].h[0] * Rt.uh[1]);Vd.w[i] = '
               'sat32(accum) ;}'},
 159: {'hvx_intrinsic': 'Vd.w=vmax(Vu.w,Vv.w)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] > Vv.w[i]) '
               '? Vu.w[i] :Vv.w[i] ;}'},
 160: {'hvx_intrinsic': 'Vd.w=vmin(Vu.w,Vv.w)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] < Vv.w[i]) '
               '? Vu.w[i] :Vv.w[i] ;}'},
 161: {'hvx_intrinsic': 'Vd.w=vmpye(Vu.w,Vv.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] * '
               'Vv.w[i].uh[0]) >> 16 ;}'},
 162: {'hvx_intrinsic': 'Vd.w=vmpyi(Vu.w,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] * Rt.b[i % '
               '4]) ;}'},
 163: {'hvx_intrinsic': 'Vd.w=vmpyi(Vu.w,Rt.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] * Rt.h[i % '
               '2]) ;}'},
 164: {'hvx_intrinsic': 'Vd.w=vmpyi(Vu.w,Rt.ub)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] * Rt.ub[i '
               '% 4]) ;}'},
 165: {'hvx_intrinsic': 'Vd.w=vmpyie(Vu.w,Vv.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] * '
               'Vv.w[i].uh[0]) ;}'},
 166: {'hvx_intrinsic': 'Vd.w=vmpyieo(Vu.h,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
               '(Vu.w[i].h[0]*Vv.w[i].h[1]) << 16;}'},
 167: {'hvx_intrinsic': 'Vd.w=vmpyio(Vu.w,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] * '
               'Vv.w[i].h[1]) ;}'},
 168: {'hvx_intrinsic': 'Vd.w=vmpyo(Vu.w,Vv.h):<<1:rnd:sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = sat32(((((Vu.w[i] * '
               'Vv.w[i].h[1])>> 14) + 1) >> 1)) ;}'},
 169: {'hvx_intrinsic': 'Vd.w=vmpyo(Vu.w,Vv.h):<<1:sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = sat32(((((Vu.w[i] * '
               'Vv.w[i].h[1])>> 14) + 1) >> 1)) ;}'},
 170: {'hvx_intrinsic': 'Vd.w=vnavg(Vu.w,Vv.w)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i]-Vv.w[i])/2 '
               ';}'},
 171: {'hvx_intrinsic': 'Vd.w=vrmpy(Vu.b,Vv.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i].b[0] * '
               'Vv.w[i].b[0]);Vd.w[i] += (Vu.w[i].b[1] * Vv.w[i].b[1]);Vd.w[i] '
               '+= (Vu.w[i].b[2] * Vv.w[i].b[2]);Vd.w[i] += (Vu.w[i].b[3] * '
               'Vv.w[i].b[3]) ;}'},
 172: {'hvx_intrinsic': 'Vd.w=vrmpy(Vu.ub,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.uw[i].ub[0] * '
               'Rt.b[0]);Vd.w[i] += (Vu.uw[i].ub[1] * Rt.b[1]);Vd.w[i] += '
               '(Vu.uw[i].ub[2] * Rt.b[2]);Vd.w[i] += (Vu.uw[i].ub[3] * '
               'Rt.b[3]) ;}'},
 173: {'hvx_intrinsic': 'Vd.w=vrmpy(Vu.ub,Vv.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.uw[i].ub[0] * '
               'Vv.w[i].b[0]);Vd.w[i] += (Vu.uw[i].ub[1] * '
               'Vv.w[i].b[1]);Vd.w[i] += (Vu.uw[i].ub[2] * '
               'Vv.w[i].b[2]);Vd.w[i] += (Vu.uw[i].ub[3] * Vv.w[i].b[3]) ;}'},
 174: {'hvx_intrinsic': 'Vd.w=vsatdw(Vu.w, Vv.w)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
               'usat32(Vu.w[i]:Vv.w[i]) ;}'},
 175: {'hvx_intrinsic': 'Vd.w=vsub(Vu.w,Vv.w)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i]-Vv.w[i]) '
               ';}'},
 176: {'hvx_intrinsic': 'Vd.w=vsub(Vu.w,Vv.w):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
               'sat32(Vu.w[i]-Vv.w[i]) ;}'},
 177: {'hvx_intrinsic': 'Vd.w=vsub(Vu.w,Vv.w,Qx4):carry',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
               'Vu.w[i]+~Vv.w[i]+QxV[i*4];QxV[4*i+4-1:4*i] = '
               '-carry_from(Vu.w[i],~Vv.w[i],QxV[i*4]) ;}'},
 178: {'hvx_intrinsic': 'Vd=Vu',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i]=Vu.w[i] ;}'},
 179: {'hvx_intrinsic': 'Vd=valign(Vu,Vv,#u3)',
       'spec': 'for(i = 0; i < VWIDTH; i++) {Vd.ub[i] = (i+#u>=VWIDTH) ? '
               'Vu.ub[i+#u-VWIDTH] : Vv.ub[i+#u];}'},
 180: {'hvx_intrinsic': 'Vd=valign(Vu,Vv,Rt)',
       'spec': 'unsigned shift = Rt & (VWIDTH-1);for(i = 0; i < VWIDTH; i++) '
               '{Vd.ub[i] = (i+shift>=VWIDTH) ?Vu.ub[i+shift-VWIDTH] : '
               'Vv.ub[i+shift];}'},
 181: {'hvx_intrinsic': 'Vd=vand(!Qu4,Rt)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = !QuV[i] ? Rt.ub[i % '
               '4] : 0 ;}'},
 182: {'hvx_intrinsic': 'Vd=vand(!Qv4,Vu)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = !QvV[i] ? Vu.b[i] : '
               '0 ;}'},
 183: {'hvx_intrinsic': 'Vd=vand(Qu4,Rt)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = QuV[i] ? Rt.ub[i % '
               '4] : 0 ;}'},
 184: {'hvx_intrinsic': 'Vd=vand(Qv4,Vu)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = QvV[i] ? Vu.b[i] : 0 '
               ';}'},
 185: {'hvx_intrinsic': 'Vd=vand(Vu,Vv)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Vu.uh[i] & Vv.h[i] '
               ';}'},
 186: {'hvx_intrinsic': 'Vd=vdelta(Vu,Vv)',
       'spec': 'for (offset=VWIDTH; (offset>>=1)>0; ) {for (k = 0; k<VWIDTH; '
               'k++) {Vd.ub[k] = (Vv.ub[k]&offset) ?Vu.ub[k^offset] : '
               'Vu.ub[k];}for (k = 0; k<VWIDTH; k++) {Vu.ub[k] = Vd.ub[k];}}'},
 187: {'hvx_intrinsic': 'Vd=vlalign(Vu,Vv,#u3)',
       'spec': 'unsigned shift = VWIDTH - #u;for(i = 0; i < VWIDTH; i++) '
               '{Vd.ub[i] = (i+shift>=VWIDTH) ?Vu.ub[i+shift-VWIDTH] : '
               'Vv.ub[i+shift];}'},
 188: {'hvx_intrinsic': 'Vd=vlalign(Vu,Vv,Rt)',
       'spec': 'unsigned shift = VWIDTH - (Rt & (VWIDTH-1));for(i = 0; i < '
               'VWIDTH; i++) {Vd.ub[i] = (i+shift>=VWIDTH) '
               '?Vu.ub[i+shift-VWIDTH] : Vv.ub[i+shift];}'},
 189: {'hvx_intrinsic': 'Vd=vmux(Qt4,Vu,Vv)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = QtV[i] ? Vu.ub[i] : '
               'Vv.ub[i] ;}'},
 190: {'hvx_intrinsic': 'Vd=vnot(Vu)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = ~Vu.uh[i] ;}'},
 191: {'hvx_intrinsic': 'Vd=vor(Vu,Vv)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Vu.uh[i] | Vv.h[i] '
               ';}'},
 192: {'hvx_intrinsic': 'Vd=vrdelta(Vu,Vv)',
       'spec': 'for (offset=1; offset<VWIDTH; offset<<=1){for (k = 0; '
               'k<VWIDTH; k++) {Vd.ub[k] = (Vv.ub[k]&offset) ?Vu.ub[k^offset] '
               ': Vu.ub[k];}for (k = 0; k<VWIDTH; k++) {Vu.ub[k] = '
               'Vd.ub[k];}}'},
 193: {'hvx_intrinsic': 'Vd=vror(Vu,Rt)',
       'spec': 'for (k=0;k<VWIDTH;k++) {Vd.ub[k] = Vu.ub[(k+Rt)&(VWIDTH-1)];}'},
 194: {'hvx_intrinsic': 'Vd=vsathub(Vu,Vv)',
       'spec': 'Assembler mapped to: "Vd.ub=vsat(Vu.h,Vv.h)"'},
 195: {'hvx_intrinsic': 'Vd=vsatuwuh(Vu,Vv)',
       'spec': 'Assembler mapped to: "Vd.uh=vsat(Vu.uw,Vv.uw)"'},
 196: {'hvx_intrinsic': 'Vd=vsatwh(Vu,Vv)',
       'spec': 'Assembler mapped to: "Vd.h=vsat(Vu.w,Vv.w)"'},
 197: {'hvx_intrinsic': 'Vd=vsplat(Rt)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = Rt ;}'},
 198: {'hvx_intrinsic': 'Vd=vxor(Vu,Vv)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Vu.uh[i] ^ Vv.h[i] '
               ';}'},
 199: {'hvx_intrinsic': 'Vdd.b=vadd(Vuu.b,Vvv.b)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].b[i] '
               '=(Vuu.v[0].b[i]+Vvv.v[0].b[i]);Vdd.v[1].b[i] '
               '=(Vuu.v[1].b[i]+Vvv.v[1].b[i]) ;}'},
 200: {'hvx_intrinsic': 'Vdd.b=vadd(Vuu.b,Vvv.b):sat',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].b[i] '
               '=sat8(Vuu.v[0].b[i]+Vvv.v[0].b[i]);Vdd.v[1].b[i] '
               '=sat8(Vuu.v[1].b[i]+Vvv.v[1].b[i]) ;}'},
 201: {'hvx_intrinsic': 'Vdd.b=vshuffoe(Vu.b,Vv.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) '
               '{Vdd.v[0].uh[i].b[0]=Vv.uh[i].ub[0];Vdd.v[0].uh[i].b[1]=Vu.uh[i].ub[0];Vdd.v[1].uh[i].b[0]=Vv.uh[i].ub[1];Vdd.v[1].uh[i].b[1]=Vu.uh[i].ub[1] '
               ';}'},
 202: {'hvx_intrinsic': 'Vdd.b=vsub(Vuu.b,Vvv.b)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].b[i] = '
               '(Vuu.v[0].b[i]-Vvv.v[0].b[i]);Vdd.v[1].b[i] = '
               '(Vuu.v[1].b[i]-Vvv.v[1].b[i]) ;}'},
 203: {'hvx_intrinsic': 'Vdd.b=vsub(Vuu.b,Vvv.b):sat',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].b[i] = '
               'sat8(Vuu.v[0].b[i]-Vvv.v[0].b[i]);Vdd.v[1].b[i] = '
               'sat8(Vuu.v[1].b[i]-Vvv.v[1].b[i]) ;}'},
 204: {'hvx_intrinsic': 'Vdd.h=vadd(Vu.ub,Vv.ub)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
               'Vu.uh[i].ub[0] +Vv.uh[i].ub[0];Vdd.v[1].h[i] = Vu.uh[i].ub[1] '
               '+Vv.uh[i].ub[1] ;}'},
 205: {'hvx_intrinsic': 'Vdd.h=vadd(Vuu.h,Vvv.h)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] '
               '=(Vuu.v[0].h[i]+Vvv.v[0].h[i]);Vdd.v[1].h[i] '
               '=(Vuu.v[1].h[i]+Vvv.v[1].h[i]) ;}'},
 206: {'hvx_intrinsic': 'Vdd.h=vadd(Vuu.h,Vvv.h):sat',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] '
               '=sat16(Vuu.v[0].h[i]+Vvv.v[0].h[i]);Vdd.v[1].h[i] '
               '=sat16(Vuu.v[1].h[i]+Vvv.v[1].h[i]) ;}'},
 207: {'hvx_intrinsic': 'Vdd.h=vdmpy(Vuu.ub,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
               '(Vuu.v[0].uh[i].ub[0] *Rt.b[(2*i) % 4]);Vdd.v[0].h[i] += '
               '(Vuu.v[0].uh[i].ub[1] *Rt.b[(2*i+1)%4]);Vdd.v[1].h[i] = '
               '(Vuu.v[0].uh[i].ub[1] *Rt.b[(2*i) % 4]);Vdd.v[1].h[i] += '
               '(Vuu.v[1].uh[i].ub[0] *Rt.b[(2*i+1)%4]) ;}'},
 208: {'hvx_intrinsic': 'Vdd.h=vlut16(Vu.b,Vv.h,#u3)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {matchval = #u & 0xF;oddhalf = '
               '(#u >> (log2(VECTOR_SIZE)-6)) &0x1;idx = '
               'Vu.uh[i].ub[0];Vdd.v[0].h[i] = ((idx & 0xF0) ==(matchval << '
               '4)) ? Vv.w[idx %VBITS/32].h[oddhalf] : 0;idx = '
               'Vu.uh[i].ub[1];Vdd.v[1].h[i] = ((idx & 0xF0) ==(matchval << '
               '4)) ? Vv.w[idx %VBITS/32].h[oddhalf] : 0 ;}'},
 209: {'hvx_intrinsic': 'Vdd.h=vlut16(Vu.b,Vv.h,Rt)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {matchval = Rt & 0xF;oddhalf = '
               '(Rt >> (log2(VECTOR_SIZE)-6)) &0x1;idx = '
               'Vu.uh[i].ub[0];Vdd.v[0].h[i] = ((idx & 0xF0) ==(matchval << '
               '4)) ? Vv.w[idx %VBITS/32].h[oddhalf] : 0;idx = '
               'Vu.uh[i].ub[1];Vdd.v[1].h[i] = ((idx & 0xF0) ==(matchval << '
               '4)) ? Vv.w[idx %VBITS/32].h[oddhalf] : 0 ;}'},
 210: {'hvx_intrinsic': 'Vdd.h=vlut16(Vu.b,Vv.h,Rt):nomatch',
       'spec': 'for (i = 0; i < VELEM(16); i++) {matchval = Rt & 0xF;oddhalf = '
               '(Rt >> (log2(VECTOR_SIZE)-6)) &0x1;idx = Vu.uh[i].ub[0];idx = '
               '(idx&0x0F) | (matchval<<4);Vdd.v[0].h[i] = Vv.w[idx '
               '%VBITS/32].h[oddhalf];idx = Vu.uh[i].ub[1];idx = (idx&0x0F) | '
               '(matchval<<4);Vdd.v[1].h[i] = Vv.w[idx %VBITS/32].h[oddhalf] '
               ';}'},
 211: {'hvx_intrinsic': 'Vdd.h=vmpa(Vuu.ub,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
               '(Vuu.v[0].uh[i].ub[0] *Rt.b[0]) + (Vuu.v[1].uh[i].ub[0] * '
               'Rt.b[1]);Vdd.v[1].h[i] = (Vuu.v[0].uh[i].ub[1] *Rt.b[2]) + '
               '(Vuu.v[1].uh[i].ub[1] * Rt.b[3]) ;}'},
 212: {'hvx_intrinsic': 'Vdd.h=vmpa(Vuu.ub,Rt.ub)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].uh[i] = '
               '(Vuu.v[0].uh[i].ub[0] *Rt.ub[0]) + (Vuu.v[1].uh[i].ub[0] * '
               'Rt.ub[1]);Vdd.v[1].uh[i] = (Vuu.v[0].uh[i].ub[1] *Rt.ub[2]) + '
               '(Vuu.v[1].uh[i].ub[1] * Rt.ub[3]) ;}'},
 213: {'hvx_intrinsic': 'Vdd.h=vmpa(Vuu.ub,Vvv.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
               '(Vuu.v[0].uh[i].ub[0] *Vvv.v[0].uh[i].b[0]) + '
               '(Vuu.v[1].uh[i].ub[0] *Vvv.v[1].uh[i].b[0]);Vdd.v[1].h[i] = '
               '(Vuu.v[0].uh[i].ub[1] *Vvv.v[0].uh[i].b[1]) + '
               '(Vuu.v[1].uh[i].ub[1] *Vvv.v[1].uh[i].b[1]) ;}'},
 214: {'hvx_intrinsic': 'Vdd.h=vmpa(Vuu.ub,Vvv.ub)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
               '(Vuu.v[0].uh[i].ub[0] *Vvv.v[0].uh[i].ub[0]) + '
               '(Vuu.v[1].uh[i].ub[0] *Vvv.v[1].uh[i].ub[0]);Vdd.v[1].h[i] = '
               '(Vuu.v[0].uh[i].ub[1] *Vvv.v[0].uh[i].ub[1]) + '
               '(Vuu.v[1].uh[i].ub[1] *Vvv.v[1].uh[i].ub[1]) ;}'},
 215: {'hvx_intrinsic': 'Vdd.h=vmpy(Vu.b,Vv.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = (Vu.h[i].b[0] '
               '*Vv.h[i].b[0]);Vdd.v[1].h[i] = (Vu.h[i].b[1] *Vv.h[i].b[1]) '
               ';}'},
 216: {'hvx_intrinsic': 'Vdd.h=vmpy(Vu.ub,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
               '(Vu.uh[i].ub[0] *Rt.b[(2*i+0)%4]);Vdd.v[1].h[i] = '
               '(Vu.uh[i].ub[1] *Rt.b[(2*i+1)%4]) ;}'},
 217: {'hvx_intrinsic': 'Vdd.h=vmpy(Vu.ub,Vv.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
               '(Vu.uh[i].ub[0] *Vv.h[i].b[0]);Vdd.v[1].h[i] = (Vu.uh[i].ub[1] '
               '*Vv.h[i].b[1]) ;}'},
 218: {'hvx_intrinsic': 'Vdd.h=vshuffoe(Vu.h,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) '
               '{Vdd.v[0].uw[i].h[0]=Vv.uw[i].uh[0];Vdd.v[0].uw[i].h[1]=Vu.uw[i].uh[0];Vdd.v[1].uw[i].h[0]=Vv.uw[i].uh[1];Vdd.v[1].uw[i].h[1]=Vu.uw[i].uh[1] '
               ';}'},
 219: {'hvx_intrinsic': 'Vdd.h=vsub(Vu.ub,Vv.ub)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
               'Vu.uh[i].ub[0] -Vv.uh[i].ub[0];Vdd.v[1].h[i] = Vu.uh[i].ub[1] '
               '-Vv.uh[i].ub[1] ;}'},
 220: {'hvx_intrinsic': 'Vdd.h=vsub(Vuu.h,Vvv.h)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
               '(Vuu.v[0].h[i]-Vvv.v[0].h[i]);Vdd.v[1].h[i] = '
               '(Vuu.v[1].h[i]-Vvv.v[1].h[i]) ;}'},
 221: {'hvx_intrinsic': 'Vdd.h=vsub(Vuu.h,Vvv.h):sat',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
               'sat16(Vuu.v[0].h[i]-Vvv.v[0].h[i]);Vdd.v[1].h[i] = '
               'sat16(Vuu.v[1].h[i]-Vvv.v[1].h[i]) ;}'},
 222: {'hvx_intrinsic': 'Vdd.h=vsxt(Vu.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
               'Vu.h[i].b[0];Vdd.v[1].h[i] = Vu.h[i].b[1] ;}'},
 223: {'hvx_intrinsic': 'Vdd.h=vtmpy(Vuu.b,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
               '(Vuu.v[0].h[i].b[0] *Rt.b[(2*i )%4]);Vdd.v[0].h[i] += '
               '(Vuu.v[0].h[i].b[1] *Rt.b[(2*i+1)%4]);Vdd.v[0].h[i] += '
               'Vuu.v[1].h[i].b[0];Vdd.v[1].h[i] = (Vuu.v[0].h[i].b[1] '
               '*Rt.b[(2*i )%4]);Vdd.v[1].h[i] += (Vuu.v[1].h[i].b[0] '
               '*Rt.b[(2*i+1)%4]);Vdd.v[1].h[i] += Vuu.v[1].h[i].b[1] ;}'},
 224: {'hvx_intrinsic': 'Vdd.h=vtmpy(Vuu.ub,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
               '(Vuu.v[0].uh[i].ub[0] *Rt.b[(2*i )%4]);Vdd.v[0].h[i] += '
               '(Vuu.v[0].uh[i].ub[1] *Rt.b[(2*i+1)%4]);Vdd.v[0].h[i] += '
               'Vuu.v[1].uh[i].ub[0];Vdd.v[1].h[i] = (Vuu.v[0].uh[i].ub[1] '
               '*Rt.b[(2*i )%4]);Vdd.v[1].h[i] += (Vuu.v[1].uh[i].ub[0] '
               '*Rt.b[(2*i+1)%4]);Vdd.v[1].h[i] += Vuu.v[1].uh[i].ub[1] ;}'},
 225: {'hvx_intrinsic': 'Vdd.h=vunpack(Vu.b)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.h[i] = Vu.b[i] ;}'},
 226: {'hvx_intrinsic': 'Vdd.ub=vadd(Vuu.ub,Vvv.ub):sat',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].ub[i] '
               '=usat8(Vuu.v[0].ub[i]+Vvv.v[0].ub[i]);Vdd.v[1].ub[i] '
               '=usat8(Vuu.v[1].ub[i]+Vvv.v[1].ub[i]) ;}'},
 227: {'hvx_intrinsic': 'Vdd.ub=vsub(Vuu.ub,Vvv.ub):sat',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].ub[i] = '
               'usat8(Vuu.v[0].ub[i]-Vvv.v[0].ub[i]);Vdd.v[1].ub[i] = '
               'usat8(Vuu.v[1].ub[i]-Vvv.v[1].ub[i]) ;}'},
 228: {'hvx_intrinsic': 'Vdd.uh=vadd(Vuu.uh,Vvv.uh):sat',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].uh[i] '
               '=usat16(Vuu.v[0].uh[i]+Vvv.v[0].uh[i]);Vdd.v[1].uh[i] '
               '=usat16(Vuu.v[1].uh[i]+Vvv.v[1].uh[i]) ;}'},
 229: {'hvx_intrinsic': 'Vdd.uh=vmpy(Vu.ub,Rt.ub)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].uh[i] = '
               '(Vu.uh[i].ub[0] *Rt.ub[(2*i+0)%4]);Vdd.v[1].uh[i] = '
               '(Vu.uh[i].ub[1] *Rt.ub[(2*i+1)%4]) ;}'},
 230: {'hvx_intrinsic': 'Vdd.uh=vmpy(Vu.ub,Vv.ub)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].uh[i] = '
               '(Vu.uh[i].ub[0] *Vv.uh[i].ub[0]);Vdd.v[1].uh[i] = '
               '(Vu.uh[i].ub[1] *Vv.uh[i].ub[1]) ;}'},
 231: {'hvx_intrinsic': 'Vdd.uh=vsub(Vuu.uh,Vvv.uh):sat',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].uh[i] = '
               'usat16(Vuu.v[0].uh[i]-Vvv.v[0].uh[i]);Vdd.v[1].uh[i] = '
               'usat16(Vuu.v[1].uh[i]-Vvv.v[1].uh[i]) ;}'},
 232: {'hvx_intrinsic': 'Vdd.uh=vunpack(Vu.ub)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.uh[i] = Vu.ub[i] ;}'},
 233: {'hvx_intrinsic': 'Vdd.uh=vzxt(Vu.ub)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].uh[i] = '
               'Vu.uh[i].ub[0];Vdd.v[1].uh[i] = Vu.uh[i].ub[1] ;}'},
 234: {'hvx_intrinsic': 'Vdd.uw=vadd(Vuu.uw,Vvv.uw):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].uw[i] '
               '=usat32(Vuu.v[0].uw[i]+Vvv.v[0].uw[i]);Vdd.v[1].uw[i] '
               '=usat32(Vuu.v[1].uw[i]+Vvv.v[1].uw[i]) ;}'},
 235: {'hvx_intrinsic': 'Vdd.uw=vdsad(Vuu.uh,Rt.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].uw[i] = '
               'ABS(Vuu.v[0].uw[i].uh[0] -Rt.uh[0]);Vdd.v[0].uw[i] += '
               'ABS(Vuu.v[0].uw[i].uh[1] -Rt.uh[1]);Vdd.v[1].uw[i] = '
               'ABS(Vuu.v[0].uw[i].uh[1] -Rt.uh[0]);Vdd.v[1].uw[i] += '
               'ABS(Vuu.v[1].uw[i].uh[0] -Rt.uh[1]) ;}'},
 236: {'hvx_intrinsic': 'Vdd.uw=vmpy(Vu.uh,Rt.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].uw[i] = '
               '(Vu.uw[i].uh[0] *Rt.uh[0]);Vdd.v[1].uw[i] = (Vu.uw[i].uh[1] * '
               'Rt.uh[1]);}'},
 237: {'hvx_intrinsic': 'Vdd.uw=vmpy(Vu.uh,Vv.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].uw[i] = '
               '(Vu.uw[i].uh[0] *Vv.uw[i].uh[0]);Vdd.v[1].uw[i] = '
               '(Vu.uw[i].uh[1] *Vv.uw[i].uh[1]) ;}'},
 238: {'hvx_intrinsic': 'Vdd.uw=vrmpy(Vuu.ub,Rt.ub,#u1)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].uw[i] = (Vuu.v[#u '
               '?1:0].uw[i].ub[0] * Rt.ub[(0-#u) & 0x3]);Vdd.v[0].uw[i] += '
               '(Vuu.v[0 ].uw[i].ub[1] *Rt.ub[(1-#u) & 0x3]);Vdd.v[0].uw[i] += '
               '(Vuu.v[0 ].uw[i].ub[2] *Rt.ub[(2-#u) & 0x3]);Vdd.v[0].uw[i] += '
               '(Vuu.v[0 ].uw[i].ub[3] *Rt.ub[(3-#u) & 0x3]);Vdd.v[1].uw[i] = '
               '(Vuu.v[1 ].uw[i].ub[0] *Rt.ub[(2-#u) & 0x3]);Vdd.v[1].uw[i] += '
               '(Vuu.v[1 ].uw[i].ub[1] *Rt.ub[(3-#u) & 0x3]);Vdd.v[1].uw[i] += '
               '(Vuu.v[#u ?1:0].uw[i].ub[2] * Rt.ub[(0-#u) & '
               '0x3]);Vdd.v[1].uw[i] += (Vuu.v[0 ].uw[i].ub[3] *Rt.ub[(1-#u) & '
               '0x3]) ;}'},
 239: {'hvx_intrinsic': 'Vdd.uw=vrsad(Vuu.ub,Rt.ub,#u1)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].uw[i] '
               '=ABS(Vuu.v[#u?1:0].uw[i].ub[0] - '
               'Rt.ub[(0-#u)&3]);Vdd.v[0].uw[i] += ABS(Vuu.v[0 ].uw[i].ub[1]- '
               'Rt.ub[(1-#u)&3]);Vdd.v[0].uw[i] += ABS(Vuu.v[0 ].uw[i].ub[2]- '
               'Rt.ub[(2-#u)&3]);Vdd.v[0].uw[i] += ABS(Vuu.v[0 ].uw[i].ub[3]- '
               'Rt.ub[(3-#u)&3]);Vdd.v[1].uw[i] = ABS(Vuu.v[1 ].uw[i].ub[0] '
               '-Rt.ub[(2-#u)&3]);Vdd.v[1].uw[i] += ABS(Vuu.v[1 ].uw[i].ub[1]- '
               'Rt.ub[(3-#u)&3]);Vdd.v[1].uw[i] '
               '+=ABS(Vuu.v[#u?1:0].uw[i].ub[2] - '
               'Rt.ub[(0-#u)&3]);Vdd.v[1].uw[i] += ABS(Vuu.v[0 ].uw[i].ub[3]- '
               'Rt.ub[(1-#u)&3]) ;}'},
 240: {'hvx_intrinsic': 'Vdd.uw=vsub(Vuu.uw,Vvv.uw):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].uw[i] = '
               'usat32(Vuu.v[0].uw[i]-Vvv.v[0].uw[i]);Vdd.v[1].uw[i] = '
               'usat32(Vuu.v[1].uw[i]-Vvv.v[1].uw[i]) ;}'},
 241: {'hvx_intrinsic': 'Vdd.uw=vunpack(Vu.uh)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.uw[i] = Vu.uh[i] ;}'},
 242: {'hvx_intrinsic': 'Vdd.uw=vzxt(Vu.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].uw[i] = '
               'Vu.uw[i].uh[0];Vdd.v[1].uw[i] = Vu.uw[i].uh[1] ;}'},
 243: {'hvx_intrinsic': 'Vdd.w=vadd(Vu.h,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = Vu.w[i].h[0] '
               '+ Vv.w[i].h[0];Vdd.v[1].w[i] = Vu.w[i].h[1] + Vv.w[i].h[1];}'},
 244: {'hvx_intrinsic': 'Vdd.w=vadd(Vu.uh,Vv.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = '
               'Vu.uw[i].uh[0] +Vv.uw[i].uh[0];Vdd.v[1].w[i] = Vu.uw[i].uh[1] '
               '+Vv.uw[i].uh[1] ;}'},
 245: {'hvx_intrinsic': 'Vdd.w=vadd(Vuu.w,Vvv.w)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
               '=(Vuu.v[0].w[i]+Vvv.v[0].w[i]);Vdd.v[1].w[i] '
               '=(Vuu.v[1].w[i]+Vvv.v[1].w[i]) ;}'},
 246: {'hvx_intrinsic': 'Vdd.w=vadd(Vuu.w,Vvv.w):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] '
               '=sat32(Vuu.v[0].w[i]+Vvv.v[0].w[i]);Vdd.v[1].w[i] '
               '=sat32(Vuu.v[1].w[i]+Vvv.v[1].w[i]) ;}'},
 247: {'hvx_intrinsic': 'Vdd.w=vdmpy(Vuu.h,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = '
               '(Vuu.v[0].w[i].h[0] *Rt.b[(2*i+0)%4]);Vdd.v[0].w[i] += '
               '(Vuu.v[0].w[i].h[1] *Rt.b[(2*i+1)%4]);Vdd.v[1].w[i] = '
               '(Vuu.v[0].w[i].h[1] *Rt.b[(2*i+0)%4]);Vdd.v[1].w[i] += '
               '(Vuu.v[1].w[i].h[0] *Rt.b[(2*i+1)%4]) ;}'},
 248: {'hvx_intrinsic': 'Vdd.w=vmpa(Vuu.h,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = '
               '(Vuu.v[0].w[i].h[0] *Rt.b[0]) + (Vuu.v[1].w[i].h[0] * '
               'Rt.b[1]);Vdd.v[1].w[i] = (Vuu.v[0].w[i].h[1] *Rt.b[2]) + '
               '(Vuu.v[1].w[i].h[1] * Rt.b[3]) ;}'},
 249: {'hvx_intrinsic': 'Vdd.w=vmpa(Vuu.uh,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = '
               '(Vuu.v[0].w[i].uh[0] *Rt.b[0]) + (Vuu.v[1].w[i].uh[0] * '
               'Rt.b[1]);Vdd.v[1].w[i] = (Vuu.v[0].w[i].uh[1] *Rt.b[2]) + '
               '(Vuu.v[1].w[i].uh[1] * Rt.b[3]) ;}'},
 250: {'hvx_intrinsic': 'Vdd.w=vmpy(Vu.h,Rt.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = (Vu.w[i].h[0] '
               '* Rt.h[0]);Vdd.v[1].w[i] = (Vu.w[i].h[1] * Rt.h[1]) ;}'},
 251: {'hvx_intrinsic': 'Vdd.w=vmpy(Vu.h,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = (Vu.w[i].h[0] '
               '*Vv.w[i].h[0]);Vdd.v[1].w[i] = (Vu.w[i].h[1] *Vv.w[i].h[1]) '
               ';}'},
 252: {'hvx_intrinsic': 'Vdd.w=vmpy(Vu.h,Vv.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = (Vu.w[i].h[0] '
               '*Vv.uw[i].uh[0]);Vdd.v[1].w[i] = (Vu.w[i].h[1] '
               '*Vv.uw[i].uh[1]) ;}'},
 253: {'hvx_intrinsic': 'Vdd.w=vrmpy(Vuu.ub,Rt.b,#u1)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = (Vuu.v[#u ? '
               '1:0].uw[i].ub[0]* Rt.b[(0-#u) & 0x3]);Vdd.v[0].w[i] += '
               '(Vuu.v[0 ].uw[i].ub[1] *Rt.b[(1-#u) & 0x3]);Vdd.v[0].w[i] += '
               '(Vuu.v[0 ].uw[i].ub[2] *Rt.b[(2-#u) & 0x3]);Vdd.v[0].w[i] += '
               '(Vuu.v[0 ].uw[i].ub[3] *Rt.b[(3-#u) & 0x3]);Vdd.v[1].w[i] = '
               '(Vuu.v[1 ].uw[i].ub[0] *Rt.b[(2-#u) & 0x3]);Vdd.v[1].w[i] += '
               '(Vuu.v[1 ].uw[i].ub[1] *Rt.b[(3-#u) & 0x3]);Vdd.v[1].w[i] += '
               '(Vuu.v[#u ?1:0].uw[i].ub[2] * Rt.b[(0-#u) & '
               '0x3]);Vdd.v[1].w[i] += (Vuu.v[0 ].uw[i].ub[3] *Rt.b[(1-#u) & '
               '0x3]) ;}'},
 254: {'hvx_intrinsic': 'Vdd.w=vsub(Vu.h,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = Vu.w[i].h[0] '
               '- Vv.w[i].h[0];Vdd.v[1].w[i] = Vu.w[i].h[1] - Vv.w[i].h[1];}'},
 255: {'hvx_intrinsic': 'Vdd.w=vsub(Vu.uh,Vv.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = '
               'Vu.uw[i].uh[0] -Vv.uw[i].uh[0];Vdd.v[1].w[i] = Vu.uw[i].uh[1] '
               '-Vv.uw[i].uh[1] ;}'},
 256: {'hvx_intrinsic': 'Vdd.w=vsub(Vuu.w,Vvv.w)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = '
               '(Vuu.v[0].w[i]-Vvv.v[0].w[i]);Vdd.v[1].w[i] = '
               '(Vuu.v[1].w[i]-Vvv.v[1].w[i]) ;}'},
 257: {'hvx_intrinsic': 'Vdd.w=vsub(Vuu.w,Vvv.w):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = '
               'sat32(Vuu.v[0].w[i]-Vvv.v[0].w[i]);Vdd.v[1].w[i] = '
               'sat32(Vuu.v[1].w[i]-Vvv.v[1].w[i]) ;}'},
 258: {'hvx_intrinsic': 'Vdd.w=vsxt(Vu.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = '
               'Vu.w[i].h[0];Vdd.v[1].w[i] = Vu.w[i].h[1] ;}'},
 259: {'hvx_intrinsic': 'Vdd.w=vtmpy(Vuu.h,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vdd.v[0].w[i] = '
               '(Vuu.v[0].w[i].h[0] *Rt.b[(2*i+0)%4]);Vdd.v[0].w[i]+= '
               '(Vuu.v[0].w[i].h[1] *Rt.b[(2*i+1)%4]);Vdd.v[0].w[i]+= '
               'Vuu.v[1].w[i].h[0];Vdd.v[1].w[i] = (Vuu.v[0].w[i].h[1] '
               '*Rt.b[(2*i+0)%4]);Vdd.v[1].w[i]+= (Vuu.v[1].w[i].h[0] '
               '*Rt.b[(2*i+1)%4]);Vdd.v[1].w[i]+= Vuu.v[1].w[i].h[1] ;}'},
 260: {'hvx_intrinsic': 'Vdd.w=vunpack(Vu.h)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vdd.w[i] = Vu.h[i] ;}'},
 261: {'hvx_intrinsic': 'Vdd=vcombine(Vu,Vv)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].ub[i] = '
               'Vv.ub[i];Vdd.v[1].ub[i] = Vu.ub[i] ;}'},
 262: {'hvx_intrinsic': 'Vdd=vdeal(Vu,Vv,Rt)',
       'spec': 'Vdd.v[0] = Vv;Vdd.v[1] = Vu;for (offset=VWIDTH>>1; offset>0; '
               'offset>>=1) {if ( Rt & offset) {for (k = 0; k < VELEM(8); k++) '
               '{if (!( k & offset)) '
               '{SWAP(Vdd.v[1].ub[k],Vdd.v[0].ub[k+offset]);}}}}'},
 263: {'hvx_intrinsic': 'Vdd=vmpye(Vu.w,Vv.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {prod = (Vu.w[i] * '
               'Vv.w[i].uh[0]);Vdd.v[1].w[i] = prod >> 16;Vdd.v[0].w[i] = prod '
               '<< 16 ;}'},
 264: {'hvx_intrinsic': 'Vdd=vshuff(Vu,Vv,Rt)',
       'spec': 'Vdd.v[0] = Vv;Vdd.v[1] = Vu;for (offset=1; offset<VWIDTH; '
               'offset<<=1) {if ( Rt & offset) {for (k = 0; k < VELEM(8); k++) '
               '{if (!( k & offset)) '
               '{SWAP(Vdd.v[1].ub[k],Vdd.v[0].ub[k+offset]);}}}}'},
 265: {'hvx_intrinsic': 'Vdd=vswap(Qt4,Vu,Vv)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vdd.v[0].ub[i] = QtV[i] ? '
               'Vu.ub[i] :Vv.ub[i];Vdd.v[1].ub[i] = !QtV[i] ? Vu.ub[i] '
               ':Vv.ub[i] ;}'},
 266: {'hvx_intrinsic': 'Vdd=vsxtb(Vu)',
       'spec': 'Assembler mapped to: "Vdd.h=vsxt(Vu.b)"'},
 267: {'hvx_intrinsic': 'Vdd=vsxth(Vu)',
       'spec': 'Assembler mapped to: "Vdd.w=vsxt(Vu.h)"'},
 268: {'hvx_intrinsic': 'Vdd=vzxtb(Vu)',
       'spec': 'Assembler mapped to: "Vdd.uh=vzxt(Vu.ub)"'},
 269: {'hvx_intrinsic': 'Vdd=vzxth(Vu)',
       'spec': 'Assembler mapped to: "Vdd.uw=vzxt(Vu.uh)"'},
 270: {'hvx_intrinsic': 'Vx.b|=vlut32(Vu.b,Vv.b,#u3)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {matchval = #u & 0x7;oddhalf = '
               '(#u >> (log2(VECTOR_SIZE)-6)) &0x1;idx = Vu.ub[i];Vx.b[i] |= '
               '((idx & 0xE0) == (matchval <<5)) ? Vv.h[idx % '
               'VBITS/16].b[oddhalf] : 0 ;}'},
 271: {'hvx_intrinsic': 'Vx.b|=vlut32(Vu.b,Vv.b,Rt)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {matchval = Rt & 0x7;oddhalf = '
               '(Rt >> (log2(VECTOR_SIZE)-6)) &0x1;idx = Vu.ub[i];Vx.b[i] |= '
               '((idx & 0xE0) == (matchval <<5)) ? Vv.h[idx % '
               'VBITS/16].b[oddhalf] : 0 ;}'},
 272: {'hvx_intrinsic': 'Vx.h+=vdmpy(Vu.ub,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i] += (Vu.uh[i].ub[0] * '
               'Rt.b[(2*i) %4]);Vx.h[i] += (Vu.uh[i].ub[1] *Rt.b[(2*i+1)%4]) '
               ';}'},
 273: {'hvx_intrinsic': 'Vx.h+=vmpyi(Vu.h,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i] += (Vu.h[i] * Rt.b[i '
               '% 4]) ;}'},
 274: {'hvx_intrinsic': 'Vx.h+=vmpyi(Vu.h,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i] += (Vu.h[i] * '
               'Vv.h[i]) ;}'},
 275: {'hvx_intrinsic': 'Vx.h=vmpa(Vx.h,Vu.h,Rtt.h):sat',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i]= sat16(( ( (Vx.h[i] * '
               'Vu.h[i])<<1)+ (Rtt.h[( (Vu.h[i]>>14)&0x3)]<<15))>>16) ;}'},
 276: {'hvx_intrinsic': 'Vx.h=vmpa(Vx.h,Vu.uh,Rtt.uh):sat',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i]= sat16(( (Vx.h[i] * '
               'Vu.uh[i]) +(Rtt.uh[((Vu.uh[i]>>14)&0x3)]<<15))>>16) ;}'},
 277: {'hvx_intrinsic': 'Vx.h=vmps(Vx.h,Vu.uh,Rtt.uh):sat',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vx.h[i]= sat16(( (Vx.h[i] * '
               'Vu.uh[i]) -(Rtt.uh[((Vu.uh[i]>>14)&0x3)]<<15))>>16) ;}'},
 278: {'hvx_intrinsic': 'Vx.uw+=vmpye(Vu.uh,Rt.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.uw[i] += (Vu.uw[i].uh[0] * '
               'Rt.uh[0]) ;}'},
 279: {'hvx_intrinsic': 'Vx.uw+=vrmpy(Vu.ub,Rt.ub)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.uw[i] += (Vu.uw[i].ub[0] * '
               'Rt.ub[0]);Vx.uw[i] += (Vu.uw[i].ub[1] * Rt.ub[1]);Vx.uw[i] += '
               '(Vu.uw[i].ub[2] * Rt.ub[2]);Vx.uw[i] += (Vu.uw[i].ub[3] * '
               'Rt.ub[3]) ;}'},
 280: {'hvx_intrinsic': 'Vx.uw+=vrmpy(Vu.ub,Vv.ub)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.uw[i] += (Vu.uw[i].ub[0] '
               '*Vv.uw[i].ub[0]);Vx.uw[i] += (Vu.uw[i].ub[1] '
               '*Vv.uw[i].ub[1]);Vx.uw[i] += (Vu.uw[i].ub[2] '
               '*Vv.uw[i].ub[2]);Vx.uw[i] += (Vu.uw[i].ub[3] *Vv.uw[i].ub[3]) '
               ';}'},
 281: {'hvx_intrinsic': 'Vx.w+=vdmpy(Vu.h,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += (Vu.w[i].h[0] * '
               'Rt.b[(2*i+0)%4]);Vx.w[i] += (Vu.w[i].h[1] * '
               'Rt.b[(2*i+1)%4]);}'},
 282: {'hvx_intrinsic': 'Vx.w+=vdmpy(Vu.h,Rt.h):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {accum = Vx.w[i];accum += '
               '(Vu.w[i].h[0] * Rt.h[0]);accum += (Vu.w[i].h[1] * '
               'Rt.h[1]);Vx.w[i] = sat32(accum) ;}'},
 283: {'hvx_intrinsic': 'Vx.w+=vdmpy(Vu.h,Rt.uh):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {accum=Vx.w[i];accum += '
               '(Vu.w[i].h[0] * Rt.uh[0]);accum += (Vu.w[i].h[1] * '
               'Rt.uh[1]);Vx.w[i] = sat32(accum) ;}'},
 284: {'hvx_intrinsic': 'Vx.w+=vdmpy(Vu.h,Vv.h):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {accum = (Vu.w[i].h[0] * '
               'Vv.w[i].h[0]);accum += (Vu.w[i].h[1] * Vv.w[i].h[1]);Vx.w[i] = '
               'sat32(Vx.w[i]+accum) ;}'},
 285: {'hvx_intrinsic': 'Vx.w+=vdmpy(Vuu.h,Rt.h):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {accum = Vx.w[i];accum += '
               '(Vuu.v[0].w[i].h[1] * Rt.h[0]);accum += (Vuu.v[1].w[i].h[0] * '
               'Rt.h[1]);Vx.w[i] = sat32(accum) ;}'},
 286: {'hvx_intrinsic': 'Vx.w+=vdmpy(Vuu.h,Rt.uh,#1):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {accum=Vx.w[i];accum += '
               '(Vuu.v[0].w[i].h[1] * Rt.uh[0]);accum += (Vuu.v[1].w[i].h[0] * '
               'Rt.uh[1]);Vx.w[i] = sat32(accum) ;}'},
 287: {'hvx_intrinsic': 'Vx.w+=vmpyi(Vu.w,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += (Vu.w[i] * Rt.b[i '
               '% 4]) ;}'},
 288: {'hvx_intrinsic': 'Vx.w+=vmpyi(Vu.w,Rt.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += (Vu.w[i] * Rt.h[i '
               '% 2]) ;}'},
 289: {'hvx_intrinsic': 'Vx.w+=vmpyi(Vu.w,Rt.ub)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += (Vu.w[i] * Rt.ub[i '
               '% 4]) ;}'},
 290: {'hvx_intrinsic': 'Vx.w+=vmpyie(Vu.w,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] = Vx.w[i] + (Vu.w[i] '
               '* Vv.w[i].h[0]);}'},
 291: {'hvx_intrinsic': 'Vx.w+=vmpyie(Vu.w,Vv.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] = Vx.w[i] + (Vu.w[i] '
               '*Vv.w[i].uh[0]) ;}'},
 292: {'hvx_intrinsic': 'Vx.w+=vmpyo(Vu.w,Vv.h):<<1:rnd:sat:shift',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] = sat32(((((Vx.w[i] + '
               '(Vu.w[i] *Vv.w[i].h[1])) >> 14) + 1) >> 1)) ;}'},
 293: {'hvx_intrinsic': 'Vx.w+=vmpyo(Vu.w,Vv.h):<<1:sat:shift',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] = sat32(((((Vx.w[i] + '
               '(Vu.w[i] *Vv.w[i].h[1])) >> 14) + 1) >> 1)) ;}'},
 294: {'hvx_intrinsic': 'Vx.w+=vrmpy(Vu.b,Vv.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += (Vu.w[i].b[0] * '
               'Vv.w[i].b[0]);Vx.w[i] += (Vu.w[i].b[1] * Vv.w[i].b[1]);Vx.w[i] '
               '+= (Vu.w[i].b[2] * Vv.w[i].b[2]);Vx.w[i] += (Vu.w[i].b[3] * '
               'Vv.w[i].b[3]) ;}'},
 295: {'hvx_intrinsic': 'Vx.w+=vrmpy(Vu.ub,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += (Vu.uw[i].ub[0] * '
               'Rt.b[0]);Vx.w[i] += (Vu.uw[i].ub[1] * Rt.b[1]);Vx.w[i] += '
               '(Vu.uw[i].ub[2] * Rt.b[2]);Vx.w[i] += (Vu.uw[i].ub[3] * '
               'Rt.b[3]) ;}'},
 296: {'hvx_intrinsic': 'Vx.w+=vrmpy(Vu.ub,Vv.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += (Vu.uw[i].ub[0] * '
               'Vv.w[i].b[0]);Vx.w[i] += (Vu.uw[i].ub[1] * '
               'Vv.w[i].b[1]);Vx.w[i] += (Vu.uw[i].ub[2] * '
               'Vv.w[i].b[2]);Vx.w[i] += (Vu.uw[i].ub[3] * Vv.w[i].b[3]) ;}'},
 297: {'hvx_intrinsic': 'Vx.w=vinsert(Rt)', 'spec': 'Vx.uw[0] = Rt;'},
 298: {'hvx_intrinsic': 'Vxx+=vmpyo(Vu.w,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {prod = (Vu.w[i] * '
               'Vv.w[i].h[1]) +Vxx.v[1].w[i];Vxx.v[1].w[i] = prod >> '
               '16;Vxx.v[0].w[i].h[0]=Vxx.v[0].w[i] >> '
               '16;Vxx.v[0].w[i].h[1]=prod & 0x0000ffff ;}'},
 299: {'hvx_intrinsic': 'Vxx.h+=vadd(Vu.ub,Vv.ub)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vxx.v[0].h[i] += '
               'Vu.h[i].ub[0] +Vv.h[i].ub[0];Vxx.v[1].h[i] += Vu.h[i].ub[1] '
               '+Vv.h[i].ub[1] ;}'},
 300: {'hvx_intrinsic': 'Vxx.h+=vdmpy(Vuu.ub,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vxx.v[0].h[i] += '
               '(Vuu.v[0].uh[i].ub[0] *Rt.b[(2*i) % 4]);Vxx.v[0].h[i] += '
               '(Vuu.v[0].uh[i].ub[1] *Rt.b[(2*i+1)%4]);Vxx.v[1].h[i] += '
               '(Vuu.v[0].uh[i].ub[1] *Rt.b[(2*i) % 4]);Vxx.v[1].h[i] += '
               '(Vuu.v[1].uh[i].ub[0] *Rt.b[(2*i+1)%4]) ;}'},
 301: {'hvx_intrinsic': 'Vxx.h+=vmpa(Vuu.ub,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vxx.v[0].h[i] += '
               '(Vuu.v[0].uh[i].ub[0] *Rt.b[0]) + (Vuu.v[1].uh[i].ub[0] * '
               'Rt.b[1]);Vxx.v[1].h[i] += (Vuu.v[0].uh[i].ub[1] *Rt.b[2]) + '
               '(Vuu.v[1].uh[i].ub[1] * Rt.b[3]) ;}'},
 302: {'hvx_intrinsic': 'Vxx.h+=vmpa(Vuu.ub,Rt.ub)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vxx.v[0].uh[i] += '
               '(Vuu.v[0].uh[i].ub[0] *Rt.ub[0]) + (Vuu.v[1].uh[i].ub[0] * '
               'Rt.ub[1]);Vxx.v[1].uh[i] += (Vuu.v[0].uh[i].ub[1] *Rt.ub[2]) + '
               '(Vuu.v[1].uh[i].ub[1] * Rt.ub[3]) ;}'},
 303: {'hvx_intrinsic': 'Vxx.h+=vmpy(Vu.b,Vv.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vxx.v[0].h[i] += '
               '(Vu.h[i].b[0] *Vv.h[i].b[0]);Vxx.v[1].h[i] += (Vu.h[i].b[1] '
               '*Vv.h[i].b[1]) ;}'},
 304: {'hvx_intrinsic': 'Vxx.h+=vmpy(Vu.ub,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vxx.v[0].h[i] += '
               '(Vu.uh[i].ub[0] *Rt.b[(2*i+0)%4]);Vxx.v[1].h[i] += '
               '(Vu.uh[i].ub[1] *Rt.b[(2*i+1)%4]) ;}'},
 305: {'hvx_intrinsic': 'Vxx.h+=vmpy(Vu.ub,Vv.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vxx.v[0].h[i] += '
               '(Vu.uh[i].ub[0] *Vv.h[i].b[0]);Vxx.v[1].h[i] += '
               '(Vu.uh[i].ub[1] *Vv.h[i].b[1]) ;}'},
 306: {'hvx_intrinsic': 'Vxx.h+=vtmpy(Vuu.b,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vxx.v[0].h[i] += '
               '(Vuu.v[0].h[i].b[0] *Rt.b[(2*i )%4]);Vxx.v[0].h[i] += '
               '(Vuu.v[0].h[i].b[1] *Rt.b[(2*i+1)%4]);Vxx.v[0].h[i] += '
               'Vuu.v[1].h[i].b[0];Vxx.v[1].h[i] += (Vuu.v[0].h[i].b[1] '
               '*Rt.b[(2*i )%4]);Vxx.v[1].h[i] += (Vuu.v[1].h[i].b[0] '
               '*Rt.b[(2*i+1)%4]);Vxx.v[1].h[i] += Vuu.v[1].h[i].b[1] ;}'},
 307: {'hvx_intrinsic': 'Vxx.h+=vtmpy(Vuu.ub,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vxx.v[0].h[i] += '
               '(Vuu.v[0].uh[i].ub[0] *Rt.b[(2*i )%4]);Vxx.v[0].h[i] += '
               '(Vuu.v[0].uh[i].ub[1] *Rt.b[(2*i+1)%4]);Vxx.v[0].h[i] += '
               'Vuu.v[1].uh[i].ub[0];Vxx.v[1].h[i] += (Vuu.v[0].uh[i].ub[1] '
               '*Rt.b[(2*i )%4]);Vxx.v[1].h[i] += (Vuu.v[1].uh[i].ub[0] '
               '*Rt.b[(2*i+1)%4]);Vxx.v[1].h[i] += Vuu.v[1].uh[i].ub[1] ;}'},
 308: {'hvx_intrinsic': 'Vxx.h|=vlut16(Vu.b,Vv.h,#u3)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {matchval = #u & 0xF;oddhalf = '
               '(#u >> (log2(VECTOR_SIZE)-6)) &0x1;idx = '
               'Vu.uh[i].ub[0];Vxx.v[0].h[i] |= ((idx & 0xF0) ==(matchval << '
               '4)) ? Vv.w[idx %VBITS/32].h[oddhalf] : 0;idx = '
               'Vu.uh[i].ub[1];Vxx.v[1].h[i] |= ((idx & 0xF0) ==(matchval << '
               '4)) ? Vv.w[idx %VBITS/32].h[oddhalf] : 0 ;}'},
 309: {'hvx_intrinsic': 'Vxx.h|=vlut16(Vu.b,Vv.h,Rt)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {matchval = Rt.ub[0] & '
               '0xF;oddhalf = (Rt >> (log2(VECTOR_SIZE)-6)) &0x1;idx = '
               'Vu.uh[i].ub[0];Vxx.v[0].h[i] |= ((idx & 0xF0) ==(matchval << '
               '4)) ? Vv.w[idx %VBITS/32].h[oddhalf] : 0;idx = '
               'Vu.uh[i].ub[1];Vxx.v[1].h[i] |= ((idx & 0xF0) ==(matchval << '
               '4)) ? Vv.w[idx %VBITS/32].h[oddhalf] : 0 ;}'},
 310: {'hvx_intrinsic': 'Vxx.h|=vunpacko(Vu.b)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vxx.uh[i] |= Vu.ub[i]<<8 ;}'},
 311: {'hvx_intrinsic': 'Vxx.uh+=vmpy(Vu.ub,Rt.ub)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vxx.v[0].uh[i] += '
               '(Vu.uh[i].ub[0] *Rt.ub[(2*i+0)%4]);Vxx.v[1].uh[i] += '
               '(Vu.uh[i].ub[1] *Rt.ub[(2*i+1)%4]) ;}'},
 312: {'hvx_intrinsic': 'Vxx.uh+=vmpy(Vu.ub,Vv.ub)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vxx.v[0].uh[i] += '
               '(Vu.uh[i].ub[0] *Vv.uh[i].ub[0]);Vxx.v[1].uh[i] += '
               '(Vu.uh[i].ub[1] *Vv.uh[i].ub[1]) ;}'},
 313: {'hvx_intrinsic': 'Vxx.uw+=vdsad(Vuu.uh,Rt.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vxx.v[0].uw[i] += '
               'ABS(Vuu.v[0].uw[i].uh[0] -Rt.uh[0]);Vxx.v[0].uw[i] += '
               'ABS(Vuu.v[0].uw[i].uh[1] -Rt.uh[1]);Vxx.v[1].uw[i] += '
               'ABS(Vuu.v[0].uw[i].uh[1] -Rt.uh[0]);Vxx.v[1].uw[i] += '
               'ABS(Vuu.v[1].uw[i].uh[0] -Rt.uh[1]) ;}'},
 314: {'hvx_intrinsic': 'Vxx.uw+=vmpy(Vu.uh,Rt.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vxx.v[0].uw[i] += '
               '(Vu.uw[i].uh[0] *Rt.uh[0]);Vxx.v[1].uw[i] += (Vu.uw[i].uh[1] '
               '*Rt.uh[1]) ;}'},
 315: {'hvx_intrinsic': 'Vxx.uw+=vmpy(Vu.uh,Vv.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vxx.v[0].uw[i] += '
               '(Vu.uw[i].uh[0] *Vv.uw[i].uh[0]);Vxx.v[1].uw[i] += '
               '(Vu.uw[i].uh[1] *Vv.uw[i].uh[1]) ;}'},
 316: {'hvx_intrinsic': 'Vxx.uw+=vrmpy(Vuu.ub,Rt.ub,#u1)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vxx.v[0].uw[i] += (Vuu.v[#u '
               '?1:0].uw[i].ub[0] * Rt.ub[(0-#u) & 0x3]);Vxx.v[0].uw[i] += '
               '(Vuu.v[0 ].uw[i].ub[1] *Rt.ub[(1-#u) & 0x3]);Vxx.v[0].uw[i] += '
               '(Vuu.v[0 ].uw[i].ub[2] *Rt.ub[(2-#u) & 0x3]);Vxx.v[0].uw[i] += '
               '(Vuu.v[0 ].uw[i].ub[3] *Rt.ub[(3-#u) & 0x3]);Vxx.v[1].uw[i] += '
               '(Vuu.v[1 ].uw[i].ub[0] *Rt.ub[(2-#u) & 0x3]);Vxx.v[1].uw[i] += '
               '(Vuu.v[1 ].uw[i].ub[1] *Rt.ub[(3-#u) & 0x3]);Vxx.v[1].uw[i] += '
               '(Vuu.v[#u ?1:0].uw[i].ub[2] * Rt.ub[(0-#u) & '
               '0x3]);Vxx.v[1].uw[i] += (Vuu.v[0 ].uw[i].ub[3] *Rt.ub[(1-#u) & '
               '0x3]) ;}'},
 317: {'hvx_intrinsic': 'Vxx.uw+=vrsad(Vuu.ub,Rt.ub,#u1)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vxx.v[0].uw[i] '
               '+=ABS(Vuu.v[#u?1:0].uw[i].ub[0] - '
               'Rt.ub[(0-#u)&3]);Vxx.v[0].uw[i] += ABS(Vuu.v[0 ].uw[i].ub[1]- '
               'Rt.ub[(1-#u)&3]);Vxx.v[0].uw[i] += ABS(Vuu.v[0 ].uw[i].ub[2]- '
               'Rt.ub[(2-#u)&3]);Vxx.v[0].uw[i] += ABS(Vuu.v[0 ].uw[i].ub[3]- '
               'Rt.ub[(3-#u)&3]);Vxx.v[1].uw[i] += ABS(Vuu.v[1 ].uw[i].ub[0]- '
               'Rt.ub[(2-#u)&3]);Vxx.v[1].uw[i] += ABS(Vuu.v[1 ].uw[i].ub[1]- '
               'Rt.ub[(3-#u)&3]);Vxx.v[1].uw[i] '
               '+=ABS(Vuu.v[#u?1:0].uw[i].ub[2] - '
               'Rt.ub[(0-#u)&3]);Vxx.v[1].uw[i] += ABS(Vuu.v[0 ].uw[i].ub[3]- '
               'Rt.ub[(1-#u)&3]) ;}'},
 318: {'hvx_intrinsic': 'Vxx.w+=vadd(Vu.h,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vxx.v[0].w[i] += Vu.w[i].h[0] '
               '+Vv.w[i].h[0];Vxx.v[1].w[i] += Vu.w[i].h[1] + Vv.w[i].h[1];}'},
 319: {'hvx_intrinsic': 'Vxx.w+=vadd(Vu.uh,Vv.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vxx.v[0].w[i] += '
               'Vu.w[i].uh[0] +Vv.w[i].uh[0];Vxx.v[1].w[i] += Vu.w[i].uh[1] '
               '+Vv.w[i].uh[1] ;}'},
 320: {'hvx_intrinsic': 'Vxx.w+=vdmpy(Vuu.h,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vxx.v[0].w[i] += '
               '(Vuu.v[0].w[i].h[0] *Rt.b[(2*i+0)%4]);Vxx.v[0].w[i] += '
               '(Vuu.v[0].w[i].h[1] *Rt.b[(2*i+1)%4]);Vxx.v[1].w[i] += '
               '(Vuu.v[0].w[i].h[1] *Rt.b[(2*i+0)%4]);Vxx.v[1].w[i] += '
               '(Vuu.v[1].w[i].h[0] *Rt.b[(2*i+1)%4]) ;}'},
 321: {'hvx_intrinsic': 'Vxx.w+=vmpa(Vuu.h,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vxx.v[0].w[i] += '
               '(Vuu.v[0].w[i].h[0] *Rt.b[0]) + (Vuu.v[1].w[i].h[0] * '
               'Rt.b[1]);Vxx.v[1].w[i] += (Vuu.v[0].w[i].h[1] *Rt.b[2]) + '
               '(Vuu.v[1].w[i].h[1] * Rt.b[3]) ;}'},
 322: {'hvx_intrinsic': 'Vxx.w+=vmpa(Vuu.uh,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vxx.v[0].w[i] += '
               '(Vuu.v[0].w[i].uh[0] *Rt.b[0]) + (Vuu.v[1].w[i].uh[0] * '
               'Rt.b[1]);Vxx.v[1].w[i] += (Vuu.v[0].w[i].uh[1] *Rt.b[2]) + '
               '(Vuu.v[1].w[i].uh[1] * Rt.b[3]) ;}'},
 323: {'hvx_intrinsic': 'Vxx.w+=vmpy(Vu.h,Rt.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vxx.v[0].w[i] = '
               'Vxx.v[0].w[i].s64 +(Vu.w[i].h[0] * Rt.h[0]);Vxx.v[1].w[i] = '
               'Vxx.v[1].w[i].s64 +(Vu.w[i].h[1] * Rt.h[1]) ;}'},
 324: {'hvx_intrinsic': 'Vxx.w+=vmpy(Vu.h,Rt.h):sat',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vxx.v[0].w[i] = '
               'sat32(Vxx.v[0].w[i].s64 +(Vu.w[i].h[0] * '
               'Rt.h[0]));Vxx.v[1].w[i] = sat32(Vxx.v[1].w[i].s64 '
               '+(Vu.w[i].h[1] * Rt.h[1])) ;}'},
 325: {'hvx_intrinsic': 'Vxx.w+=vmpy(Vu.h,Vv.h)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vxx.v[0].w[i] += '
               '(Vu.w[i].h[0] *Vv.w[i].h[0]);Vxx.v[1].w[i] += (Vu.w[i].h[1] '
               '*Vv.w[i].h[1]) ;}'},
 326: {'hvx_intrinsic': 'Vxx.w+=vmpy(Vu.h,Vv.uh)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vxx.v[0].w[i] += '
               '(Vu.w[i].h[0] *Vv.uw[i].uh[0]);Vxx.v[1].w[i] += (Vu.w[i].h[1] '
               '*Vv.uw[i].uh[1]) ;}'},
 327: {'hvx_intrinsic': 'Vxx.w+=vrmpy(Vuu.ub,Rt.b,#u1)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vxx.v[0].w[i] += (Vuu.v[#u '
               '?1:0].uw[i].ub[0] * Rt.b[(0-#u) & 0x3]);Vxx.v[0].w[i] += '
               '(Vuu.v[0 ].uw[i].ub[1] *Rt.b[(1-#u) & 0x3]);Vxx.v[0].w[i] += '
               '(Vuu.v[0 ].uw[i].ub[2] *Rt.b[(2-#u) & 0x3]);Vxx.v[0].w[i] += '
               '(Vuu.v[0 ].uw[i].ub[3] *Rt.b[(3-#u) & 0x3]);Vxx.v[1].w[i] += '
               '(Vuu.v[1 ].uw[i].ub[0] *Rt.b[(2-#u) & 0x3]);Vxx.v[1].w[i] += '
               '(Vuu.v[1 ].uw[i].ub[1] *Rt.b[(3-#u) & 0x3]);Vxx.v[1].w[i] += '
               '(Vuu.v[#u ?1:0].uw[i].ub[2] * Rt.b[(0-#u) & '
               '0x3]);Vxx.v[1].w[i] += (Vuu.v[0 ].uw[i].ub[3] *Rt.b[(1-#u) & '
               '0x3]) ;}'},
 328: {'hvx_intrinsic': 'Vxx.w+=vtmpy(Vuu.h,Rt.b)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {Vxx.v[0].w[i]+= '
               '(Vuu.v[0].w[i].h[0] *Rt.b[(2*i+0)%4]);Vxx.v[0].w[i]+= '
               '(Vuu.v[0].w[i].h[1] *Rt.b[(2*i+1)%4]);Vxx.v[0].w[i]+= '
               'Vuu.v[1].w[i].h[0];Vxx.v[1].w[i]+= (Vuu.v[0].w[i].h[1] '
               '*Rt.b[(2*i+0)%4]);Vxx.v[1].w[i]+= (Vuu.v[1].w[i].h[0] '
               '*Rt.b[(2*i+1)%4]);Vxx.v[1].w[i]+= Vuu.v[1].w[i].h[1] ;}'},
 329: {'hvx_intrinsic': 'Vxx.w=vasrinto(Vu.w,Vv.w)',
       'spec': 'for (i = 0; i < VELEM(32); i++) {shift = (Vu.w[i] << 32);mask '
               '= (((Vxx.v[0].w[i]) << 32) |Vxx.v[0].w[i]);lomask = (((1) << '
               '32) - 1);count = -(0x40 & Vv.w[i]) + (Vv.w[i] & 0x3f);result = '
               '(count == -0x40) ? 0 : (((count < 0)? ((shift << -(count)) | '
               '(mask & (lomask << -(count)))) : ((shift >> count) | (mask & '
               '(lomask>> count)))));Vxx.v[1].w[i] = ((result >> 32) '
               '&0xffffffff);Vxx.v[0].w[i] = (result & 0xffffffff) ;}'},
 330: {'hvx_intrinsic': 'Vxx.w|=vunpacko(Vu.h)',
       'spec': 'for (i = 0; i < VELEM(16); i++) {Vxx.uw[i] |= Vu.uh[i]<<16 ;}'},
 331: {'hvx_intrinsic': 'Vxx=vasrinto(Vu,Vv)',
       'spec': 'Assembler mapped to: "Vxx.w=vasrinto(Vu.w,Vv.w)"'},
 332: {'hvx_intrinsic': 'Vx|=vand(!Qu4,Rt)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i] |= !(QuV[i]) ? '
               'Rt.ub[i % 4] : 0 ;}'},
 333: {'hvx_intrinsic': 'Vx|=vand(Qu4,Rt)',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i] |= (QuV[i]) ? Rt.ub[i '
               '% 4] : 0 ;}'},
 334: {'hvx_intrinsic': 'if (!Ps) Vd=Vu',
       'spec': 'if (!Ps[0]) {for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
               'Vu.ub[i];}} else {NOP;}'},
 335: {'hvx_intrinsic': 'if (!Ps) Vdd=vcombine(Vu,Vv)',
       'spec': 'if (!Ps[0]) {for (i = 0; i < VELEM(8); i++) {Vdd.v[0].ub[i] = '
               'Vv.ub[i];Vdd.v[1].ub[i] = Vu.ub[i];}} else {NOP;}'},
 336: {'hvx_intrinsic': 'if (!Qv4) Vx.b+=Vu.b',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i]=QvV.i ? Vx.ub[i] : '
               'Vx.ub[i]+Vu.ub[i] ;}'},
 337: {'hvx_intrinsic': 'if (!Qv4) Vx.b-=Vu.b',
       'spec': 'for (i = 0; i < VELEM(8); i--) {Vx.ub[i]=QvV.i ? Vx.ub[i] : '
               'Vx.ub[i]-Vu.ub[i] ;}'},
 338: {'hvx_intrinsic': 'if (!Qv4) Vx.h+=Vu.h',
       'spec': 'for (i = 0; i < VELEM(16); i++) '
               '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]+Vu.h[i]) ;}'},
 339: {'hvx_intrinsic': 'if (!Qv4) Vx.h-=Vu.h',
       'spec': 'for (i = 0; i < VELEM(16); i--) '
               '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]-Vu.h[i]) ;}'},
 340: {'hvx_intrinsic': 'if (!Qv4) Vx.w+=Vu.w',
       'spec': 'for (i = 0; i < VELEM(32); i++) '
               '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]+Vu.w[i]) ;}'},
 341: {'hvx_intrinsic': 'if (!Qv4) Vx.w-=Vu.w',
       'spec': 'for (i = 0; i < VELEM(32); i--) '
               '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]-Vu.w[i]) ;}'},
 342: {'hvx_intrinsic': 'if (Ps) Vd=Vu',
       'spec': 'if (Ps[0]) {for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
               'Vu.ub[i];}} else {NOP;}'},
 343: {'hvx_intrinsic': 'if (Ps) Vdd=vcombine(Vu,Vv)',
       'spec': 'if (Ps[0]) {for (i = 0; i < VELEM(8); i++) {Vdd.v[0].ub[i] = '
               'Vv.ub[i];Vdd.v[1].ub[i] = Vu.ub[i];}} else {NOP;}'},
 344: {'hvx_intrinsic': 'if (Qv4) Vx.b+=Vu.b',
       'spec': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i]=QvV.i ? Vx.ub[i] : '
               'Vx.ub[i]+Vu.ub[i] ;}'},
 345: {'hvx_intrinsic': 'if (Qv4) Vx.b-=Vu.b',
       'spec': 'for (i = 0; i < VELEM(8); i--) {Vx.ub[i]=QvV.i ? Vx.ub[i] : '
               'Vx.ub[i]-Vu.ub[i] ;}'},
 346: {'hvx_intrinsic': 'if (Qv4) Vx.h+=Vu.h',
       'spec': 'for (i = 0; i < VELEM(16); i++) '
               '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]+Vu.h[i]) ;}'},
 347: {'hvx_intrinsic': 'if (Qv4) Vx.h-=Vu.h',
       'spec': 'for (i = 0; i < VELEM(16); i--) '
               '{Vx.h[i]=select_bytes(QvV,i,Vx.h[i],Vx.h[i]-Vu.h[i]) ;}'},
 348: {'hvx_intrinsic': 'if (Qv4) Vx.w+=Vu.w',
       'spec': 'for (i = 0; i < VELEM(32); i++) '
               '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]+Vu.w[i]) ;}'},
 349: {'hvx_intrinsic': 'if (Qv4) Vx.w-=Vu.w',
       'spec': 'for (i = 0; i < VELEM(32); i--) '
               '{Vx.w[i]=select_bytes(QvV,i,Vx.w[i],Vx.w[i]-Vu.w[i]) ;}'},
 350: {'hvx_intrinsic': 'vdeal(Vy,Vx,Rt)',
       'spec': 'for (offset=VWIDTH>>1; offset>0; offset>>=1) {if ( Rt & '
               'offset) {for (k = 0; k < VELEM(8); k++) {if (!( k & offset)) '
               '{SWAP(Vy.ub[k],Vx.ub[k+offset]);}}}}'},
 351: {'hvx_intrinsic': 'vshuff(Vy,Vx,Rt)',
       'spec': 'for (offset=1; offset<VWIDTH; offset<<=1) {if ( Rt & offset) '
               '{for (k = 0; k < VELEM(8); k++) {if (!( k & offset)) '
               '{SWAP(Vy.ub[k],Vx.ub[k+offset]);}}}}'},
 352: {'hvx_intrinsic': 'vtrans2x2(Vy,Vx,Rt)',
       'spec': 'Assembler mapped to: "vshuff(Vy,Vx,Rt)"'},
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
 'hexagon_V6_shuffeqh_128B': {'hvx_intrinsic': 'Qd4.b=vshuffe(Qs4.h,Qt4.h)',
                              'spec': 'for (i = 0; i < VELEM(8); i++) '
                                      '{QdV[i]=(i & 1) ? QsV[i-1] : QtV[i] ;}'},
 'hexagon_V6_shuffeqw': {'hvx_intrinsic': 'Qd4.h=vshuffe(Qs4.w,Qt4.w)',
                         'spec': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=(i & '
                                 '2) ? QsV[i-2] : QtV[i] ;}'},
 'hexagon_V6_vandvrt': {'hvx_intrinsic': 'Qd4=vand(Vu,Rt)',
                        'spec': 'for (i = 0; i < VELEM(8); i++) '
                                '{QdV[i]=((Vu.ub[i] & Rt.ub[i % 4]) != 0) ? 1 '
                                ': 0 ;}'},
 'hexagon_V6_vdmpybus': {'hvx_intrinsic': 'Vd.h=vdmpy(Vu.ub,Rt.b)',
                         'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                 '(Vu.uh[i].ub[0] * Rt.b[(2*i) %4]);Vd.h[i] += '
                                 '(Vu.uh[i].ub[1] *Rt.b[(2*i+1)%4]) ;}'},
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
 'hexagon_V6_vmpyhvsrs': {'hvx_intrinsic': 'Vd.h=vmpy(Vu.h,Vv.h):<<1:rnd:sat',
                          'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                  'sat16(sat32(round(((Vu.h[i] '
                                  '*Vv.h[i])<<1))).h[1]) ;}'},
 'hexagon_V6_vmpyih': {'hvx_intrinsic': 'Vd.h=vmpyi(Vu.h,Vv.h)',
                       'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                               '(Vu.h[i] * Vv.h[i]) ;}'},
 'hexagon_V6_vmpyihb': {'hvx_intrinsic': 'Vd.h=vmpyi(Vu.h,Rt.b)',
                        'spec': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                                '(Vu.h[i] * Rt.b[i % 4]) ;}'},
 'hexagon_V6_vmpyuhe': {'hvx_intrinsic': 'Vd.uw=vmpye(Vu.uh,Rt.uh)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                '(Vu.uw[i].uh[0] * Rt.uh[0]) ;}'},
 'hexagon_V6_vrmpyub': {'hvx_intrinsic': 'Vd.uw=vrmpy(Vu.ub,Rt.ub)',
                        'spec': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                '(Vu.uw[i].ub[0] * Rt.ub[0]);Vd.uw[i] += '
                                '(Vu.uw[i].ub[1] * Rt.ub[1]);Vd.uw[i] += '
                                '(Vu.uw[i].ub[2] * Rt.ub[2]);Vd.uw[i] += '
                                '(Vu.uw[i].ub[3] * Rt.ub[3]) ;}'}}