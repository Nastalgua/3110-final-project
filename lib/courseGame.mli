type player_obj
type p_manager

(* [game_setup] creates game window and creates a player. *)
val game_setup : unit -> player_obj

(* [loop p c] runs the main game loop. Everything that should be updated every
   frame should be in this method. *)
val loop : player_obj -> p_manager -> Raylib.Color.t -> unit

(* [start_game] sets up the game and starts the game loop. *)
val start_game : unit -> unit
