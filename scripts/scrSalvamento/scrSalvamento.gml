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

//Função para salvar o jogo
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
	Exemplo: força == 50, velocidade == 60, etc
	
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

//Função para carregar os dados salvos
function carregarJogo(nomeArquivo = "saveJogo.ini"){
	//Primeiro, devemos abrir o arquivo de save, para isto usaremos a mesma função ini_open()
	ini_open(nomeArquivo)
	
	/*
	Na outra função, como queriamos salvar informações, nós usamos o ini_write, mas como agora queremos
	Ler as informações, usaremos as funções ini_read_real() e a ini_read_string()
	********Para melhor entendimento, usarei o mesmo texto para explicar as duas funções, pois o intenção
			é a mesma, diferenciando apenas que uma recebe texto e a outra recebe números
			Deixarei em parenteses os nomes a ser substituidos sendo o lado esquerdo a função de string
			e o lado direito a de números
	Descrições:
	function ini_read_(string ou real)(section: String, key: String, default: (String ou real)) ->
	(String ou real)
	You can use this function to read a (string (text) ou real(number)) from an ini data file.
	section The section of the .ini to read from.
	key	The key within the relevant section of the .ini to read from.
	default	The (string ou real) to return if a (string ou real) is not found in the defined place 
	(or the .ini file does not exist). Must be a (string ou real).
	
	Traduções:
	Função ini_read_(string ou real)(section: valor String, key: valor String, default: valor (String ou real))
	Retorno do tipo (String ou real)
	Você pode usar esta função para ler um valor (string (texto) ou real (número)) do arquivo de dados ini
	section A sessão de onde vai ler dentro do arquivo .ini
	key A chave (ou identificação) referente a sessão do arquivo .ini
	default O valor (string ou real) para retornar se um valor (string ou real) não é encontrado mo caminho
	definido (ou o arquivo .ini não existir). Tem que ser um valor (string ou real)
	
	Ou seja, ao usar esta função, se você não passar o caminho corretamente ou caso o arquivo de save não 
	tenha sido criado ainda, esta função retornará um valor padrão
	Isto nos ajudará a criar o save de maior pontuação, pois caso seja a primeira vez que o jogador
	Abrir o jogo, podemos deixar o menor valor possivel de ser tirado (0), mas das próximas vezes que
	abrir o jogo e se o jogo tenha sido salvo, automáticamente receberá o valor salvo
	
	No nosso caso, receberemos o valor salvo de maiorPontuacao
	*/
	
	/*Recebo o valor salvo na maior pontuacao (Lembrando que o caminho de carregamento tem que ser 
	igual ao caminho da informação salva) e, caso não tenha o arquivo ou não ache a informação, 
	receberemos	0
	*/
	global.maiorPontos = ini_read_real("Pontos", "maiorPontos", 0)
	
	//Assim que terminar de carregar todos os dados, podemos fechar o arquivo
	ini_close()
}
/*
Caso queiram achar o arquivo de save no computador, basta ir em:(lembrando que o que está
				em parenteses é para ser subistituido):
	Disco local -> Usuários -> (Seu Usuário) -> AppData -> Local -> (Nome do seu jogo)
	E abrir o arquivo com o nome do arquivo que você definiu
	
	Se não achar, basta abrir o cmd e digitar o seguinte comando
	cd C:\Users\(Seu Usuario)\AppData\Local\(NomeDoJogo) 
	E depois digitar
	(nome do arquivo) open
Agora, falta só colocar as funções no lugar certo
*/

