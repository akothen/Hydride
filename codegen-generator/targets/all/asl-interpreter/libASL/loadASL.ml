(****************************************************************
 * Functions for processing ASL files
 *
 * Copyright Arm Limited (c) 2017-2019
 * SPDX-Licence-Identifier: BSD-3-Clause
 ****************************************************************)

open Asl_ast

module Lexer  = Lexer
module Parser = Asl_parser
module TC     = Tcheck
module PP     = Asl_parser_pp
module AST    = Asl_ast

open Lexersupport
open Lexing

let report_parse_error (on_error: unit -> 'a) (f: unit -> 'a): 'a =
    (try
        f ()
    with
    | Parse_error_locn(l, s) ->
        Printf.printf "  Syntax error %s at %s\n" s (pp_loc l);
        on_error ()
    | PrecedenceError(loc, op1, op2) ->
        Printf.printf "  Syntax error: operators %s and %s require parentheses to disambiguate expression at location %s\n"
            (Utils.to_string (PP.pp_binop op1))
            (Utils.to_string (PP.pp_binop op2))
            (pp_loc loc);
        on_error ()
    | Parser.Error ->
        Printf.printf "  Parser error\n";
        on_error ()
    )

let report_type_error (on_error: unit -> 'a) (f: unit -> 'a): 'a =
    (try
        f ()
    with
    | TC.UnknownObject (loc, what, x) ->
        Printf.printf "  %s: Type error: Unknown %s %s\n" (pp_loc loc) what x;
        on_error ()
    | TC.DoesNotMatch (loc, what, x, y) ->
        Printf.printf "  %s: Type error: %s %s does not match %s\n" (pp_loc loc) what x y;
        on_error ()
    | TC.IsNotA (loc, what, x) ->
        Printf.printf "  %s: Type error: %s is not a %s\n" (pp_loc loc) x what;
        on_error ()
    | TC.Ambiguous (loc, what, x) ->
        Printf.printf "  %s: Type error: %s %s is ambiguous\n" (pp_loc loc) what x;
        on_error ()
    | TC.TypeError (loc, what) ->
        Printf.printf "  %s: Type error: %s\n" (pp_loc loc) what;
        on_error ()
    )

let report_eval_error (on_error: unit -> 'a) (f: unit -> 'a): 'a =
    (try
        f ()
    with
    | Value.EvalError (loc, msg) ->
        Printf.printf "  %s: Evaluation error: %s\n" (pp_loc loc) msg;
        on_error ()
    )

(* Official ASL does not have specific syntax for declaring variable getter
   functions, so if we encounter a variable declaration and a variable getter
   function definition of the same name, we assume that the former is meant
   to be a declaration of the latter and update the AST accordingly.
   Otherwise, the variable would shadow the getter function, which would
   remain unused. *)
let declare_var_getters (decls: declaration list) =
  let open Asl_utils in
  let getter_def_id = function
    | Decl_VarGetterDefn (_, id, _, _) -> [id]
    | _ -> []
  in
  let getters = IdentSet.of_list (List.concat (List.map getter_def_id decls)) in
  let declare = function
    | Decl_Var (ty, id, l) when IdentSet.mem id getters ->
       Decl_VarGetterType (ty, id, l)
    | decl -> decl
  in
  List.map declare decls

let parse_file (filename : string) (isPrelude: bool) (verbose: bool): AST.declaration list =
    let inchan = open_in filename in
    let lexbuf = Lexing.from_channel inchan in
    lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with pos_fname = filename };
    let t =
        report_parse_error
          (fun _ -> print_endline (pp_loc (Range (lexbuf.lex_start_p, lexbuf.lex_curr_p))); exit 1)
          (fun _ ->
            (* Apply offside rule to raw token stream *)
            let lexer = offside_token Lexer.token in

            (* Run the parser on this line of input. *)
            if verbose then Printf.printf "- Parsing %s\n" filename;
            Parser.declarations_start lexer lexbuf)
    in
    close_in inchan;
    declare_var_getters t

let read_file (filename : string) (isPrelude: bool) (verbose: bool): AST.declaration list =
    if verbose then Printf.printf "Processing %s\n" filename;
    let t = parse_file filename isPrelude verbose in

    if false then PPrint.ToChannel.pretty 1.0 60 stdout (PP.pp_declarations t);
    if verbose then Printf.printf "  - Got %d declarations from %s\n" (List.length t) filename;

    let t' =
        report_type_error (fun _ -> exit 1) (fun _ ->
            if verbose then Printf.printf "- Typechecking %s\n" filename;
            TC.tc_declarations isPrelude t
        )
    in

    if false then PPrint.ToChannel.pretty 1.0 60 stdout (PP.pp_declarations t');
    if verbose then Printf.printf "  - Got %d typechecked declarations from %s\n" (List.length t') filename;

    if verbose then Printf.printf "Finished %s\n" filename;
    flush stdout;
    t'

let read_spec (filename : string) (verbose: bool): AST.declaration list =
    let r: AST.declaration list list ref = ref [] in
    let inchan = open_in filename in
    (try
        while true do
            let t = read_file (input_line inchan) false verbose in
            r := t :: !r
        done
    with
    | End_of_file ->
        close_in inchan
    );
    List.concat (List.rev !r)

let read_impdef (tcenv: TC.Env.t) (loc: AST.l) (s: string): (string * AST.expr) =
    let lexbuf = Lexing.from_string s in
    let lexer  = offside_token Lexer.token in
    let CLI_Impdef (x, e) = Parser.impdef_command_start lexer lexbuf in
    let (s, e') = TC.with_unify tcenv loc (fun u ->
        let (e', _) = TC.tc_expr tcenv u loc e in
        e'
    ) in
    (x, TC.unify_subst_e s e')

let read_expr (tcenv: TC.Env.t) (loc: AST.l) (s: string): AST.expr =
    let lexbuf = Lexing.from_string s in
    let lexer  = offside_token Lexer.token in
    let e = Parser.expr_command_start lexer lexbuf in
    let (s, e') = TC.with_unify tcenv loc (fun u ->
        let (e', _) = TC.tc_expr tcenv u loc e in
        e'
    ) in
    TC.unify_subst_e s e'

let read_stmt (tcenv: TC.Env.t) (s: string): AST.stmt =
    let lexbuf = Lexing.from_string s in
    let lexer  = offside_token Lexer.token in
    let s = Parser.stmt_command_start lexer lexbuf in
    TC.tc_stmt tcenv s

(****************************************************************
 * End
 ****************************************************************)
