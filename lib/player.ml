let ball_color = Raylib.Color.blue

type player_info = {
  grade : int;
  mutable pos : Raylib.Vector2.t;
  mutable dir : int;
}

let create x y = { grade = 0; pos = Raylib.Vector2.create x y; dir = 1 }
let grade (p : player_info) = p.grade

let update_pos p x y =
  Raylib.Vector2.set_x p.pos x;
  Raylib.Vector2.set_y p.pos y

let pos (p : player_info) = p.pos
let update_dir p d = p.dir <- d
let dir (p : player_info) = p.dir
let draw p player_size = Raylib.draw_circle_v p.pos player_size ball_color
