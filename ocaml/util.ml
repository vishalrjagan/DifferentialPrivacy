type base = int list

(* lookup tables for finite slices of deterministic functions *)
module Table = Map.Make(
  struct
    type t = base
    let compare = Stdlib.compare
  end)
type table = base Table.t

(* Make a table for f's I/O relation over given range. Note, f should *
   be a function like numeric_sparse, but specialized to be an int *
   list -> int list. E.g. 'make_table (2,3) (2) (+1)' builds a map containing:
   [([2,2]-> [3,3]),([2,3] -> [3,4]),([3,2] -> [4,3]),([3,3] -> [4,4])]*)
let make_table (left,right:int*int) (n_query:int) (f:base -> base) : table =
  assert(left <= right && n_query >= 1);
  let rec help (left,right) curr n g inp acc =
    if n<n_query then
      let m = help (left,right) left (n+1) g (curr::inp) acc in
      if (curr<right) then
        help (left,right) (curr+1) n g inp m
      else m
    else Table.add inp (g inp) acc in
  help (left,right) left 0 f [] Table.empty


(* SPARSE *)

(* deterministic sparse algorithm *)
let sparse (thresh:int) (c:int) (inp:base) : base =
  let rec help l (cnt,res) =
    match l with
    | [] -> (cnt,res)
    | x::xs ->
      if (x >= thresh && cnt < c) then
        help xs (cnt+1, 1::res)
      else
        help xs (cnt, 0::res) in
  let (_,rev_out) = help inp (0,[]) in
  List.rev rev_out

(* compute beta (as Math. string) for the sparse algorithm *)
let beta_sparse_expression
    (c:int) (k:int) (du:int) (factor:string) : string =
  let cs = string_of_int c in
  let ks = string_of_int k in
  let du_s = string_of_int du in
  "("^factor^")*("^"(2*"^cs^"*"^ks^") / (Exp[(eps*"^du_s^" / (8*"^cs^"))]))"

(* Custom function for du (i.e. sufficient alpha) of discrete inputs
   for sparse *)
let du_sparse
    (inp:base)
    (thresh:int)
    (c:int) : int =
  assert(c!=0);
  let rec help xs thresh cnt acc =
    match xs with
    | [] -> acc
    | x::rest ->
      if cnt<c then
        let new_min = min acc (abs (x-thresh)) in
        if x>=thresh then
          help rest thresh (cnt+1) new_min
        else
          help rest thresh cnt new_min
      else acc
  in
  match inp with
  | [] -> failwith "Empty input to alpha_sparse is not allowed"
  | i::xs -> help inp thresh 0 (abs (i-thresh))

let dus_sparse
    (thresh:int)
    (c:int)
    (tab:table)
  : (base*int) Table.t =
  Table.mapi
    (fun inp out ->
       let du = du_sparse inp thresh c in
       (out,du)) tab

(* Here 'beta' should be specialized to take float to float *)
let betas_sparse
    (alphaGamma:int)
    (factor:string)
    (compare:bool)
    (c:int)
    (thresh:int)
    (tab:(base*int) Table.t)
  : (base*int*int*bool*string) Table.t =
  Table.mapi
    (fun inp (out,du) ->
       (out,du,alphaGamma,false,
        beta_sparse_expression c (List.length inp)
          (du_sparse inp thresh c) factor)) tab


(* NOISY MAX *)

(* Deterministic noisy max outputs singleton list containing the index
   of max value in list *)
let noisy_max
    (inp:base)
  : base =
  match inp with
  | [] -> failwith "Noisy max fails for empty lists"
  | x::xs ->
    let _,argmax,_ =
      List.fold_left
        (fun (v,v_idx,curr_idx) elt ->
           if elt>v
           then (elt,curr_idx,curr_idx+1)
           else (v,v_idx,curr_idx+1)) (x,0,0) inp
    in [argmax]

