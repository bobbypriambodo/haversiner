open Haversine

let epsilon = 0.01 (* We tolerate difference of +- 10 meters *)

let test_set = [
  "calculate_distance BNA-LAX", `Quick, (fun () ->
      (* Distance from BNA to LAX should roughly be 2886.45 km *)
      let bna = coordinate_of_floats ~lat:36.12 ~long:(-86.67) in
      let lax = coordinate_of_floats ~lat:33.94 ~long:(-118.4) in

      let result = calculate_distance bna lax in

      Alcotest.(check (float epsilon)) "close enough" 2886.45 result
    );

  "calculate_distance JAK-BDG", `Quick, (fun _ ->
      (* Distance from Jakarta to Bandung should roughly be 114.78 km *)
      let jak = coordinate_of_floats ~lat:(-6.21462) ~long:106.84513 in
      let bdg = coordinate_of_floats ~lat:(-6.90389) ~long:107.61861 in

      let result = calculate_distance jak bdg in

      Alcotest.(check (float epsilon)) "close enough" 114.78 result
    );
]
