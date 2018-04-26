#language: pt
#utf-8

Funcionalidade: Fazer uma busca
Eu como Operador
Quero entrar no Portal 
Para fazer uma busca de reserva

Contexto: Usuário acessa o Portal
Dado que esteja na Home do Portal
Quando clicar no menu Buscar

@confirmar 
Cenario: Fazer uma confirmação
Quando pesquisar a reserva desejada
Então a reserva deverá ser confirmada

@pagar
Cenario: Fazer um pagamento
Quando pesquisar a reserva desejada
Então a reserva deverá ser paga