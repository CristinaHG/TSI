(define (problem RDistribuye-1)
(:domain RobotDistribuidor)
(:objects
	r1 - robot
	p1 - paquete
	p2 - paquete
	hab0 - habitacion
	hab1 - habitacion
	hab2 - habitacion
	)
(:init
	(libre r1)
	(= (batrestante r1 ) 100) ; inicialmente tiene la batería cargada
	(at r1 hab0)
	(at p1 hab0)
	(at p2 hab2)
;	(cambio-lento 100 75) ; disminuye la batería
;	(cambio-lento 75 50) ; disminuye la batería
;	(cambio-lento 50 25) 
;	(cambio-lento 25 0) 
;	(cambio-lento 0 100) 
;	(cambio-rapido fl2 fl0)
;	(cambio-rapido fl0 fl2)

	(conectada hab0 hab1)
	(conectada hab1 hab0)
	(conectada hab2 hab1)
	(conectada hab1 hab2)
)
(:goal (and
	(at r1 hab1)
	(at p2 hab0)
	(at p1 hab2)
	))
)
