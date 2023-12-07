open Student

val player : student
(** variable representing the current player *)

val play_game : unit -> unit
(** Placeholder for now *)

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

val play_story : string list -> unit
(** Given a string list [txt] we iterate over [txt] to play the story by either
    printing out text or executing certain functions*)

val begin_story_game : unit -> unit
(** Function used to play the story game*)
