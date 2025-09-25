/*
Se você deixar o mouse encima da função, 
ele mostra as parametros, o retorno da função, e a explicação de cada um
neste caso, a função de keyboard check a informações são
function keyboard_check(key: Constant. VirtualKey OR Real) -> Bool
With this function you can check to see if a key is held down or not.
key The key to check the down state of.

Traduzindo:
Função keyboard_check(Qual tecla você checar: Constante. Seja ela no teclado ou um valor real) e retorna um valor Booleano, ou seja verdadeiro ou falso
Com esta função, você consegue checar se a tecla foi pressionado ou não 
Tecla: siginifica qual tecla você quer checar, ou seja, é um parametro unico

Então quer dizer, que verdadeiro ou falso, é um valor, e o que podemos fazer com um valor?
Só para lembrar, quando um valor do retorno não é nulo ou indefinido, podemos armazelo
Ou seja, a função keyboard_check(), tem um valor nulo ou indefinido? Não certo, então, podemos armazenalo
Então vamos criar uma variavel para armazenar este valor, neste caso, vamos fazer isto para todas as teclas que queremos utilizar
*/

/*
Tecla esquerda recebe o retorno da função keyboard_check(vk_left)
Lembrando que vk_left é a seta do teclado
Mas, não existe o vk_letraA
O que podemos para ler uma letra do teclado?
Usar a função ord()

Descrição dela:
function ord(string: String) -> Real
This function takes a single character input string and returns the Unicode (UTF8) value for that character.
string The string with which to find the Unicode code.

Função ord(Valor String: o texto que você indicar) -> retorno de um valor real
Esta função pega um caracter unico/sozinho transforma em um tipo string e retorna um valor do tipo Unicode para aquele caracter
String: O valor string com que você quer achar no valor Unicode 
****Lembrando que o caracter tem que estar na letra maiuscula
Nós queremos que ela considere quando eu apertar a tecla esquerda ou na letra A
Se queremos uma coisa ou outra, o que temos que colocar na condição? o "or"
Ou seja, keyboard_check(vk_left) or keyboard_check(ord("A"))
*/


teclaEsquerda = keyboard_check(vk_left) or keyboard_check(ord("A"))

//Mesma lógica para direita
teclaDireita = keyboard_check(vk_right) or keyboard_check(ord("D"))

/*
Pronto, já temos as duas direções programadas, agora é só alterar a posição do meu objeto
Se nós queremos mexer para esquerda ou direita, ou seja, no angulo horizontal, qual deve sera o valor alterado para isto?
A posição x ou a posição y?
Isto, a posição x
E agora, temos que configurar os valores
Pergunta, se apertarmos a tecla para esquerda, nós queremos aumentar ou diminuir o valor de x?
Dininuir, exatamente, ou seja, teclaEsquerda vai ficar negativa
E agora, para ir para direita, vamos fazer o que? Aumentar o valor, ou seja, teclaDireita vai ficar positiva
Se vamos alterar estes valores, vamos criar uma varivel para isto
Vamos chamara esta variavel de movimentação

*/
movimentacao = - teclaEsquerda + teclaDireita
/*Ou seja, se eu apenas apertar a tecla esquerda, o valor de movimentacao vai ser - 1
movimentacao == - 1
E se eu apenas apertar a tecla direita, o valor de movimentacao vai ser 1
movimentacao == 1
E agora eu pergunto, o que acontece se eu apertar as duas teclas ao mesmo tempo
movimentacao vai receber -1 + 1, resultando em 0
Por fim, vamos somar em x, a variavel movimentação vezes a velocidade 
*/
x += movimentacao * velocidade