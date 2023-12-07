(* All questions can have at most 26 choices. *)

(* To create a new set of questions, follow example below: *)
let cs1110 : Question.t list =
  [
    (* CS 1110 *)
    Question.make "How is a comment written in Python?" 1
      [ "Using //"; "Using #"; "Using /* */"; "Using <!-- -->" ];
  ]

let cs2110 : Question.t list =
  [
    (* CS 1110 *)
    Question.make "How is a comment written in Python?" 1
      [ "Using //"; "Using #"; "Using /* */"; "Using <!-- -->" ];
  ]

let cs2800 : Question.t list =
  [
    (* CS 1110 *)
    Question.make "How is a comment written in Python?" 1
      [ "Using //"; "Using #"; "Using /* */"; "Using <!-- -->" ];
  ]

let cs3110 : Question.t list =
  [
    (* CS 1110 *)
    Question.make "How is a comment written in Python?" 1
      [ "Using //"; "Using #"; "Using /* */"; "Using <!-- -->" ];
  ]

let math1920 : Question.t list =
  [
    (* CS 1110 *)
    Question.make "How is a comment written in Python?" 1
      [ "Using //"; "Using #"; "Using /* */"; "Using <!-- -->" ];
  ]

let math2940 : Question.t list =
  [
    (* CS 1110 *)
    Question.make "How is a comment written in Python?" 1
      [ "Using //"; "Using #"; "Using /* */"; "Using <!-- -->" ];
  ]

let phys1112 : Question.t list =
  [
    (* CS 1110 *)
    Question.make "How is a comment written in Python?" 1
      [ "Using //"; "Using #"; "Using /* */"; "Using <!-- -->" ];
  ]

let phys2213 : Question.t list =
  [
    (* CS 1110 *)
    Question.make "How is a comment written in Python?" 1
      [ "Using //"; "Using #"; "Using /* */"; "Using <!-- -->" ];
  ]

let go_next q_manager =
  match QuestionManager.pop q_manager with
  | None -> ()
  | Some _ -> ()

let got_question_correct q_manager =
  Score.add_one ();
  go_next q_manager

let got_question_wrong q_manager = go_next q_manager
