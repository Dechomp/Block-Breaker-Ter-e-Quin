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
		Na esquerda, e caso o x seja maior metade, estrá na direita
		*/
		 
		
		
	}
}


