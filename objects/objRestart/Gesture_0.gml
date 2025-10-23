/*
Toda vez que clicarmos uma vez no objRestart, ele reinciára o jogo
E fará a tela de morte sumir
*/

layer_set_visible("TelaMorte", true)
layer_set_visible("TelaMorteFundo", true)
global.isFim = false

/*
Assim que restramos, vimos que as vidas e outra variáveis globais, não são
Resetadas juntas, isto acontece pois a existencia das variáveis globais, não são 
Apagadas, e lá no jogo, aonde checamos a exitencia, funcionam com elas existentes
Pra resolver isto, precisamos apenas resetar manualmente ou apagar a existencia delas
*/

//Resetendo o bloco na altura certe e demais variáveis
global.blocoAlturaCerta = false

//O jogo não começou
global.isStart = false

//Não ganhou nenhum ponto
global.pontos = 0

//Não há blocos criados
global.quantBlocos = 0

//Não há bolas criadas
global.quantBolas = 0

//O "id" do objVida começa zerado
global.quantVidas = 0

//Começa o joo com 3 vidas
global.vidas = 3

room_restart()