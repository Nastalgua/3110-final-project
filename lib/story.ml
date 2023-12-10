open Teacher
open Student
open CourseGame
open Score

let player = new_student ()
let classmate1 = new_student ()
let classmate2 = new_student ()
let classmate3 = new_student ()
let classmate4 = new_student ()
let teacher = new_teacher ()
let play_game () = ()
let curr_class = ref ""
let num_qs = ref 0

(* JSON for organization of the student *)
let story_text =
  [
    (*========================= INTRO ===========================*)
    "SETUP";
    "Welcome to Programmer University!";
    "What is your name?";
    "SETNAME";
    "Select your gender\n (1) Male  (2) Female  (3) Other";
    "SETGENDER";
    "Creating character...";
    "GREET";
    "Stepping into the threshold of university, a realm where bytes weave \
     worlds and algorithms shape reality, I stood poised on the brink of an \
     exhilarating odyssey. The journey that lay ahead promised not just \
     knowledge but a tapestry of challenges, discoveries, and the boundless \
     horizons of Computer Science awaiting exploration.\n\
    \     There are 8 courses you must complete before graduating.";
    "To pass a course, answer two questions right on the exam.";
    "Goodluck soldier";
    "CHOOSECLASS";
    (* Initiates class choosing after intro *)
    (*===================== END OF INTRO ===========================*)

    (*===================== ENDING ===========================*)
    "After overcoming countless challenges and dedicating unyielding effort, \
     you've triumphed at Programmer University. Your journey through the eight \
     rigorous courses, mastering intricate coding languages and algorithms, \
     culminated in a momentous graduation. As you stood among your peers, the \
     dean praised your unparalleled dedication and innovative problem-solving \
     skills. Holding your diploma, a testament to your perseverance, you felt \
     a surge of pride and excitement for the boundless opportunities awaiting \
     you. Armed with the knowledge and confidence garnered from this journey, \
     you stepped into the world of technology, ready to make your mark and \
     shape the future through your coding expertise and unwavering \
     determination.";
  ]

let game_set_name () = set_name player (read_line ())
let game_set_gender () = set_gender player (read_int () |> get_gender)
let greet () = print_endline ("Hi " ^ player.student_name ^ " nice meeting you!")

let notify (input : string) =
  if input = "Yes" then print_endline "You pressed Yes!"

let setup_classmates () =
  set_gender classmate1 Male;
  set_gender classmate2 Male;
  set_gender classmate3 Female;
  set_gender classmate4 Other;
  set_name classmate1 "Michael";
  set_name classmate2 "Matthew";
  set_name classmate3 "Matthew";
  set_name classmate4 "Bob"

let rec wait_for_yes (fn : string -> unit) (choice : string) =
  match choice with
  | "Yes" -> fn choice
  | "No" ->
      let new_choice = read_line () in
      wait_for_yes fn new_choice
  | _ ->
      let new_choice = read_line () in
      wait_for_yes fn new_choice

let eligible_courses (s : student) =
  let all_courses =
    [
      "CS 1110";
      "CS 2110";
      "CS 3110";
      "CS 2800";
      "PHYS 1112";
      "PHYS 2213";
      "MATH 1920";
      "MATH 2940";
    ]
  in

  let courses_passed = player.courses in
  (* Function to get passed courses *)
  List.filter
    (fun c ->
      (not (List.exists (fun x -> x = c) courses_passed))
      &&
      (* Exclude passed courses *)
      match c with
      | "CS 2110" -> List.exists (fun x -> x = "CS 1110") courses_passed
      | "CS 3110" -> List.exists (fun x -> x = "CS 2110") courses_passed
      | "CS 2800" -> List.exists (fun x -> x = "CS 1110") courses_passed
      | "PHYS 2213" -> List.exists (fun x -> x = "PHYS 1112") courses_passed
      | "MATH 2940" -> List.exists (fun x -> x = "MATH 1920") courses_passed
      | _ -> true) (* No prerequisites *)
    all_courses

let rec play_questions (c : string) =
  (match c with
  | "CS 1110" ->
      start_game Questions.cs1110;
      num_qs := List.length Questions.cs1110
  | "CS 2110" ->
      start_game Questions.cs2110;
      num_qs := List.length Questions.cs2110
  | "CS 2800" ->
      start_game Questions.cs2800;
      num_qs := List.length Questions.cs2800
  | "CS 3110" ->
      start_game Questions.cs3110;
      num_qs := List.length Questions.cs3110
  | "PHYS 1112" ->
      start_game Questions.phys1112;
      num_qs := List.length Questions.phys1112
  | "PHYS 2213" ->
      start_game Questions.phys2213;
      num_qs := List.length Questions.phys2213
  | "MATH 1920" ->
      start_game Questions.math1920;
      num_qs := List.length Questions.math1920
  | "MATH 2940" ->
      start_game Questions.math2940;
      num_qs := List.length Questions.math2940
  | _ -> print_endline "Class name DNE");
  print_endline ("You answered " ^ string_of_int !score ^ " questions right");
  (* update student info only if they pass*)
  (* passing score will be 2/5 questions *)
  (let overall = float_of_int !score /. float_of_int !num_qs in
   let s = post_course_dialogue teacher overall 0.4 in
   let res = "STATUS: " ^ s in
   print_endline res;
   if overall >= 0.4 then (
     add_course player c;
     add_grade player overall)
   else print_endline "You failed this class, please try again!");
  reset_score ()

let get_num_courses (s : student) : int = s.num_courses

let rec choose_class (s : student) =
  ();
  let available_courses = eligible_courses s in
  print_endline
    "Here are the courses you are qualified for, type its full name to enroll:";
  List.iter (fun c -> print_endline ("* " ^ c)) available_courses;
  let choice = read_line () |> String.uppercase_ascii in
  if List.exists (fun x -> x = choice) available_courses then begin
    curr_class := choice;
    print_endline ("You are now taking " ^ !curr_class);
    play_questions !curr_class;
    (* Check if all courses are completed *)
    let num = get_num_courses s in
    if num < 8 then begin
      print_endline
        ("You need to take "
        ^ string_of_int (8 - num)
        ^ " more courses to graduate.");
      choose_class s (* Call choose_class again for the next course *)
    end
    else
      print_endline
        ("CONGRATULATIONS " ^ get_name s
       ^ "!, you have graduated from Programmer University!")
  end
  else begin
    print_endline "Invalid choice or not qualified";
    choose_class s
  end

let rec play_story (txt : string list) =
  match txt with
  | h :: t ->
      (match h with
      | "SETUP" -> setup_classmates ()
      | "SETNAME" ->
          init_teacher teacher "Mr. Cornell" Male;
          game_set_name ()
      | "SETGENDER" -> game_set_gender ()
      | "GREET" -> greet ()
      | "WAIT" -> wait_for_yes notify (read_line ())
      | "CHOOSECLASS" -> choose_class player (* Start class choosing *)
      | text -> print_endline text);
      play_story t
  | _ -> print_endline ""

let begin_story_game () = play_story story_text
