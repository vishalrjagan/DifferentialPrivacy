type base = int list

(* lookup tables for finite slices of deterministic functions *)
module Table = Map.Make(
  struct
    type t = base
    let compare = Pervasives.compare
  end)
type table = base Table.t

(* Make a table for the f's I/O relation over range. Note, f should *
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

(* Sparse *)

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
    (c:int) (k:int) (alpha:float) : string =
  let cs = string_of_int c in
  let ks = string_of_int k in
  let alpha_s = string_of_float alpha in
  "(2*"^cs^") / (Exp[(eps*"^alpha_s^" / (8*"^cs^")) - Log["^ks^"]])"

(* Custom function for du (i.e. sufficient alpha) of discrete inputs
   for sparse *)
let alpha_sparse
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

(* let alphas_sparse
 *     (thresh:int)
 *     (c:int)
 *     (tab:table)
 *   : (base*int) Table.t =
 *   Table.mapi
 *     (fun inp out ->
 *        let du = alpha_sparse inp thresh c in
 *        let alpha = du in
 *        (out,alpha)) tab *)

(* Here 'beta' should be specialized to take float to float *)
let betas_sparse
    (c:int)
    (thresh:int)
    (tab:base Table.t)
  : (base*string) Table.t =
  Table.mapi
    (fun k v ->
       (v,beta_sparse_expression c
          (List.length k)
          (float_of_int @@ alpha_sparse k thresh c))) tab


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
let alpha_noisy_max
    (inp:base)
  : float = float_of_int @@ list_arg_max inp

(* let alphas_noisy_max
 *     (tab:table)
 *   : (base*int) Table.t =
 *   Table.mapi
 *     (fun inp out ->
 *        let du = alpha_noisy_max inp in
 *        let alpha = du in
 *        (out,alpha)) tab *)

(* compute beta (as Math. string) for the noisy max algorithm *)
let beta_noisy_max_expression
    (n_queries:int) (alpha:float) : string =
  (string_of_int n_queries)^"/(Exp[eps*"^(string_of_float alpha)^"/4])"

let betas_noisy_max
    (tab:base Table.t)
  : (base*string) Table.t =
  Table.mapi
    (fun k v ->
       (v,beta_noisy_max_expression (List.length k) (alpha_noisy_max k))) tab


(* NUMERIC SPARSE *)
let numeric_sparse
    (inp:base) : base =
  (* Modeling in DiPC. What an ad-hack! *)
  [1]

let beta_numeric_sparse_expression
    (c:int) (k:int) (alpha:float) : string =
  let c_str,k_str = string_of_int c,string_of_int k in
  let alpha_str = string_of_float alpha in
  "("^k_str^"*4*"^c_str^")/(Exp[("^alpha_str^"*eps)/(9*"^c_str^")])"

let betas_numeric_sparse
    (c:int)
    (alpha:float)
    (tab:base Table.t)
    : (base*string) Table.t =
  Table.mapi
    (fun k v ->
    (v,beta_numeric_sparse_expression c (List.length k) alpha)) tab


(* GENERAL *)
let rec int_list_to_string (delim:string) (l:base) : string =
  let ss = List.map (fun n -> string_of_int n) l in
  String.concat delim ss

(* Write an alpha-beta annotated I/O table to file filename *)
let write_table_to_file (filename:string) (tab:(base*string) Table.t) =
  let oc = open_out filename in
  Table.iter
    (fun inp (out,beta_string) ->
       let input_string = int_list_to_string " " inp in
       let output_string = int_list_to_string ";" out in
       Printf.fprintf oc (format_of_string "%s > %s @ %s\n")
         input_string output_string beta_string) tab;
  close_out oc

let generate_io_table_sparse
    (filename:string)
    (range:int*int)
    (n_queries:int)
    (thresh:int)
    (c:int) : unit =
  let t = make_table range n_queries (sparse thresh c) in
  let t_beta = betas_sparse c thresh t in
  write_table_to_file filename t_beta

let generate_io_table_noisy_max
    (filename:string)
    (range:int*int)
    (n_queries:int) : unit =
  let t = make_table range n_queries noisy_max in
  let t_beta = betas_noisy_max t in
  write_table_to_file filename t_beta

let generate_io_table_numeric_sparse
    (filename:string)
    (range:int*int)
    (n_queries:int)
    (thresh:int) (* UNUSED because of hack *)
    (alpha:float)
    (c:int) : unit =
  let t = make_table range n_queries numeric_sparse in
  let t_beta = betas_numeric_sparse c alpha t in
  write_table_to_file filename t_beta





(* OLD -------------------------------------------------- *)

(* (\* each position must differ by no more than 1 *\)
 * let compare (v1:int list) (v2:int list) : bool =
 *   List.for_all2 (fun a b -> abs (a-b) <= 1) v1 v2
 *
 * (\* du(x,y) = norm_l_infinity(x-y) *\)
 * let du_above_threshold (x:int list) (y:int list) : int =
 *   assert(List.length x = List.length y);
 *   let z = List.map2 (fun xi yi -> abs (xi-yi)) x y in
 *   List.fold_left (fun acc zi -> if zi > acc then zi else acc) 0 z
 *
 * (\* deterministic numeric sparse AT algorithm *\)
 * let numeric_sparse (thresh:int) (c:int) (inp:int list) : int list =
 *   let rec help l (cnt,res) =
 *     match l with
 *     | [] -> (cnt,res)
 *     | x::xs ->
 *       if (x >= thresh && cnt < c) then
 *         help xs (cnt+1, x::res)
 *       else
 *         help xs (cnt, 0::res) in (\* careful assuming \bot=0 *\)
 *   let rev_out = snd @@ help inp (0,[]) in
 *   List.rev rev_out *)

(* let get_closest
 *     (du:dist)
 *     (tab:table)
 *     (u,v:int list*int list) : int list =
 *   let io = Table.bindings tab in
 *   let disequals = List.filter
 *       (fun (inp,out) -> out <> v) io in
 *   let u_sorted = List.sort
 *       (fun (inp1,_) (inp2,_) ->
 *          Stdlib.compare (du u inp1) (du u inp2)) disequals in
 *   match u_sorted with
 *   | [] -> failwith "No disequal inputs, reconsider your input ranges,
 *     etc."
 *   | (inp,out)::xs -> inp
 *
 * (\* Determine alphas for given inputs based on distance metric for
 *    input space. That is, for u\in U, find a v\in U with minimal
 *    du(u,v) s.t. f(u)\neq f(v). Build a table from inputs to pairs of
 *    output and alpha. *\)
 * let alphas
 *     (tab:table)
 *     (\* (left,right:int*int)
 *      * (n_query:int) *\)
 *     (\* (u:int list) *\)
 *     (du:dist)
 * (\* (f:f_det) : int = *\)
 *   : (base*int) Table.t =
 *   Table.mapi
 *     (fun inp out ->
 *        let inp_close = get_closest du tab (inp,out) in
 *        let alpha = du inp inp_close in
 *        (out,alpha)) tab *)
