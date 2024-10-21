## 3D_LOAD
```

      Load a surface through the sampler interface
```
## 3D_SAMPLE
```

      Sample a surface
```
## 3D_SAMPLE4
```

    Sample the surface using bilinear filtering, and return four samples.
```
## AVS
```

      AVS functionality
```
## BARRIER
```

                    Barrier synchronization within a thread group.
```
## CACHE_FLUSH
```

                    Flush the textural cache.
```
## CALL
```

                    Calls the subroutine at <label>
```
## CMP
```

                    for (i = 0; i < exec_size; ++i) {
                      if (ChEn[i]) {
                        if (dst is predicate) {
                          dst[i] = src0[i] rel_op src[i];
                        }
                        else { // dst is general operand
                          dst[i] = src0[i] rel_op src[i] ? -1 : 0;
                        }
                    }
```
## DPAS
```
   DPAS is a matrix multiply-add operation as follows:

       D = C + A x B

       where
          D (Dst)  : MxN
          C (Src0) : MxN
          A (Src2) : MxK
          B (Src1) : KxN

          M : repeat count
          N : fixed execution size, either 8 or 16
          K : depth * OPS_PER_CHAN
              OPS_PER_CHAN
                 1 : for TF32
                 2 : for 16-bit precision(BF, HF)
                 4 : for 8-bit precision (FP8, UB, B)
                 8 : for less-then 8 bit precision (U4/S4, U2/S2).

              If depth is 8, K would be 8, 16, 32, or 64 (basd on OPS_PER_CHAN).

       Note that Src2 is A, and Src1 is B.

   Conceptually, DPAS instruction is simple. As it requires its operands to have a special layout in GRF
   for matrix B, this makes DPAS a little complicated to understand. The following might help undertand
   it better.

       If we view GRFs as a 1-D memory space in the increasing order of GRF numbers, Dst, Src0, Src2
       are laid out in row-major in this 1-D memory space. But Src1 needs a special layout, neither
       row-major nor column major. To visualize the layout for Src1,  we can view entire GRFs as a 2-D
       memory space with each row being an exactly one whole GRF. For example,  128 GRFs of 16 DWs each
       can be viewed as 128x16 of DW (it would be 128x8 if GRF size is 8 DWs), which means N must be 16.
       Under this view, each column of Src1 (matrix B) of total 16 columns are packed into its corresponding
       column of this 2-D memory space, that is, Column 0 of Src1 to Column 0 of 2-D memory space, column 1
       of Src1 to Column 1 of 2-D memory space, and so on. Take 8-bit precision for example, K is 32. This
       32 elements of 8-bit precision data is packed into 8 DWs (4 for each DW). For all 16 columns, it
       takes 8 rows in this 2-D memory space, which is 8 GRFs.

   With this, the following detailed description will be not hard to follow.

    1) The semantics for interger DPAS and float(bf/hf) DPAS:

       The semantics is described using the following notation:

           Let dot4(X.a[3:0], Y.b[3:0]) be a 4-element dot product of X and Y, starting
           at element offset a and b respectively. Similary, let dot2(X.a[1:0], Y.b[1:0])
           be a 2-element dot product of X and Y, and dot8(X.a[7:0], Y.b[7:0]) be a 8-element
           dot product of X and Y. Note that the size of element in X and Y may be different.
           For example, if X's precision is 4 bit, Y's 8 bits, X's element
           size shall be 4 bits, y's shall be 8 bits. Also, X.DW[j] is used to denote
           the j+1'th DW of X; X.R[j] for denoting the j+1'th GRF. Similarly, X.R[1].DW[2]
           will refer to the 3rd DW of the 2nd GRF of X. Note that index always starts from zero.
           GRF size would be 8 pre PVC and 16 DW in PVC or later.


       // 1) Src1PrecisionInBits and Src2PrecisionInBits are 16 for both bfloat(bf) and half(hf) dpas.
       // 2) Element size for Src0 and Dst are 4 bytes (either int or fp32)
       // 3) Element size for src1 and src2 could be 2 bits, 4 bits, 8 bits, or 16 bits (bf/hf),
       //    which are given as precisons.

       // OPS_PER_CHAN
       if (Src1PrecisionInBits == 16) {
         // BF/HF dpas. Src2PrecisionInBits must be 16
         OPS_PER_CHAN = 2;
       } else if (Src1Precision == 8 || Src2Precision == 8) {
         // integer dpas : dot4 per DW
         OPS_PER_CHAN = 4;
       } else {
         // integer dpas : dot8 per DW
         OPS_PER_CHAN = 8;
       }

       // Src1's DW of each channel might be used in more than one depth (based on its precision).
       // For example, an integer dpas with src1's precision being 2-bits, one DW has data for
       // 4 depths (assuming dot4 per DW. Each dot4 consumes 8 bits, a DW can do 4 dot4 operations).
       // Under SD=8, the first four depths will use the entire DW of the first GRF holding src1;
       // and the second 4 depths will use the entire DW of the second GRF. If src1's precision is
       // 8 bits (dot4 per DW), each DW will be used in an exact one depth; and the next depth will
       // use the DW of the next GRF. The following variable is used in the pseudo code:
       //   SRC1_OPERANDS_PER_CHAN :
       //     how many operands per each DW (each channel is DW-wide) for src1.
       //     Each operand is defined as data that is used for a single dot4/dot8(int) or dot2(bf/bf).
       //     This means that for float DPAS, SRC1_OPERANDS_PER_CHAN = 1; and for int DPAS,
       //       if OPS_PER_CHAN = 4
       //          SRC1_OPERANDS_PER_CHAN = 1 (8-bit precision), 2 (4-bit), or 4 (2-bit)
       //       else // OPS_PER_CHAN = 8
       //          SRC1_OPERANDS_PER_CHAN = 1 (4-bit), or 2 (2-bit)
       SRC1_OPERANDS_PER_CHAN = 32 / (OPS_PER_CHAN * Src1PrecisionInBits)

       Exec_size = isPrePVC ? 8 : 16;

       k = 0;
       for (r = 0; i < RC; ++r)
       {
         temp = Src0.R[r];
         for (d = 0; d < SD; ++d )
         {
           m = d / SRC1_OPERANDS_PER_CHAN;  // to select GRF
           n = (d % SRC1_OPERANDS_PER_CHAN) * OPS_PER_CHAN; // in unit of element
           for ( i = 0; i < Exec_size; i++ )
           { // for each channel
             if OPS_PER_CHAN == 4  // int dpas
                temp.DW[i] += dot4(Src1.R[m].DW[i].n[3:0], Src2.k[3:0]);
             else if OPS_PER_CHAN == 8 // int dpas
                temp.DW[i] += dot8(Src1.R[m].DW[i].n[7:0], Src2.k[7:0]);
             else // float DPAS
                temp.F[i] += dot2(Src1.R[m].DW[i].n[1:0], Src2.k[1:0]);
           }
           k += OPS_PER_CHAN;
         }

         // update dst
         dst.R[r] = temp;
       }

       Dst, Src0 are advanced one GRF for each repeat advance; Src2 is advanced 8*OPS_PER_CHAN for
       each repeat advance. Src1 stays the same for each repeat count advance.








```
## DPASW
```

       DPASW is a DPAS wide instruction, a variant of DPAS. It is a specific instruction
       for XEHP when EU fusion is present. All the fields are defined the same as in DPAS.
       Refer DPAS for field definition. Here only difference from DPAS is described.

       DPAS wide differs from DPAS on that DPASW shares the data contents of the src2 register
       read from the GRF of one of the fused EUs among the two fused DPAS pipelines in a Fusion
       thread group. In doing so, the GRF bandwidth requirement is reduced for dpas pipe. For this
       to work, hardware threads must be paired. In OpenCL terminology, this means that the number
       of threads within a work group must be an even number.

       Let (EU0, EU1) is the paired fusion thread group. The values of **Src2** is defined as below.
       Note that if both EUs provide the same amount of data, which one is EU0 does not matter. But
       if they provide a different amount of data, which one is EU0 should matter, and thread ID
       could be used to decide which one is EU0 (need to verify).

       Src2SizeInBytes = ((Src2PrecisionInBits * OPS_PER_CHAN)/8) * 8 * RC;
                       = (Src2PrecisionInBits * OPS_PER_CHAN) * RC;
       NGrf = ((Src2SizeInBytes + 32 - 1) / 32;
       NGrf_EU0 = (NGrf + 1)/2;
       NGrf_EU1 = NGrf - NGrf_EU0;

       for (i=0; i < NGrf_EU0; ++i)
          Src2.R[i] = EU0.Src2.R[i];
       for (i=0; i < NGrf_EU1; ++i)
          Src2.R[NGrf_EU0 + i] = EU1.Src2.R[i];

       Using Src2, the DPAS algorithm works exactly for DPASW. Refer DPAS for details.
```
## FADDR
```

                    Take the address of function <func_id> and store it to <dst>
```
## FBH
```

                    for (i = 0; i < exec_size; ++i) {
                      if (ChEn[i]) {
                        UD cnt = 0;
                        if ( src0 is unsigned ) {
                          UD udScalar = src0[i];
                          while ( (udScalar & (1 << 31)) == 0 && cnt != 32 ) {
                            cnt ++;
                            udScalar = udScalar << 1;
                          }
                          dst[i] = src0[i] == 0 ? 0xFFFFFFFF : cnt;
                        }
                        else { // src0 is signed.
                          D dScalar = src0[i];
                          bit cval = dScalar[31];
                          while ((dScalar & (1 << 31)) == cval && cnt != 32 ) {
                            cnt ++;
                            dScalar = dScalar << 1;
                          }
                          dst[i] = (src0[i] == 0xFFFFFFFF) || (src0[i] == 0) ? 0xFFFFFFFF : cnt;
                        }
                      }
                    }
```
## FCALL
```

                    Calls the function <func_id>.
```
## FCCALL
FC Calls to a kernel identified as label, which is resolved by FC linker. Note that FCCALL is an alias to CALL (same opcode).
## FENCE
```

      Memory fence.
```
## FILE
```

      Source file name for the subsequent instructions.
```
## FRET
```

                    Returns from a function (FCALL).
```
## GOTO
```

                    Unstructured SIMD jump to basic block at <label>
```
## IFCALL
```

                    Calls the function located at <func_addr>
```
## INFO
```

    Returns information about the surface
```
## JMP
```

                    Jump to the basic block at <label>.
```
## LABEL
```

                    Declare a basic block.
```
## LIFETIME
```

      Marks the start/end of a variable's lifetime.
```
## LOC
```

      Source line number for the subsequent instructions.
```
## LSC_FENCE
```

    wait_for_pending_accesses_to_complete(LscSFID, LscFenceOp, LscScope)
    Dest.data = 0 // Dest. is implicit within vISA
```
## LSC_TYPED
The `lsc_load_quad` and `lsc_store_quad` LSC_UNTYPED versions,
except the address calculation uses surface state and the U, V, R, and LOD coordinates
to calculate the surface address (based on the surface state).
Note, the data and address types chosen must match the values in the surface state.

