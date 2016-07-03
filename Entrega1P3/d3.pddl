(define (domain RobotDistribuidor)
  (:requirements :typing)
  (:types objeto - object
	paquete robot - objeto
	habitacion flevel)

  (:predicates
    (at ?r - objeto ?h - habitacion)
    (conectada ?h1 - habitacion ?h2 - habitacion)
    (libre ?r - robot)
    (cogido ?paq - paquete ?r - robot)
    (batrestante ?r - robot ?bat - flevel)
    (cambio-lento ?n1 ?n2 - flevel)
    (cambio-rapido ?n1 ?n2 - flevel))

  (:action mover-lento
    :parameters (?r - robot ?origen ?destino - habitacion ?bat1 ?bat2 - flevel)
    :precondition (and
		     (at ?r ?origen)
		     (conectada ?origen ?destino)
		     (batrestante ?r ?bat1)
		     (cambio-lento ?bat1 ?bat2))
    :effect (and
              (at ?r ?destino)
              (not (at ?r ?origen))
	      (not (batrestante ?r ?bat1))
	      (batrestante ?r ?bat2)))

  (:action mover-rapido
    :parameters (?r - robot ?origen ?destino - habitacion ?bat1 ?bat2 - flevel)
    :precondition (and
		     (at ?r ?origen)
		     (conectada ?origen ?destino)
		     (batrestante ?r ?bat1)
		     (cambio-rapido ?bat1 ?bat2))
    :effect (and
              (at ?r ?destino)
              (not (at ?r ?origen))
	      (not (batrestante ?r ?bat1))
	      (batrestante ?r ?bat2)))

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




