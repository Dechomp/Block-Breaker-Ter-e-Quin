/*
Dentro jogo, nós queremos que a cada vez que eu perder uma vida, mostre
para o usuário, em outros, poderiamos apenas mostrar a quantidade de vida
Mas para este jogo, queremos que mostre  a qauntidade de vida através de
bolinhas cheias ou não
Ou seja, caso eu tenha 2 vidas, dentro do jogo, a segunda e a terceira
- bolinha devem aparecer apagadas
MAs como vamos saber qual bolinha apagar?
Para isto, teremos que usar um maio para identificar as bolinhas
Pelo ID, ficaria dificil, pois teriamos que mudar o ID manualmente
Então vamos criar uma variável para isto
No caso, a primeira bolinha tem que receber no identifcador 1
A segunda deve receber 2
E a terceira 3
Porém, se fizermos apenas ma variável interna, isto nunca funcionaria
Pois todas teriam o mesmo ID
Então teriamos que criar uma maneira externa para cirar as variáveis
E esta maneira, será através de uma variável global
Faremos isto, pois, teriamos acesso ao valor referente a quantidade de vidas
de qualquer instancia
Mase, se apenas criamos a variável sem checar se ela já existe, perderiamos
O sentido de criar uma variável global
Então antes de apenas criamos a variável global, checaremos se ela já existe
Se ela já existe, significa que já temos uma instancia do objVida
Então, aumentaremos a quantidade de vidas em 1
Se não temos, receberemos 1 na variável
Mas agora, se não armazenamos estes valores, iriamos perdelos
Então agora, antes de ir para apróxima instanca, vamos armazenar o valor 
de quantVidas no identificador
*/
if variable_global_exists("quantVidas"){
	global.quantVidas++
}
else{
	global.quantVidas = 1 
}

identificador = global.quantVidas
//Agora que criamos um identificador, ficará mais fácil apagar a bolinha certa