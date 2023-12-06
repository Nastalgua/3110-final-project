(** student.mli *)
(** custom type for genders*)
type gender =
  | Male
  | Female
  | Other


(** custom type to represent student*)
type student = {
  mutable student_name : string;
  mutable gender : gender;
  mutable total_grade : float;
  mutable num_courses : int;
  mutable courses : string list;
}

val new_student : unit -> student
(** Constructs a new student *)

val set_name : student -> string -> unit
(** Sets the name of the given student [s] to a new name [name] *)

val set_gender : student -> gender -> unit
(** Sets the gender of the given student [s] to a new gender [g] *)
val get_name : student -> string
(** Gets the name of the given student [s]  *)
val get_gender : int -> gender
(** Gets the gender of the given student [s]  *)
val get_courses_taken : student -> string list 
(** Given a student [s] we return a string list from their field s.courses *)
val has_course : string list -> string -> bool
(** Given a string list [course_list] and a string [c] we check to see that c is in course_list*)

val init_student : student -> string -> gender -> unit
(** Initializes the name and gender with [name] and [g] for a student [s] *)

val gender_to_string : gender -> string
(** Given a gender [g] it converts it to the corresponding string equivalent*)

val add_course : student -> string -> unit
(** Given a student [s] and a course [course] we update the users state*)

val avg_grade : student -> float
(** Given a student [s] we return the average grade they have if the number of
    courses they have taken is more than 0 *)

val add_grade : student -> float -> unit
(** Given a student [s] and a grade [g] we add the grade to the students grade*)

val finish_course : student -> float -> string -> unit
(** Given a student [s] and a grade [g] and a course name [course_name] we call
    two helper functions to help update the fields*)

val print_student : student -> unit
(** Given a student [s] we print all the relevant information about that student*)
