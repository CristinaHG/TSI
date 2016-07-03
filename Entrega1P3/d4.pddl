(define (domain RobotDistribuidor)
  (:requirements :typing )
  (:types objeto - object
	paquete robot - objeto
	habitacion 
	;numero - integer
  )
  (:predicates
    (at ?r - objeto ?h - habitacion)
    (conectada ?h1 - habitacion ?h2 - habitacion)
    (libre ?r - robot)
    (cogido ?paq - paquete ?r - robot)
    ;(cambio-lento ?n1 ?n2 - numero)
    ;(cambio-rapido ?n1 ?n2 - numero)
)

(:functions
    (batrestante ?r - robot))

  (:action cargarbat
	:parameters(?r - robot)
	:precondition:(<=(batrestante ?r) 25)
	:effect (increase (batrestante ?r ) 50))

  (:action mover-lento
    :parameters (?r - robot ?origen ?destino - habitacion )
    :precondition (and
		     (at ?r ?origen)
		     (conectada ?origen ?destino)
		     (>=(batrestante ?r) 25))
		     ;(cambio-lento ?bat1 ?bat2)
    :effect (and
              (at ?r ?destino)
              (not (at ?r ?origen))
	      (decrease (batrestante ?r ) 25)))

  (:action mover-rapido
    :parameters (?r - robot ?origen ?destino - habitacion )
    :precondition (and
		     (at ?r ?origen)
		     (conectada ?origen ?destino)
		     (>=(batrestante ?r) 50))
    :effect (and
              (at ?r ?destino)
              (not (at ?r ?origen))
	      (decrease (batrestante ?r ) 50)))

  (:action coger
    :parameters ( ?hab - habitacion ?paq - paquete ?r - robot)
    :precondition (and
	            (at ?paq ?hab)
		    (libre ?r)
	            (at ?r ?hab))
    :effect (and
              (not (libre ?r))
	      (cogido ?paq ?r )
	      (not (at ?paq ?hab))))

  (:action dejar
    :parameters ( ?hab - habitacion ?paq - paquete ?r - robot)
    :precondition (and
		    (cogido ?paq ?r)
	            (at ?r ?hab))
    :effect (and
	      (at ?paq ?hab)
              (libre ?r)
    	      (not (cogido ?paq ?r)))))




