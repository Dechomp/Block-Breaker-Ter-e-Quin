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
x = objPlayer.x
y = objPlayer.y - 10
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
isStart = false //Futuramente, esta deve ser uma variável global
