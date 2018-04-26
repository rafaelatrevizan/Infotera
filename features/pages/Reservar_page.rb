class Reservar < SitePrism::Page
    element :menuReservar, :xpath, '//a[contains(text(), "Reservar")]'
    element :pesquisarHotel, :xpath, '//input[contains(@id, "frmMotorHotel:idDestinoHotel_input")]'
    element :hotelEscolhido, :xpath, '//tr[contains(@class, "ui-autocomplete-item")]/td'
    element :resulthotel, :xpath, '//div[@class = "Fs22"]'
    # element :pesquisaHotel, :xpath, '//input[@id = "frmMotorHotel:j_idt512"]'
    # element :fazerReserva, :xpath, '//button[@id = "pnlPesquisa:0:pnlHotelPesquisa:0:j_idt2008"]'
    element :adult1_name, :xpath, '//input[@id = "frmNomeEdit:hotel:0:quarto:0:pnlNome:nome:0:idNome"]'
    element :adult1_last_name, :xpath, '//input[@id = "frmNomeEdit:hotel:0:quarto:0:pnlNome:nome:0:idSobrenome"]'
    element :adult1_num_doc, :xpath, '//input[@id = "frmNomeEdit:hotel:0:quarto:0:pnlNome:nome:0:idNrDocumento"]'
    element :adult1_data_nasc, :xpath, '//input[@id = "frmNomeEdit:hotel:0:quarto:0:pnlNome:nome:0:idDtNascimento"]'
    element :adult2_name, :xpath, '   //input[@id = "frmNomeEdit:hotel:0:quarto:0:pnlNome:nome:1:idNome"]'
    element :adult2_last_name, :xpath, '//input[@id = "frmNomeEdit:hotel:0:quarto:0:pnlNome:nome:1:idSobrenome"]'
    element :adult2_num_doc, :xpath, '//input[@id = "frmNomeEdit:hotel:0:quarto:0:pnlNome:nome:1:idNrDocumento"]'
    element :adult2_data_nasc, :xpath, '//input[@id = "frmNomeEdit:hotel:0:quarto:0:pnlNome:nome:1:idDtNascimento"]' 
    element :textarea, :xpath, '//textarea[@id = "frmNomeEdit:hotel:0:quarto:0:idDsObservacao"]'
    element :cliente_name, :xpath, '//input[@id = "frmNomeEdit:idNmContato"]'
    element :cliente_email, :xpath, '//input[@id = "frmNomeEdit:idEmailContato"]'
    element :cliente_tel, :xpath, '//input[@id = "frmNomeEdit:idTelefoneContato"]'
    element :finalizar_reserva, :xpath, '//button[@id = "frmNomeEdit:j_idt2581"]'
    element :reservado, :xpath, '//span[contains(text(), "HOSPEDAGEM")]'
    element :status_reservado, :xpath, '//div[contains(text(), "RESERVADO")]'
    element :check_hotel, :xpath, '//div[contains(@style, "flex-direction: row;width: 100%")]/div/b'
    element :id_reserva, :xpath, '//div[@class = "ui-g-8 ui-md-2 ui-lg-2 fontBold"][1]'
    
    def self.set_massa(path , ct , column, valor)
       
        massa = Hash.new
        xlsx = Roo::Spreadsheet.open(path)
        xlsx.default_sheet = xlsx.sheets[0]
        begin
          headers = Hash.new
          xlsx.row(1).each_with_index { |header,i|
            headers[header] = i
          }
          linha = 1
          ((xlsx.first_row + 1)..xlsx.last_row).each do |row|
            if ct.to_s == xlsx.row(row)[headers["CT"]].to_s
              coluna = 0
              headers.each do |key, value|
                if key.upcase == column.upcase.strip
                  workbook = RubyXL::Parser.parse(path)
                  sheet = workbook[0]
                  sheet.add_cell(linha, coluna, valor, nil)
                  workbook.stream
                  workbook.save path
                end
                coluna+=1
                end
              end
              linha+=1
           end
         rescue
           raise "Erro ao ler a planilha."
        end
      end
 
    
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
        lala = all(:xpath, '//input[contains(@id, "frmMotorHotel")]')
        pesquisaHotel = lala[1]
        resulthotel.text.include?(pesquisaHotel.text)
    end

    def fazerReserva
        botao = all(:xpath, '//button[contains(@id, "pnlPesquisa:0:pnlHotelPesquisa:0:")]')
        botao[0].click
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
        adult2_num_doc.set(Faker::CPF.number) 
        # sex = all(:xpath, '//div[@class = "ui-selectonemenu-trigger ui-state-default ui-corner-right"]')
        doc[3].click
        sleep 1
        adult2_sex = all(:xpath, '//li[@data-label = "Masculino"]')
        adult2_sex[0].click
        sleep 1
        adult2_data_nasc.set('020101970')
        # adult1_data_nasc.set(Faker::Date.birthday(18, 65))        
    end

    def fillTextArea
        textarea.set('Teste reserva hotel')
    end

    def dadosCliente        
        @nomeCliente = Faker::Name.first_name 
        cliente_name.set(@nomeCliente)
        cliente_email.set('teste@homolog.com')
        cliente_tel.set('11111111111')
    end

    def finalizar_reserva
        binding.pry
        bla = all(:xpath, '//button[contains(@id, "frmNomeEdit")]')
        bla[1].click
    end

    def check_reservation
        reservado
        status_reservado
    end

    # def verifyReservation
    #     check_hotel.text.include?resulthotel.text
    # end

end




