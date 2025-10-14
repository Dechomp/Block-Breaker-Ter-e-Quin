/*
Por enquanto, não importa se usarmos o draw ou o draw GUI, pois no
nosso jogo, não possui câmera

Agora para mostrar os pontos vamos usar uma função e aproveitaremos e aprenderemos
Sobre padronização de nomes de função e como ela funciona no Game Maker

Quabdo formos criar uma função, há um certo padrão a ser seguido, este padrão
é a primeira palavra sendo um verbo, e depois a segunda palavra estando
com a primeira letra maiuscula, e complementando o verbo
Por exemplo: 
Se eu fosse criar uma função para quebrar blocos eu criaria quebrarBloco()
Se eu quiser checar a colisão entra dois objetos, seria o checarColisão()
Se eu quiser iniciar o jogo, ou seja, lançar a bola, usaria o lancarBola()
Se eu quiser inverter a direção da bola, eu criaria o redirecionarBola()

No Game Maker as funções são parecidos, a diferença é que são em inglês
Então, por exemplo, nós queremos mostrar o texto na tela, podemos dizer que queremos
desenhar um texto na tela, agora, é só separar as palavras chaves desta frase
Quais são elas: desenhar e texto
Agora é só traduzir as duas palavras em inglês
Desenhar: draw
Texto: text
Ou seja, muito provavelmente, existe uma função com este nome
Então, mesmo não sabendo o nome da função, você pode tentar achar ela
Pelo nome em inglês, ou usando o nome do que você fazer de referencia
Por exemplo, muitas para não dizer todas as funções relacionadas a fase
Vão estar com "room" em seu nome, relacionado ao  conteudo do texto, vai estar
com "text" em seu nome e assim por diante
********Outra padronização de código, é quando você quiser alterar um valor
		a função terá "set" no nome, e quando você quiser receber um valor
		Provavelmente terá "get" ou "is" no nome
Então vamos ver a descrição do draw_text():
function draw_text(x: Real, y: Real, string: Any) -> Undefined
With this function you can draw any string at any position within the room 
(for drawing real numbers you should use the string() function to convert 
them into text).
X The x coordinate of the drawn string.
Y The y coordinate of the drawn string.
string The string to draw.

Tradução:
Função draw_text(x: valor real, y: valor real, string: qualquer) retorno vazio ou
indefinido
Com esta função, você pode desenhar qualquer texto e em qualquer posição na sala
(Para desenhar um valor real, você deve usar a função string() para converter o 
em texto)
X A coordenada x do texto
Y A coordenada y do texto
string O texto que queira desenhar

O insteressante, é que a própria função, já indica do que fazer caso o seu texto
use números, que é o nosso caso, então vamos ver a descrição dela:
Descrição:
function string(val_or_format: Any, [...: Any*]) -> String
With this function you can turn any value into a string.
val_or_format The value to be turned into a string or a format string.
... Values to replace the placeholders with.

Tradução:
Função string(val_or_format: qualquer, [...: qualquer*) retorno do tipo string
Com esta função, você pode tornar um valor em string ou um formato string
val_or_format O valor a ser conertido em string ou no formato string
... Valores a ser trocados no placeholder

Então, como colocaremos os pontos para serem mostrados, temos que traduzilos
para string e mostra-los, e para deixar um pouco mais dinâmico, criaremos uma
mensagem para isto

Bom, mas o texto esta pequeno, então vamos ter que usar um outro método/função
Uma maneira seria usando o draw_text_transformed(), mas ele fica fora do lugar e 
pixelizado, então vamos criar uma fonte e por lá, controlar o desenho e o 
tamanho do texto 

Agora que já criamos a fonte, iremos colocar para usu-la usando a função draw_set_font()
Descrição:
function draw_set_font (font: Asset.GMFont) -> Undefined
This function will set the font to be used for all further text drawing.
font The name of the font to use.

Tradução:
Função draw_set_font (font: Fonte criada) retorno vazio ou indefinido
Esta função irá dewfinir a font a ser usada para todos os futuros textos
font O nome da fonte a ser usada

Para finalizar, vamos colocar para aparecer mais zeros na frente
*/
if global.pontos < 10{
	mensagem = "0000" + string(global.pontos)
} 
else if global.pontos < 100{
	mensagem = "000" + string(global.pontos)
} 
else if global.pontos < 1000{
	mensagem = "00" + string(global.pontos)
}
else if global.pontos < 10000{
	mensagem = "0" + string(global.pontos)
}
else{
	mensagem = string(global.pontos)
}
draw_set_font(fntPontos)

/*
E agora desenhamos na tela, também colocamos para ela ir para o meio da tela
Mas, vamos perceber que o texto não está no meio, pois a horientação normal 
é na esquerda
Para trocarmos a direção usaremos a função draw_set_halign():

Para definir a centralização, usaremos as funções:
draw_set_halign():
function draw_set_halign(halign: Constant.HAlign) ->
Undefined
This function is used to align text along the horizontal axis -
- and changing the horizontal alignment will -
- change the position and direction in which all 
- further text is drawn with the default value being fa_left.
halign Horizontal alignment.

Tradução:
Função draw_set_halign(halign: Constant. alinhamento horizontal) -
- retorno vazio ou indefinido
Esta função é usada pra alinhar o texto no eixo horizontal e mudar -
- o alinhamento horizontal e irá mudar a posição e a direção em tudos -
- os texto desenhados, com o padrão sendo iniciar pela esquerda (fa_left)
halign Alinhamento horizontal
Aqui as possiveis variáveis são:
fa_left: Para a esquerda
fa_center: Para o centro
fa_right: Para a direita
No caso iremos usar a fa_center


draw_set_valign():
function draw_set_valign(valign: Constant.VAlign) -> Undefined
This function is used to align text along the vertical axis and
- changing the vertical alignment will change the position and -
- direction in which all further text is drawn, with the default -
- value being fa_top.
valign Vertical alignment.

Função draw_set_valign(valign: Constante. alinhamnto vertical) -
- retorno vazio ou indefinido
Esta função é usada pra alinhar o texto no eixo vertical e mudar -
- o alinhamento vertical e irá mudar a posição e a direção em todos -
- os texto desenhados, com o padrão sendo iniciar pelo topo
valign Alinhamento vertical
Aqui as possiveis variáveis são:
fa_top: Para o topo
fa_middle: Para o meio
fa_bottom: Para baixo
No caso iremos usar a fa_top, então não necessáriamente teremos que 
- utilizar esta função, mas já fica de ensinamento
*/

draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_text(room_width / 2,y,mensagem)