let list_arg_max
    (inp:base)
    : int =
  match inp with
  | [] -> failwith "Empty list not allowed for noisy_max"
  | x::[] -> failwith "Singleton list not allowed for noisy_max"
  | x::y::rest ->
    let max1,max2 =
      if x > y then x,y else y,x in
    let l,r =
      List.fold_left
        (fun (max1,max2) elt ->
           if elt > max1 then elt,max1
           else if elt > max2
           then max1,elt
           else max1,max2) (max1,max2) inp in
    (l-r)

(* Custom function for du (i.e. sufficient alpha) of discrete inputs for noisy max *)
let du_noisy_max (inp:base) : int = list_arg_max inp

let dus_noisy_max
    (tab:table)
  : (base*int) Table.t =
  Table.mapi
    (fun inp out ->
       let du = du_noisy_max inp in
       (out,du)) tab

(* compute beta (as Math. string) for the noisy max algorithm *)
let beta_noisy_max_expression
    (n_queries:int) (du:int) (factor:string) : string =
  let du_s = string_of_int du in
  let correct_du_s = "("^du_s^"/2)" in
  "("^factor^")*("^(string_of_int n_queries)^" / (Exp[eps*"^correct_du_s^"/2]))"

let betas_noisy_max
    (alphaGamma:int)
    (factor:string)
    (compare:bool)
    (tab:(base*int) Table.t)
  : (base*int*int*bool*string) Table.t =
  Table.mapi
    (fun inp (out,du) ->
       (out,du,alphaGamma,compare,
        beta_noisy_max_expression (List.length inp) du factor)) tab


(* NUMERIC SPARSE *)
let numeric_sparse
    (inp:base) : base =
  (* Modeling in DiPC. What an ad-hack! *)
  [1]

let beta_numeric_sparse_expression_dwork_roth
    (c:int) (k:int) (alpha:int) (factor:string) : string =
  let c_str,k_str = string_of_int c,string_of_int k in
  let alpha_str = string_of_int alpha in
  "("^factor^")*(("^k_str^"*4*"^c_str^") / (Exp[("^alpha_str^"*eps)/(9*"^c_str^")]))"

let beta_numeric_sparse_expression_better
    (c:int) (k:int) (alpha:int) (factor:string) : string =
  let c_str,k_str = string_of_int c,string_of_int k in
  let alpha_str = string_of_int alpha in
  "("^factor^")*(((2*"^k_str^" + 1)*"^c_str^") / (Exp[("^alpha_str^"*eps)/(9*"^c_str^")]))"

let du_numeric_sparse = du_sparse

let dus_numeric_sparse
    (thresh:int)
    (c:int)
    (tab:base Table.t)
  : (base*int) Table.t =
  Table.mapi
    (fun inp out ->
    (out,du_numeric_sparse inp thresh c)) tab

let betas_numeric_sparse
    (alphaGamma:int)
    (factor:string)
    (compare:bool)
    (c:int)
    (tab:(base*int) Table.t)
    : (base*int*int*bool*string) Table.t =
  Table.mapi
    (fun inp (out,du) ->
       (out,du,alphaGamma,compare,
        beta_numeric_sparse_expression_better c (List.length inp) alphaGamma factor)) tab


(* GENERAL *)
let rec int_list_to_string (delim:string) (l:base) : string =
  let ss = List.map (fun n -> string_of_int n) l in
  String.concat delim ss

