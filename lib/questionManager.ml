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
let peek q_m = Queue.peek_opt q_m
let clear q_m = Queue.clear q_m
let is_empty q_m = Queue.is_empty q_m

let draw_question q =
  let open Raylib in
  let question_str = Question.get_text q in
  let choices = Question.string_lst_of_choices q in
  let start_y = int_of_float Settings.start_y + Settings.rect_height in
  let start_x = int_of_float Settings.margin in
  draw_text question_str start_x start_y Settings.question_text_size Color.black;
  for i = 0 to List.length choices - 1 do
    let choice_text = List.nth choices i in
    let updated_choice_text =
      String.make 1 (Char.chr (Char.code 'A' + i)) ^ ": " ^ choice_text
    in
    draw_text updated_choice_text start_x
      (start_y + ((i + 1) * 25))
      Settings.choice_text_size Color.black
  done
