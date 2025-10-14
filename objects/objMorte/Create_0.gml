/*
Explicação dos alarmes:
Os alarmes possuem algumas propriedades
1º: Os alarmes são parecidos com vetores, ou seja, o primeiro alarme
Fica na posição 0, e o último fica na quantidade de vetores menos um
Sabendo disso e também sabendo que temos 12 vetores, qual é a posição
do último alarme? Isso, 11

2º Ao passar um valor para um vetor (exp: alarm[0] = 10), ele ira
Diminuir em 1 a cada frame, ou seja, se você atribuir por exemplo 10
Quer dizer que vai demorar 10 frames para funcionar

3º O alarm, assim que chega a 0, irá rodar o código que há dentro dele
Por exemplo, se você colocar dentro de um alarm para ele criar
Um inimigo e colocar para ele receber 10, quer dizer que a cada 10 frames
Ele irá criar um novoi inimigo
Então, sabendo que cada segundo possui 60 frames
Então é só colocarmos o alarm para receber 60 vezes a quantidade de segundos
Que a cada segundo que você calcular, ele irá rodar o código
No nosso caso, queremos que assim que criar uma instancia do objMorte
QUeremos que ela seja destruida em 2 segundos
Sabendo disso, qual sintax usaremos para fazer isto?
*/
//Assim também funciona, mais toda hora você terá que calcular
//Qual é a outra forma
//alarm[0] = 120

//Forma mais simples
alarm[0] = 2 * 60