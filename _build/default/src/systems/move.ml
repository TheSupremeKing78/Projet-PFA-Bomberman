(* Question 3 *)
open Component_defs

class type movable =
  object
    inherit position
    inherit velocity
  end

type t = movable

let init () = ()
let dt = 1000. /. 60.

let update _dt el =
  Seq.iter
    (fun (e : t) ->
      let v = e#velocity#get in
      let p = e#position#get in
      let np = Vector.add p (Vector.mult dt v) in
      e#position#set np)
    el
