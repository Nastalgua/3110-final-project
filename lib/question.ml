let number_of_choices = 4

type answer =
  | A of int * string
  | B of int * string
  | C of int * string
  | D of int * string

type t = {
  question : string;
  answer : answer;
  choices : answer list;
}

let default_choices = ref [| A (0, ""); B (1, ""); C (2, ""); D (3, "") |]
let available_choices = ref !default_choices

let convert_to_answer (index, s) =
  match index with
  | 0 -> A (index, s)
  | 1 -> B (index, s)
  | 2 -> C (index, s)
  | 3 -> D (index, s)
  | _ -> failwith "Invalid index"

let make q a choices =
  let actual_choices =
    List.mapi (fun index c -> convert_to_answer (index, c)) choices
  in
  { question = q; answer = List.nth actual_choices a; choices = actual_choices }

let pick_rand_ans () =
  let arr_length = Array.length !available_choices in
  let rand_int = Random.int arr_length in
  let rand_choice = !available_choices.(rand_int) in
  let remove_picked index =
    Array.init (arr_length - 1) (fun i ->
        if i < index then !available_choices.(i) else !available_choices.(i + 1))
  in
  let reset_if_empty () =
    let length = Array.length !available_choices in
    if length = 0 then available_choices := !default_choices else ()
  in
  available_choices := remove_picked rand_int;
  reset_if_empty ();
  rand_choice

let get_index = function
  | A (i, _) | B (i, _) | C (i, _) | D (i, _) -> i

let get_choice_text = function
  | A (_, s) | B (_, s) | C (_, s) | D (_, s) -> s

let get_text q = q.question
let is_answer_correct (q : t) (a : answer) = get_index q.answer = get_index a

let string_lst_of_choices q =
  List.map
    (fun ans ->
      match ans with
      | A (_, s) | B (_, s) | C (_, s) | D (_, s) -> s)
    q.choices

let setup_images () =
  let open Raylib in
  let path = get_working_directory () ^ "/lib/resources/" in
  [|
    load_texture (path ^ "A.png");
    load_texture (path ^ "B.png");
    load_texture (path ^ "C.png");
    load_texture (path ^ "D.png");
  |]
