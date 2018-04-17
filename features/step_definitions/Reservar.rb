Quando("clicar no menu Reservar") do
  $reservarInfo = Reservar.new
  $reservarInfo.menuReservar.click
end

Então("deverá ser exibido a tela para procurar destino e data") do
 $reservarInfo.pesquisarHotel
 $reservarInfo.partida
 $reservarInfo.retorno

end