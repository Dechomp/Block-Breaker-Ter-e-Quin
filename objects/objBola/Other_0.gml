

if global.isFim || place_meeting(x,y, objColisao){
	exit
}


/*
Este evento é gerado toda vez qua a instancia sai da tela
No nosso, quando uma instancia do objBola sai da tela
E como ela só pode sair por baixo, temos certeza que o player perdeu
a bolinha, consequentemente uma ds vidas

Então, vamos configurar 4 coisas
1º Diminuir a vida em 1
2º Fazer a animação de morte aonde a bolinha saiu
3º Apagar do código a bolinha que saiu(para evitar lags)
4º Criar uma nova bolinha caso ainda tenha vida
*/

//Vamos mexer alguns componentes de lugar, qoe queremos por enquanto
//É, diminuir a quantidade de bolas, recriar o objMorte e destruir a bola
//que saiu, sendo a condição, se a quantidade d e bolas é igual a 0
//Primeiro, diminuimos a quantidade bolas


//Agora, caso a quantidade de bolas seja maior que 0, iremos apenas
//Fazer a animação


//E caso a quantidade seja maior que zero, não faremos nada
global.quantBolas--
instance_destroy()
instance_create_layer(x, room_height, "Instances", objMorte)

if global.quantBolas > 0{
	exit
}

//Primeiro, tiramos uma vida
global.vidas--
global.isStart = false
//Seg1zdo, criar uma animação de morte
//Só que, para isto, criaremos um novo objeto chamado objMorte
//E aprendermos como criar novas instancias dentro do código
/*
Para criar novas instancias, usaremos a função instance_create_layer()
Descrição:
function instance_create_layer(
x: Real,
y: Real,
layer_id: String OR Id. Layer,
obj: Asset.GMObject,
[var_struct: Struct]
) -> Id. Instance
With this function you can create a new instance of the specified 
- object at any given point within the room and on the layer specified.
X The x position the object will be created at
Y The y position the object will be created at
layer_id The layer ID (or name) to assign the created instance to
obj The object index of the object to create an instance of
var_struct A structure that contains variables that are 
- copied into the new instance before the Create Event is called

Tradução:
Função instance_create_layer(
x: valor Real,
y: valor Real,
layer_id: valor String OR Id. Layer,
obj: objeto do sistema,
[var_struct: instruções]
) retorno do Id da nova Instancia
Com esta função, você consegue criar uma nova instancia do objeto especifico
- em qualquer lugar da sala dando pontos de referencia em uma layer especifica
X A posição x de onde o objeto vai ser criado
Y A posição y de onde o objeto vai ser criado
layer_id O Id da layer (ou nome) para criar a instancia
obj O index do objeto da instancia que você deseja criar
var_struct Uma estrutura onde contem as variaveis que serão copiadas
- dentro da nova instancia antes do evento de criação

Basicamente, toda vez que quisermos criar uma instancia, usaremos esta função
Por exemplo, quando a bolinha sair, vamos criar a instancia do objMorte 
Onde a bolinha saiu
*/
//instance_create_layer(x, room_height, "Instances", objMorte)
/*
Agora que testamos e que funcionou, temos que apagar a explosão depois
de um tempo

Para criar algo depois de um tempo, iremos usar o evento de alarm
A explicação estará no evento de criação do objMorte

Como deu certo, então o segundo passo está completo
*/

/*
Agora vamos fazer o 3 passo: Destrui a bolinha que saiu
Isto já sabemos, basta usar o instace_destroy()
*/

/*
E o último passo, recriar a bolinha encima do player
*/

instance_create_layer(objPlayer.x, objPlayer.y - 10, "Instances", objBola)


/*
Percebemos que, quando qualquer bolinha conta como uma vida a menos
Mesmo ainda tendo uma bolinha ou mais na tela sobrando
Então o que faremos?
Vocês vocês se lembram do break?
Para quem não lembra, o break sai do laço de repetição quando aparecia
Por exemplo, quando um número fosse divisil por i, ele sai do laço de repitção
Independente do que aconteceu antes, agora, nós iremos usar algo parecido
Que no caso é o exit
O exit sai do código do evento assim que é chamado
No nosso caso, iremos criar o contador de bolinhas e, assim que a última
Bolinha sair, aí sim mexeremos na vida

*/