type player_obj = Player.player_info
type p_manager = ProjectileManager.t

let time = ref 0.0

let game_setup () =
  Raylib.init_window Settings.width Settings.height "Course Game";
  Raylib.init_audio_device ();
  Raylib.set_target_fps Settings.target_fps;
  Settings.set_imgs ();
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
  Raylib.draw_rectangle x y len Settings.rect_height color

(* [set_timeout callback] runs the callback every at each
   [Settings.spawn_rate]. *)
let set_timeout callback =
  if !time /. (Settings.spawn_rate *. float_of_int Settings.target_fps) >= 1.0
  then (
    callback ();
    time := 0.0)
  else time := !time +. 1.0

let rec loop player proj_manager question_manager ball_color music =
  match Raylib.window_should_close () with
  | true ->
      Raylib.unload_music_stream music;
      Raylib.close_audio_device ();
      Raylib.close_window ()
  | false ->
      let open Raylib in
      update_music_stream music;
      let _ =
        player_controller player;
        set_timeout (fun () -> ProjectileManager.create_projectile proj_manager)
      in
      begin_drawing ();
      clear_background Color.raywhite;
      draw_movement_bar ();
      ProjectileManager.update proj_manager question_manager;
      QuestionManager.draw_question
        (match QuestionManager.peek question_manager with
        | None -> Question.default_question
        | Some q -> q);
      Player.draw player Settings.circle_size;
      end_drawing ();
      loop player proj_manager question_manager ball_color music

let start_game q_lst =
  let player = game_setup () in
  let proj_manager =
    ProjectileManager.create Settings.width Settings.spawn_rate player
  in
  let path = Raylib.get_working_directory () ^ "/lib/resources/" in
  let music = Raylib.load_music_stream (path ^ "pizza.mp3") in
  let question_manager = QuestionManager.create q_lst in
  Raylib.play_music_stream music;
  loop player proj_manager question_manager Raylib.Color.darkblue music
