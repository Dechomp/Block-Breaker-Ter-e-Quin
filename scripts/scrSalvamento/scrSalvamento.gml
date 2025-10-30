/*
Neste arquivo, armazenaremos as funções de salvamento e carragamento
do jogo

Lembrando que funções são instruções pré feita para chamarmos aonde
Quisermos, deixando o código mais limpo e organizado

Lembrando que as funções, possuem parâmetros que serão usados
Para alterar o seu comporatmento

No nosso caso, quando formos salvar, o parâmetro a ser passado
Vai ser o nome do arquivo de save

Vamos chama-lo de nomeArquivo

E caso não passemos o nome do arquivo,ele iniciára com o 
nome saveJogo.ini
*/
function salvarJogo(nomeArquivo = "saveJogo.ini"){
	
	/*
	Quando chamar esta função, eu preciso abrir ou criar o arquivo
	Com este nome, para isto, usarmos a função ini_open()
	Descrição:
	function ini_open(name: String) Undefined
	This opens an ini_file for reading and/writing.
	name The filename for the ini file.
	
	Tradução:
	Função ini_open(name: Texto do arquivo) retorno indefinido ou vazio
	Esta função abre um arquivo ini apara ler e escrever
	name O nome do arquivo ini
	*/
	
	//Abro o arquivo de save
	ini_open(nomeArquivo)
	
	/*
	Como estamos salvando, quer dizer que vamos escrever no arquivo
	Para escrevermso temos duas funções
	ini_write_real():
	function ini_write_real(section: String, key: String, value: Real) -> 
	Undefined
	You can use this function to write a value (numeric) to an ini 
	data file.
	section The section of the ini to write to.
	key	The key within the relevant section of the ini to write to.
	value The real value to write to the relevant destination.
	
	Tradução:
	Função ini_write_real(section: String, key: String, value: Real) vazio
	Você pode usar esta função para escrever um valor númerico em um arquivo
	de save
	section: A sessão do arquivo ini para escrever
	key O chave(id) com a relevÂncia da sessão do arquivo ini para escrever
	value O valor real para escrever relevante ao destino
	
	Reseumindo, esta função serve para escrever valores reais e ordem deve ser
	Primeiro: A categoria da informação
	Exemplo: Se fossemos fazer um jogo de RPG, esta seria a sessão dos 
	Status do player, ou seja, a categoria status
	
	Segundo: O nome daquele valor
	Exemplo: Dentro da categoria Status, teriamos os status separdos
	como força, velocidade, hp, etc
	
	Por fim? o valor numérico daquela informção
	Exemplo: força == 5-, velocidade == 60, etc
	
	ini_write_string():
	A diferença desta função para a write_real, é que você adiciona valores 
	de texto
	
	No nosso caso, só queremos salvar poor enquanto a maior pontuação feita
	*/
	
	//Escreve no arquivo, o maior ponto
	ini_write_real("Pontos", "maiorPontos", global.maiorPontos)
	
	//Assim que eu terminei de escrever, iremos fechar o arquivo de save
	
	ini_close()
	
	
	
}