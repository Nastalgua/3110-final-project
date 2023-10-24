type projectile = {
  mutable pos : Raylib.Vector2.t;
  dir : Raylib.Vector2.t;
}

let create x y dir = { pos = Raylib.Vector2.create x y; dir }

let move_in_dir p spd =
  let dir = p.dir in
  let move_v = Raylib.Vector2.scale dir (spd *. Raylib.get_frame_time ()) in
  p.pos <- Raylib.Vector2.add p.pos move_v

let pos p = p.pos
let x_pos p = Raylib.Vector2.x (pos p)
let y_pos p = Raylib.Vector2.y (pos p)

let has_left_screen p width height =
  let x = x_pos p in
  let y = y_pos p in
  not
    (x >= 0.0 && y >= 0.0 && x <= float_of_int width && y <= float_of_int height)

let draw p size = Raylib.draw_circle_v p.pos size Raylib.Color.pink
