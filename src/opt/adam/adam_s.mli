module Make (P : Prms.PT) : sig
  type fv = Owl.Algodiff.S.t
  type prm = Owl.Algodiff.S.t
  type prms = prm P.t

  type lr =
    | Fix of float
    | Ada of (int -> float)

  type f = prms -> fv
  type state
  type stop = state -> bool

  val lr : state -> lr
  val iter : state -> int
  val prms : state -> prms
  val f : state -> f
  val fv : state -> float

  val init
    :  ?beta1:float
    -> ?beta2:float
    -> ?eps:float
    -> prms0:prms
    -> f:f
    -> lr:lr
    -> unit
    -> state

  val stop : state -> bool
  val min : ?stop:stop -> state -> state
  val max : ?stop:stop -> state -> state
end