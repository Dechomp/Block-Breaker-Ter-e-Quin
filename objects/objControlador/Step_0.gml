/*
Nós queremos que toda vez que a vida chegue a zero, iremos mostrar a tela de morte
Para isto, usaremos a função layer_set_visible
Descrição:
function layer_set_visible(layer_id: String OR Id. Layer, visible: Bool) -> Undefined
With this function you can toggle the visibility of a layer.
layer_id  The unique ID value of the layer to target (or the layer name as a string)
visible Whether the layer should be visible (true) or not (false)

Tradução
Função layer_set_visible(layer_id: nome em texto ou o ID da layer, visible: valor booleano) -> retorno vazio
- ou indefinido
Com esta função, você pode trocar a visibilidade de uma layer
layer_id O valor único de um ID da layer alvo (ou o nome da layer em texto)
visible Quando tornar a layer visivel (true) ou não (false)

Ou seja, toda vez que a vida chegar a zero, as duas layer vão se tornar visiveis
*/

if global.vidas <= 0{
	layer_set_visible("TelaMorte", true)
	layer_set_visible("TelaMorteFundo", true)
	
	//E agora criaremos uma variável para impedir que os outros objetos contiuem funcionando
	//E se esta variável for verdadeira, colocaremos para sair(exit) do resto do código
	//E vamos colocar este código em todos os objetos 
	global.isFim = true
		
}
