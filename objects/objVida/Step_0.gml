/*
Agora é só configurar para mostrar se a quantidade de vida sobrando 
através dos sprites
Para isto, vamos usar o identifcador como exemplo
Nós sabemos que quando a 3 vidas, terá 2 bolinhas acesas
QUando eu tenho 2 vidas, terá 1 bolinha
E quando eu tenho 1 vida, não terá bolinha acesa
Ou seja, toda vez a quantidade de vida é maior do que a quantidade 
de bolinhas acesas
E para saber qual bolinha deve se acender ou não, é só comparar a quantidade
de vida ao identificador
Ou seja, caso o jogador tenha 3 vida, as vidas 1 e 2, ficarão acesas
Já a vida 3, ficará apagada
Se ele tiver 2 vidas, só a primeira bolinha ficará acesa, enquanto
as bolinhas 2 e 3, ficarão apagadas
Se tiver 1 vida,as 3 ficarão apagadas
Sendo assim, temos certeza der que, todas vez que o idenficador for maior
ou igual a quantidade de vidas, a bolinha ficará apagada
Se o identificador for menor, ficará aceso
*/
if identificador >= global.vidas{
	sprite_index = sprVidaUsada
}
else{
	
	sprite_index = sprBolaVida
}