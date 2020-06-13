type base = int list
type precise = float
type dist = base -> base -> int
type f_det = base -> base

(* lookup tables for finite slices of deterministic functions *)
module Table = Map.Make(
  struct
    type t = base
    let compare = Pervasives.compare
  end)
type table = int list Table.t

(* compute beta (as a Math. string) for the numeric sparse algorithm *)
let beta_numeric_sparse_expression
    (c:int) (k:int) (eps:float) (alpha:float) : float =
  let cf = float_of_int c in
  let kf = float_of_int k in
  (2. *. cf) /. (exp ((eps *. alpha /. 8. *. cf) -. log kf))

(* each position must differ by no more than 1 *)
let compare (v1:int list) (v2:int list) : bool =
  List.for_all2 (fun a b -> abs (a-b) <= 1) v1 v2

(* du(x,y) = norm_l_infinity(x-y) *)
let du_above_threshold (x:int list) (y:int list) : int =
  assert(List.length x = List.length y);
  let z = List.map2 (fun xi yi -> abs (xi-yi)) x y in
  List.fold_left (fun acc zi -> if zi > acc then zi else acc) 0 z

(* deterministic numeric sparse AT algorithm *)
let numeric_sparse (thresh:int) (c:int) (inp:int list) : int list =
  let rec help l (cnt,res) =
    match l with
    | [] -> (cnt,res)
    | x::xs ->
      if (x >= thresh && cnt < c) then
        help xs (cnt+1, x::res)
      else
        help xs (cnt, 0::res) in (* careful assuming \bot=0 *)
  let rev_out = snd @@ help inp (0,[]) in
  List.rev rev_out

(* Make a table for the f's I/O relation over range. Note, f should *
   be a function like numeric_sparse, but specialized to be an int *
   list -> int list. E.g. 'make_table (2,3) (2) (+1)' builds a map containing:
   [([2,2]-> [3,3]),([2,3] -> [3,4]),([3,2] -> [4,3]),([3,3] -> [4,4])]*)
let make_table (left,right:int*int) (n_query:int) (f:f_det) : table =
  assert(left <= right && n_query >= 1);
  let rec help (left,right) curr n g inp acc =
    if n<n_query then
      let m = help (left,right) left (n+1) g (curr::inp) acc in
      if (curr<right) then
        help (left,right) (curr+1) n g inp m
      else m
    else Table.add inp (g inp) acc in
  help (left,right) left 0 f [] Table.empty

let get_closest
    (du:dist)
    (tab:table)
    (u,v:int list*int list) : int list =
  let io = Table.bindings tab in
  let disequals = List.filter
      (fun (inp,out) -> out <> v) io in
  let u_sorted = List.sort
      (fun (inp1,_) (inp2,_) ->
         Stdlib.compare (du u inp1) (du u inp2)) disequals in
  match u_sorted with
  | [] -> failwith "No disequal inputs, reconsider your input ranges,
    etc."
  | (inp,out)::xs -> inp

(* Determine alphas for given inputs based on distance metric for
   input space. That is, for u\in U, find a v\in U with minimal
   du(u,v) s.t. f(u)\neq f(v). Build a table from inputs to pairs of
   output and alpha. *)
let alphas
    (tab:table)
    (* (left,right:int*int)
     * (n_query:int) *)
    (* (u:int list) *)
    (du:dist)
(* (f:f_det) : int = *)
  : (base*int) Table.t =
  Table.mapi
    (fun inp out ->
       let inp_close = get_closest du tab (inp,out) in
       let alpha = du inp inp_close in
       (out,alpha)) tab


(* SVT *)

(* deterministic sparse AT algorithm *)
let sparse (thresh:int) (c:int) (inp:int list) : int list =
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
    (c:int) (k:int) (alpha:int) : string =
  let cs = string_of_int c in
  let ks = string_of_int k in
  let alphas = string_of_int alpha in
  "(2*"^cs^") / (Exp[(eps*"^alphas^" / (8*"^cs^")) - Log["^ks^"]])"
(* (2. *. cf) /. (exp ((eps *. alpha /. 8. *. cf) -. log kf)) *)

(* Custom function for du of discrete inputs for svt *)
let svt_du
    (inp:int list)
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
  | [] -> failwith "Empty input to svt_du is not allowed"
  | i::xs -> help inp thresh 0 (abs (i-thresh))

let alphas_svt
    (thresh:int)
    (c:int)
    (tab:table)
  : (base*int) Table.t =
  Table.mapi
    (fun inp out ->
       let du = svt_du inp thresh c in
       let alpha = du in
       (out,alpha)) tab

(* Here 'beta' should be specialized to take float to float *)
let betas_svt
    (c:int)
    (tab:(base*int) Table.t)
    (beta:int -> int -> int -> string) : (base*(int*string)) Table.t =
  Table.map
    (fun (v,alpha) ->
       (v,(alpha,beta_sparse_expression c (List.length v) alpha))) tab

let rec int_list_to_string (delim:string) (l:int list) : string =
  let ss = List.map (fun n -> string_of_int n) l in
  String.concat delim ss


(* NOISY MAX *)

(* Check LICS paper for deterministic function *)
let noisy_max
    (inp:int list)
  : int =
  match inp with
  | [] -> failwith "Noisy max fails for empty lists"
  | x::xs ->
    List.fold_left
      (fun acc elt -> if elt > acc then elt else acc) x inp

let list_arg_max
    (inp:int list)
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

(* Custom function for du of discrete inputs for noisy max *)
let noisy_max_du
    (inp:int list)
  : int = list_arg_max inp

(* compute beta (as Math. string) for the noisy max algorithm *)
let noisy_max_expression
    (n_queries:int) (alpha:int) : string =
  (string_of_int n_queries)^"/(Exp[eps*"^(string_of_int alpha)^"/4])"


(* GENERAL *)

(* Write an alpha-beta annotated I/O table to file filename *)
let write_table_to_file (filename:string) (tab:(base*(int*string)) Table.t) =
  let oc = open_out filename in
  Table.iter
    (fun inp (out,(alpha,beta)) ->
       let input_string = int_list_to_string " " inp in
       let output_string = int_list_to_string ";" out in
       let alpha_string = string_of_int alpha in
       (* let beta_string = string_of_float beta in *)
       Printf.fprintf oc (format_of_string "%s > %s @ %s @@ %s\n")
         input_string output_string alpha_string beta) tab;
  close_out oc
