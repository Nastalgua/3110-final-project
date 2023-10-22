open Student

let player = Student.new_student

(** A recursive function that waits for the user to say yes before starting fn
    which is intended to be a function or game that starts once the user says
    yes *)
let rec wait_for_yes (fn : string) (choice : string) =
  match choice with
  | "Yes" -> print_endline fn
  | "No" ->
      let new_choice = read_line () in
      wait_for_yes fn new_choice
  | _ ->
      let new_choice = read_line () in
      wait_for_yes fn new_choice

let get_gender (choice : int) =
  match choice with
  | 1 -> Student.Male
  | 2 -> Student.Female
  | 3 -> Student.Other
  | _ -> Student.Other

let intro () =
  print_endline "Welcome to Programmer University!";
  print_endline "What is your name?";
  let name = read_line () in
  print_endline "Select your gender\n (1) Male  (2) Female  (3) Other";
  let choice = read_int () in
  print_endline "Creating character...";
  Student.init_student player name (choice |> get_gender);
  Student.print_student player;
  print_endline ("Hi " ^ name ^ " cheesed to meet you");
  print_endline
    "Aspiring coders and hackers from all corners of the globe gather";
  print_endline
    "to hone their digital skills and unlock the secrets of the cyber world.";
  print_endline
    "As a student you must embark upon a long, arduous, mindblowing journey of \
     learning";
  print_endline "Your journey starts with CS 1110 \nGoodluck soldier"

let game () =
  print_endline "Welcome to CS 1110!";
  print_endline "In order to pass CS 1110 you must pass our test";
  print_endline "This test will require you to [...]";
  print_endline "Would you like to take the test now?"

let ending () =
  print_endline "CONGRATS You have reached the end of Programmer University...";
  print_endline "Ending WIP"

let () =
  intro ();
  game ();
  ending ()
