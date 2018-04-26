Quando("clicar no menu Buscar") do
    $buscarInfo = Buscar.new
    $buscarInfo.menuBuscar.click
  end
  
  Quando("pesquisar a reserva desejada") do
    $buscarInfo.changeIframe
    $buscarInfo.pesquisarReserva
  end
  
  Então("a reserva deverá ser confirmada") do
    $buscarInfo.confirmar
  end