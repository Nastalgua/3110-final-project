open Student

type gender =
  | Male
  | Female
  | Other

type teacher = {
  mutable teacher_name : string;
  mutable gender : gender;
  mutable course : string;
}

type student = {
  mutable student_name : string;
  mutable gender : gender;
  mutable total_grade : float;
  mutable num_courses : int;
  mutable courses : string list;
}

let new_teacher () = 
  {
  teacher_name = "";
  gender = Other;
  course = ""
}

let set_teacher_name (t : teacher) (name : string) = t.teacher_name <- name
let set_teacher_gender (t : teacher) (g : gender) = t.gender <- g
let set_teacher_class (t : teacher) (name : string) = t.teacher_name <- name
let get_teacher_name (t : teacher) = t.teacher_name
let get_teacher_gender (t : teacher) = t.gender

let init_teacher (t : teacher) (name : string) (g : gender) =
  set_teacher_name t name;
  set_teacher_gender t g

let pre_course_dialogue (t : teacher) =
  print_endline
    (t.teacher_name ^ ":" ^ t.course ^ " will be so fun! I hope you enjoy!")

let post_course_dialogue (t : teacher) (grade : float) (passing_grade : float) =
  print_endline
    ("Hi! " ^ "You received a grade of:"
   ^ string_of_float grade);
  (** teacher comments on their grade *)
  if grade < 0.3 then (get_teacher_name t ^ ": Please retake this class")
else if grade < 0.4 then ( get_teacher_name t ^ ": I have no words")
  else if grade < 0.5 then  (get_teacher_name t ^ ": Please take this course again")
  else if grade < 0.6 then  (get_teacher_name t  ^ ": I know you are better than that")
  else if grade < 0.7 then  (get_teacher_name t  ^ ": Please do better")
  else if grade < 0.8 then  (get_teacher_name t ^ ": Almost there")
  else if grade < 0.9 then (get_teacher_name t ^ ": Great job!")
  else
    (get_teacher_name t ^ ": Wow you are doing so well! Have you considered getting a PhD?")

let print_teacher (t : teacher) = 
  print_endline "===== TEACHER INFO =====";
  print_endline t.teacher_name;
  print_endline (t.course);
  print_endline "===== END OF STUDENT INFO ====="
