Quando("clicar no menu Reservar") do
  $reservarInfo = Reservar.new
  $reservarInfo.menuReservar.click
end

Então("deverá ser exibido a tela para procurar destino e data") do
 $reservarInfo.changeIframe
 $reservarInfo.validarPesquisa
end

Então("as abas com as opções de serviço") do |table|
  $reservarInfo.validarAbas(table)

end

Quando("preencher os campos Cidade ou hotel de destino, data de partida e retorno") do
  $reservarInfo.changeIframe
  $reservarInfo.preenchimentoHotel  
end  

Quando("ser exibido todos os hotéis compatíveis") do
  $reservarInfo.verifyHotel
 
 end

Então("deverá selecionar o hotel") do
  $reservarInfo.fazerReserva.click
end

Então("deverá ser preenchido todas as informações necessárias e realizar a reserva") do
 $reservarInfo.fillFormAdult1
 $reservarInfo.fillFormAdult2
end