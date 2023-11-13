(* All questions can have at most 26 choices. *)
let questions : Question.t list =
  [
    Question.make "What is your favorite fruit" 0
      [ "Apple"; "Bitches"; "Orange"; "Your mum" ];
  ]

let go_next q_manager =
  match QuestionManager.pop q_manager with
  | None -> ()
  | Some _ -> ()

let got_question_correct q_manager =
  Score.add_one ();
  go_next q_manager

let got_question_wrong q_manager = go_next q_manager
