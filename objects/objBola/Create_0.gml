/*
Vamos começar criando as variáveis de direção e de velocidade da bola
*/
//Vamos iniciar a variavel velocidade recebendo 3
velocidade = 3

//E agora vamos definir as direções, ambas iniciando zeradas
direcaoVertical = 0
direcaoHorizontal = 0

/*
E também temos que iniciar com a bola no meio do player, -
- como podemos fazer isso?
Sujestões: Seguir o player, mas como? -
- Pegando a posição do player
Então o x da bola, tem que ser o x do player para ficar no meio do player
Lembrando que ao usar "." você está se refirindo a uma propriedade/função -
- da variavel/objeto, no nosso caso, usaremos as propriedades do objPlayer
E o y da bola dever ser apenas alguns pixels acima do y do player
*/

/*
Aqui esta o motivo da bola iniciar lá embaixo com o player, ou seja, ou
Começamos um novo objeto para identificar que é uma bola criada pelo bloco
Ou adaptamos o objeto para funcionar tanto no incio do jogo, quanto
quando for criado
*/
//Certo escolhemos a adaptação, então iniciamos tirando este jeito
/*x = objPlayer.x
y = objPlayer.y - 10*/
/*
Só que tem um problema, sabem qual? Toda vez que a bolinha for criada -
- ela vai aparecer no meio do player, só que, nem toda bola é criada -
- acima do player, afinal, temos blocos que geram bolas, ou seja, -
- teremos que criar um jeito de verificar se é o inicio do jogo
Sujestões:
Quando a bola está na plataforma, ok, mas estamos resolvendo exatamente isso
Pelos pontos, ok, mas e quando o player perde uma vida, não necessáriamente -
- perde pontos, apesar de iniciar no centro da barra, então não podemos -
- usar este método
Podemos criar um objeto separado para bolas que proveem de blocos, ok
Podemos usar este método (Existem outras maneiras, mas vamos usar esta)
Apesar da bola iniciar no lugar certo, ela não segue o player, para seguir
Teremos que usar uma outra função no step
*/
//isStart = false //Futuramente, esta deve ser uma variável global

/*
Lembra que eu falei que futuramente fariamos a variável sendo global?
È por isto, nós vamos verificar se o jogo inicou ou não
E ele vai começar não inciado, e depois ir para cima do player
E quando não estiver, vai iniciar com um direção aleatória

Não esqueça de verificar se a variável global já existe
Se ela não existe, cria a variável
*/

if ! variable_global_exists("isStart"){
	global.isStart = false
	x = objPlayer.x
	y = objPlayer.y - 10
}
else{
	//Caso exista, iremos aleatorizar a direção para aonde a bola vai
	
	direcaoHorizontal = irandom_range(0, 1)
	direcaoVertical = irandom_range(0, 1)
	
	//0 representa a chance de ir para esquera ou para cima

	if direcaoHorizontal == 0{
		direcaoHorizontal  = -1
	}
	
	if direcaoVertical == 0{
		direcaoVertical = -1
	}
}

//Processo de criação da quantidade de bolas
if ! variable_global_exists("quantBolas"){
	global.quantBolas = 1
}
else{
	global.quantBolas++
}

