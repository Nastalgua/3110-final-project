let width = 800
let height = 500
let start_fraction = 3.0 /. 4.0
let start_x = float_of_int width *. start_fraction
let start_y = float_of_int height *. start_fraction
let circle_size = 25.0
let movement_speed = 5.0
let margin = 50.0

type player_obj = Player.player_info

let game_setup () =
  Raylib.init_window width height "Course Game";
  Raylib.set_target_fps 60;
  Player.create start_x start_y

let player_controller (player : player_obj) =
  let open Raylib in
  let old_pos = Player.pos player in
  let old_dir = Player.dir player in
  let dir =
    if is_mouse_button_pressed MouseButton.Left then (
      Player.update_dir player (old_dir * -1);
      Player.dir player)
    else old_dir
  in
  let future_pos d = Vector2.x old_pos +. (movement_speed *. float_of_int d) in
  let temp_pos_x = future_pos dir in
  let next_x =
    (* player bounding *)
    let new_dir =
      if not (temp_pos_x >= margin) then 1
      else if not (temp_pos_x <= float_of_int width -. margin) then -1
      else dir
    in
    Player.update_dir player new_dir;
    future_pos new_dir
  in
  Player.update_pos player next_x (Vector2.y old_pos);
  Player.pos player

let rec loop player ball_color =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      let next = player_controller player in
      begin_drawing ();
      draw_text
        (""
        ^ string_of_float (Vector2.x (get_mouse_position ()))
        ^ " "
        ^ string_of_float (Vector2.y (get_mouse_position ())))
        10 10 20 Color.darkgray;
      clear_background Color.raywhite;
      draw_circle_v next circle_size ball_color;
      end_drawing ();
      loop player ball_color

let start_game () =
  let player = game_setup () in
  loop player Raylib.Color.darkblue
