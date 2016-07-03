(define (problem RDistribuye-2)
(:domain RobotDistribuidor)
(:objects
	r1 - robot
	r2 - robot
	p1 - paquete
	p2 - paquete
	p3 - paquete
	hab0 - habitacion
	hab1 - habitacion
	hab2 - habitacion
	hab3 - habitacion 
	fl0 - flevel
	fl1 - flevel
	fl2 - flevel
	)
(:init
	(libre r1)
	(libre r2)
	(batrestante r1 fl2) ; inicialmente tiene la batería cargada
	(batrestante r2 fl2) ; inicialmente tiene la batería cargada
	(at r1 hab0)
	(at r2 hab2)
	(at p1 hab0)
	(at p2 hab2)
	(at p3 hab0)
	(cambio fl2 fl1) ; disminuye la batería
	(cambio fl1 fl0) ; disminuye la batería
	(cambio fl0 fl2) ; se carga la batería
	(conectada hab0 hab1)
	(conectada hab1 hab0)
	(conectada hab2 hab1)
	(conectada hab1 hab2)
	(conectada hab3 hab2)
	(conectada hab2 hab3)
)
(:goal (and
	(at r1 hab1)
	(at r2 hab1)
	(at p2 hab0)
	(at p1 hab2)
	(at p3 hab3)
	))
)
