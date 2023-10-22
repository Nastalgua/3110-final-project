type player_obj

val game_setup : unit -> player_obj
val loop : player_obj -> Raylib.Color.t -> unit
val start_game : unit -> unit
