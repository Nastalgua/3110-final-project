type answer
type t

(* [make q a] creates a question with its assigned answer. *)
val make : string -> answer -> t

(* [pick_rand_ans ()] gives back a random answer to a question. *)
val pick_rand_ans : unit -> answer

(* [setup ()] loads up all the image textures associated with teach choice. *)
val setup_images : unit -> Raylib.Texture.t array

(* [get_index ans] turns the answer into an index. *)
val get_index : answer -> int
