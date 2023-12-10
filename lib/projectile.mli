(* [pos] is the position of the projectile. [dir] is the normalized vector of
   the direction of the projectile. *)
type t

(* [create x y dir] spawns a project that moves in a certain [dir]. *)
val create : float -> float -> Question.answer -> Raylib.Vector2.t -> t

(* [update_pos p spd] moves the projectile at spd in the direction when it was
   created. *)
val move_in_dir : t -> float -> unit

(* [pos p] gives back the position of the projectile. *)
val pos : t -> Raylib.Vector2.t

(* [x_pos] gives back the x-position of the projectile. *)
val x_pos : t -> float

(* [y_pos] gives back the y-position of the projectile. *)
val y_pos : t -> float

(* [get_ans] gives back the answer associated with the projectile. *)
val get_ans : t -> Question.answer

(* [has_left_screen p width height] returns true if projectile's position is
   outside of the box made from the top-left and bottom-right corners
   respectively: (0, 0), (width, height) *)
val has_left_screen : t -> int -> int -> bool

(* [draw p s] draws the projectile of [s] size using the Raylib library. *)
val draw : t -> float -> unit
