type t

(* [create q_lst] creates a question manager filled in with the passed
   questions. *)
val create : Question.t list -> t

(* [pop q_m] removes the oldest question in the [q_m]. *)
val pop : t -> Question.t option

(* [peek q_m] returns the current question being asked. *)
val peek : t -> Question.t option

(* [is_empty q_m] true if there are no questions left. *)
val is_empty : t -> bool

(* [clear q_m] deletes all the questions currently in the question manager. *)
val clear : t -> unit

(* [draw_question q] displays the question's text and answer choices. *)
val draw_question : Question.t -> unit
