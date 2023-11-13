type answer
type t

(* [make q a choices] creates a question with its assigned answer index in
   [choices]. Also, sets available choices based on the order of the list
   presented. Ex. if choices = ["H"; "e", "l", "o"], then answers would
   associate A with choice "H", B with "e", etc. *)
val make : string -> int -> string list -> t

(* [pick_rand_ans ()] gives back a random answer to a question. *)
val pick_rand_ans : unit -> answer

(* [setup ()] loads up all the image textures associated with teach choice. *)
val setup_images : unit -> Raylib.Texture.t array

(* [get_index ans] turns the answer into an index. *)
val get_index : answer -> int

(* [is_answer_correct q a] returns true if the answer passed in matches the
   answer to the passed question. *)
val is_answer_correct : t -> answer -> bool

(* [get_text q] gives back a string of the question. *)
val get_text : t -> string

(* [string_lst_of_choices q] gives back the list of choices associated with the
   question. *)
val string_lst_of_choices : t -> string list
