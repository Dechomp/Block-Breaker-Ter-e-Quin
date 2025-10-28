//Ao destruir o bloco, ele irá somar aos pontos
global.pontos+= 10

/*
Nós já somamos, mas, ainda não mostramos a quantidade de pontos na tela
Para mostrar, iremos criar o objPontos
*/

/*
Quando o objeto for destruido, iremos checar qual é o tipo dele

Caso o tipo seja 15, quer dizer que é um bloco com uma bola dentro
Então, quando for destruido, e o tipo dele for 15, iremos criar uma bola no lugar
*/

global.quantBlocos--

//Caso o bloco seja de bola
if tipoBloco == 15{
	instance_create_layer(x, y, "Instances", objBola)
}

//Caso o bloco seja de coração
if tipoBloco == 16 and global.quantVidas < 3{
	instance_create_layer(x, y, "Instances", objVida)
}



