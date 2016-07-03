(define (domain RobotDistribuidor)

  (:requirements :typing)
  (:types objeto - object
	paquete robot - objeto
	habitacion)

  (:predicates
    (at ?r - objeto ?h - habitacion)
    (conectada ?h1 - habitacion ?h2 - habitacion)
    (libre ?r - robot)
    (cogido ?paq - paquete ?r - robot)
  )


  (:action mover
    :parameters (?r - robot ?origen ?destino - habitacion)
    :precondition (and
		     (at ?r ?origen)
		     (conectada ?origen ?destino))
    :effect (and
              (at ?r ?destino)
              (not (at ?r ?origen)))
  )

  (:action coger
    :parameters ( ?hab - habitacion ?paq - paquete ?r - robot)
    :precondition (and
	            (at ?paq ?hab)
		    (libre ?r)
	            (at ?r ?hab)
	          )
    :effect (and
              (not (libre ?r))
	      (cogido ?paq ?r )
	      (not (at ?paq ?hab))
	    )
  )


  (:action dejar
    :parameters ( ?hab - habitacion ?paq - paquete ?r - robot)
    :precondition (and
		    (cogido ?paq ?r)
	            (at ?r ?hab))
    :effect (and
	      (at ?paq ?hab)
              (libre ?r)
    	      (not (cogido ?paq ?r)))
  )
)




