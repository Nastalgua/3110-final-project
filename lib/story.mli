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
(** Given a string [s] if [s] is equal to "Yes" we notify the user by printing a
    line saying they typed Yes*)

val setup_classmates : unit -> unit
(** Given a unit sets up the classmates for a user*)

val wait_for_yes : (string -> unit) -> string -> unit
(** Function used to wait for user to input "Yes"*)

val eligible_courses : student -> string list
(** Given a student [s] we return a string list containing all the courses they
    may take*)

val play_questions : string -> unit
(** Given a string [c] we play the questions for the class specified by c *)

val get_num_courses : student -> int
(** Given a student [s] return the number of courses they are taking*)

val choose_class : student -> unit
(** Given a student [s] wait for user input to see whether or not a class can be
    taken*)

val play_story : string list -> unit
(** Given a string list [txt] we iterate over [txt] to play the story by either
    printing out text or executing certain functions*)

val begin_story_game : unit -> unit
(** Function used to play the story game*)
