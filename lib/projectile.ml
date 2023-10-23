type projectile = {
  mutable pos : Raylib.Vector2.t;
  dir : Raylib.Vector2.t;
}

let create x y dir = { pos = Raylib.Vector2.create x y; dir }

let move_in_dir p spd =
  let dir = p.dir in
  let move_v = Raylib.Vector2.scale dir spd in
  p.pos <- Raylib.Vector2.add p.pos move_v

let pos p = p.pos

let has_left_screen p width height =
  let x = Raylib.Vector2.x p.pos in
  let y = Raylib.Vector2.y p.pos in
  not
    (x >= 0.0 && y >= 0.0 && x <= float_of_int width && y <= float_of_int height)
