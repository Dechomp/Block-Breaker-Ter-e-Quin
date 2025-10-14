/*
Este evento é gerado toda vez qua a instancia sai da tela
No nosso, quando uma instancia do objBola sai da tela
E como ela só pode sair por baixo, temos certeza que o player perdeu
a bolinha, consequentemente uma ds vidas

Então, vamos configurar 4 coisas
1º Diminuir a vida em 1
2º Fazer a animação de morte aonde a bolinha saiu
3º Apagar do código a bolinha que saiu(para evitar lags)
4º Criar uma nova bolinha caso ainda tenha vida
*/

//Primeiro, tiramos uma vida
global.vidas--

//Segundo, criar uma animação de morte
//Só que, para isto, criaremos um novo objeto chamado objMorte
//E aprendermos como criar novas instancias dentro do código