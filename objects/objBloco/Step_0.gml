if global.isFim{
	exit
}


if ! global.blocoAlturaCerta{
	y ++
	
	if y >= 416{
		global.blocoAlturaCerta = true
	}
}