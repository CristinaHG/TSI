(define (problem RDistribuye-1)
(:domain RobotDistribuidor)
(:objects
	r1 - robot
	p1 - paquete
	p2 - paquete
	hab0 - habitacion
	hab1 - habitacion
	hab2 - habitacion
	fl0 - flevel
	fl1 - flevel
	fl2 - flevel
	)
(:init
	(libre r1)
	(batrestante r1 fl2) ; inicialmente tiene la batería cargada
	(at r1 hab0)
	(at p1 hab0)
	(at p2 hab2)
	(cambio fl2 fl1) ; disminuye la batería
	(cambio fl1 fl0) ; disminuye la batería
	(cambio fl0 fl2) ; se carga la batería
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
