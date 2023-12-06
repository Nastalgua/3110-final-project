open Student

let player = new_student ()
let play_game () = () 

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
  "Welcome to CS 1110!";
  "In order to pass CS 1110 you must pass our test";
  "This test will require you to [...]";
  "Would you like to take the test now?";
  "WAIT";
  "Welcome to CS 2110!";
  "In order to pass CS 2110 you must pass our test";
  "This test will require you to [...]";
  "Would you like to take the test now?";
  "WAIT";
  "Welcome to CS 3110!";
  "In order to pass CS 3110 you must pass our test";
  "This test will require you to [...]";
  "Would you like to take the test now?";
  "WAIT";
  "Welcome to CS 2800!";
  "In order to pass CS 2800 you must pass our test";
  "This test will require you to [...]";
  "Would you like to take the test now?";
  "WAIT";
  "Welcome to PHYS 1112!";
  "In order to pass PHYS 1112 you must pass our test";
  "This test will require you to [...]";
  "Would you like to take the test now?";
  "WAIT";
  "Welcome to PHYS 2213";
  "In order to pass PHYS 2213 you must pass our test";
  "This test will require you to [...]";
  "Would you like to take the test now?";
  "WAIT";
  "Welcome to MATH 1920!";
  "In order to pass MATH 1920 you must pass our test";
  "This test will require you to [...]";
  "Would you like to take the test now?";
  "WAIT";
  "Welcome to MATH 2940!";
  "In order to pass MATH 2940 you must pass our test";
  "This test will require you to [...]";
  "Would you like to take the test now?";
  "WAIT";

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

let rec play_story (txt : string list) =
  match txt with
  | [] -> print_endline "End of Story"
  | h :: t -> (
      match h with
      | "SETNAME" -> game_set_name ();
      | "SETGENDER" -> game_set_gender ();
      | "GREET" -> greet();
      | "WAIT" -> wait_for_yes (notify) (read_line ());
      | text -> (print_endline text););
      play_story t

let begin_story_game () =
  play_story story_text;
  print_student player
