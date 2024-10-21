(****************************************************************
 * Functions for processing ASL files
 *
 * Copyright Arm Limited (c) 2017-2019
 * SPDX-Licence-Identifier: BSD-3-Clause
 ****************************************************************)

module AST = Asl_ast
module TC  = Tcheck

val report_parse_error : (unit -> 'a) -> (unit -> 'a) -> 'a
val report_type_error  : (unit -> 'a) -> (unit -> 'a) -> 'a
val report_eval_error  : (unit -> 'a) -> (unit -> 'a) -> 'a

(** Parse and typecheck ASL file *)
val read_file   : string -> bool -> bool -> Asl_ast.declaration list

val read_spec   : string -> bool -> Asl_ast.declaration list

(** Parse ASL file, but do not typecheck *)
val parse_file  : string -> bool -> bool -> Asl_ast.declaration list

val read_impdef : TC.Env.t -> AST.l -> string -> (string * AST.expr)
val read_expr   : TC.Env.t -> AST.l -> string -> AST.expr
val read_stmt   : TC.Env.t -> string -> AST.stmt

(****************************************************************
 * End
 ****************************************************************)
