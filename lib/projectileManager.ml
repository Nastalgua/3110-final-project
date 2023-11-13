let projectile_spd = 100.0
let projectile_size = 16.5

type t = {
  width : int;
  rate : float;
  player : Player.player_info;
  mutable created_p : Projectile.t list;
}

let create w r p = { width = w; rate = r; player = p; created_p = [] }
let float_width p = float_of_int p.width

let pick_random_spawn p =
  Random.self_init ();
  let rand_x = Random.float (float_width p) in
  Raylib.Vector2.create rand_x 0.0

let pick_target_pos (x, y, len) =
  Random.self_init ();
  let rand_x = Random.float (float_of_int len -. float_of_int x) in
  Raylib.Vector2.create rand_x (float_of_int y)

let create_projectile p =
  let rand_answer = Question.pick_rand_ans () in
  let v = pick_random_spawn p in
  let x = Raylib.Vector2.x v in
  let target = pick_target_pos Settings.movement_area in
  let dir = Raylib.Vector2.normalize (Raylib.Vector2.subtract target v) in
  let proj = Projectile.create x 0.0 rand_answer dir in
  p.created_p <- proj :: p.created_p

let has_projectile_hit_player p obj =
  let play_x = Player.x_pos p.player in
  let play_y = Player.y_pos p.player in
  let obj_x = Projectile.x_pos obj in
  let obj_y = Projectile.y_pos obj in
  let play_radius = Settings.circle_size /. 2.0 in
  let obj_radius = projectile_size /. 1.0 in
  (* Better collision detection. *)
  let distance =
    sqrt
      (((play_x -. obj_x) *. (play_x -. obj_x))
      +. ((play_y -. obj_y) *. (play_y -. obj_y)))
  in
  distance <= play_radius +. obj_radius

let should_delete_projectile p obj q_manager =
  let collided_with_correct_answer () =
    if QuestionManager.is_empty q_manager then false
    else
      let curr_q = QuestionManager.peek q_manager in
      let selected_ans = Projectile.get_ans obj in
      Question.is_answer_correct curr_q selected_ans
  in
  if has_projectile_hit_player p obj then
    let _ =
      if collided_with_correct_answer () then
        Questions.got_question_correct q_manager
      else Questions.got_question_wrong q_manager
    in
    List.filter (fun x -> obj <> x) p.created_p
  else p.created_p

let update p q_manager =
  let todo x =
    Projectile.move_in_dir x projectile_spd;
    if not (Projectile.has_left_screen x Settings.width Settings.height) then
      Projectile.draw x projectile_size
    else ();
    p.created_p <- should_delete_projectile p x q_manager
  in
  List.iter todo p.created_p
