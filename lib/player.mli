(* All the player information *)
type player_info

(* Player module that represents the player for just the course game. *)

(* [create x y] makes a new player for the game. Spawns the player at x and y
   position *)
val create : float -> float -> player_info

(* [grade p] gives back the integer version of the player's grade. *)
val grade : player_info -> int

(* [update_pos p x y] updates the player's position to x: [x] y: [y] *)
val update_pos : player_info -> float -> float -> unit

(* [get_pos p] gives back the position of the player. *)
val pos : player_info -> Raylib.Vector2.t

(* [update_dir p d] changes the player's direction of movement to [d] *)
val update_dir : player_info -> int -> unit

(* [dir p] gives back the direction the player is moving in. -1 --> Left 1 -->
   Right *)
val dir : player_info -> int
