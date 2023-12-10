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

let rec split_text text font_size window_length =
  let characters_per_line = (window_length + 400) / font_size in
  let rec split acc txt =
    if String.length txt > characters_per_line then
      let split_index =
        try String.rindex_from txt characters_per_line ' '
        with Not_found -> characters_per_line
      in
      let line = String.sub txt 0 (split_index + 1) in
      let remaining_text =
        String.sub txt (split_index + 1) (String.length txt - split_index - 1)
      in
      split (line :: acc) remaining_text
    else List.rev (txt :: acc)
  in
  split [] text |> String.concat "\n"

let count_newlines text =
  let rec count_chars str count index =
    if index < 0 then count
    else if String.get str index = '\n' then
      count_chars str (count + 1) (index - 1)
    else count_chars str count (index - 1)
  in
  count_chars text 0 (String.length text - 1)

let draw_question q =
  let open Raylib in
  let q_raw = Question.get_text q in
  let question_str =
    split_text q_raw Settings.question_text_size Settings.width
  in
  let choices = Question.string_lst_of_choices q in
  let start_y = int_of_float Settings.start_y + Settings.rect_height in
  let choice_start_y =
    int_of_float Settings.start_y
    + (count_newlines question_str * 50)
    + Settings.rect_height
  in
  let start_x = int_of_float Settings.margin in
  draw_text question_str start_x start_y Settings.question_text_size Color.black;
  for i = 0 to List.length choices - 1 do
    let choice_text = List.nth choices i in
    let updated_choice_text =
      String.make 1 (Char.chr (Char.code 'A' + i)) ^ ": " ^ choice_text
    in
    draw_text updated_choice_text start_x
      (choice_start_y + ((i + 1) * 25))
      Settings.choice_text_size Color.black
  done
