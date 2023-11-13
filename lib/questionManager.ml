type t = Question.t Queue.t

let curr = ref None

let create q_lst =
  let q = Queue.create () in
  let rec add lst =
    match lst with
    | [] -> ()
    | h :: t ->
        Queue.add h q;
        add t
  in
  add q_lst;
  q

let pop q_m = Queue.take_opt q_m
let peek q_m = Queue.peek q_m
let clear q_m = Queue.clear q_m
let is_empty q_m = Queue.is_empty q_m

let draw_question q =
  let open Raylib in
  let question_str = Question.get_text q in
  draw_text question_str 0 0 25 Color.black
