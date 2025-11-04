if global.isFim{
	exit
}


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
if ! global.isStart{
	//Seguindo o player
	x = objPlayer.x
	y = objPlayer.y - 20
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
		global.isStart = true
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
	
	Ou seja, com esta função podemos verificar se havera uma colisão em um lugar especifico
	No nosso caso, usaremos para determinar para qual direção o objeto deve ir
	*/
	
	//Primeiro, vamos confirgurar as leterais
	//Ou seja, a esquerda e a direita
	//Colisão na esquerda
	//**Usaremos o objeto colisão para testar as colisões mais facilmente
	
	//Colisão encima
	if place_meeting(x, y - velocidade, objColisao){
		/*
		Antes de receber o valor armazenado, precisamos verificar se ele é negativo, 
		se for,	vamos recebe-lo ao contrário, ou seja, multiplicado por -1, se for positivo, vamos
		recebe-lo normalmente
		*/
		
		//Se for
		if sign(armazenarAnguloVertical) == -1{
			//Recebe ao contrário
			direcaoVertical = armazenarAnguloVertical * -1
		}
		//Se não for
		else{
			//Recebe normal
			direcaoVertical = armazenarAnguloVertical
		}
		
		//Verificamos se é negativo por que o negativo faz subir
	}
	
	//Colisão na esquerda
	if place_meeting(x - velocidade, y, objColisao){
		/*
		Na esquerda, verificamos novamente se é negativo, pois na horizontal, o negativo
		Faz ir para esquerda, se for, recebe ao contrário, se não for, recebe normal
		*///Se for
		if sign(armazenarAnguloHorizontal) == -1{
			//Recebe ao contrário
			direcaoHorizontal = armazenarAnguloHorizontal * -1
		}
		//Se não for
		else{
			//Recebe normal
			direcaoHorizontal = armazenarAnguloHorizontal
		}
	}	
	
	//Colisão direita
	if place_meeting(x + velocidade, y, objColisao){
		/*
		Na direita, verificamos se é positivo, pois na horizontal, o positivo
		Faz ir para direita, se for, recebe ao contrário, se não for, recebe normal
		*/
		//Se for
		if sign(armazenarAnguloHorizontal) == 1{
			//Recebe ao contrário
			direcaoHorizontal = armazenarAnguloHorizontal * -1
		}
		//Se não for
		else{
			//Recebe normal
			direcaoHorizontal = armazenarAnguloHorizontal
		}
	}
	
	
	
	//Agora iremos fazer a interação com o player
	if place_meeting(x, y + velocidade, objPlayer){
		//direcaoVertical = -1
		
		
		//Vamos fazer o calculo da direção de onde a bola deve ir
		
		/*
		Vamos as seguinte condições
		O x da bola e do player, são originados diretamente no meio, então, para calcularmos
		as distancias, fazer a subtração do x da bola parao x do player
		E depois verificar qual foi o valor final
		*/
		
		//Criamos uma variável para armezenar o valor da subtração
		distancia = x - objPlayer.x
		
		if distancia < 20 and distancia > -20{
			/*
			Do jeito que fizemos, dependendo de onde bate, a bola fica mis rapida
			ou divagar
			Para evitar isto, temos que compensar a velocidade que ele perde na altura 
			e colocar na lagura
			*/
			
			direcaoHorizontal = 0.2 * sign(distancia)
			direcaoVertical = -1.8
			
			
		}
		else if distancia < 40 and distancia > -40{
			direcaoHorizontal = 0.5 * sign(distancia)
			direcaoVertical = -1.5 
		}
		else if distancia < 60 and distancia > -60{
			direcaoHorizontal = 1 * sign(distancia)
			direcaoVertical = - 1
		}
		else{
			direcaoHorizontal = 1.5 * sign(distancia)
			direcaoVertical = - 0.5
		}
		
		//Recebe o ângulo calculado
		armazenarAnguloHorizontal = direcaoHorizontal
		armazenarAnguloVertical = direcaoVertical
		
	}
	
	//Agora vamos começar as colisões com os blocos
	//Primeiro vamos checar as direção de onde ocorrerá a colisão
	//Para isto usaremos qual função? Muito bem, place_meeting()
	//Caso ocorra na esquerda
	/*
		Mas eu não destruir o bloco que a bola colidiu apenas usando o instance_destroy(objBlocos)
		Por que não podemos usar? É só olharmos a descrição da função
		Descrição:
		function instance_destroy([id: Asset.GMObject OR Id. Instance OR Constant.All], -
		- [execute_event_flag: Bool]) -> Undefined
		You call this function whenever you wish to destroy an instance, normally triggering -
		- a Destroy Event and also a Clean Up Event.
		id The instance ID or object_index to destroy (optional, default is the calling instance) -
		execute_event_flag Set to true or false to perform the destroy event or not-
		- (optional, default is true)
		
		Tradução
		Função instance_destroy([id: Asset Objeto ou Id. da instancia ou Constant. Todas as instancias], -
		- [execute_event_flag: valor booleano]) retorno indefinido ou vazio
		Você chama esta função quando você deseja destruir uma instancia, normalmente ocasiona no evento -
		- de destruição e também no evento de limpeza
		id A identificação da instancia ou o index do objeto (opcional, porque o padrão é deletar a instancia-
		- que chamou a função) 
		execute_event_flag Verdadeiro ou falso para permitir o evento de destruição ou não(opcional pois o
		- padrão é true)
		
		Então, caso coloquemos para destuir o objBlocos, ele destruirá todas as instancia daquele blocos
		Para resolver isto, podemos fazer de 2 jeitos
		O primeiro, é adicionar ao objBlocos, o evento de colsião com o objBola, e destruir o bloco lá
		A segunda e destuir a instancia recebendo o id dela quando colidirmos com uma
		Qual método, querem usar? Eu particulamente, prefiro pela segunda opção.
		Segundo Ganhou
		Ok, com sgundo método, usaremos a função place_instance()
		Descrição da função:
		function instance_place(x: Real, y: Real, obj: Id. TileMapElement OR Asset.GMObject -
		- OR Constant.All OR Array) -> Id. Instance
		With this function you can check a position for a collision with another instance or -
		- all instances of an object
		using the collision mask of the instance that runs the code for the check.
		X The x position to check for instances.
		y The y position to check for instances.
		obj The object to check for instances of.
		
		Tradução:
		Função instance_place(x: valor Real, y: valor Real, obj? Id do tilemap, ou Asset. Objeto, ou Constante. -
		-todos os objetos ou um vetor de objetos) retorno id da instancia
		Com esta função, você consegue checar uma posição aonde ocerrerá uma colisão com outra instancia ou-
		- todas as instancia de um objeto
		Usa a mascara de colsião de uma instancia desta compilaçaodo código para checar
		X A posição do x para checar as instancias
		Y A posição do y para checar as instancias
		obj O objeto para checar a instancia
		
		Ou seja, iremos primeiro checar se ouve uma colisão, se houver, iremos receber o id da instancia
		e depois destuilá
		*/
		
		//Colisão em cima
		if place_meeting(x, y - velocidade, objBloco){
				//Agora criamos uma variável do bloco que a bolinha acertou e destroi ele
				blocoAcertado = instance_place(x, y - velocidade , objBloco)
				//Agora destroimos
				instance_destroy(blocoAcertado)
				//Como acertamos em cima, agora iremos para baixo
				/*
				Antes de receber o valor armazenado, precisamos verificar se ele é negativo, 
				se for,	vamos recebe-lo ao contrário, ou seja, multiplicado por -1, se for positivo, vamos
				recebe-lo normalmente
				*/
		
				//Se for
				if sign(armazenarAnguloVertical) == -1{
					//Recebe ao contrário
					direcaoVertical = armazenarAnguloVertical * -1
				}
				//Se não for
				else{
					//Recebe normal
					direcaoVertical = armazenarAnguloVertical
				}
		
				//Verificamos se é negativo por que o negativo faz subir
		}
		
		//Colisão em baixo
		if place_meeting(x, y + velocidade, objBloco){
				//Agora criamos uma variável do bloco que a bolinha acertou e destroi ele
				blocoAcertado = instance_place(x, y + velocidade , objBloco)
				//Agora destroimos
				instance_destroy(blocoAcertado)
				//Como acertamos em baixo, agora iremos para cima 
				/*
				Antes de receber o valor armazenado, precisamos verificar se ele é positivo, 
				se for,	vamos recebe-lo ao contrário, ou seja, multiplicado por -1, se for positivo, vamos
				recebe-lo normalmente
				*/
		
				//Se for
				if sign(armazenarAnguloVertical) == 1{
					//Recebe ao contrário
					direcaoVertical = armazenarAnguloVertical * -1
				}
				//Se não for
				else{
					//Recebe normal
					direcaoVertical = armazenarAnguloVertical
				}
		
				//Verificamos se é positivo pois no angulo vertical
				//o positivo faz descer
		}
		
		//Colisão na esquerda
		if place_meeting(x - velocidade, y, objBloco){
				//Agora criamos uma variável do bloco que a bolinha acertou e destroi ele
				blocoAcertado = instance_place(x - velocidade, y, objBloco)
				//Agora destroimos
				instance_destroy(blocoAcertado)
				//Como acertamos na esquerda, agora iremos para direita
				/*
				Aqui devemos verificar se o valor armazenado é negativo, pois na horizontal
				O negativo faz ir para esquerda, se for, recebemos o valor ao contrário
				Se não, recebemos o valor normal
				*/
				
				//Se for verdade
				if sign(armazenarAnguloHorizontal) == -1{
					//Recebe ao contrário
					direcaoHorizontal = armazenarAnguloHorizontal * -1
				}
				//Se não for
				else{
					//Recebe normal
					direcaoHorizontal = armazenarAnguloHorizontal
				}
		}
		
		//Colisão na direita
		if place_meeting(x + velocidade, y, objBloco){
				//Agora criamos uma variável do bloco que a bolinha acertou e destroi ele
				blocoAcertado = instance_place(x + velocidade, y, objBloco)
				//Agora destroimos
				instance_destroy(blocoAcertado)
				//Como acertamos na direita, agora iremos para esquerda
				/*
				Aqui devemos verificar se o valor armazenado é positivo, pois na horizontal
				O positivo faz ir para direita, se for, recebemos o valor ao contrário
				Se não, recebemos o valor normal
				*/
				
				//Se for verdade
				if sign(armazenarAnguloHorizontal) == 1{
					//Recebe ao contrário
					direcaoHorizontal = armazenarAnguloHorizontal * -1
				}
				//Se não for
				else{
					//Recebe normal
					direcaoHorizontal = armazenarAnguloHorizontal
				}
		}
		
		
		
}

//No final, some as direções com as suas respectivas variáveis vezes a velocidade
//x soma com a direção horizontal
x += direcaoHorizontal * velocidade

//y soma com a direção vertical
y += direcaoVertical * velocidade