Atomics and `lsc_store_uncompressed` are identical in behavior to LSC_UNTYPED with a
scale of 1 and immediate offset of 0.

LOAD_BLOCK2D:
```
            reg_pitch = BlockWidth < 4 ? 4 : round_up_pow2(BlockWidth);
            for (u = 0; u < BlockHeight; u++) {
                for (v = 0; v < BlockWidth/(SURF_STATEpixel_size); v++) {
                    dest[u*reg_pitch + v] = (SURF_STATEDATA_TYPE *)(2D_TILER(SURF_STATE_TABLE[bsso|bti+btp], u, v));
                }
            }
```

STORE_BLOCK2D:
```
            reg_pitch = BlockWidth < 4 ? 4 : round_up_pow2(BlockWidth);
            for (u = 0; u < BlockHeight; u++) {
                for (v = 0; v < BlockWidth/(SURF_STATEpixel_size); v++) {
                    (SURF_STATEDATA_TYPE *)(2D_TILER(SURF_STATE_TABLE[bsso|bti+btp], u, v)) = Src1Data[u*reg_pitch + v];
                }
            }
```
## LSC_UNTYPED
```
                    struct grf_data_sized {
                       // 8 elements for :d64, 16 for :d32, 32 for :d16, 64 for :d8 (half of this for DG2)
                       DataSize elems[GRF_SIZE_BYTES/sizeof(DataSize)];
                    } DstData, Src1Data, Src2Data;
                    union grf_addr_size {
                       // 8 elements for :a64, 16 for :a32, 32 for :a16 (half of this for DG2)
                       AddrSize addrs[GRF_SIZE_BYTES/sizeof(AddrSize)];
                    } src0;

      LOAD:
                    for (n = 0; n < ExecSize; n++) {
                      if (Msg.ChEn[n]) {
                        for (v = 0; v < vect_size; v++) {
                          grf_sized src = AddrScale*(Surface + Src0Addrs[n]) + AddrImmOffset
                          auto datum = src.elems[v];
                          if (DataOrder == LSC_DATA_ORDER_TRANSPOSED) {
                            DstData[n].elems[v] = datum
                          } else {
                            DstData[v].elems[n] = datum
                          }
                        }
                      }
                    }

      LOAD_QUAD:
                    for (n = 0; n < ExecSize; n++) {
                      if (Msg.ChEn[n]) {
                        for (m = v = 0; v < 4; v++) {
                          if (ChMask[v]) {
                            grf_sized src = AddrScale*(Surface + Src0Addrs[n]) + AddrImmOffset
                            DstData[m].elems[n] = src.elems[v]
                            m++;
                          }
                        }
                      }
                    }

      LOAD_STRIDED:
                    for (n = 0; n < ExecSize; n++) {
                      if (Msg.ChEn[n]) {
                        for (v = 0; v < vect_size; v++) {
                          auto addr = AddrScale*(Base + offset + Src0Addrs) + n*Src0AddrPitch + AddrImmOffset
                          if (DataOrder == LSC_DATA_ORDER_TRANSPOSED) {
                            dst[n].elems[v] = addr->elems[v]
                          } else {
                            dst[v].elems[n] = addr->elems[v]
                          }
                        }
                      }
                    }

      LOAD_STATUS:
                    for (n = 0; n < ExecSize; n++) {
                      s = 1;
                      if (Msg.ChEn[n]) {
                        auto addr = AddrScale*(Surface + Src0Addrs[n] + AddrImmOffset)
                        for (v = 0; v < vect_size; v++) {
                          if (s) {
                            s = IsTRTT_VALID_PAGE(addr.elems[v])
                          }
                        }
                      }
                      dest.bit[n] = MsgChEn[n] & s
                    }

      LOAD_BLOCK2D:
          // let T be the element data type (e.g. uint32_t for d32)
          // src0.* is see block2d array source payload register
          const int B = Blocks, H = BlockHeight, W = BlockWidth; // values -1-encoded
          const int X = Src0AddrX, Y = Src0AddrY; // these are not -1-encoded
          const bool transpose =  DataOrder == LSC_DATA_ORDER_TRANSPOSED, transform = VNNI;
          const int elems_per_dword = 4/sizeof(T);
          const int elems_per_reg = GRF_SIZE_BYTES/sizeof(T);

          auto store_elem_to_grf = [&](int dst_off, T value) {
            int r = dst_off / elems_per_reg, sr = dst_off % elems_per_reg;
            dst[r].elems[sr] = value;
          };
          const char *block_start = src0.SurfaceBaseAddr + src0.Y * src0.SurfacePitch;

          // 'b' is the block, 'u' represents the Y-axis, and 'v' the X-axis
          auto load_elem = [&](int dst_off, int b, int y, int x) {
            T *row = (T *)(SurfaceBase + y * SurfacePitch);
            store_elem_to_grf(dst_off, row[X + b * W + x]);
          };

          // loads a row span or column span of elements into GRF ...
          auto load_row_span = [&](int grf_off, int b, int y, int x, int n) {
            for (int i = 0; i < n; i++) load_elem(grf_off + i, b, y, x + i);
          };
          auto load_col_span = [&](int grf_off, int b, int y, int x, int n) {
            for (int i = 0; i < n; i++) load_elem(grf_off + i, b, y + i, x);
          };
          auto fill_grf_zeros = [&](int dst_off, int n) {
            for (int i = 0; i < n; i++) store_elem_to_grf(dst_off + i, 0);
          };

          const int grf_row_size = transpose ? H : W;
          const int grf_row_pitch = round_up_pow2(grf_row_size);
          const int grf_block_size = grf_row_pitch * (transpose ? W : H);
          const int grf_block_pitch = round_to_multiple_of(elems_per_reg, grf_block_size);

          for (int b = 0; b < B; b++) {
            if (!transpose && !transform) {
            for (int y = 0; y < H; y++) {
              int grf_row_start = b*grf_block_pitch + y*grf_row_pitch;
              load_row_span(grf_row_start, b, y, 0, W);
              fill_grf_zeros(grf_row_start + W, grf_row_pitch - W);
            } // for H
            } else if (!transpose && transform) {
            for (int y = 0; y < H; y += elems_per_dword) {
              for (int x = 0; x < W; x++) {
              load_col_span(
                b*grf_block_pitch + y*grf_row_pitch + x*elems_per_dword,
                b, y, x,
                elems_per_dword);
              } // for W
              // pad out the row in GRF with zeros
              fill_grf_zeros(
              b*grf_block_pitch + y*grf_row_pitch + W*elems_per_dword,
              elems_per_dword*(grf_row_pitch - W));
            } // for H
            } else if (transpose && !transform) {
            for (int x = 0; x < W; x++) {
              load_col_span(
              b*grf_block_pitch + x*grf_row_pitch,
              b, 0, x,
              H);
              fill_grf_zeros(b*grf_block_pitch + x*grf_row_pitch + H, grf_row_pitch - H);
            }
            } else if (transpose && transform) {
            for (int x = 0; x < W; x += elems_per_dword) {
              for (int y = 0; y < H; y++) {
              load_row_span(
                b*grf_block_pitch + x*grf_row_pitch + y*elems_per_dword,
                b, y, x,
                elems_per_dword);
              } // for H
              // pad out the row in GRF with zeros
              fill_grf_zeros(
              b*grf_block_pitch + x*grf_row_pitch + H*elems_per_dword,
              elems_per_dword * (grf_row_pitch - H));
            } // for W
            }
            // pad out GRF for this block
            fill_grf_zeros(
            b*grf_block_pitch + grf_block_size,
            grf_block_pitch - grf_block_size);
          } // for B

      STORE:
      STORE_UNCOMPRESSED:
                    for (n = 0; n < ExecSize; n++) {
                      if (Msg.ChEn[n]) {
                        for (v = 0; v < vect_size; v++) {
                          auto addr = AddrScale*(Surface + Src0Addrs[n] + AddrImmOffset)
                          if (DataOrder == LSC_DATA_ORDER_TRANSPOSED) {
                            *addr = DstData[n].elems[v]
                          } else {
                            *addr = DstData[v].elems[n]
                          }
                        }
                      }
                    }

      STORE_QUAD:
                    for (n = 0; n < ExecSize; n++) {
                      if (Msg.ChEn[n]) {
                        for (m = v = 0; v < 4; v++) {
                          if (ChMask[v]) {
                            (*(AddrScale*(Surface + Src0Addrs[n] + AddrImmOffset))).elems[v] = Src1Data[m].elems[n]
                            m++
                          }
                        }
                      }
                    }

      STORE_STRIDED:
                    auto pitch = v*DataSize // vISA picks default pitch to make a packed block operation
                    for (n = 0; n < ExecSize; n++) {
                      if (Msg.ChEn[n]) {
                        for (v = 0; v < vect_size; v++) {
                          auto addr = AddrScale*(Surface + Src0Addrs[n] + AddrImmOffset) + n*Src0AddrPitch + AddrImmOffset
                          if (DataOrder == LSC_DATA_ORDER_TRANSPOSED) {
                            addr.elems[v] = Src1Data[n].elems[v];
                          } else {
                            addr.elems[v] = Src1Data[v].elems[n];
                          }
                        }
                      }
                    }

      STORE_BLOCK2D:
                    // similar to load block2d, but accesses are stores instead of loads
                    // and only a single block is permitted
                    for (n = 0; n < BlockHeight; n++) {
                      for (v = 0; v < BlockWidth; v++) {
                        reg_pitch = round_up_pow2(BlockHeight);
                        (SurfaceBase+(Src0AddrY+(n*SurfacePitch)+Src0AddrX)).elems[v] =
                          Src1Data.elems[(v*reg_pitch)+n];
                      }
                    }

      AppendCounterAtomicAdd:
                  ctr_address = SURFACE_STATE[state_offset].Aux_surface_address
                    for (n = 0; n < ExecSize; n++) {
                      if (Msg.ChEn[n]) {
                        old = (ctr_address).data_size[0];
                        (ctr_address).data_size[0] = old + src0Data[0].data_size[n];
                        dest[0].data_size[n] = old;
                      }
                    }

      AppendCounterAtomicSub:
                  ctr_address = SURFACE_STATE[state_offset].Aux_surface_address
                    for (n = 0; n < ExecSize; n++) {
                      if (Msg.ChEn[n]) {
                        old = (ctr_address).data_size[0];
                        (ctr_address).data_size[0] = old - src0Data[0].data_size[n];
                        dest[0].data_size[n] = old;
                      }
                    }
```
## NBARRIER
```

      named barrier synchronization for a subgroup of threads within a thread group.
```
## RAW_SEND
```

      A direct method for generating a GEN native send message
```
## RAW_SENDS
```

      A direct method for generating a GEN native split send message
```
## RET
```

                    Returns from a subroutine/ends execution.
```
## RT_READ
```

  This message takes 16 or 32 pixels for reads to a render target. This message is intended only for use by pixel shader kernels for reading data from render targets.
  A SIMD16 writeback message consists of 4 destination registers and SIMD32 writeback consists of 8 registers.
```
## RT_WRITE
```

    Render target write
```
## SAMPLE_UNORM
```

                    Sample a UNORM surface
```
## SBARRIER
```

      split-phase barrier synchronization within a thread group.
```
## SUBROUTINE
```

                    Declare a subroutine.
```
## SVM
Share virtual memory access
## SWITCHJMP
```

                    Jumps to one of the labels based on the index value.
```
## TYPED_ATOMIC
```

    word or dword atomic "read-modify-write" operations.
```
## URB_WRITE
```

    Write to the Unified Resource Buffer (URB)
```
## VME_FBR
```

      Video Motion Estimation - fractional and bidirectional refinement
```
## VME_IDM
```

      Video Motion Estimation - distortion mesh.
```
## VME_IME
```

      Video Motion Estimation - integer motion estimation
```
## VME_SIC
```

      Video Motion Estimation - skip and intra check.
```
## WAIT
```

    //Each TDR is a struct with two fields: a bool valid bit and a thread id.
    //It is initialized during thread dispatch
    for (i = 0; i < 8; ++i) {
        if (mask & (1<< i)) {
            TDR[i].valid = false;
        }
        if (TDR[i].valid) {
            wait for TDR[i].thread to finish;
        }
    }
```
## YIELD
```

    Causes the EU to switch to another thread. The hardware selects the thread to yield to.
```
