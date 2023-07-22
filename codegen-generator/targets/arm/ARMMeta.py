notSSA = ['maxv', 'minv', 'rbit',
          'rev', 'addlv', 'create', 'vdup_n_s64', 'vdup_n_u64']
UIP = ['cls', 'clz', 'cnt', 'recpe', 'rsqrte', 'sli', 'sli_n', 'sliq_n', 'slid_n',
       'shl_n', 'shlq_n', 'shld_n', 'sri_n', 'sriq_n', 'srid_n']  # unimplemented
op_mismatch = ['qrdmlah', 'qrdmlsh']
not_compiled_in_gcc = ['eor3q', 'rax1q', 'bcaxq', 'xarq']
semantics_changed = ['shl']
