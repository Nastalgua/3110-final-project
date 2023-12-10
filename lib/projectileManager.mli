type t

(* [create w c r] creates a projectile manager. [c] number of projectiles will
   spawn on horizontal line from [0...w]. Projectiles will spawn at a rate of
   [r]. *)
val create : int -> float -> Player.player_info -> t

(* [pick_random_spawn] gives back a random Vector2 pos for the projectile to
   start at. *)
val pick_random_spawn : t -> Raylib.Vector2.t

(* [pick_target_pos p] gives back a random Vector2 pos with: x = random float
   from distance p[0] + p[2]; y = p[1] *)
val pick_target_pos : int * int * int -> Raylib.Vector2.t

(* [create_projectile p] creates a projectile. Creates a random direction for
   the projectile to go in. Adds the projectile to p_manager. *)
val create_projectile : t -> unit

(* [float_width] gives width as a float. *)
val float_width : t -> float

(* [has_projectile_hit_player p obj] Checks if the [obj] has hit the player
   inside of [p]. *)
val has_projectile_hit_player : t -> Projectile.t -> bool

(* [update p] updates the positions of the created projectiles. Creates new
   projectiles if [timeout] with time=rate has finished. *)
val update : t -> QuestionManager.t -> unit
