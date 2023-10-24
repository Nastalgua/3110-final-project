type player_obj = Player.player_info
type p_manager = ProjectileManager.p_manager

let time = ref 0.0

let game_setup () =
  Raylib.init_window Settings.width Settings.height "Course Game";
  Raylib.set_target_fps 60;
  Player.create Settings.start_x Settings.start_y

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
  let future_pos d =
    Vector2.x old_pos
    +. (Settings.movement_speed *. float_of_int d *. Raylib.get_frame_time ())
  in
  let temp_pos_x = future_pos dir in
  let next_x =
    (* player bounding *)
    let new_dir =
      if not (temp_pos_x >= Settings.margin) then 1
      else if not (temp_pos_x <= float_of_int Settings.width -. Settings.margin)
      then -1
      else dir
    in
    Player.update_dir player new_dir;
    future_pos new_dir
  in
  Player.update_pos player next_x (Vector2.y old_pos)

let draw_movement_bar () =
  let color = Raylib.Color.gray in
  let x, y, len = Settings.movement_area in
  Raylib.draw_rectangle x y len 50 color

let set_timeout callback =
  if !time /. (Settings.spawn_rate *. 60.0) >= 1.0 then (fun () ->
    callback ();
    time := 0.0)
  else fun () -> time := !time +. 1.0

let rec loop player proj_manager ball_color =
  match Raylib.window_should_close () with
  | true -> Raylib.close_window ()
  | false ->
      let open Raylib in
      let _ =
        player_controller player;
        set_timeout
          (fun () -> ProjectileManager.create_projectile proj_manager)
          ()
      in
      begin_drawing ();
      draw_text
        (""
        ^ string_of_float (Vector2.x (get_mouse_position ()))
        ^ " "
        ^ string_of_float (Vector2.y (get_mouse_position ())))
        10 10 20 Color.darkgray;
      clear_background Color.raywhite;
      draw_movement_bar ();
      ProjectileManager.update proj_manager;
      Player.draw player Settings.circle_size;
      end_drawing ();
      loop player proj_manager ball_color

let start_game () =
  let player = game_setup () in
  let proj_manager =
    ProjectileManager.create Settings.width Settings.spawn_rate
  in
  loop player proj_manager Raylib.Color.darkblue
