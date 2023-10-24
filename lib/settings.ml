let width = 800
let height = 500
let start_fraction = 4.0 /. 5.0
let start_x = float_of_int width *. start_fraction
let start_y = float_of_int height *. start_fraction
let circle_size = 25.0
let movement_speed = 300.0
let margin = 50.0
let spawn_rate = 0.8 (* In seconds *)
let target_fps = 60

let movement_area =
  let x = int_of_float margin - int_of_float circle_size in
  let y = int_of_float start_y - int_of_float circle_size in
  let length =
    int_of_float (float_of_int width -. (2.0 *. margin) +. (circle_size *. 2.0))
  in
  (x, y, length)
