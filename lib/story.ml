open Student
open CourseGame
open Score

let player = new_student ()
let play_game () = () 

let curr_class = ref ""
let num_qs = ref 0
(** JSON for organization of the student*)
let story_text = 
[
  (**========================= INTRO ===========================*)
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
  "WIP";
  (**===================== END OF INTRO ===========================*)
  (**===================== START OF GAME ===========================*)
  
  "CHOOSECLASS";
  "GOTOCLASS";
  "GETQUESTIONS";
  "Wow that was fun wasnt it? Now choose your next class";
  
  
  
  (**===================== END OF GAME ===========================*)
  (**======================== ENDING ============================*)
  "CONGRATS You have reached the end of Programmer University...";
  "ENDING WIP"
  (**======================== END OF ENDING ============================*)
]


let game_set_name () = set_name player (read_line ())

let game_set_gender () = set_gender player ((read_int ()) |> get_gender)

let greet () = print_endline ("Hi " ^ player.student_name ^ " nice meeting you!")

let notify (input : string) = if input = "Yes" then print_endline "You pressed Yes!"
let rec wait_for_yes (fn : string -> unit) (choice : string) =
  match choice with
  | "Yes" -> (fn choice)
  | "No" ->
      let new_choice = read_line () in
      wait_for_yes fn new_choice
  | _ ->
      let new_choice = read_line () in
      wait_for_yes fn new_choice

let check_pre_req (s : student) (c : string) =
  let courses = get_courses_taken s in
  match c with 
  | "CS 1110" | "MATH 1920" | "PHYS 1112" -> true
  | "CS 2110" -> if (has_course courses "CS 1110") then true else false
  | "CS 3110" -> if (has_course courses "CS 1110") && (has_course courses "CS 3110") then true else false
  | "CS 2800" -> if (has_course courses "CS 1110") then true else false
  | "PHYS 2213" -> if (has_course courses "PHYS 1112") then true else false
  | "PHYS 2940" -> if (has_course courses "MATH 1920") then true else false
  | _ -> false

let play_class_scene (c : string) = 
    print_endline ("Welcome to " ^ c ^ "!");
    print_endline ("In order to pass " ^ c ^ " you must pass our test");
    print_endline "This test will require you to answer a lot of questions";
    print_endline "Would you like to take the test now?"

let rec play_questions (c : string) =
  (
  match c with 
  | "CS 1110" -> (start_game Questions.cs1110); num_qs := List.length Questions.cs1110
  | "CS 2110" -> (start_game Questions.cs2110); num_qs := List.length Questions.cs2110
  | "CS 2800" -> (start_game Questions.cs2800); num_qs := List.length Questions.cs2800
  | "CS 3110" -> (start_game Questions.cs3110); num_qs := List.length Questions.cs3110
  | "PHYS 1112" -> (start_game Questions.phys1112); num_qs := List.length Questions.phys1112
  | "PHYS 2213" -> (start_game Questions.phys2213); num_qs := List.length Questions.phys2213
  | "MATH 1920" -> (start_game Questions.math1920); num_qs := List.length Questions.math1920
  | "MATH 2940" -> (start_game Questions.math2940); num_qs := List.length Questions.math2940
  | _ -> (print_endline "Class game DNE"));
  print_endline (string_of_int !score);
  (** update student info only if they pass*)
  (** passing score will be 50% *)
  (let overall = (float_of_int !score) /. (float_of_int !num_qs) in
  if overall >= 0.5 then 
    (
      (add_course player c);
      (add_grade player overall);
      (print_student player)
    )
else
  (print_endline "LOL YOU FAILED!!! XDDDDD"));
  reset_score ()

  

let rec choose_class (s : student) (choice : string) = 
  match choice with 
  | x -> if check_pre_req player x then ((curr_class := x); (print_endline "You may take this class"); (print_endline !curr_class)) else ((print_endline "Not qualified"); choose_class s (read_line ()));
  | _ -> print_endline "How did you get here"

let rec play_story (txt : string list) =
  match txt with
  | [] -> print_endline "End of Story"
  | h :: t -> (
      match h with
      | "SETNAME" -> game_set_name ();
      | "SETGENDER" -> game_set_gender ();
      | "GREET" -> greet();
      | "WAIT" -> wait_for_yes (notify) (read_line ());
      | "CHOOSECLASS" -> 
      (
      (print_endline "Choose a class to take (copy name exactly as it says here)
      * CS 1110
      * CS 2110
      * CS 3110
      * CS 2800
      * PHYS 1112
      * PHYS 2213
      * MATH 1920
      * MATH 2940
    ");
      
      choose_class player (read_line ())
      );
      | "GOTOCLASS" -> (play_class_scene !curr_class);
      | "GETQUESTIONS" -> (play_questions !curr_class)
      | text -> (print_endline text);
      );
      play_story t
      

let begin_story_game () =
  (play_story story_text)
