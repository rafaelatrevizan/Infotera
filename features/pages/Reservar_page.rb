class Reservar < SitePrism::Page
    element :menuReservar, :xpath, '//a[contains(text(), "Reservar")]'
    # element :abasReservar, :xpath, '//span[@class = "ui-menuitem-text PadWithBorder5"]'
    element :pesquisarHotel, '//input[@id = "frmMotorHotel:idDestinoHotel_input"]'
    element :partida, '//input[@id = "frmMotorHotel:dtPartida_input"]'
    element :retorno, '//input[@id = "frmMotorHotel:dtRetorno_input"]'
    

    # def validarAbas
    #     i = 0
    #     while i<=12 do
    #     find(abasReservar)[i]
    #     i += 1 
    #     end
    # end

    # def validarPesquisa
    #     pesquisarHotel
    #     partida
    #     retorno
    # end

end