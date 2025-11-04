//Para não resetar, checaremos a exitencia da variável
if! variable_global_exists("maiorPontos"){
	global.maiorPontos = 0
}

//Carregamos os dados salvos caso exista
carregarJogo()
