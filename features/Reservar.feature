
#language: pt
#utf-8

Funcionalidade: Validar reseva
Eu como Operador
Quero entrar no Portal 
Para fazer uma reserva

Contexto: Usuário acessa o Portal
Dado que esteja na Home do Portal
Quando clicar no menu Reservar

@reservar
Cenario: Validar tela de reserva
Então deverá ser exibido a tela para procurar destino e data
E as abas com as opções de serviço
| Abas                  |
| Hotéis                |
| Passagens             |
| Serviços              |
| Monte seu pacote      |
| Pacotes               |
| Circuitos             |

@fazerReserva
Cenario: Fazer uma reserva
Quando preencher os campos Cidade ou hotel de destino, data de partida e retorno
E ser exibido todos os hotéis compatíveis 
Então deverá selecionar o hotel
E deverá ser preenchido todas as informações necessárias e realizar a reserva


