if global.isFim{
	exit
}

/*
Aqui, toda vez que a quantidade de blocos chegar a zero. começaremos a criar os blocos
Como criaremos mais de 1, teremos que usar um laço de repetição

Lembrando que laços de repetição, executam uma tarefa até comprir uma certa condição, ou descumpri-lá
No nosso caso, usremos o while, que funciona enquanto a condição dentro dele é verdadeira]

No nosso caso, usaremos dois laços, uma para cada linha, e dentro do laço das linhas, um para cada coluna
E as nossas condições vão ser, enquanto a variável de conta for menor que a quantidade de linhas/blocos
Criaremos uma novo bloco
E depois que tivermos certeza que tudo foi criado corretamente, faremos eles entrarem descendo da tela
*/

//Então criamos a variável de linhas

if global.quantBlocos == 0{
	global.blocoAlturaCerta = false
	
	//Agora faremos para ele criar em blocos
	//Para isto, criaremos outro laço, e colocar o anterior dentro dele
	
	i = 0
	
	while i < linhas{
		j = 1
	
		while j < colunas{
		
			/*Cria uma instancia do objBloco, o que fareros de difereça, é que criremos a posição
			Horizontal do bloco, apartir da multiplicação da posição por j
			Por que faremos isto?
			Pois assim, a cada inicialização do laço, o bloco se moverá para depois do último bloco
			No nosso caso, multiplicaremos 64 por j
			Então o primeiro bloco iniciaria no x 0, o segundo n x 64, o terceiro no x 128, e assim por diante
			Mas Perceberam um erro aqui? Isto, ao criar o primeiro iniciaria no x 0, estando grudado na parede
			Para corrigir isto, iniciaremos o j, com 1, assim, o primeiro bloco começa no 64
			O segundo em 28, o terceiro em 192 e asasim po diante
		
			Depois, farermos a parte do y
		
			Usaremos a função instance_create_layer()
			*/
			
			/*A altura do bloco vai ser -64 multiplicado pelo i, ou seja, o primeiro bloco começa na altura 0, o
			segundon na altura -64, o teceiro na altura -128 e assim por diante
			Aqui não tem problema de começar fora da tela, pois, no jogo os blocos aparecem descendo assim que acaba o jogo
			Por isto, iremos criar os blocos fora de tela, e depois, mandar descer
			*/
			
			//POr causa do temanho dos blocos, irei colocar para multiplicar por -40
			instance_create_layer(64 * j, -40 * i, "Instances", objBloco)
		
		
			//No final de cada laço, aumentaremos o valor de j em 1
			j++
		
		
		}
		
		//Aumentar o valor de i
		i++
	}
	
}


