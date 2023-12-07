open Student
open CourseGame
open Score

let player = new_student ()
let play_game () = ()
let curr_class = ref ""
let num_qs = ref 0

(* JSON for organization of the student *)
let story_text =
  [
    (*========================= INTRO ===========================*)
    "Welcome to Programmer University!";
    "What is your name?";
    "SETNAME";
    "Select your gender\n (1) Male  (2) Female  (3) Other";
    "SETGENDER";
    "Creating character...";
    "GREET";
    "Aspiring coders and hackers from all corners of the globe gather";
    "to hone their digital skills and unlock the secrets of the cyber world.";
    "As a student you must embark upon a long, arduous, mindblowing journey of \
     learning";
    "Choose a course to start off with \nGoodluck soldier";
    "CHOOSECLASS";
    (* Initiates class choosing after intro *)
    (*===================== END OF INTRO ===========================*)
  ]

let game_set_name () = set_name player (read_line ())
let game_set_gender () = set_gender player (read_int () |> get_gender)
let greet () = print_endline ("Hi " ^ player.student_name ^ " nice meeting you!")

let notify (input : string) =
  if input = "Yes" then print_endline "You pressed Yes!"

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

let play_class_scene (c : string) =
  print_endline ("Welcome to " ^ c ^ "!");
  print_endline ("In order to pass " ^ c ^ " you must pass our test");
  print_endline "This test will require you to answer a lot of questions";
  print_endline "Would you like to take the test now?"

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
  print_endline (string_of_int !score);
  (* update student info only if they pass*)
  (* passing score will be 2/5 questions *)
  (let overall = float_of_int !score /. float_of_int !num_qs in
   if overall >= 0.4 then (
     add_course player c;
     add_grade player overall;
     print_student player)
   else print_endline "You failed this class, please try again!");
  reset_score ()

let get_num_courses (s : student) : int = s.num_courses

let rec choose_class (s : student) =
  let available_courses = eligible_courses s in
  let num = get_num_courses s in
  print_endline "Type in the classes you want to take:";
  List.iter (fun c -> print_endline ("* " ^ c)) available_courses;
  let choice = read_line () in
  if List.exists (fun x -> x = choice) available_courses then begin
    curr_class := choice;
    print_endline ("You are now taking " ^ !curr_class);
    play_class_scene !curr_class;
    play_questions !curr_class;
    (* Using the method to increment num_courses *)
    if num < 7 then choose_class s
    else
      print_endline
        "CONGRATS You have reached the end of Programmer University... ENDING \
         WIP"
  end
  else begin
    print_endline "Invalid choice or not qualified";
    choose_class s
  end

let rec play_story (txt : string list) =
  match txt with
  | [] -> print_endline "Intro complete. Start choosing your classes."
  | h :: t ->
      (match h with
      | "SETNAME" -> game_set_name ()
      | "SETGENDER" -> game_set_gender ()
      | "GREET" -> greet ()
      | "WAIT" -> wait_for_yes notify (read_line ())
      | "CHOOSECLASS" -> choose_class player (* Start class choosing *)
      | text -> print_endline text);
      play_story t

let begin_story_game () = play_story story_text

let play_class_scene (c : string) =
  print_endline ("Welcome to " ^ c ^ "!");
  print_endline ("In order to pass " ^ c ^ " you must pass our test");
  print_endline "This test will require you to answer a lot of questions";
  print_endline "Would you like to take the test now?"
