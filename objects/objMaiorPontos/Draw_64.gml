//Caso o maior pontos seja menor que os pontos atuais, recebemos estes pontos
if global.maiorPontos < global.pontos{
	global.maiorPontos = global.pontos
}


if global.maiorPontos < 10{
	pontosMensagem = "0000" + string(global.maiorPontos)
} 
else if global.maiorPontos < 100{
	pontosMensagem = "000" + string(global.maiorPontos)
} 
else if global.maiorPontos < 1000{
	pontosMensagem = "00" + string(global.maiorPontos)
}
else if global.maiorPontos < 10000{
	pontosMensagem = "0" + string(global.maiorPontos)
}
else{
	pontosMensagem = string(global.maiorPontos)
}

draw_set_font(fntPontos)

mensagem = "Maior pontuacao: " + pontosMensagem
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_text(x,y,mensagem)