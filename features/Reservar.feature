
#language: pt
#utf-8

Funcionalidade: Validar reseva
Eu como Operador
Quero entrar no Portal 
Para fazer uma reserva

@reservar
Cenario: Validar tela de reserva
Dados que esteja na Home do Portal
Quando clicar no menu Reservar
Então deverá ser exibido a tela para procurar destino e data
