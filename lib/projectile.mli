(* [pos] is the position of the projectile. [dir] is the normalized vector of
   the direction of the projectile. *)
type projectile

(* [create x y dir] spawns a project that moves in a certain [dir]. *)
val create : float -> float -> Raylib.Vector2.t -> projectile

(* [update_pos p spd] moves the projectile at spd in the direction when it was
   created. *)
val move_in_dir : projectile -> float -> unit

(* [pos p] gives back the position of the projectile. *)
val pos : projectile -> Raylib.Vector2.t

(* [has_left_screen p width height] returns true if projectile's position is
   outside of the box made from the top-left and bottom-right corners
   respectively: (0, 0), (width, height) *)
val has_left_screen : projectile -> int -> int -> bool

(* [draw p s] draws the projectile of [s] size using the Raylib library. *)
val draw : projectile -> float -> unit
