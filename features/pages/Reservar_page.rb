class Reservar < SitePrism::Page
    element :menuReservar, :xpath, '//a[contains(text(), "Reservar")]'
    element :pesquisarHotel, :xpath, '//input[contains(@id, "frmMotorHotel:idDestinoHotel_input")]'
    element :hotelEscolhido, :xpath, '//tr[contains(@class, "ui-autocomplete-item")]/td'
    element :resulthotel, :xpath, '//div[@class = "Fs22"]'
    element :pesquisaHotel, :xpath, '//input[@id = "frmMotorHotel:j_idt512"]'
    element :fazerReserva, :xpath, '//button[@id = "pnlPesquisa:0:pnlHotelPesquisa:0:j_idt2121"]'
    element :adult1_name, :xpath, '//input[@id = "frmNomeEdit:j_idt2140:0:j_idt2141:0:j_idt2146:j_idt2147:0:idNome"]'
    element :adult1_last_name, :xpath, '//input[@id = "frmNomeEdit:j_idt2140:0:j_idt2141:0:j_idt2146:j_idt2147:0:idSobrenome"]'
    element :adult1_num_doc, :xpath, '//input[@id = "frmNomeEdit:j_idt2140:0:j_idt2141:0:j_idt2146:j_idt2147:0:idNrDocumento"]'
    element :adult1_data_nasc, :xpath, '//input[@id = "frmNomeEdit:j_idt2140:0:j_idt2141:0:j_idt2146:j_idt2147:0:idDtNascimento"]'
    element :adult2_name, :xpath, '   //input[@id = "frmNomeEdit:j_idt2140:0:j_idt2141:0:j_idt2146:j_idt2147:1:idSobrenome"]'
    element :adult2_last_name, :xpath, '//input[@id = "frmNomeEdit:j_idt2140:0:j_idt2141:0:j_idt2146:j_idt2147:0:idSobrenome"]'
    element :adult2_num_doc, :xpath, '//input[@id = "frmNomeEdit:j_idt2140:0:j_idt2141:0:j_idt2146:j_idt2147:1:idNrDocumento"]'
    element :adult2_data_nasc, :xpath, '//input[@id = "frmNomeEdit:j_idt2140:0:j_idt2141:0:j_idt2146:j_idt2147:1:idDtNascimento"]' 
 
    
    def changeIframe
         page.driver.browser.switch_to.frame 0
    end


    def validarAbas (abasEsperada)
        i = 0
        abasEsperada.hashes.each do |item|
           find(:xpath, '//span[contains(text(), "'+ item["Abas"] +'")]')
           i += 1 
        end 
    end

    def validarPesquisa
        pesquisarHotel
        partida
        retorno
    end

    def preenchimentoHotel
       hotelBuscado = pesquisarHotel.set('hotel rafa teste')
       hotelEscolhido.click
       sleep 1   
       data_partida = all(:xpath, '//a[contains(text(), "4")]')  
       data_partida[0].click  
       sleep 1
       data_retorno = all(:xpath, '//a[contains(text(), "10")]')   
       data_retorno[0].click
       sleep 1    
       pesquisar = all(:xpath, '//span[contains(text(), "Pesquisar")]')    
       pesquisar[1].click
       sleep 3
    end

    def verifyHotel
        resulthotel.text.include?(pesquisaHotel.text)
    end

    def fillFormAdult1
        @nomeCadastro = Faker::Name.first_name 
        adult1_name.set(@nomeCadastro)
        adult1_last_name.set(Faker::Name.last_name )

        doc = all(:xpath, '//div[@class = "ui-selectonemenu-trigger ui-state-default ui-corner-right"]')
        doc[0].click
        doc_sel = all(:xpath, '//li[@data-label = "CPF"]')
        doc_sel[0].click

        # adult1_num_doc.set('42513070895')
        adult1_num_doc.set(Faker::CPF.number) 
        # sex = all(:xpath, '//div[@class = "ui-selectonemenu-trigger ui-state-default ui-corner-right"]')
        doc[1].click

        adult1_sex = all(:xpath, '//li[@data-label = "Feminino"]')
        adult1_sex[0].click
        sleep 1
        adult1_data_nasc.set('018091992')
        # adult1_data_nasc.set(Faker::Date.birthday(18, 65))        
    end

    def fillFormAdult2
        @nomeCadastro = Faker::Name.first_name 
        adult2_name.set(@nomeCadastro)
        adult2_last_name.set(Faker::Name.last_name )

        doc = all(:xpath, '//div[@class = "ui-selectonemenu-trigger ui-state-default ui-corner-right"]')
        doc[2].click
        doc_sel = all(:xpath, '//li[@data-label = "CPF"]')
        doc_sel[0].click

        # adult1_num_doc.set('42513070895')
        adult1_num_doc.set(Faker::CPF.number) 
        # sex = all(:xpath, '//div[@class = "ui-selectonemenu-trigger ui-state-default ui-corner-right"]')
        doc[3].click
        sleep 1
        adult1_sex = all(:xpath, '//li[@data-label = "Feminino"]')
        adult1_sex[1].click
        sleep 1
        adult1_data_nasc.set('020101970')
        # adult1_data_nasc.set(Faker::Date.birthday(18, 65))        
    end

end




