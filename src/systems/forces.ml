(* Question 5 *)
open Component_defs

class type physics =
  object
    inherit mass
    inherit sum_forces
    inherit velocity
  end

type t = physics

let init () = ()
let dt = 1000.0 /. 60.0

let update _dt el =
  Seq.iter
    (fun (e : t) ->
      let m = e#mass#get in
      if Float.is_finite m then begin
        let f = e#sum_forces#get in
        e#sum_forces#set Vector.zero;
        let a = Vector.mult (1. /. m) f in
        let dv = Vector.mult dt a in
        let v = e#velocity#get in
        e#velocity#set (Vector.add v dv)
      end)
    el
