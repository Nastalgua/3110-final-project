type gender =
  | Male
  | Female
  | Other

type teacher = {
  mutable teacher_name : string;
  mutable gender : gender;
  mutable course : string;
}

val new_teacher : unit -> teacher
(** Given a unit creates a new teacher record*)

val get_teacher_name : teacher -> string
(** Sets the name of the given teacher [t] to a new name [name] *)

val get_teacher_gender : teacher -> gender
(** Sets the gender of the given teacher [t] to a new gender [g] *)

val set_teacher_name : teacher -> string -> unit
(** Sets the name of the given teacher [t] to a new name [name] *)

val set_teacher_gender : teacher -> gender -> unit
(** Sets the gender of the given teacher [t] to a new gender [g] *)

val init_teacher : teacher -> string -> gender -> unit
(** Initializes the name and gender with [name] and [g] for a teacher [t] *)

val pre_course_dialogue : teacher -> unit
(** Prints a response to the student getting them ready for the minigame *)
val post_course_dialogue : teacher -> float -> float -> string
(** Prints a response to the student based on the grade they get from the minigame *)
val print_teacher : teacher -> unit
(** Prints the teacher information *)
