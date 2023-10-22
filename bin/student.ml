(* The module Student serves the purpose of creating our student and managing
   the state of the student over the course of our story *)
module Student = struct
  type gender =
    | Male
    | Female
    | Other

  type student = {
    mutable student_name : string;
    mutable gender : gender;
    mutable total_grade : float;
    mutable num_courses : int;
    mutable courses : string list;
  }

  let new_student =
    {
      student_name = "";
      gender = Other;
      total_grade = 0.0;
      num_courses = 0;
      courses = [];
    }

  (** Sets the name of the given student [s] to a new name [name] *)
  let set_name (s : student) (name : string) = s.student_name <- name
  (** Sets the gender of the given student [s] to a new gender [g] *)
  let set_gender (s : student) (g : gender) = s.gender <- g

  (** Initializes the name and gender with [name] and [g] for a student [s] *)
  let init_student (s : student) (name : string) (g : gender) =
    set_name s name;
    set_gender s g

  (** Given a gender [g] it converts it to the corresponding string equivalent*)
  let gender_to_string (g : gender) =
    match g with
    | Male -> "Male"
    | Female -> "Female"
    | Other -> "Other"

  (** Given a student [s] and a course [course] we update the users state*)
  let add_class (s : student) (course : string) =
    let prev_num_courses = s.num_courses in
    let prev_courses = s.courses in
    s.num_courses <- prev_num_courses + 1;
    s.courses <- course :: prev_courses

  (** Given a student [s] we return the average grade they have if the number of courses they have taken is more than 0 *)
  let avg_grade (s : student) =
    if s.num_courses > 0 then
      s.total_grade /. float_of_int s.num_courses
    else
      0.0

  (** Given a student [s] and a grade [g] we add the grade to the students grade*)
  let add_grade (s : student) (g : float) =
    let prev_grade = s.total_grade in
    s.total_grade <- prev_grade +. g

  (** Given a student [s] and a grade [g] and a course name [course_name] we call two helper functions to help update the fields*)
  let finish_course (s : student) (g : float) (course_name : string) =
    add_grade s g;
    add_class s course_name

  (** Given a student [s] we print all the relevant information about that student*)
  let print_student (s : student) =
    print_endline "===== STUDENT INFO =====";
    print_endline s.student_name;
    print_endline (gender_to_string s.gender);
    print_endline (string_of_float s.total_grade);
    print_endline (string_of_int s.num_courses);
    print_endline "===== END OF STUDENT INFO ====="
end
