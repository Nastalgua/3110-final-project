open Student

val player : student
(** variable representing the current player *)

val play_game : unit -> unit
(** Given a unit the game that we have made will play *)

val story_text : string list
(** String list holding the text for the story as well as the commands for
    functions we need to call*)

val game_set_name : unit -> unit
(** Function that sets the name field in the player record*)

val game_set_gender : unit -> unit
(** Function that sets the gender field in the player record*)

val greet : unit -> unit
(** Function that greets the player based on the name they input*)

val notify : string -> unit
(** Function used to indicate when yes was entered*)

val wait_for_yes : (string -> unit) -> string -> unit
(** Function used to wait for user to input "Yes"*)

val check_pre_req : student -> string -> bool
(** Given a student [s] and string [c] we check the students courses to see if they have satisfied the pre requisites for class [c] *)
val play_class_scene : string -> unit
(** Given a string [s] we play a scene using the name of the class in it *)
val play_questions : string -> unit
(** Given a string [c] we launch the game GUI for class the string represents and update the user based on the results of the game*)
val choose_class : student -> string -> unit
(** Given a student [s] and a string [c] we check to see if the student can take the chosen class otherwise they are forced to choose again*)

val play_story : string list -> unit
(** Given a string list [txt] we iterate over [txt] to play the story by either
    printing out text or executing certain functions*)

val begin_story_game : unit -> unit
(** Function used to play the story game*)