(* Write an alpha-beta annotated I/O table to file filename *)
let write_table_to_file
    (filename:string)
    (tab:(base*int*int*bool*string) Table.t) =
  let oc = open_out filename in
  Table.iter
    (fun inp (out,du,alphaGamma,compare,beta_string) ->
       let input_string = int_list_to_string " " inp in
       let output_string = int_list_to_string ";" out in
       (* let du_string = string_of_int du in
        * let alphaGamma_string = string_of_int alphaGamma in
        * let compare_string = string_of_bool compare in *)
       (* Hacking: omit lines that won't be checked *)
       if compare && (du < alphaGamma)
       then ()
       else
         Printf.fprintf oc (format_of_string "%s > %s @ %s\n")
           input_string output_string beta_string) tab;
  close_out oc

let generate_io_table_sparse
    ?(file:string = "io_table.txt")
    ~range:(range:int*int)
    ~n_queries:(n_queries:int)
    ?(thresh:int = 0)
    ~c:(c:int)
    ~factor:(factor:string)
    () : unit =
  let t = make_table range n_queries (sparse thresh c) in
  let t_dus = dus_sparse thresh c t in
  let t_beta = betas_sparse 0 factor false c thresh t_dus in
  write_table_to_file file t_beta

let generate_io_table_noisy_max
    ?(file:string = "io_table.txt")
    ~range:(range:int*int)
    ~n_queries:(n_queries:int)
    ~factor:(factor:string)
    () : unit =
  let t = make_table range n_queries noisy_max in
  let t_dus = dus_noisy_max t in
  let t_beta = betas_noisy_max 0 factor false t_dus in
  write_table_to_file file t_beta

(* Need a separate parameter for alpha=gamma, since du is always calculated *)
let generate_io_table_numeric_sparse
    ?(file:string = "io_table.txt")
    ~range:(range:int*int)
    ~n_queries:(n_queries:int)
    ?(thresh:int = 0) (* UNUSED because of hack *)
    ?(alphaGamma:int = 1)
    ~c:(c:int)
    ~factor:(factor:string)
    () : unit =
  let t = make_table range n_queries numeric_sparse in
  let t_dus = dus_numeric_sparse thresh c t in
  let t_beta = betas_numeric_sparse alphaGamma factor true c t_dus in
  write_table_to_file file t_beta

(* Laplace *)
let laplace (inp:base) : base = [1]

let beta_laplace_expression
    (n_queries:int)
    (gamma:int)
    (factor:string): string =
  "("^factor^")*("^(string_of_int n_queries)^"/(Exp[eps*"^(string_of_int gamma)^"]))"

let betas_laplace
    (gamma:int)
    (factor:string)
    (tab:base Table.t)
  : (base*int*int*bool*string) Table.t =
  Table.mapi
    (fun inp out ->
       (out,-1,gamma,false,
        beta_laplace_expression (List.length inp) gamma factor)) tab

let generate_io_table_laplace
    ?(file:string = "io_table.txt")
    ~range:(range:int*int)
    ~n_queries:(n_queries:int)
    ?(gamma:int = 1)
    ~factor:(factor:string)
    () : unit =
  let t = make_table range n_queries laplace in
  let t_beta = betas_laplace gamma factor t in
  write_table_to_file file t_beta


let main () =
  let args = Sys.argv in

  if Array.length args <> 9 then
    failwith "Expect 8 arguments";

  let int_args = Stdlib.Array.mapi
      (fun i elt ->
         if i <> 0 && i <> 8 then int_of_string elt
         else -1) args in
  let factor = args.(8) in
  let example_type = int_args.(1) in
  assert(example_type = 0 ||
         example_type = 1 ||
         example_type = 2 ||
         example_type = 3);
  let numq = int_args.(2) in
  assert(numq>=1);
  let range = int_args.(3) in
  assert(range>0);
  let c = int_args.(4) in
  assert(c>0);
  let thresh = int_args.(5) in
  assert(thresh>=0);
  let alpha = int_args.(6) in
  assert(alpha>=0);
  let gamma = int_args.(7) in
  assert(gamma>=0);

  (* Sparse *)
  if example_type = 0 then
    generate_io_table_sparse
      ~range:(-range,range)
      ~n_queries:numq
      ~thresh:thresh
      ~c:c
      ~factor:factor
      ()

  (* Numeric sparse *)
  else if example_type = 1 then
    generate_io_table_numeric_sparse
      ~range:(-range,range)
      ~n_queries:numq
      ~thresh:thresh
      ~alphaGamma:alpha
      ~c:c
      ~factor:factor
      ()

  (* Noisy max *)
  else if example_type = 2 then
    generate_io_table_noisy_max
      ~range:(-range,range)
      ~n_queries:numq
      ~factor:factor
      ()

  (* Laplace mechanism *)
  else if example_type = 3 then
    generate_io_table_laplace
      ~range:(-range,range)
      ~n_queries:numq
      ~gamma:gamma
      ~factor:factor
      ()

  else
    failwith "Unsupported example type"

let _ = main ()
