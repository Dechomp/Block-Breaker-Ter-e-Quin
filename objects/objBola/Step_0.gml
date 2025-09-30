//Primeiro vamos seguir o x do player
//Jeito "errado" de seguir o player
//x = objPlayer.x

/*
Com este método, até funciona no inicio, mas para iniciar o jogo,-
- não podemos fazer deste jeito pois não podemos seguir o player -
- para sempre, então temos que verificar se o jogo ainda não iniciou, -
- se não iniciou, vamos seguir o player, se iniciou, vamos para de segui-lo
Para fins de rapidez, vamos usar uma variável para isto
Ela vamos cria-lá no create e altera-la assim que clicarmos para cima
Nós vamos usar o if para verificar se o jogo iniciou ou não
Mas, o if só funciona quando a condição/variável é verdadeira
Como nós queremos o contrário disto, ou seja, só funcione quando for falso
Teremos que inverter o valor de false para true, ou seja, funcionar quando -
- o jogo não começar e de true para false, quando o jogo iniciar e pararemos de -
- seguir o player
Para inverter um valor de true para false e vice-versa, temos um operador para isto
Vocês sabem dizer qual é? A "!" (em outras linguagens, podemos usar como not)
Então se o jogo não começou, seguimos o player
*/
//Jeito "certo"
if ! isStart{
	//Seguindo o player
	x = objPlayer.x
	//E agora, caso apertemos para cima, a bola deve se mover e alterar o isStart para true
	if keyboard_check(vk_up) or keyboard_check(ord("W")) or keyboard_check(vk_space){
		//Vai para cima
		direcaoVertical = -1
		/*
		Para a direção horizontal, podemos usar a referencia da localização atual da bola, então -
		- caso a bola esteja mais a esquerda, a bola vai para direita, e se estiver mais a direita -
		- ela irá para esquerda
		Para sabermos se ela está mais a esquerda ou direita, vamos pegar a largura da sala -
		- e dividir por 2, ou seja, saberemos qual é a metade do tamanho da sala
		Caso o x seja menor que a metade do tamanho da sala, está mais a esquerda ou na direita?
		Na esquerda, e caso o x seja maior metade, estara na direita
		*/
		if x < room_width / 2{
			direcaoHorizontal = 1
		}
		else{
			direcaoHorizontal = -1
		}
		//Indique que o jogo foi iniciado com isStart recebendo true
		isStart = true
	}
}
//Se o jogo já começou
else{
	/*
	Primeiro vamos fazer as interações com o objColisao
	Para isto usaremos a função place_meeting()
	Descrição:
	function place_meeting(x: Real, y: Real, obj: Id. TileMapElement OR Asset.GMObject OR -
	- Id. Instance OR Constant.All OR Array) -> Bool
	With this function you can check a position for a collision with another instance or -
	- all instances of an object using the collision mask of the instance that runs the code -
	- for the check.
	X The x position to check.
	The y position to check.
	obj The instance or object to check for.
	
	Tradução:
	Função place_meeting(x: valor real, y: valor real, obj: ID. Elemento do tile map ou Imagem do Asset-
	- ou Id. da Instancia ou Constante. todos os objetos ou um vetor deles) retorno de valor booleano -
	- (true ou false)
	Com esta função, você consegue checar uma posição para um colisão com outra instancia ("ser") ou todas -
	- as instancia de um objeto("tipo"), usa a mascara da instancia para iniciar o código para checar
	X A posição do x para checar
	Y A posição do y para checar
	obj A instancia("ser") ou objeto("tipo") que queira checar
	
	Ou seja, com esta função podemos verificar se havera uma colsião em um lugar especifico
	No nosso caso, usaremos para determinar para qual direção o objeto deve ir
	*/
	
	//Primeiro, vamos confirgurar as leterais
	//Ou seja, a esquerda e a direita
	//Colisão na esquerda
	//**Usaremos o objeto colisão para testar as colisões nais facilmente
	if place_meeting(x - velocidade, y, objColisao){
		direcaoHorizontal = 1
	}	
	
	//Colisão direita
	if place_meeting(x + velocidade, y, objColisao){
		direcaoHorizontal = -1
	}
	
	//Colisão encima
	if place_meeting(x, y - velocidade, objColisao){
		direcaoVertical = 1
	}
	
	//Agora iremos fazer a insteração com o player
	if place_meeting(x, y + velocidade, objPlayer){
		direcaoVertical = -1
	}
}

//No final, some as direções com as suas respectivas variáveis vezes a velocidade
//x soma com a direção horizontal
x += direcaoHorizontal * velocidade

//y soma com a direção vertical
y += direcaoVertical * velocidade
