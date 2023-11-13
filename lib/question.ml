let number_of_choices = 4

type answer =
  | A of int
  | B of int
  | C of int
  | D of int

type t = {
  question : string;
  answer : answer;
}

let default_choices = ref [| A 0; B 1; C 2; D 3 |]
let available_choices = ref !default_choices
let make q a = { question = q; answer = a }

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
  | A a -> a
  | B b -> b
  | C c -> c
  | D d -> d

let setup_images () =
  let open Raylib in
  let path = get_working_directory () ^ "/lib/resources/" in
  [|
    load_texture (path ^ "A.png");
    load_texture (path ^ "B.png");
    load_texture (path ^ "C.png");
    load_texture (path ^ "D.png");
  |]
