//Criar a varivel de velocidade
velocidade = 5		

/*Agora queremos criar as vidas
Para criar uma variavel global, usamos global.(Nome da variavel)
Seria global.vida = 3
Só que tem um problema
Toda vez que criamos o player, ele também vai resetar as vidas
Pois, quando o sinal de igual está sozinho, ou seja "=", ele subistitui o valor anterior
Vamos supor que a vida atual é 1, ou seja, global.vidas == 1
Se subistituirmos, ficará global.vidas == 3
Então, antes de criarmos a variavel, vamos verificar se ela existe.
Então usaremos a função variable_global_exists()
Esta função checa se existe ou não a variavel, 
se ela existir, ela retorna true
Se ela não existir, retorna false
O que nós queremos é verificar se ela não existe
Ou seja, queremos que apenas quando não exista, iremos inicia-lá com 3
Para isso, precisamos inverter o resultado do retorno
Para inverter o resultado de algo, podemos usar a "!"
Ela inverte true para false e false para true
ou seja, se ela existir, não vamos alterar, ou seja, vai de true para false
O que queremos é, ela não existir, iremos alterar, ou seja, false para true
*/

if ! variable_global_exists("vidas"){
	global.vidas = 3
}

//Mesma lógica para os pontos
if ! variable_global_exists("pontos"){
	global.pontos = 0
}
//Agora que já criamos os blocos, vamos mostra-los na tela, mas antes, vamos adicionar
//pontos ao quebrar blocos