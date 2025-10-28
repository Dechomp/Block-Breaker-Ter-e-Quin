//Caso não tenha batido contra o player
if batidas == 0{
	//Desce a tela
	y += gravidade * 2
}

//Qunado for a ultima batida
else if batidas == 5{
	//Aumenta a quantidade de vidas do player
	global.vidas ++
	
	//Destruir a instancia
	instance_destroy()
}

//Se não for nem a primeira nem a última batida
else{
	//Ganha o efeito da gravidade
	direcaoVertical += gravidade
	
	//Soma a direção ao y
	y += direcaoVertical
	
	//Soma direção ao x
	x += direcaoHorizontal
	
	//Gira a imagem
	image_angle += velocidadeGiro
}

/*
Quando colidir com o objBloco, a afastamento tem que ser maior pois
O player pode usar disto para tirar vantagem
Para evitar, mandaremos o que o dobro do que há normalmente na
direcaoHorizontal
Mas para não bugar a direção, teremos que recber um novo valor
E para não perder a direção, teremos que pegar se o valor 
Que há em direção é positivo ou negativo, e independente do que vier
Multiplicamos por -1, assim mandando para o outro lado
Mas como sabermos se o valor é positivo ou negativo?
Para isto, usaremos a função sign()
Descrição:
function sign(n: Real) -> Real
This function returns whether a number is positive, negative 
or neither and returns 1, -1, 0 respectively.
n The number to get the sign of.

Tradução
Função sign(n: valor Real) retorno Real
Esta função retorna quando o número é positivo, negativo, ou nenhum
e retorna 1, -1, ou 0 respectitivamente
n O número para pegar o sinal
*/

if place_meeting(x + direcaoHorizontal, y , objColisao){
	direcaoHorizontal  = 2.5 * sign(direcaoHorizontal) * -1
}