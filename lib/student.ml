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

let new_student () =
  {
    student_name = "";
    gender = Other;
    total_grade = 0.0;
    num_courses = 0;
    courses = [];
  }

let set_name (s : student) (name : string) = s.student_name <- name
let set_gender (s : student) (g : gender) = s.gender <- g
let set_grade (s : student) (g : float) = s.total_grade <- g
let get_name (s : student) = s.student_name
let get_total_grade (s : student) = s.total_grade

let get_gender (choice : int) =
  match choice with
  | 1 -> Male
  | 2 -> Female
  | 3 -> Other
  | _ -> Other

let get_courses_taken (s : student) = s.courses

let init_student (s : student) (name : string) (g : gender) =
  set_name s name;
  set_gender s g

let gender_to_string (g : gender) =
  match g with
  | Male -> "Male"
  | Female -> "Female"
  | Other -> "Other"

let add_course (s : student) (course : string) =
  let prev_num_courses = s.num_courses in
  let prev_courses = s.courses in
  s.num_courses <- prev_num_courses + 1;
  s.courses <- prev_courses @ [ course ]

let rec has_course (course_list : string list) (course : string) =
  match course_list with
  | [] -> false
  | h :: t -> if course = h then true else has_course t course

let avg_grade (s : student) =
  if s.num_courses > 0 then s.total_grade /. float_of_int s.num_courses else 0.0

let add_grade (s : student) (g : float) =
  let prev_grade = s.total_grade in
  s.total_grade <- prev_grade +. g

let finish_course (s : student) (g : float) (course_name : string) =
  add_grade s g;
  add_course s course_name

let comment_on_grade (s1 : student) (s2 : student) =
  let g1 = get_total_grade s1 in
  let g2 = get_total_grade s2 in
  let res = ref "" in
  if g1 > g2 then res := "Wow you got higher than me, "
  else res := "Wow you got lower than me, ";

  if g1 < 0.1 then res := !res ^ "try harder next time buddy!"
  else if g1 < 0.2 then res := !res ^ "try a little more!"
  else if g1 < 0.3 then res := !res ^ "almost there!"
  else if g1 < 0.4 then res := !res ^ "almost passing!"
  else if g1 < 0.5 then res := !res ^ "almost got it!"
  else if g1 < 0.6 then res := !res ^ "at least you passed!"
  else if g1 < 0.7 then res := !res ^ "good stuff!"
  else if g1 < 0.8 then res := !res ^ "nice job!"
  else if g1 < 0.9 then res := !res ^ "wow you're pretty good at this stuff!"
  else if g1 < 1.0 then res := !res ^ "you should TA for this class!"
  else res := !res ^ "How did you get such a high score?";

  res

let print_student (s : student) =
  print_endline "===== STUDENT INFO =====";
  print_endline s.student_name;
  print_endline (gender_to_string s.gender);
  print_endline (string_of_float s.total_grade);
  print_endline (string_of_int s.num_courses);
  print_endline "===== END OF STUDENT INFO ====="
