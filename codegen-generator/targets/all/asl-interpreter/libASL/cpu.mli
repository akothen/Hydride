(****************************************************************
 * CPU interface
 *
 * Copyright Arm Limited (c) 2017-2019
 * SPDX-Licence-Identifier: BSD-3-Clause
 ****************************************************************)

type cpu = {
    env      : Eval.Env.t;
    reset    : unit -> unit;
    step     : unit -> unit;
    getPC    : unit -> Primops.bigint;
    setPC    : Primops.bigint -> unit;
    elfwrite : Int64.t -> char -> unit;
    opcode   : string -> Primops.bigint -> unit;
}

val mkCPU : Eval.Env.t -> cpu

(****************************************************************
 * End
 ****************************************************************)
