let projectile_spd = 100.0
let projectile_size = 25.0

type p_manager = {
  width : int;
  rate : float;
  mutable created_p : Projectile.projectile array;
}

let create w r = { width = w; rate = r; created_p = [||] }
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
  let v = pick_random_spawn p in
  let x = Raylib.Vector2.x v in
  let target = pick_target_pos Settings.movement_area in
  let dir = Raylib.Vector2.normalize (Raylib.Vector2.subtract target v) in
  let proj = Projectile.create x 0.0 dir in
  p.created_p <- Array.append p.created_p [| proj |]

let update p =
  let todo x =
    Projectile.move_in_dir x projectile_spd;
    if not (Projectile.has_left_screen x Settings.width Settings.height) then
      Projectile.draw x projectile_size
    else ()
  in
  Array.iter todo p.created_p
